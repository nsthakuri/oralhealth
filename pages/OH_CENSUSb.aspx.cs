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

public partial class pages_OH_CENSUSb : System.Web.UI.Page
{
    // Stores Household Address ID (Muni+Ward+HH)
    // Passed from previous screen using QueryString
    protected string strID;
    protected string strWeek;
    protected string strNepDate;
    protected string strWorkerID;
    private List<string> _newWomanErrors = new List<string>();

    #region EVENTS
    /***************************
     *    EVENTS      *
     ***************************/
    protected void Page_Load(object sender, EventArgs e)
    {
        strID = Request.QueryString["id"];
        strWeek = Request.QueryString["wk"];
        strNepDate = Request.QueryString["dt"];
        strWorkerID = Request.QueryString["wr"];        
         
        if (!IsPostBack)
        {
            lblsucessmsg.Text = "";
            string[] AryAddressUnit = Core.GetAddressUunit(strID);            
            BindWomanGrid(); 
        }
    }

    protected void GridWomanList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        lblsucessmsg.Text = "";
        if (e.CommandName == "DeleteRow")
        {
            int CensusID = Convert.ToInt32(e.CommandArgument);            
            BindWomanGrid();
            //delete from woman list
            var womanListTA = new OralHealthTableAdapters.WomenRosterTableAdapter();
            //womanListTA.DeleteQuery(CensusID);
            PanelSuccess.Visible = true;
            lblsucessmsg.Text = MsgWomanDeletedFromList;
            BindWomanGrid();
            return;
        }

        if (e.CommandName == "ButtonAddToCensusWithNNIPS")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            if (rowIndex < 0 || rowIndex >= GridWomanList.Rows.Count)
                return;

            PrepareCensusForm(
                isWithinNNIPS: true,
                censusID: GridWomanList.DataKeys[rowIndex]["CensusID"].ToString(),
                firstName: GridWomanList.DataKeys[rowIndex]["CensusFirstNames"].ToString(),
                lastName: GridWomanList.DataKeys[rowIndex]["CensusLastName"].ToString()
            );

            return;
        }
         
        if (e.CommandName == "ButtonAddToCensusOutsideNNIPS")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            if (rowIndex < 0 || rowIndex >= GridWomanList.Rows.Count)
                return;

            PrepareCensusForm(
                isWithinNNIPS: false,
                censusID: GridWomanList.DataKeys[rowIndex]["CensusID"].ToString(),
                firstName: GridWomanList.DataKeys[rowIndex]["CensusFirstNames"].ToString(),
                lastName: GridWomanList.DataKeys[rowIndex]["CensusLastName"].ToString()
            );

            return;
        } 

    }

    protected void ChkCensusNNIPSnum_CheckedChanged(object sender, EventArgs e)
    {
        NewCensusNNIPSnum.Enabled = !ChkCensusNNIPSnum.Checked;
        if (ChkCensusNNIPSnum.Checked)
            NewCensusNNIPSnum.Text = "";
    }

    protected void ButtonAddNewWoman_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/pages/OH_WOMENROSTER.aspx?id=" + strID + "&wk=" + strWeek + "&dt=" + strNepDate + "&wr=" + strWorkerID + "&page=roster");
    }
    // ============================
    // Household Header Submission
    // ============================

    protected void ButtonCensusSaveData_Click(object sender, EventArgs e)
    {
        lblsucessmsg.Text = "";
        PanelError.Visible = false;

        // 1) Must have selected woman
        if (string.IsNullOrWhiteSpace(TBCensusID.Text))
        {
            ShowError("Please select a woman from the list first.");
            return;
        }

        // 2) Validate
        bool isWithinNNIPS = !ChkCensusNNIPSnum.Visible;

        if (!ValidateNewWomanForm(isWithinNNIPS))
        {
            ShowErrorList(_newWomanErrors);
            return;
        }

        // 3) Save (Transaction inside SaveNewWoman)
        try
        {
            SaveNewWoman();
        }
        catch (Exception ex)
        {
            PanelSuccess.Visible = false;
            ShowError("Save failed: " + ex.Message); // or keep generic msg in production
            return;
        }

        // 4) Reset + refresh
        ResetNewWomanForm();
        TBCensusID.Text = "";
        PanelCensusForm.Visible = false;
        BindWomanGrid();

        // 5) Next screen decision
        PanelSuccess.Visible = true;

        if (HasWomenInWomanList())
        {
            PanelPopulateWomanList.Visible = true;
            PanelCensuWoman.Visible = false;
            lblsucessmsg.Text = MsgOneWomanSaved;
        }
        else
        {
            BindCensuWoman(strID);
            PanelPopulateWomanList.Visible = false;
            PanelCensuWoman.Visible = true;
            lblsucessmsg.Text = MsgAllWomenEnrolled;
        }
    }




    #endregion

    #region SUPPORTMETHODS
    /***************************
     *    SUPPORT METHODS      *
     ***************************/

    private void ResetNewWomanForm()
    {
        NewCensusNNIPSnum.Text = "";
        ChkCensusNNIPSnum.Checked = false;

        NewCensusFirstNames.Text = "";
        NewCensusLastName.Text = "";
        NewCensusDOBNep.Text = "";
        NewCensusAge.Text = "";

        NewHusbandNNIPSNUM.Text = "";
        ChkNewHusbandNNIPSNUM.Checked = false;
        NewCensusHusbFirstNames.Text = "";
        NewCensusHusbLastName.Text = "";

        NewCensusConsent.SelectedIndex = 0;
    }

    private void ShowError(string message)
    {
        PanelError.Visible = true;
        PanelError.CssClass = "error-card show";
        LitErrors.Text = message;
    }

    private void ShowErrorList(List<string> errors)
    {
        PanelError.Visible = true;
        PanelError.CssClass = "error-card show";
        LitErrors.Text =
            "<ul><li>" + string.Join("</li><li>", errors) + "</li></ul>";
    }

    private void BindWomanGrid()
    {
        OralHealthTableAdapters.WomenRosterTableAdapter TA = new OralHealthTableAdapters.WomenRosterTableAdapter();
        OralHealth.WomenRosterDataTable DT = new OralHealth.WomenRosterDataTable();
        TA.FillByAddress(DT, strID);
        GridWomanList.DataSource = DT;
        GridWomanList.DataBind();
    }
    private void BindCensuWoman(string addr)
    {
        OralHealthTableAdapters.View_WomanProfileTableAdapter TA = new OralHealthTableAdapters.View_WomanProfileTableAdapter();
        OralHealth.View_WomanProfileDataTable DT = new OralHealth.View_WomanProfileDataTable();
        TA.FillByAddress(DT, addr);
        GridViewCensuWoman.DataSource = DT;
        GridViewCensuWoman.DataBind();
    }
    private string ResolveNNIPS(string nnips, bool isNew)
    {
        return isNew ? null : nnips.Trim();
    }

    /// <summary>
    /// Prepares the Census form based on NNIPS mode
    /// </summary>
    /// <param name="isWithinNNIPS">
    /// true  = woman already has NNIPS (Within NNIPS)
    /// false = woman from outside NNIPS
    /// </param>
    private void PrepareCensusForm(
        bool isWithinNNIPS,
        string censusID,
        string firstName,
        string lastName)
    {
        // Bind selected woman
        TBCensusID.Text = censusID;
        NewCensusFirstNames.Text = firstName;
        NewCensusLastName.Text = lastName;

        // Reset NNIPS validation
        cvWomanNNIPS.IsValid = true;

        if (isWithinNNIPS)
        {
            // =========================
            // WITHIN NNIPS
            // =========================
            NewCensusNNIPSnum.Text = "";
            NewCensusNNIPSnum.Enabled = false;
            ChkCensusNNIPSnum.Visible = false;
            ChkCensusNNIPSnum.Checked = false;
            LblCensusNNIPSnum.Visible = false;

            LblWomanType.Text =
                "<b>Instructions:</b><br/>" + MsgOldNNIPSInstructions;
        }
        else
        {
            // =========================
            // OUTSIDE NNIPS
            // =========================
            NewCensusNNIPSnum.Text = "";
            NewCensusNNIPSnum.Enabled = true;
            ChkCensusNNIPSnum.Visible = true;
            ChkCensusNNIPSnum.Checked = false;
            LblCensusNNIPSnum.Visible = true;

            LblWomanType.Text =
                "<b>Instructions:</b><br/>" + MsgOutsideNNIPSInstructions;
        }

        // Show census panel
        PanelCensusForm.Visible = true;

        // Focus for better UX
        NewCensusFirstNames.Focus();
    }


    private string EnsureHusband(
    string husbNNIPS,
    string firstName,
    string lastName,
    string vs,
    string addressID)
    {
        var nnipsTA = new maharishiTableAdapters.NNIPSTableAdapter();

        if (Core.IsEmpty(husbNNIPS))
        {
            husbNNIPS = Core.generateNNIPSnumber();

            Core.InsertPersonNNIPS(
                husbNNIPS,
                Core.CleanText(firstName),
                Core.CleanText(lastName),
                "99999999",
                "1",
                vs,
                addressID
            );

            return husbNNIPS;
        }

        // if typed NNIPS: check it exists, else insert
        var dt = new maharishi.NNIPSDataTable();
        nnipsTA.FillByNNIPSnum(dt, husbNNIPS);

        if (dt.Rows.Count == 0)
        {
            Core.InsertPersonNNIPS(
                husbNNIPS,
                Core.CleanText(firstName),
                Core.CleanText(lastName),
                "99999999",
                "1",
                vs,
                addressID
            );
        }
        else
        {
            nnipsTA.UpdateNNIPSVS(vs, DateTime.Now, husbNNIPS);
        }

        return husbNNIPS;
    }


    private string EnsureWomanAndCensus(
    string womNNIPS,
    string husbNNIPS,
    string addressID,
    string week,
    string nepDate,
    string workerID)
    {
        DateTime romCensusDate = (DateTime)Core.GetRomDateFromNepDate(nepDate, true);
        DateTime romDOB = (DateTime)Core.GetRomDateFromNepDate(NewCensusDOBNep.Text.Trim(), true);

        var censusTA = new OralHealthTableAdapters.CensusTableAdapter();
        var nnipsTA = new maharishiTableAdapters.NNIPSTableAdapter();

        bool isNewWomanNNIPS = Core.IsEmpty(womNNIPS);

        // ---------------------------------------------------
        // 1) ENSURE WOMAN NNIPS EXISTS (insert if new)
        // ---------------------------------------------------
        if (isNewWomanNNIPS)
        {
            womNNIPS = Core.generateNNIPSnumber();

            Core.InsertPersonNNIPS(
                womNNIPS,
                Core.CleanText(NewCensusFirstNames.Text.ToUpper()),
                Core.CleanText(NewCensusLastName.Text.ToUpper()),
                Core.CleanText(NewCensusDOBNep.Text),
                "2",
                NewCensusVS.SelectedValue,
                addressID
            );
        }
        else
        {
            // If typed NNIPS exists, just update VS (and optionally update name/DOB if your rules allow)
            nnipsTA.UpdateNNIPSVS(NewCensusVS.SelectedValue, DateTime.Now, womNNIPS);
        }

        // ---------------------------------------------------
        // 2) ENSURE WOMAN-HUSBAND LINK
        // ---------------------------------------------------
        Core.UpdateInsertNNIPSWomen(womNNIPS, husbNNIPS);

        // ---------------------------------------------------
        // 3) UPSERT CENSUS: Insert if missing, Update if exists
        // ---------------------------------------------------
        var dt = censusTA.GetDataByNNIPSnum(womNNIPS);

        if (dt.Rows.Count == 0)
        {
            // INSERT NEW CENSUS record using entered womNNIPS
            censusTA.Insert(
                womNNIPS,
                addressID,
                week,
                nepDate,
                romCensusDate,
                workerID,
                Core.CleanText(NewCensusFirstNames.Text.ToUpper()),
                Core.CleanText(NewCensusLastName.Text.ToUpper()),
                "2",
                NewCensusVS.SelectedValue,
                Core.CleanText(NewCensusAge.Text),
                Core.CleanText(NewCensusDOBNep.Text),
                romDOB,
                NewCensusMarr.SelectedValue,
                NewCensusMS.SelectedValue,
                NewCensusConsent.SelectedValue,
                husbNNIPS,
                Core.CleanText(NewCensusHusbFirstNames.Text.ToUpper()),
                Core.CleanText(NewCensusHusbLastName.Text.ToUpper()),
                NewCensusHusbVS.SelectedValue,
                Core.GetDEO(),
                DateTime.Now,
                DateTime.Now
            );
        }
        else
        {
            // UPDATE existing census
            var row = dt[0];
            row.BeginEdit();

            row.CensusWeek = week;
            row.CensusNepDate = nepDate;
            row.CensusRomDate = romCensusDate;
            row.CensusWorkerID = workerID;

            row.CensusFirstNames = Core.CleanText(NewCensusFirstNames.Text.ToUpper());
            row.CensusLastName = Core.CleanText(NewCensusLastName.Text.ToUpper());
            row.CensusVS = NewCensusVS.SelectedValue;
            row.CensusMS = NewCensusMS.SelectedValue;
            row.CensusAge = Core.CleanText(NewCensusAge.Text);
            row.CensusDOBNep = Core.CleanText(NewCensusDOBNep.Text);
            row.CensusDOBRom = romDOB;
            row.CensusMarr = NewCensusMarr.SelectedValue;

            row.CensusHusbNNIPSnum = husbNNIPS;
            row.CensusHusbFirstNames = Core.CleanText(NewCensusHusbFirstNames.Text.ToUpper());
            row.CensusHusbLastName = Core.CleanText(NewCensusHusbLastName.Text.ToUpper());
            row.CensusHusbVS = NewCensusHusbVS.SelectedValue;

            row.CensusDEO = Core.GetDEO();
            row.CensusUpdate = DateTime.Now;

            if (NewCensusMS.SelectedValue == "1")
                row.CensusConsent = NewCensusConsent.SelectedValue;
            else
                row.SetCensusConsentNull();

            row.EndEdit();
            censusTA.Update(dt);
        }

        return womNNIPS;
    }



    private void SaveNewWoman()
    {
        /*
        string womNNIPS = ResolveNNIPS(NewCensusNNIPSnum.Text, ChkCensusNNIPSnum.Checked);
        string husbNNIPS = ResolveNNIPS(NewHusbandNNIPSNUM.Text, ChkNewHusbandNNIPSNUM.Checked);

        bool isWithinNNIPS = !ChkCensusNNIPSnum.Visible;

        var womanRosterTA = new OralHealthTableAdapters.WomenRosterTableAdapter();

        if (isWithinNNIPS)
        {
            var dt = womanRosterTA.GetDataByCensusID(int.Parse(TBCensusID.Text));
            if (dt.Rows.Count == 0)
                throw new Exception("Woman roster record not found.");

            var row = dt[0];
            row.BeginEdit();
            row.CensusWeek = strWeek;
            row.CensusNepDate = strNepDate;
            row.CensusRomDate = (DateTime)Core.GetRomDateFromNepDate(strNepDate, true);
            row.CensusWorkerID = strWorkerID;

            row.CensusFirstNames = Core.CleanText(NewCensusFirstNames.Text.ToUpper());
            row.CensusLastName = Core.CleanText(NewCensusLastName.Text.ToUpper());
            row.CensusSex = "2";
            row.CensusVS = NewCensusVS.SelectedValue;

            row.CensusAge = (NewCensusAge.Text ?? "").Trim();
            row.CensusDOBNep = (NewCensusDOBNep.Text ?? "").Trim();
            row.CensusDOBRom = (DateTime)Core.GetRomDateFromNepDate(row.CensusDOBNep, true);

            row.CensusMarr = NewCensusMarr.SelectedValue;
            row.CensusMS = NewCensusMS.SelectedValue;

            if (NewCensusMS.SelectedValue == "1")
                row.CensusConsent = NewCensusConsent.SelectedValue;
            else
                row.SetCensusConsentNull();

            row.CensusHusbNNIPSnum = husbNNIPS;
            row.CensusHusbFirstNames = Core.CleanText(NewCensusHusbFirstNames.Text.ToUpper());
            row.CensusHusbLastName = Core.CleanText(NewCensusHusbLastName.Text.ToUpper());
            row.CensusHusbVS = NewCensusHusbVS.SelectedValue;

            row.CensusStatus = "1";
            row.CensusDEO = strWorkerID;
            row.CensusUpdate = DateTime.Now;
            row.EndEdit();

            womanRosterTA.Update(dt);
            return;
        }

        // OUTSIDE NNIPS: transaction for multiple tables
        using (var scope = new TransactionScope())
        {
            husbNNIPS = EnsureHusband(
                husbNNIPS,
                Core.CleanText(NewCensusHusbFirstNames.Text.ToUpper()),
                Core.CleanText(NewCensusHusbLastName.Text.ToUpper()),
                NewCensusHusbVS.SelectedValue,
                strID);

            womNNIPS = EnsureWomanAndCensus(
                womNNIPS,
                husbNNIPS,
                strID,
                strWeek,
                strNepDate,
                strWorkerID);

            // Mark roster completed
            var dt = womanRosterTA.GetDataByCensusID(int.Parse(TBCensusID.Text));
            if (dt.Rows.Count == 0)
                throw new Exception("Woman roster record not found.");

            dt[0].CensusStatus = "1";
            womanRosterTA.Update(dt);

            scope.Complete();
        }
        */
    }


    private bool HasWomenInWomanList()
    {
        // If you already have FillByAddress, this is simplest:
        var ta = new OralHealthTableAdapters.WomenRosterTableAdapter();
        var dt = new OralHealth.WomenRosterDataTable();
        ta.FillByAddress(dt, strID);
        return dt.Rows.Count > 0;
    }

    private void ValidateNNIPSRecord(
    string nnipsNum,
    string firstName,
    string lastName,
    string dobNepTextOrNull, // pass DOB only for Woman, null for Husband
    string labelPrefix)
    {
        if (string.IsNullOrWhiteSpace(nnipsNum))
            return; // validate only when NNIPS typed

        nnipsNum = nnipsNum.Trim();

        var adapter = new maharishiTableAdapters.NNIPSTableAdapter();
        var dt = new maharishi.NNIPSDataTable();
        adapter.FillByNNIPSnum(dt, nnipsNum);

        if (dt.Rows.Count == 0)
        {    
            _newWomanErrors.Add(string.Format(
                "{0}: No record found for NNIPS number.",
                nnipsNum));
            return;
        }

        var row = (maharishi.NNIPSRow)dt.Rows[0];

        string f1 = (firstName ?? "").Trim();
        string l1 = (lastName ?? "").Trim();

        // Name checks
        if (!row.FirstNames.Trim().Equals(f1, StringComparison.OrdinalIgnoreCase))             
        _newWomanErrors.Add(string.Format(
                "{0}: First name does not match NNIPS record.",
                labelPrefix) + " Hint: (" + row.FirstNames + ")");

        if (!row.LastName.Trim().Equals(l1, StringComparison.OrdinalIgnoreCase)) 
        _newWomanErrors.Add(string.Format(
                "{0}: Last name does not match NNIPS record.",
                labelPrefix) + " Hint: (" + row.LastName + ")");

        // DOB check (Woman only)
        if (!string.IsNullOrWhiteSpace(dobNepTextOrNull))
        {
            string dobInput = dobNepTextOrNull.Trim();

            // TODO: replace "DOBNep" with your real NNIPSRow column/property name
            string dobDb = row.IsDOBNepNull() ? "" : (row.DOBNep ?? "").Trim();

            if (!string.IsNullOrWhiteSpace(dobDb) &&
                !dobDb.Equals(dobInput, StringComparison.OrdinalIgnoreCase))
            {    
                _newWomanErrors.Add(string.Format(
                "{0}: Date of birth does not match NNIPS record.",
                labelPrefix) + " Hint: (" + row.DOBNep + ")");
            }
        }
    }
     

    private bool TryGetRomDateFromNepDOB(string nepDob, out DateTime romDob)
    {
        romDob = DateTime.MinValue;

        if (string.IsNullOrWhiteSpace(nepDob))
            return false;

        try
        {
            romDob = (DateTime)Core.GetRomDateFromNepDate(nepDob.Trim(), true);
            return true;
        }
        catch
        {
            return false;
        }
    }


    private void ValidateDOB()
    {
        string dobText = (NewCensusDOBNep.Text ?? "").Trim();
        if (string.IsNullOrWhiteSpace(dobText))
            return; // RequireText already handles

        DateTime romDOB;
        if (!TryGetRomDateFromNepDOB(dobText, out romDOB))
        {
            _newWomanErrors.Add("Invalid Nepali date of birth.");
            return;
        }

        if (romDOB.Date > DateTime.Today)
        {
            _newWomanErrors.Add("Date of birth cannot be in the future.");
            return;
        }

        // More realistic range for field data
        int age;
        string ageText = (NewCensusAge.Text ?? "").Trim();

        if (!int.TryParse(ageText, out age))
        {
            _newWomanErrors.Add("Age must be a number.");
            return;
        }

        if (age < 15 || age > 35)
        {
            _newWomanErrors.Add("Age must be between 15 and 35 years.");
            return;
        }

        // DOB consistency check
        int calcAge = DateTime.Today.Year - romDOB.Year;

        if (romDOB.Date > DateTime.Today.AddYears(-calcAge))
            calcAge--;

        if (Math.Abs(calcAge - age) > 1)
        {
            _newWomanErrors.Add("Age does not match the date of birth.");
        }

    }
     

    #endregion

    #region VALIDATIONS
    /***************************
     *    VALIDATIONS      *
     ***************************/

    private void RequireText(TextBox t, string label)
    {
        if (string.IsNullOrWhiteSpace(t.Text))
            _newWomanErrors.Add(label + " is required.");
    }

    private bool ValidateNewWomanForm(bool isWithinNNIPS)
    {
        _newWomanErrors.Clear();

        // NNIPS rules
        if (isWithinNNIPS)
        {
            if (!string.IsNullOrWhiteSpace(NewCensusNNIPSnum.Text))
                _newWomanErrors.Add("NNIPS number must be empty for Within NNIPS area.");
        }
        else
        {
            if (string.IsNullOrWhiteSpace(NewCensusNNIPSnum.Text) && !ChkCensusNNIPSnum.Checked)
                _newWomanErrors.Add("NNIPS number is required or must be auto-assigned.");
        }

        // Basic woman info
        RequireText(NewCensusFirstNames, "Woman first name");
        RequireText(NewCensusLastName, "Woman last name");
        RequireText(NewCensusDOBNep, "Date of birth");
        RequireText(NewCensusAge, "Age");

        if (NewCensusVS.SelectedValue != "1")
            _newWomanErrors.Add("Woman vital status must be Alive.");

        if (NewCensusMarr.SelectedValue != "1")
            _newWomanErrors.Add("Marital status must be Married with husband.");

        // DOB validation
        ValidateDOB();

        // Husband NNIPS rules
        if (string.IsNullOrWhiteSpace(NewHusbandNNIPSNUM.Text) && !ChkNewHusbandNNIPSNUM.Checked)
            _newWomanErrors.Add("Husband NNIPS number is required or must be auto-assigned.");

        RequireText(NewCensusHusbFirstNames, "Husband first name");
        RequireText(NewCensusHusbLastName, "Husband last name");

        if (NewCensusHusbVS.SelectedValue != "1")
            _newWomanErrors.Add("Husband vital status must be Alive.");

        // DB-level NNIPS validation (only when NNIPS typed)
        ValidateNNIPSRecord(
            NewCensusNNIPSnum.Text,
            NewCensusFirstNames.Text,
            NewCensusLastName.Text,
            NewCensusDOBNep.Text,  // woman dob check
            "Woman");

        ValidateNNIPSRecord(
            NewHusbandNNIPSNUM.Text,
            NewCensusHusbFirstNames.Text,
            NewCensusHusbLastName.Text,
            null,                  // husband no dob check
            "Husband");

        // Met status + consent
        if (string.IsNullOrWhiteSpace(NewCensusMS.SelectedValue))
            _newWomanErrors.Add("Woman met status is required.");
        else if (NewCensusMS.SelectedValue == "1")
        {
            if (string.IsNullOrWhiteSpace(NewCensusConsent.SelectedValue))
                _newWomanErrors.Add("Consent is required when woman is met.");
        }
        else if (NewCensusMS.SelectedValue == "2")
        {
            if (!string.IsNullOrWhiteSpace(NewCensusConsent.SelectedValue))
                _newWomanErrors.Add("Consent must be empty when woman is not met.");
        }

        return _newWomanErrors.Count == 0;
    }
     

    protected void ValidateWomanNNIPS(object source, ServerValidateEventArgs args)
    {
        // WITHIN NNIPS → skip validation completely
        if (!ChkCensusNNIPSnum.Visible)
        {
            args.IsValid = true;
            return;
        }

        // OUTSIDE NNIPS
        bool isNew = ChkCensusNNIPSnum.Checked;
        string nnips = NewCensusNNIPSnum.Text.Trim();

        // If "assign new NNIPS" checked → textbox must be empty
        // If unchecked → textbox must have NNIPS
        args.IsValid = isNew ? nnips == "" : nnips != "";
    }


    protected void ValidateHusbandNNIPS(object source, ServerValidateEventArgs args)
    {
        bool isNew = ChkNewHusbandNNIPSNUM.Checked;
        string nnips = NewHusbandNNIPSNUM.Text.Trim();

        args.IsValid = isNew ? nnips == "" : nnips != "";
    }
    protected void ValidateMetStatus(object source, ServerValidateEventArgs args)
    {
        string ms = NewCensusMS.SelectedValue;
        bool valid = true;

        if (ms == "1")
            valid = NewCensusConsent.SelectedValue != "";
        else if (ms == "2")
            valid = NewCensusConsent.SelectedValue == "";

        args.IsValid = valid;
    }

    #endregion

    #region MESSAGES

    // ---------- SUCCESS MESSAGES ----------
    private const string MsgCensusEnrollmentSaved =
        "Success! Census enrollment data has been saved successfully.";

    private const string MsgWomanMovedToCensus =
        "The woman has been successfully added to the census list.";

    private const string MsgWomanDeletedFromList =
        "The woman has been removed from the temporary list.";

    private const string MsgCensusContinue =
        "Thank you for your participation. Our team will visit again for follow-up visits.";

    // ---------- INFO / INSTRUCTION MESSAGES ----------
    private const string MsgOldNNIPSInstructions =
        "NNIPS Study Area: Please complete the electronic census form (No NNIPSNum required) and the paper tracking form.";

    private const string MsgOutsideNNIPSInstructions =
        "Outside NNIPS Area: The selected woman is from outside the NNIPS area.<br/>" +
        "Please complete the census form below. A new NNIPS number will be assigned automatically.";

    private const string MsgOneWomanSaved =
        "Please select the next woman from the list to continue census enrollment.";


    // ---------- ERROR MESSAGES ----------
    private const string MsgValidationFailed =
        "Please correct the highlighted errors before saving.";

    private const string MsgSaveFailed =
        "Save failed. Please contact the system administrator.";

    private const string MsgNoWomenToSave =
        "No women found to enroll. (दर्ता गर्नुपर्ने महिला भेटिएन।)";

    private const string MsgBatchSaveDonePrefix =
        "Census enrollment complete. Total women enrolled: ";

    private const string MsgBatchSaveDonePrefixNE =
        "जनगणना दर्ता पूरा भयो। कुल दर्ता महिला संख्या: ";
      
    private const string MsgAllWomenEnrolled =
        "All women from the list have been enrolled successfully.";

     
    #endregion

}