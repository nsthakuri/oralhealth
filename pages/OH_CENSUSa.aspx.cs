using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Data & Database
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

// Typed DataSets
using OralHealthTableAdapters;
using maharishiTableAdapters;

using System.Transactions;

public partial class pages_OH_CENSUSa : System.Web.UI.Page
{
    String[] hdrObjectNames = new String[] {"Week", "Day","Month",
        "Year","WorkerId","MuniId","Ward","HH","MapUnit"};

    protected string strID;    
    private List<string> _headerErrors = new List<string>(); 
    private List<string> _censusErrors = new List<string>();


    #region EVENTS
    /***************************
     *    EVENTS      *
     ***************************/
    protected void Page_Load(object sender, EventArgs e)
    {
        strID = Request.QueryString["id"];
        DisableHeaderTextBoxes();

        if (!IsPostBack)
        {
            lblsucessmsg.Text = "";
            LitErrors.Text = "";

            string[] AryAddressUnit = Core.GetAddressUunit(strID);

            // Load existing women for this household
            PopulateWomen(strID);

            if (AryAddressUnit.Length > 0 &&
                AryAddressUnit[0] != null &&
                AryAddressUnit[0].Length >= 8)
            {
                MuniId.Text = AryAddressUnit[0].Substring(0, 2);
                Ward.Text = AryAddressUnit[0].Substring(2, 2);
                HH.Text = AryAddressUnit[0].Substring(4, 4);
            }

            if (AryAddressUnit.Length > 1)
                MapUnit.Text = AryAddressUnit[1] ?? "";

            string[] AryWeekDate = Core.GetWeekDate(DateTime.Today);
            if (AryWeekDate.Length > 1 && AryWeekDate[1].Length >= 8)
            {
                Week.Text = AryWeekDate[0];
                Day.Text = AryWeekDate[1].Substring(0, 2);
                Month.Text = AryWeekDate[1].Substring(2, 2);
                Year.Text = AryWeekDate[1].Substring(6, 2);
            }
            WorkerId.Text = Core.GetDEO();
        }
    }

    // ============================
    // Household Header Submission
    // ============================
    protected void HHStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        string v = HHStatus.SelectedValue;

        if (v == "1")   // Exists Old HH
        {
            PanelHeaderData.Visible = true;
            ButtonSaveHeaderData.Text = "Save HH Info";
        }
        else if (v == "3" || v == "4" || v == "5") // STOP cases
        {
            PanelHeaderData.Visible = false;
            ButtonSaveHeaderData.Text = "Save HH Status";
        }
        else
        {
            PanelHeaderData.Visible = false;
        }
    }

    protected void HasElgWoman_SelectedIndexChanged(object sender, EventArgs e)
    {
        string elgWoman = HasElgWoman.SelectedValue; 
        if(elgWoman == "1")
        {
            PanelHOH.Visible = true;
        }
        else
        {
            PanelHOH.Visible = false;            
        }
    }
    protected void CAHOHMS_SelectedIndexChanged(object sender, EventArgs e)
    {
        string HOHMS = CAHOHMS.SelectedValue;
        if (HOHMS == "2")
        {
            PanelRespondent.Visible = true;
        }
        else
        {
            PanelRespondent.Visible = false;
        }
    }
    protected void HHCons_SelectedIndexChanged(object sender, EventArgs e)
    {
        string HHConsent = HHCons.SelectedValue;
        if (HHConsent == "1")
        {
            PanelHHConsent.Visible = true;
        }
        else
        {
            PanelHHConsent.Visible = false;
        }
    }

    protected void ButtonSaveHeaderData_Click(object sender, EventArgs e)
    {
        lblsucessmsg.Text = "";
        LitErrors.Text = "";

        if (!Page.IsValid) return;

        // --------------------------------------------------
        // SERVER VALIDATION (GPS + header rules)
        // --------------------------------------------------
        decimal? lat, lng;

        if (!ValidateHouseholdHeader(out lat, out lng))
        {
            PanelError.Visible = true;
            PanelError.CssClass = "error-card show";
            LitErrors.Text =
                "<ul><li>" + string.Join("</li><li>", _headerErrors) + "</li></ul>";
            return;
        } 

        // --------------------------------------------------
        // HasElgWoman = NO but woman exists in database
        // --------------------------------------------------
        if (HasElgWoman.SelectedValue == "0" && LitElgWoman.Text == "1")
        {
            PanelError.Visible = true; 
            LitErrors.Text = "<span class='error-msg'>" + MsgHasWomanMismatch + "</span>";
            return;
        }

        bool isDataSaved = SaveHeaderData(strID, lat, lng);
        if (!isDataSaved) return;
         
        // ---------------------------
        // SUCCESS HEADER
        // ---------------------------
        PanelTopHHSection.Visible = false;
        ButtonSaveHeaderData.Visible = false;

        string hhStatus = HHStatus.SelectedValue;
        string hasWoman = HasElgWoman.SelectedValue;
        string hhCons = HHCons.SelectedValue;

        // ---------------------------
        // STOP CASES
        // ---------------------------
        if (hhStatus == "3" || hhStatus == "4" || hhStatus == "5")
        {
            PanelSuccess.Visible = true;            
            ButtonSaveData.Visible = false;
            PanelHeader.Visible = false;
            lblsucessmsg.Text = MsgStopHH;
            return;
        }

        // ---------------------------
        // REFUSED CONSENT
        // ---------------------------
        if (hhCons == "6")
        {
            PanelError.Visible = false;
            PanelSuccess.Visible = true;            
            ButtonSaveData.Visible = false;
            PanelHeader.Visible = false;
            lblsucessmsg.Text = MsgConsentRefused;
            return;
        }

        // ---------------------------
        // NO ELIGIBLE WOMAN
        // ---------------------------
        if (hasWoman == "0")
        {
            PanelError.Visible = false;
            PanelHeader.Visible = false;
            ButtonSaveData.Visible = false; 
            PanelSuccess.Visible = true;
            lblsucessmsg.Text = MsgNoEligibleWoman;            
            return;
        }

        // ---------------------------
        // ELIGIBLE WOMAN EXISTS
        // ---------------------------
        //if (hhStatus == "1" && hasWoman == "1")
        //{
        //    View_WomanProfileTableAdapter caAdapter = new View_WomanProfileTableAdapter();
        //    bool hasData = caAdapter.GetDataByAddressMSNull(strID).Rows.Count > 0;

        //    if (hasData)
        //    {
        //        // Existing women → show census repeater
        //        PanelCensusPeople.Visible = true;
        //    }
        //    else
        //    {
        //        // No women yet → show add new woman UI
        //        PanelCensusPeople.Visible = false;
        //        PanelNewWomanConfirm.Visible = true;
        //    }
        //} 
        // --------------------------------------------------
        // DATA TRANSFER: Census -> WomenRoster
        // --------------------------------------------------
        // We transfer if HHStatus is continue (1) and there is an eligible woman (1)
        if (hhStatus == "1" && hasWoman == "1")
        {
            try
            {
                // 1. Fetch all eligible women from the Census View for this Address
                var censusAdapter = new OralHealthTableAdapters.View_WomanProfileTableAdapter();
                var censusDataTable = censusAdapter.GetDataByAddressMSNull(Address);
                if (censusDataTable.Rows.Count > 0)
                {
                    var rosterAdapter = new OralHealthTableAdapters.WomenRosterTableAdapter();

                    // 2. Use a Transaction to ensure all-or-nothing saving
                    using (TransactionScope scope = new TransactionScope())
                    {
                        // LOOP through every row found in the census data
                        foreach (DataRow row in censusDataTable.Rows)
                        {
                            var censusRow = (OralHealth.View_WomanProfileRow)row;

                            // Check if this woman already exists in WomenRoster
                            var exists = rosterAdapter.GetDataByNNIPSnum(censusRow.CensusNNIPSnum).Rows.Count > 0;
                            if (exists)
                            {
                                // If exists, do nothing and skip to next
                                continue;
                            }

                            // Otherwise, insert new woman
                            string fName = Core.CleanText(censusRow.CensusFirstNames);
                            string lName = Core.CleanText(censusRow.CensusLastName);

                            DateTime romDate = (DateTime)Core.GetRomDateFromNepDate(FormDateNep, true);

                            rosterAdapter.Insert(
                                censusRow.CensusNNIPSnum,
                                Address,
                                Week.Text,
                                FormDateNep,
                                romDate,
                                WorkerId.Text,
                                fName,
                                lName,
                                "2",         // Sex = Female
                                null,
                                censusRow.CensusAge,
                                censusRow.CensusDOBNep,
                                censusRow.CensusDOBRom,
                                null,
                                null,
                                null,
                                censusRow.CensusHusbNNIPSnum,
                                Core.CleanText(censusRow.CensusHusbFirstNames),
                                Core.CleanText(censusRow.CensusHusbLastName),
                                null,
                                "0",
                                "1",         // existing woman
                                Core.GetDEO(),
                                DateTime.Now,
                                DateTime.Now
                            );
                        }

                        // Complete the transaction
                        scope.Complete();
                    }
                }
            } 
            catch (Exception ex)
            {
                LitErrors.Text = "Data transfer failed: " + ex.Message;
                PanelError.Visible = true;
                return;
            }
        }

        // insert log data
        Core.InsertDataEntryLogWorkerID(WorkerId.Text);
        PanelError.Visible = false;
        PanelHeader.Visible = false;
        PanelSuccess.Visible = true;
        ButtonSaveData.Visible = true;
        lblsucessmsg.Text = MsgCollectInfo;
        Response.Redirect("~/pages/OH_WOMENROSTER.aspx?id=" + Address + "&wk=" + Week.Text + "&dt=" + FormDateNep + "&wr=" + WorkerId.Text + "&page=roster&msg=successa");
    }

    protected void ButtonSaveData_Click(object sender, EventArgs e)
    {
        Page.Validate("vgCensus");
        lblsucessmsg.Text = "";
        if (!Page.IsValid)
        {
            PanelSuccess.Visible = false;
            PanelError.Visible = true;
            PanelError.CssClass = "error-card show";            
            PanelError.Visible = _censusErrors.Count > 0;
            LitErrors.Text = string.Join("<br/>", _censusErrors);
            return;
        }
        SaveCensusWomen();
        PanelCensusPeople.Visible = false;
        PanelTopHHSection.Visible = false;
        PanelHeader.Visible = false;
        PanelNewWomanConfirm.Visible = true;
        PanelError.Visible = false; 
        PanelSuccess.Visible = true; 
    }

    protected void ButtonYes_Click(object sender, EventArgs e)
    {
        lblsucessmsg.Text = "";
        if (!Page.IsValid)
        {
            return;
        }
        PanelNewWomanConfirm.Visible = false;
        PanelSuccess.Visible = true;
        lblsucessmsg.Text = MsgCreateNewWoman;
        Response.Redirect("~/pages/OH_WOMENROSTER.aspx?id=" + Address + "&wk=" + Week.Text + "&dt=" + FormDateNep + "&wr=" + WorkerId.Text + "&page=roster");
    }
    protected void ButtonNo_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            return;
        }
        PanelSuccess.Visible = true;
        PanelNewWomanConfirm.Visible = false;        
    }

    // Binds DOB type dropdown on row load (needed because of dynamic content)
    protected void RepeaterCensus_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        // Only process real data rows
        if (e.Item.ItemType != ListItemType.Item &&
            e.Item.ItemType != ListItemType.AlternatingItem)
            return;

        DataRowView row = (DataRowView)e.Item.DataItem;

        /* =====================================================
         * 1) DROPDOWN BINDING (CONSENT, HUSBAND VS)
         * ===================================================== */

        DropDownList ddlConsent = e.Item.FindControl("CensusConsent") as DropDownList;
        if (ddlConsent != null)
        {
            string consentValue = row["CensusConsent"] == DBNull.Value
                ? ""
                : row["CensusConsent"].ToString();

            if (ddlConsent.Items.FindByValue(consentValue) != null)
                ddlConsent.SelectedValue = consentValue;
        }

        DropDownList ddlHusbVS = e.Item.FindControl("CensusHusbVS") as DropDownList;
        if (ddlHusbVS != null)
        {
            string husbVSValue = row["CensusHusbVS"] == DBNull.Value
                ? ""
                : row["CensusHusbVS"].ToString();

            if (ddlHusbVS.Items.FindByValue(husbVSValue) != null)
                ddlHusbVS.SelectedValue = husbVSValue;
        }

        /* =====================================================
         * 2) DOB EDITABILITY LOGIC
         *    Enable only if DOB has unknown parts
         * ===================================================== */

        TextBox txtDOB = e.Item.FindControl("CensusDOBNep") as TextBox;
        if (txtDOB == null) return;

        // Default: lock DOB
        txtDOB.Enabled = false;

        string dob = row["CensusDOBNep"] == DBNull.Value
            ? ""
            : row["CensusDOBNep"].ToString().Trim();

        // Expected format: ddmmyyyy
        if (dob.Length == 8)
        {
            string day = dob.Substring(0, 2);
            string month = dob.Substring(2, 2);
            string year = dob.Substring(4, 4);

            // Enable if any component is unknown
            if (day == "99" || month == "99" || year == "9999")
            {
                txtDOB.Enabled = true;
                txtDOB.ToolTip = "Date of birth contains unknown value. Please correct.";
            }
        }
    }


    #endregion

    #region SUPPORTMETHODS
    /***************************
     *    SUPPORT METHODS      *
     ***************************/

    private void DisableHeaderTextBoxes()
    {
        foreach (string name in hdrObjectNames)
        {
            var tb = PanelHeader.FindControl(name) as TextBox;
            if (tb != null)
                tb.ReadOnly = true;
        }
    }

    private void PopulateWomen(string Address)
    {
        View_WomanProfileTableAdapter caAdapter = new View_WomanProfileTableAdapter();
        var data = caAdapter.GetDataByAddressMSNull(Address);
        RepeaterCensus.DataSource = data;
        RepeaterCensus.DataBind();
        // Always keep this in-sync (used for mismatch check)
        LitElgWoman.Text = (RepeaterCensus.Items.Count > 0) ? "1" : "0";
    }
    private bool SaveHeaderData(string AddressID, decimal? lat, decimal? lng)
    {
        var CAAdapter = new OralHealthTableAdapters.CensusAddressTableAdapter();
        var NNAddrAdapter = new maharishiTableAdapters.NNIPSAddressTableAdapter();

        var CADT = CAAdapter.GetDataByAddress(AddressID);
        var NNDT = NNAddrAdapter.GetDataByAddress(strID);

        if (CADT.Rows.Count == 0 || NNDT.Rows.Count == 0)
        {
            PanelError.Visible = true; 
            LitErrors.Text = "Error: Address record not found on the server.";
            return false;
        }

        // --------------------------------------------------
        // 1) GPS (validated earlier, safe values passed in)
        // --------------------------------------------------
        if (lat.HasValue && lng.HasValue)
        {
            var NNRow = NNDT[0];
            NNRow.LAT = lat.Value;
            NNRow.LONG = lng.Value;             
            NNRow.COMMENT = "Updated via OralHealth.CENSUSa";
            NNRow.NAUPDATE = DateTime.Now;            
        }
        // --------------------------------------------------
        // 4) Update Census Address
        // --------------------------------------------------
        var CARow = (OralHealth.CensusAddressRow)CADT.Rows[0];

        CARow.CAHHStatus = HHStatus.SelectedValue;
        CARow.CAHasWoman = HasElgWoman.SelectedValue;
        if (HasElgWoman.SelectedValue == "1")
        {
            CARow.CAHOHFNames = HOHFNames.Text.Trim().ToUpper();
            CARow.CAHOHLName = HOHLName.Text.Trim().ToUpper();
            CARow.CAHOHMS = CAHOHMS.SelectedValue;
            CARow.CAResFNames = ResFNames.Text.Trim().ToUpper();
            CARow.CAResLName = ResLName.Text.Trim().ToUpper();
            CARow.CAHHCons = HHCons.SelectedValue;
            CARow.CAPerCount =
                (HHCons.SelectedValue == "1") ? PerCount.Text : null;
        }
        else
        {
            CARow.CAHOHFNames = null;
            CARow.CAHOHLName = null;
            CARow.CAResFNames = null;
            CARow.CAResLName = null;
            CARow.CAPerCount = null;
        }

        // --------------------------------------------------
        // 5) Save both tables
        // --------------------------------------------------
        NNAddrAdapter.Update(NNDT);
        CAAdapter.Update(CADT); 
        LitErrors.Text = ""; 
        return true;
    }

    private void SaveCensusWomen()
    {
        var CNAdapter = new OralHealthTableAdapters.CensusTableAdapter();
        var NNIPSAdapter = new maharishiTableAdapters.NNIPSTableAdapter();

        using (var scope = new TransactionScope())
        {
            try
            {
                int savedCount = 0;

                foreach (RepeaterItem item in RepeaterCensus.Items)
                {
                    // ===========================
                    // 1) WOMAN NNIPSNUM
                    // ===========================
                    Label lblWomNN = item.FindControl("WomanNNIPSNUM") as Label;
                    if (lblWomNN == null) continue;

                    string womNN = lblWomNN.Text.Trim();
                    if (string.IsNullOrWhiteSpace(womNN)) continue;

                    // ===========================
                    // 2) READ CONTROLS
                    // ===========================
                    var VS = (DropDownList)item.FindControl("CensusVS");
                    var MS = (DropDownList)item.FindControl("CensusMS");
                    var Marr = (DropDownList)item.FindControl("CensusMarr");
                    var HusVS = (DropDownList)item.FindControl("CensusHusbVS");
                    var WomConsent = (DropDownList)item.FindControl("CensusConsent");
                    
                    var WomDOBNep = (TextBox)item.FindControl("CensusDOBNep");                     
                    var hfAge = (HiddenField)item.FindControl("CalculatedAge"); 
                    var lblHusNN = (Label)item.FindControl("HusbandNNIPSNUM");

                    string vs = VS.SelectedValue;
                    string ms = MS.SelectedValue;
                    string marr = Marr.SelectedValue;
                    string husVS = HusVS != null ? HusVS.SelectedValue : "";
                    string consent = WomConsent != null ? WomConsent.SelectedValue : "";

                    // ===========================
                    // 3) LOAD CENSUS ROW
                    // ===========================
                    var CNDT = CNAdapter.GetDataByNNIPSnum(womNN);
                    if (CNDT.Rows.Count == 0)
                        continue; // do not break transaction

                    var row = CNDT[0];
                    row.BeginEdit();

                    // ===========================
                    // 4) COMMON FIELDS
                    // ===========================
                    row.CensusWeek = Week.Text;
                    row.CensusNepDate = FormDateNep;
                    row.CensusRomDate =
                        (DateTime)Core.GetRomDateFromNepDate(FormDateNep, true);
                    row.CensusDOBNep = Core.CleanText(WomDOBNep.Text);
                    row.CensusDOBRom =
                        (DateTime)Core.GetRomDateFromNepDate(WomDOBNep.Text, true); 
                    row.CensusWorkerID = WorkerId.Text;
                    row.CensusVS = vs;
                    row.CensusAge = hfAge != null ? hfAge.Value : null;
                    row.CensusDEO = Core.GetDEO();
                    row.CensusUpdate = DateTime.Now;

                    // ===========================
                    // 5) VS ≠ 1 → SAVE VS ONLY
                    // ===========================
                    if (vs != "1")
                    {
                        row.SetCensusMSNull();
                        row.SetCensusMarrNull();
                        row.SetCensusHusbVSNull();
                        row.SetCensusConsentNull();
                    }
                    else
                    {
                        // ===========================
                        // VS = 1 → SAVE MS & MARR
                        // ===========================
                        row.CensusMS = ms;
                        row.CensusMarr = marr;

                        // ===========================
                        // MS = 7 or 9 → STOP
                        // ===========================
                        if (ms == "7" || ms == "9")
                        {
                            row.SetCensusHusbVSNull();
                            row.SetCensusConsentNull();
                        }
                        else
                        {
                            // ===========================
                            // MS = 1 or 2
                            // ===========================
                            row.CensusHusbVS = husVS;

                            if (ms == "1")
                            {
                                if (marr == "1")
                                {
                                    row.CensusConsent = consent;
                                }
                                else
                                {
                                    row.SetCensusConsentNull();
                                }
                            }
                            else // MS = 2
                            {
                                row.SetCensusConsentNull();
                            }
                        }
                    }

                    row.EndEdit();
                    CNAdapter.Update(CNDT);

                    // ===========================
                    // 6) NNIPS VS UPDATE
                    // ===========================
                    if (!string.IsNullOrWhiteSpace(womNN))
                    {
                        NNIPSAdapter.UpdateProfile(
                            vs, Address, Core.CleanText(WomDOBNep.Text),                        
                            (DateTime)Core.GetRomDateFromNepDate(WomDOBNep.Text, true),
                            DateTime.Now,
                            womNN);
                    }

                    if (vs == "1" &&
                        marr == "1" &&
                        !string.IsNullOrWhiteSpace(husVS) &&
                        lblHusNN != null &&
                        !string.IsNullOrWhiteSpace(lblHusNN.Text))
                    {
                        NNIPSAdapter.UpdateNNIPSVS(
                            husVS,
                            DateTime.Now,
                            lblHusNN.Text.Trim());
                    }

                    savedCount++;
                }

                scope.Complete();                
                lblsucessmsg.Text = 
                            savedCount == 1
                            ? "Saved 1 record successfully."
                            : "Saved " + savedCount + " records successfully.";

            }
            catch (Exception)
            {
                PanelError.Visible = true; 
                LitErrors.Text =
                    "<span class='error-msg'>Save failed. Please contact the system administrator.</span>";
            }
        }
    }

    #endregion

    #region VALIDATIONS
    /***************************
     *    VALIDATIONS      *
     ***************************/
    private bool ValidateHouseholdHeader(out decimal? lat, out decimal? lng)
    {
        _headerErrors.Clear();
        lat = null;
        lng = null;

        string hhStatus = HHStatus.SelectedValue;
        string hasWoman = HasElgWoman.SelectedValue;
        string hhCons = HHCons.SelectedValue;
        string cahohms = CAHOHMS.SelectedValue;

        // 1. GPS Validation
        if (hhStatus == "1")
        {   
            decimal vLat;
            decimal vLng;
            string gpsError;

            if (!TryValidateNepalGPS(hfLat.Value, hfLong.Value, out vLat, out vLng, out gpsError))
            {
                _headerErrors.Add(gpsError);
            }
            else
            {
                lat = vLat;
                lng = vLng;
            }

            if (string.IsNullOrWhiteSpace(hasWoman))
                _headerErrors.Add("Eligible woman selection is required.");
        }
        //else
        //{
        //    if (!string.IsNullOrWhiteSpace(hfLat.Value) || !string.IsNullOrWhiteSpace(hfLong.Value) || !string.IsNullOrWhiteSpace(hasWoman))
        //        _headerErrors.Add("GPS and eligible woman fields must be empty for non-eligible households.");
        //}

        // 2. Has Eligible Woman = YES
        if (hasWoman == "1")
        {
            if (string.IsNullOrWhiteSpace(HOHFNames.Text)) _headerErrors.Add("Head of household first name is required.");
            if (string.IsNullOrWhiteSpace(HOHLName.Text)) _headerErrors.Add("Head of household last name is required.");
            if (string.IsNullOrWhiteSpace(hhCons)) _headerErrors.Add("Household consent is required.");

            // Your requested logic: CAHOHMS = 2 is Required, 1 is Empty
            if (cahohms == "2")
            {
                if (string.IsNullOrWhiteSpace(ResFNames.Text)) _headerErrors.Add("Respondent first name is required.");
                if (string.IsNullOrWhiteSpace(ResLName.Text)) _headerErrors.Add("Respondent last name is required.");
            }
            else if (cahohms == "1")
            {
                if (!string.IsNullOrWhiteSpace(ResFNames.Text) || !string.IsNullOrWhiteSpace(ResLName.Text))
                    _headerErrors.Add("Respondent names must be empty when met status is 'Met'.");
            }

            if (hhCons == "1" && string.IsNullOrWhiteSpace(PerCount.Text))
                _headerErrors.Add("Family count is required when consent is Yes.");

            if (hhCons == "6" && !string.IsNullOrWhiteSpace(PerCount.Text))
                _headerErrors.Add("Family count must be empty when consent is Refused.");
        }
        // 3. Has Eligible Woman = NO
        else if (hasWoman == "0")
        {
            bool hasData = !string.IsNullOrWhiteSpace(HOHFNames.Text) || !string.IsNullOrWhiteSpace(HOHLName.Text) ||
                           !string.IsNullOrWhiteSpace(ResFNames.Text) || !string.IsNullOrWhiteSpace(ResLName.Text) ||
                           !string.IsNullOrWhiteSpace(hhCons) || !string.IsNullOrWhiteSpace(PerCount.Text)
                           || !string.IsNullOrWhiteSpace(cahohms);

            if (hasData)
                _headerErrors.Add("Fields (Names, Met status, Consent, Family Count) must be empty when no eligible woman exists.");
        }

        return _headerErrors.Count == 0;
    }

    private void Required(TextBox t, string womID, string msg, List<string> errorList, ref bool valid)
    {
        if (string.IsNullOrWhiteSpace(t.Text))
        {
            errorList.Add(string.Format("[{0}] {1}", womID, msg));
            valid = false;
        }
    }

    private void RequiredDDL(DropDownList d, string womID, string msg, List<string> errorList, ref bool valid)
    {
        if (string.IsNullOrWhiteSpace(d.SelectedValue))
        {
            errorList.Add(string.Format("[{0}] {1}", womID, msg));
            valid = false;
        }
    }

    private void MustBeEmptyDDL(DropDownList d, string womID, string field, List<string> errorList, ref bool valid)
    {
        if (!string.IsNullOrEmpty(d.SelectedValue))
        {
            errorList.Add(string.Format("[{0}] {1} must be empty.", womID, field));
            valid = false;
        }
    }

    private void MustBeEmptyText(TextBox t, string womID, string field, List<string> errorList, ref bool valid)
    {
        if (!string.IsNullOrWhiteSpace(t.Text))
        {
            errorList.Add(string.Format("[{0}] {1} must be empty.", womID, field));
            valid = false;
        }
    }
    public void SetErrorMessage(object source, ServerValidateEventArgs arguments, string message)
    {
        CustomValidator cv = (CustomValidator)source;
        cv.ErrorMessage = message;
        arguments.IsValid = false;
    }

    private void CheckMustBeEmpty(DropDownList ddl, string womID, string fieldName)
    {
        if (ddl != null && !string.IsNullOrWhiteSpace(ddl.SelectedValue))
        {    
            _censusErrors.Add(womID + ": " + fieldName + " must be empty.");

        }
    }

    protected void ValidateRepeaterWomen(object source, ServerValidateEventArgs args)
    {
        _censusErrors.Clear();
        bool allValid = true;

        if (RepeaterCensus.Items.Count == 0)
        {
            _censusErrors.Add("No eligible women found for census entry.");
            args.IsValid = false;
            return;
        }

        for (int i = 0; i < RepeaterCensus.Items.Count; i++)
        {
            bool womanValid = true;
            string womID = "Woman #" + (i + 1);
            RepeaterItem item = RepeaterCensus.Items[i];

            DropDownList VS = item.FindControl("CensusVS") as DropDownList;
            DropDownList MS = item.FindControl("CensusMS") as DropDownList;
            DropDownList Marr = item.FindControl("CensusMarr") as DropDownList;
            DropDownList HusVS = item.FindControl("CensusHusbVS") as DropDownList;
            DropDownList WomConsent = item.FindControl("CensusConsent") as DropDownList;

            if (VS == null || MS == null || Marr == null)
            {
                _censusErrors.Add(womID + ": Internal form error. Reload page.");
                allValid = false;
                continue;
            }

            // ==========================
            // VS REQUIRED
            // ==========================
            if (string.IsNullOrWhiteSpace(VS.SelectedValue))
            {
                _censusErrors.Add(womID + ": Vital Status is required.");
                allValid = false;
                continue;
            }

            string vs = VS.SelectedValue;

            // ==========================
            // RULE: VS = 8 or 9 → others empty
            // ==========================
            if (vs == "8" || vs == "9")
            {
                CheckMustBeEmpty(MS, womID, "Met Status");
                CheckMustBeEmpty(Marr, womID, "Marital Status");
                CheckMustBeEmpty(HusVS, womID, "Husband Vital Status");
                CheckMustBeEmpty(WomConsent, womID, "Consent");
                continue;
            }

            // ==========================
            // RULE: VS = 1 → required fields
            // ==========================
            if (vs == "1")
            {
                if (string.IsNullOrWhiteSpace(MS.SelectedValue))
                {
                    _censusErrors.Add(womID + ": Met Status is required.");
                    womanValid = false;
                }

                if (string.IsNullOrWhiteSpace(Marr.SelectedValue))
                {
                    _censusErrors.Add(womID + ": Marital Status is required.");
                    womanValid = false;
                }

                if (HusVS == null || string.IsNullOrWhiteSpace(HusVS.SelectedValue))
                {
                    _censusErrors.Add(womID + ": Husband Vital Status is required.");
                    womanValid = false;
                }

                if (!womanValid)
                {
                    allValid = false;
                    continue;
                }

                string ms = MS.SelectedValue;
                string hus = HusVS.SelectedValue;

                // ==========================
                // MS = 1 (MET)
                // ==========================
                if (ms == "1")
                {
                    if (hus == "1")
                    {
                        if (WomConsent == null ||
                            string.IsNullOrWhiteSpace(WomConsent.SelectedValue))
                        {
                            _censusErrors.Add(womID + ": Consent is required.");
                            womanValid = false;
                        }
                    }
                    else if (hus == "8")
                    {
                        if (Marr.SelectedValue != "2")
                        {
                            _censusErrors.Add(womID + ": Marital Status must be '2'.");
                            womanValid = false;
                        }

                        CheckMustBeEmpty(WomConsent, womID, "Consent");
                    }
                }

                // ==========================
                // MS = 2 (NOT MET)
                // ==========================
                else if (ms == "2")
                {
                    CheckMustBeEmpty(WomConsent, womID, "Consent");

                    if (hus == "8" && Marr.SelectedValue != "2")
                    {
                        _censusErrors.Add(womID + ": Marital Status must be '2'.");
                        womanValid = false;
                    }
                }

                // ==========================
                // MS = 7 or 9
                // ==========================
                else if (ms == "7" || ms == "9")
                {
                    CheckMustBeEmpty(Marr, womID, "Marital Status");
                    CheckMustBeEmpty(HusVS, womID, "Husband Vital Status");
                    CheckMustBeEmpty(WomConsent, womID, "Consent");
                }
            }

            if (!womanValid)
                allValid = false;
        }

        args.IsValid = allValid;
    }


    private bool TryValidateNepalGPS(
    string latText,
    string lngText,
    out decimal lat,
    out decimal lng,
    out string errorMessage)
    {
        lat = 0;
        lng = 0;
        errorMessage = string.Empty;

        // PARSE USING INVARIANT CULTURE
        if (!decimal.TryParse(
                latText,
                System.Globalization.NumberStyles.Any,
                System.Globalization.CultureInfo.InvariantCulture,
                out lat)
            ||
            !decimal.TryParse(
                lngText,
                System.Globalization.NumberStyles.Any,
                System.Globalization.CultureInfo.InvariantCulture,
                out lng))
        {
            errorMessage = "Invalid GPS coordinates.";
            return false;
        }

        // Nepal boundary check
        if (lat < 26 || lat > 31 || lng < 80 || lng > 89)
        {
            errorMessage = "GPS coordinates are outside Nepal range.";
            return false;
        }

        return true;
    }


    #endregion

    #region VARIABLES
    /***************************
     *    VARIABLES      *
     ***************************/

    private string FormDateNep
    {
        get
        {
            return Core.BuildNepaliDate(
                Day.Text,
                Month.Text,
                Year.Text
            );
        }
    }

    private string Address
    {
        get
        {
            return Core.BuildAddress(
                MuniId.Text,
                Ward.Text,
                HH.Text
            );
        }
    }

    #endregion


    #region MESSAGES

    // ---------- STOP / EXIT MESSAGES ----------
    private const string MsgStopHH =
        "This household is not eligible for further data collection. Thank you.";

    private const string MsgNoEligibleWoman =
        "No eligible woman exists in this household. Data collection stops here.";

    private const string MsgConsentRefused =
        "Household consent was refused. No further data will be collected. Thank you.";

    private const string MsgVitalStatusStop =
        "Based on the vital status, no further census data is required.";

    // ---------- SUCCESS MESSAGES ----------
    private const string MsgHeaderSaved =
        "Success! Household header information has been saved.";

    private const string MsgWomanSaved =
        "Existing woman census information has been saved.";

    private const string MsgCollectInfo =
    "Please update the woman and husband information below.";

    private const string MsgCreateNewWoman =
        "You may now create a new married woman list for this household.";

    private const string MsgHasWomanMismatch =
    "There is at least one eligible woman already recorded for this household. " +
    "Please select the eligible woman status 'Yes'.";


    #endregion

}