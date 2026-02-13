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
public partial class pages_OH_CENSUS : System.Web.UI.Page
{
    // QueryString Variables
    protected string strID, strAddr, strWeek, strNepDate, strWorkerID, strMsg, strRID;
    private List<string> _headerErrors = new List<string>();
    private List<string> _censusErrors = new List<string>();

   
    #region EVENTS
    /***************************
     *    EVENTS      *
     ***************************/
    protected void Page_Load(object sender, EventArgs e)
    {
        strID = Request.QueryString["id"] ?? "";
        strAddr = Request.QueryString["addr"];
        strWeek = Request.QueryString["wk"];
        strNepDate = Request.QueryString["dt"];
        strWorkerID = Request.QueryString["wr"];
        strMsg = Request.QueryString["msg"];
        strRID = Request.QueryString["rid"];

        if (!IsPostBack)
        {
            lblsucessmsg.Text = "";
            LitErrors.Text = "";

            string[] AryAddressUnit = Core.GetAddressUunit(strAddr);
            bool isNew = strID.Length == 6;

            // Load existing women for this household
            if (isNew)
            {
                BindCensusRecord(strID);
            }
            else
            {
                BindWomenRoster(strID);
                PopulateHusband(strAddr);
            }  
             
            PanelPopulateHusbandList.Visible = !isNew;
            PanelWomanNNIPSNUM.Visible = !isNew;
            PanelHusbandNNIPSNUM.Visible = !isNew;

        }
    }

    protected void CensusNNIPSNumStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        WomanNNIPSNUM.Text = "";
        string ns = CensusNNIPSNumStatus.SelectedValue;
        if(ns == "3")
        {
            CensusHusbNNIPSNumStatus.Visible = false;
            HusbandNNIPSNUM.Visible = false;
            WomanNNIPSNUM.Enabled = false;
            LblNote.Text = "Correction: Use this option if the woman’s maternal home is within " +
                "the NNIPS area and she has already been enrolled in one of our previous studies " +
                "and received an NNIPS number. In this case, please complete all required forms " + 
                "and submit them to the field office so the correct NNIPS number can be identified " +
                "and updated.";
        }
        else if (ns == "1")
        {
            WomanNNIPSNUM.Enabled = false;
            CensusHusbNNIPSNumStatus.Visible = true;
            HusbandNNIPSNUM.Visible = true;
            LblNote.Text = "Auto Assign: When this option is selected, a new NNIPS number is  " +
                "automatically created and saved in the census database. You do not need to  " + 
                "enter an NNIPS number manually.";
        }
        else
        {
            WomanNNIPSNUM.Enabled = true;
            CensusHusbNNIPSNumStatus.Visible = true;
            HusbandNNIPSNUM.Visible = true;
            LblNote.Text = "Manual Assign: Use this option only if the NNIPS number is already known." + 
                "You will need to enter the NNIPS number manually.";
        }
    }

    protected void ButtonSaveData_Click(object sender, EventArgs e)
    {
        Page.Validate("vgCensus");

        if (!Page.IsValid)
        {
            PanelSuccess.Visible = false;
            return;
        } 
        SaveCensusWoman();        
        Response.Redirect("~/pages/OH_WOMENROSTER.aspx?id=" + strAddr + "&wk=" + strWeek + "&dt=" + strNepDate + "&wr=" + strWorkerID + "&page=roster&msg=successmsg");        
    }

 
    #endregion

    #region SUPPORTMETHODS
    /***************************
     *    SUPPORT METHODS      *
     ***************************/

    private void BindWomenRoster(string nnipsId)
    {
        WomenRosterTableAdapter adapter = new WomenRosterTableAdapter();
        OralHealth.WomenRosterDataTable dt = adapter.GetDataById(int.Parse(nnipsId));
        if (dt.Rows.Count > 0)
        {
            var WRRow = (OralHealth.WomenRosterRow)dt.Rows[0];
            WomanFirstNames.Text = WRRow.CensusFirstNames.ToUpper().Trim();
            WomanLastName.Text = WRRow.CensusLastName.ToUpper().Trim();
            CensusDOBNep.Text = WRRow.CensusDOBNep;

            SetDropdownValue(CensusVS, WRRow.IsCensusVSNull() ? "" : WRRow.CensusVS);
            SetDropdownValue(CensusMarr, WRRow.IsCensusMarrNull() ? "" : WRRow.CensusMarr);
            SetDropdownValue(CensusHusbandVS, WRRow.IsCensusHusbVSNull() ? "" : WRRow.CensusHusbVS);
        } 
    }

    private void BindCensusRecord(string nnipsId)
    {
        try
        {
            CensusTableAdapter adapter = new CensusTableAdapter();
            OralHealth.CensusDataTable dt = adapter.GetDataByNNIPSnum(nnipsId);

            if (dt.Rows.Count > 0)
            {
                OralHealth.CensusRow row = (OralHealth.CensusRow)dt.Rows[0];

                // 1. Prefill Labels
                WomanNNIPSNUM.Text = row.CensusNNIPSnum;
                WomanFirstNames.Text = row.CensusFirstNames;
                WomanLastName.Text = row.CensusLastName;

                // Husband Info
                HusbandNNIPSNUM.Text = row.IsCensusHusbNNIPSnumNull() ? "" : row.CensusHusbNNIPSnum;
                CensusHusbFirstNames.Text = row.IsCensusHusbFirstNamesNull() ? "" : row.CensusHusbFirstNames;
                CensusHusbLastName.Text = row.IsCensusHusbLastNameNull() ? "" : row.CensusHusbLastName;

                // 2. Prefill TextBoxes
                CensusDOBNep.Text = row.CensusDOBNep;

                // 3. Prefill DropDownLists (requires checking if the value exists in the list)
                SetDropdownValue(CensusVS, row.IsCensusVSNull() ? "" : row.CensusVS);
                SetDropdownValue(CensusMarr, row.IsCensusMarrNull() ? "" : row.CensusMarr);
                SetDropdownValue(CensusHusbandVS, row.IsCensusHusbVSNull() ? "" : row.CensusHusbVS);
                SetDropdownValue(CensusMS, row.IsCensusMSNull() ? "" : row.CensusMS);
                SetDropdownValue(CensusConsent, row.IsCensusConsentNull() ? "" : row.CensusConsent);

                CensusAge.Text = row.CensusAge; 
            }
        }
        catch (Exception ex)
        {
            //lblError.Text = "Error prefilling form: " + ex.Message;
        }
    } 


    // Helper to prevent "SelectedValue" errors if the DB value doesn't match an item
    private void SetDropdownValue(DropDownList ddl, string value)
    {
        if (ddl.Items.FindByValue(value) != null)
        {
            ddl.SelectedValue = value;
        }
        else
        {
            ddl.SelectedIndex = 0; // Default to "----"
        }
    }

    private void PopulateHusband(string addr)
    {
        View_NNIPSPersonTableAdapter TA = new View_NNIPSPersonTableAdapter();
        GridHusbandList.DataSource = TA.GetDataByAddress(addr);
        GridHusbandList.DataBind();
    }

    private string GetNNIPSNum(string strNNIPSNum)
    {
        if (Core.IsEmpty(strNNIPSNum))
        {
            return Core.generateNNIPSnumber();
        }
        return strNNIPSNum;
    }
      
    private bool CheckExistingWoman(string strID)
    {
        if (string.IsNullOrWhiteSpace(strID))
            return false;

        // Existing woman → ID length = 6
        if (strID.Trim().Length == 6)
            return true;

        // New woman → ID length < 6
        return false;
    }
 
private void SaveCensusWoman()
{
    int rosterId = int.Parse(strRID);

    string womanStatus = CensusNNIPSNumStatus.SelectedValue;
    string husbandStatus = CensusHusbNNIPSNumStatus.SelectedValue;

    string womanFn = Core.CleanText(WomanFirstNames.Text);
    string womanLn = Core.CleanText(WomanLastName.Text);
    string husbandFn = Core.CleanText(CensusHusbFirstNames.Text);
    string husbandLn = Core.CleanText(CensusHusbLastName.Text);
    string dobNep = Core.CleanText(CensusDOBNep.Text);
    string strAddress = strAddr;

    // Get NNIPS numbers from input
    string womNNIPS = GetNNIPSNum(Core.CleanText(WomanNNIPSNUM.Text));
    string husbNNIPS = GetNNIPSNum(Core.CleanText(HusbandNNIPSNUM.Text));

    try
    {
        using (var scope = new TransactionScope())
        {
            // ===============================
            // 1. Existing Woman
            // ===============================
            if (CheckExistingWoman(strID))
            {
                UpdateCensus(strID);
                Core.UpdateNNIPSProfile(CensusVS.SelectedValue, strAddress, dobNep, strID);
                Core.UpdateNNIPSProfile(CensusHusbandVS.SelectedValue.ToString(), strAddress, "99999999", HusbandNNIPSNUM.Text);
                UpdateRoster(rosterId, "1", HusbandNNIPSNUM.Text);
                scope.Complete();
                return;
            }

            // ===============================
            // 2. Woman Status = Correction
            // ===============================
            if (womanStatus == "3")
            {
                UpdateRoster(rosterId, "2", null);
                scope.Complete();
                return;
            }

            // ===============================
            // 3. Handle Woman NNIPS
            // ===============================
            if (womanStatus == "1") // create new
            {
                womNNIPS = GetNNIPSNum(WomanNNIPSNUM.Text.Trim());

                InsertNNIPS(
                    womNNIPS,
                    womanFn,
                    womanLn,
                    dobNep,
                    "2", // gender code?
                    CensusVS.SelectedValue,
                    strAddress
                );
            }
            else if (womanStatus == "2") // manual update
            {
                womNNIPS = WomanNNIPSNUM.Text.Trim();
                UpdateCensus(womNNIPS);
                Core.UpdateNNIPSProfile(CensusVS.SelectedValue, strAddress, dobNep, womNNIPS);
            }

            // ===============================
            // 4. Handle Husband NNIPS
            // ===============================
            if (husbandStatus == "1") // create new
            {
                husbNNIPS = GetNNIPSNum(HusbandNNIPSNUM.Text.Trim());

                // Ensure husband's NNIPS is not same as woman's
                if (husbNNIPS == womNNIPS)
                    husbNNIPS = Core.generateNNIPSnumber();

                InsertNNIPS(
                    husbNNIPS,
                    husbandFn,
                    husbandLn,
                    "99999999",
                    "1", // gender?
                    CensusHusbandVS.SelectedValue,
                    strAddress
                );
            }
            else if (husbandStatus == "2") // manual update
            {
                Core.UpdateNNIPSProfile(CensusHusbandVS.SelectedValue.ToString(), strAddress, "99999999", husbNNIPS);
            }

            // ===============================
            // 5. Link Woman & Husband
            // ===============================
            if (!string.IsNullOrEmpty(womNNIPS) && !string.IsNullOrEmpty(husbNNIPS))
            {
                Core.UpdateInsertNNIPSWomen(womNNIPS, husbNNIPS);
            }

            // ===============================
            // 6. Insert Census Record
            // ===============================
            if(womanStatus != "2")
            {
                InsertCensus(womNNIPS, husbNNIPS);
            }
            

            // ===============================
            // 7. Update Roster
            // ===============================
            UpdateRoster(rosterId, "1", husbNNIPS);

            // Complete Transaction
            scope.Complete();
        }
    }
    catch (Exception ex)
    {
        // Log or handle exception
        //Core.LogError("Error saving census woman: " + ex.Message);
        throw;
    }
}


private void InsertCensus(string womNN, string husbNNIPS)
    {
        var CNAdapter = new OralHealthTableAdapters.CensusTableAdapter();
        var dt = new OralHealth.CensusDataTable();
        var row = dt.NewCensusRow();

        row.CensusNNIPSnum = GetNNIPSNum(womNN);
        row.CensusAddress = strAddr;        
        row.CensusWeek = strWeek;
        row.CensusNepDate = strNepDate;
        row.CensusRomDate =
            (DateTime)Core.GetRomDateFromNepDate(strNepDate, true); 
        row.CensusWorkerID = strWorkerID;        
        row.CensusFirstNames = Core.CleanText(WomanFirstNames.Text);
        row.CensusLastName = Core.CleanText(WomanLastName.Text);
        row.CensusSex = "2";
        row.CensusVS = CensusVS.SelectedValue;
        row.CensusAge = CalculatedAge != null ? CalculatedAge.Value : null;
        row.CensusDOBNep = Core.CleanText(CensusDOBNep.Text);
        row.CensusDOBRom =
            (DateTime)Core.GetRomDateFromNepDate(CensusDOBNep.Text, true);
        row.CensusMarr = CensusMarr.SelectedValue;
        row.CensusMS = CensusMS.SelectedValue;
        row.CensusConsent = CensusConsent.SelectedValue;
        row.CensusHusbNNIPSnum = husbNNIPS;
        row.CensusHusbFirstNames = Core.CleanText(CensusHusbFirstNames.Text);
        row.CensusHusbLastName = Core.CleanText(CensusHusbLastName.Text);
        row.CensusHusbVS = CensusHusbandVS.SelectedValue;
        row.CensusDEO = Core.GetDEO();
        row.CensusUpdate = DateTime.Now;
        row.CensusCreate = DateTime.Now;
        dt.AddCensusRow(row);
        CNAdapter.Update(dt);
    }

    private void InsertNNIPS(string nn, string fn, string ln, string dobNep, 
                            string sex, string vs, string addr)
    {
        Core.InsertPersonNNIPS(nn, fn, ln, dobNep, sex, vs, addr);             
    }

    private void UpdateCensus(string womNN)
    {
        var CNAdapter = new OralHealthTableAdapters.CensusTableAdapter();
        var CNDT = CNAdapter.GetDataByNNIPSnum(womNN);

        if (CNDT.Rows.Count == 0)
            return;

        var row = CNDT[0];
        row.CensusAddress = strAddr;
        row.CensusWeek = strWeek;
        row.CensusNepDate = strNepDate;
        row.CensusRomDate =
            (DateTime)Core.GetRomDateFromNepDate(strNepDate, true);
        row.CensusWorkerID = strWorkerID;

        row.CensusVS = CensusVS.SelectedValue;
        //row.CensusAge = CalculatedAge != null ? CalculatedAge.Value : null; 
        row.CensusAge = CensusAge.Text;
        row.CensusDOBNep = Core.CleanText(CensusDOBNep.Text);
        row.CensusDOBRom =
            (DateTime)Core.GetRomDateFromNepDate(CensusDOBNep.Text, true);
        row.CensusMarr = CensusMarr.SelectedValue;
        row.CensusMS = CensusMS.SelectedValue;
        row.CensusConsent = CensusConsent.SelectedValue;
        row.CensusHusbVS = CensusHusbandVS.SelectedValue;
        row.CensusDEO = Core.GetDEO();
        row.CensusUpdate = DateTime.Now;
        CNAdapter.Update(CNDT);
    }

    private void UpdateRoster(int Rid, string nnStatus, string hNN)
    {
        var CNAdapter = new OralHealthTableAdapters.WomenRosterTableAdapter();
        var CNDT = CNAdapter.GetDataById(Rid);

        if (CNDT.Rows.Count == 0) return;

        var row = CNDT[0];

        row.CensusFirstNames = Core.CleanText(WomanFirstNames.Text);
        row.CensusLastName = Core.CleanText(WomanLastName.Text);
        row.CensusVS = CensusVS.SelectedValue;
        row.CensusDOBNep = Core.CleanText(CensusDOBNep.Text);
        row.CensusDOBRom = (DateTime)Core.GetRomDateFromNepDate(CensusDOBNep.Text, true);  
        row.CensusAge = CensusAge.Text; 
        row.CensusMarr = CensusMarr.SelectedValue;
        row.CensusMS = CensusMS.SelectedValue;
        row.CensusConsent = CensusConsent.SelectedValue;
        row.CensusHusbNNIPSnum = hNN;
        row.CensusHusbFirstNames = Core.CleanText(CensusHusbFirstNames.Text);
        row.CensusHusbLastName = Core.CleanText(CensusHusbLastName.Text);
        row.CensusHusbVS = CensusHusbandVS.SelectedValue;
        row.CensusDEO = Core.GetDEO();
        row.CensusUpdate = DateTime.Now;
        row.CensusStatus = nnStatus;
        
        CNAdapter.Update(CNDT);
    }

    private void ApplyCensusRules(dynamic row)
    {
        int vs = Convert.ToInt32(row.CensusVS);

        int? ms = string.IsNullOrEmpty(CensusMS.SelectedValue)
            ? (int?)null
            : Convert.ToInt32(CensusMS.SelectedValue);

        int? husbandVS = string.IsNullOrEmpty(CensusHusbandVS.SelectedValue)
            ? (int?)null
            : Convert.ToInt32(CensusHusbandVS.SelectedValue);

        int? marr = string.IsNullOrEmpty(CensusMarr.SelectedValue)
            ? (int?)null
            : Convert.ToInt32(CensusMarr.SelectedValue);

        string consent = CensusConsent.Text.Trim();

        // VS = 8 or 9 → clear all
        if (vs == 8 || vs == 9)
        {
            row.SetCensusMSNull();
            row.SetCensusHusbVSNull();
            row.SetCensusMarrNull();
            row.SetCensusConsentNull();
            return;
        }

        // VS = 1 requires MS, HusbandVS, Marr
        if (vs == 1 && (ms == null || husbandVS == null || marr == null))
            throw new Exception("Marriage information required.");

        if (ms == 1)
        {
            if (husbandVS == 1)
            {
                if (string.IsNullOrEmpty(consent))
                    throw new Exception("Consent required.");

                row.CensusConsent = consent;
            }
            else if (husbandVS == 8)
            {
                if (marr != 2)
                    throw new Exception("Marriage must be value 2.");

                row.SetCensusConsentNull();
            }
        }

        if (ms == 2)
        {
            row.SetCensusConsentNull();

            if (husbandVS == 8 && marr != 2)
                throw new Exception("Marriage must be value 2.");
        }

        if (ms == 7 || ms == 9)
        {
            row.SetCensusMarrNull();
            row.SetCensusHusbVSNull();
            row.SetCensusConsentNull();
        }

        if (ms != null) row.CensusMS = ms.ToString();
        if (husbandVS != null) row.CensusHusbVS = husbandVS.ToString();
        if (marr != null) row.CensusMarr = marr.ToString();
    } 


    #endregion

    #region VALIDATIONS
    /***************************
     *    VALIDATIONS      *
     ***************************/

    protected void cvCensus_ServerValidate(object source, ServerValidateEventArgs args)
    {
        _censusErrors.Clear();
        string urlWid = Request.QueryString["id"] ?? "";
        bool isExistingWoman = urlWid.Length == 6; //

        if (isExistingWoman)
        {
            ValidateExistingWoman(_censusErrors);
        }
        else
        {
            ValidateNewWoman(_censusErrors);
        }

        //
        args.IsValid = _censusErrors.Count == 0;

        if (!args.IsValid)
        {
            PanelError.Visible = true;
            LitErrors.Text = string.Join("<br/>", _censusErrors);
        }
    }

    protected void cvDOBNep_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string input = args.Value.Trim();

        // Must be 8 digits
        if (!System.Text.RegularExpressions.Regex.IsMatch(input, @"^\d{8}$"))
        {
            args.IsValid = false;
            return;
        }

        // Unknown full DOB allowed
        if (input == "99999999")
        {
            args.IsValid = true;
            return;
        }

        int day = int.Parse(input.Substring(0, 2));
        int month = int.Parse(input.Substring(2, 2));
        int year = int.Parse(input.Substring(4, 4));

        bool unknownDay = day == 99;
        bool unknownMonth = month == 99;

        if (!unknownMonth && (month < 1 || month > 12))
        {
            args.IsValid = false;
            return;
        }
        if (!unknownDay && (day < 1 || day > 32))
        {
            args.IsValid = false;
            return;
        }

        // Replace unknown day/month with 1 for calculation
        if (unknownDay) day = 1;
        if (unknownMonth) month = 1;

        // Convert BS -> AD
        DateTime dobAd;
        try
        {
            dobAd = (DateTime)Core.GetRomDateFromNepDate(
                string.Format("{0:D2}{1:D2}{2}", day, month, year), true);
        }
        catch
        {
            args.IsValid = false;
            return;
        }

        // Calculate age
        DateTime today = DateTime.Today;
        int age = today.Year - dobAd.Year;
        if (today < dobAd.AddYears(age)) age--;

        // Age must be 15–35
        if (age < 15 || age > 35)
        {
            args.IsValid = false;
            return;
        }

        args.IsValid = true;
    }



    private void ValidateExistingWoman(List<string> errors)
    {
        int censusVs = GetInt(CensusVS.SelectedValue);
        int censusMS = GetInt(CensusMS.SelectedValue);
        int husbandVS = GetInt(CensusHusbandVS.SelectedValue);
        int censusMarr = GetInt(CensusMarr.SelectedValue);
        int nnipsStatus = GetInt(CensusNNIPSNumStatus.SelectedValue);
        string consent = CensusConsent.SelectedValue;

        if (censusVs == 0)
            //errors.Add("Vital status is required.");
            RequireValue(errors, CensusVS, "Vital status");

        if (censusVs == 8 || censusVs == 9)
        {
            RequireEmpty(errors, CensusMS, "Marital status");
            RequireEmpty(errors, CensusHusbandVS, "Husband vital status");
            RequireEmpty(errors, CensusMarr, "Marriage");
            RequireEmpty(errors, CensusConsent, "Consent");
        }

        if (censusVs == 1)
        {
            RequireValue(errors, CensusMS, "Met status");
            RequireValue(errors, CensusHusbandVS, "Husband vital status");
            RequireValue(errors, CensusMarr, "Marriage");
        }

        if (censusMS == 1)
        {
            if (husbandVS == 1 && string.IsNullOrWhiteSpace(consent))
                errors.Add("Consent is required.");

            if (husbandVS == 8 || husbandVS == 9)
            {
                if (censusMarr != 2)
                    errors.Add("Marriage must be value 'Married without husband'.");

                if (!string.IsNullOrWhiteSpace(consent))
                    errors.Add("Consent must be empty.");
            }
        }

        if (censusMS == 2)
        {
            if (!string.IsNullOrWhiteSpace(consent))
                errors.Add("Consent must be empty.");

            if ((husbandVS == 8 || husbandVS == 9) && censusMarr != 2)
                errors.Add("Marriage must be value 'Married without husband'.");
        }

        if (censusMS == 7 || censusMS == 9)
        {
            RequireEmpty(errors, CensusMarr, "Marriage");
            RequireEmpty(errors, CensusHusbandVS, "Husband vital status");
            RequireEmpty(errors, CensusConsent, "Consent");
        }

    }

    private void ValidateNewWoman(List<string> errors)
    {
        int censusVs = GetInt(CensusVS.SelectedValue);
        int censusMS = GetInt(CensusMS.SelectedValue);
        int husbandVS = GetInt(CensusHusbandVS.SelectedValue);
        int censusMarr = GetInt(CensusMarr.SelectedValue);
        int nnipsStatus = GetInt(CensusNNIPSNumStatus.SelectedValue);
        int husbNnipsStatus = GetInt(CensusHusbNNIPSNumStatus.SelectedValue);
        string consent = CensusConsent.SelectedValue;

        if (censusVs != 1)
            errors.Add("Vital status must be Alive.");

        RequireText(errors, WomanFirstNames, "First name");
        RequireText(errors, WomanLastName, "Last name");
        RequireText(errors, CensusDOBNep, "DOB");

        int age = GetInt(CalculatedAge.Value);
        if (age < 15 || age > 35)
            errors.Add("Age must be between 15 and 35.");

        if (!(censusMS == 1 || censusMS == 2))
            errors.Add("Met status must be Met or Not met.");

        if (censusMarr != 1)
            errors.Add("Marriage must be Married with husband.");

        RequireText(errors, CensusHusbFirstNames, "Husband first name");
        RequireText(errors, CensusHusbLastName, "Husband last name");

        if (husbandVS != 1)
            errors.Add("Husband vital status must be Alive.");

        if (censusMS == 1 && string.IsNullOrWhiteSpace(consent))
            errors.Add("Consent required.");

        if (censusMS == 2 && !string.IsNullOrWhiteSpace(consent))
            errors.Add("Consent must be empty.");

        /* ---------- WOMAN NNIPS ---------- */
        ValidateNNIPS(
            nnipsStatus,
            WomanNNIPSNUM.Text.Trim(),
            WomanFirstNames.Text.Trim(),
            WomanLastName.Text.Trim(),
            CensusDOBNep.Text.Trim(),
            errors,
            "Woman"
        );

        /* ---------- HUSBAND NNIPS ---------- */
        ValidateNNIPS(
            husbNnipsStatus,
            HusbandNNIPSNUM.Text.Trim(),
            CensusHusbFirstNames.Text.Trim(),
            CensusHusbLastName.Text.Trim(),
            "99999999", // husband DOB rule
            errors,
            "Husband"
        );
    }


    private void ValidateNNIPS(
    int status,
    string nnipsNum,
    string firstName,
    string lastName,
    string dob,
    List<string> errors,
    string personLabel)
    {
        // Manual entry
        if (status == 2)
        {
            if (string.IsNullOrEmpty(nnipsNum))
            {
                errors.Add(personLabel + " NNIPS required.");
                return;
            }

            VerifyNNIPSRecord(nnipsNum, firstName, lastName, dob, errors, personLabel);
        }

        // System generate → field must be empty
        if ((status == 1 || status == 3) && !string.IsNullOrEmpty(nnipsNum))
        {
            errors.Add(personLabel + " NNIPS field must be empty.");
        }
    }
    private void VerifyNNIPSRecord(
    string nnipsNum,
    string firstName,
    string lastName,
    string dob,
    List<string> errors,
    string personLabel)
    {
        var adapter = new maharishiTableAdapters.NNIPSTableAdapter();
        var dt = new maharishi.NNIPSDataTable();
        adapter.FillByNNIPSnum(dt, nnipsNum);

        if (dt.Rows.Count == 0)
        {
            errors.Add(personLabel + " NNIPS record not found on the server.");
            return;
        }

        var row = dt[0];

        if (firstName != row.FirstNames)
            errors.Add(personLabel + " first name mismatch." + row.FirstNames);

        if (lastName != row.LastName)
            errors.Add(personLabel + " last name mismatch." + row.LastName);

        //if (dob != row.DOBNep)
        //    errors.Add(personLabel + " DOB mismatch." + row.DOBNep);
    }



    int GetInt(string v)
    {
        int r;
        int.TryParse(v, out r);
        return r;
    }

    void RequireText(List<string> errors, TextBox tb, string name)
    {
        if (string.IsNullOrWhiteSpace(tb.Text))
            errors.Add(name + " required.");
    }

    void RequireValue(List<string> errors, DropDownList ddl, string name)
    {
        if (string.IsNullOrEmpty(ddl.SelectedValue))
            errors.Add(name + " required.");
    }

    void RequireEmpty(List<string> errors, WebControl ctl, string name)
    {
        TextBox tb = ctl as TextBox;
        if (tb != null)
        {
            if (!string.IsNullOrWhiteSpace(tb.Text))
                errors.Add(name + " must be empty.");
            return;
        }

        DropDownList ddl = ctl as DropDownList;
        if (ddl != null)
        {
            if (!string.IsNullOrEmpty(ddl.SelectedValue))
                errors.Add(name + " must be empty.");
        }
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

    private void SetCommonCensusFields(dynamic row, string vs, string ageVal, DateTime romDate, DateTime dobRom)
    {
        row.CensusWeek = strWeek;
        row.CensusNepDate = strNepDate;
        row.CensusRomDate = romDate;
        row.CensusWorkerID = strWorkerID;
        row.CensusDEO = Core.GetDEO();
        row.CensusUpdate = DateTime.Now;

        row.CensusVS = vs;
        row.CensusAge = ageVal;
        row.CensusDOBNep = Core.CleanText(CensusDOBNep.Text);
        row.CensusDOBRom = dobRom;
    }
    private void SetCommonRosterFields(dynamic row, string vs, string ageVal, DateTime romDate, DateTime dobRom)
    {
        row.CensusWeek = strWeek;
        row.CensusNepDate = strNepDate;
        row.CensusRomDate = romDate;
        row.CensusWorkerID = strWorkerID;
        row.CensusDEO = Core.GetDEO();
        row.CensusUpdate = DateTime.Now;

        row.CensusVS = vs;
        row.CensusAge = ageVal;
        row.CensusDOBNep = Core.CleanText(CensusDOBNep.Text);
        row.CensusDOBRom = dobRom;
    }

    private void UpdateNNIPS(int vs)
    {
        var NNIPSAdapter = new maharishiTableAdapters.NNIPSTableAdapter();

        NNIPSAdapter.UpdateNNIPSVS(vs.ToString(), DateTime.Now, strID);

        if (!string.IsNullOrWhiteSpace(HusbandNNIPSNUM.Text))
        {
            NNIPSAdapter.UpdateNNIPSVS(CensusHusbandVS.SelectedValue, DateTime.Now, HusbandNNIPSNUM.Text.Trim());
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
        "Woman census information has been saved.";

    private const string MsgCollectInfo =
    "Please update the woman and husband information below.";

    private const string MsgCreateNewWoman =
        "You may now create a new married woman list for this household.";

    private const string MsgHasWomanMismatch =
    "There is at least one eligible woman already recorded for this household. " +
    "Please select the eligible woman status 'Yes'.";


    #endregion

}