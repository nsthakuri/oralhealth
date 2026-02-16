using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Typed DataSets
using OralHealthTableAdapters;
using maharishiTableAdapters;
public partial class pages_OH_CREATEHH : System.Web.UI.Page
{
    String[] hdrObjectNames = new String[] {"Week", "Day","Month",
        "Year","WorkerId"};
    protected void Page_Load(object sender, EventArgs e)
    {
        DisableHeaderTextBoxes();

        if (!IsPostBack)
        {
            MuniId.Focus();

            string[] AryWeekDate = Core.GetWeekDate(DateTime.Today);

            if (AryWeekDate.Length > 1 && AryWeekDate[1].Length >= 8)
            {
                Week.Text = AryWeekDate[0];
                Day.Text = AryWeekDate[1].Substring(0, 2);
                Month.Text = AryWeekDate[1].Substring(2, 2);
                Year.Text = AryWeekDate[1].Substring(6, 2);
            }

            WorkerId.Text = Core.GetDEO();

            LoadMapUnits();
        }
    }


    protected void ButtonCreateHH_Click(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsValid) return;

            decimal temp;
            decimal? lat = decimal.TryParse(hfLat.Value, out temp) ? temp : (decimal?)null;
            decimal? lng = decimal.TryParse(hfLong.Value, out temp) ? temp : (decimal?)null;

            // The method now returns true if the household was successfully created
            if (!CreateNewHH(lat, lng))
                return;

            // 1. UI State Management
            PanelHeader.Visible = false;
            PanelError.Visible = false;
            PanelSuccess.Visible = true;

            // 2. Generate Context-Specific Success Message
            string addressMsg = "Household <b>" + LitAddress.Text + "</b> has been created.";

            if (HasElgWoman.SelectedValue == "0")
            {
                lblsucessmsg.Text = addressMsg + "<br />No eligible woman recorded. Data collection for this HH is stopped.";
                PanelNewWomanConfirm.Visible = false;
            }
            else if (HHCons.SelectedValue == "6")
            {
                lblsucessmsg.Text = addressMsg + "<br />Consent was refused. Data collection stopped.";
                PanelNewWomanConfirm.Visible = false;
            }
            else
            {
                lblsucessmsg.Text = addressMsg + "<br />Please confirm if you would like to add woman details now.";
                PanelNewWomanConfirm.Visible = true;
            }

            // 3. Log the activity
            Core.InsertDataEntryLogWorkerID(WorkerId.Text);
        }
        catch (Exception ex)
        {
            PanelError.Visible = true;
            PanelSuccess.Visible = false;
            PanelNewWomanConfirm.Visible = false;
            LitErrors.Text = "An error occurred during saving: " + ex.Message;
        }
    }

    protected void Ward_TextChanged(object sender, EventArgs e)
    {    
        LoadMapUnits(); 

    }

    protected void HasElgWoman_SelectedIndexChanged(object sender, EventArgs e)
    {
        string elgWoman = HasElgWoman.SelectedValue;
        if (elgWoman == "1")
        {
            PanelHOH.Visible = true;
        }
        else
        {
            PanelHOH.Visible = false;
            PanelRespondent.Visible = false;
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

    protected void ButtonYes_Click(object sender, EventArgs e)
    {
        lblsucessmsg.Text = "";
        if (!Page.IsValid)
        {
            return;
        }
        PanelNewWomanConfirm.Visible = false;
        PanelSuccess.Visible = true;                        
        Response.Redirect("~/pages/OH_WOMENROSTER.aspx?id=" + LitAddress.Text + "&wk=" + Week.Text + "&dt=" + FormDateNep + "&wr=" + WorkerId.Text + "&page=roster");

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

    private bool CreateNewHH(decimal? lat, decimal? lng)
    {
        // ============================
        // Validate Map Unit
        // ============================
        if (string.IsNullOrEmpty(ddlMapUnit.SelectedValue))
        {
            PanelError.Visible = true;
            LitErrors.Text = "Please select Map Unit.";
            return false;
        }

        var CAAdapter = new CensusAddressTableAdapter();
        var NNAdapter = new maharishiTableAdapters.NNIPSAddressTableAdapter();

        // ============================
        // Generate next free HH
        // ============================
        string fullAddress = "";
        int nextHH = 1;

        while (true)
        {
            string hhStr = nextHH.ToString("D4");

            fullAddress =
                MuniId.Text +
                Ward.Text +
                hhStr;

            if (NNAdapter.GetDataByAddress(fullAddress).Rows.Count == 0)
                break;

            nextHH++;
        }

        // ============================
        // NNIPS Address Row
        // ============================
        var NNDT = new maharishi.NNIPSAddressDataTable();
        var NNRow = NNDT.NewNNIPSAddressRow();

        NNRow.ADDRESS = fullAddress;

        if (lat.HasValue)
            NNRow.LAT = lat.Value;
        else
            NNRow.SetLATNull();

        if (lng.HasValue)
            NNRow.LONG = lng.Value;
        else
            NNRow.SetLONGNull();

        NNRow.MAPUNIT = ddlMapUnit.SelectedValue;
        NNRow.COMMENT = "Added via OralHealth";
        NNRow.NACREATE = DateTime.Now;
        NNRow.NAUPDATE = DateTime.Now;

        NNDT.AddNNIPSAddressRow(NNRow);

        // ============================
        // Census Address Row
        // ============================
        var CADT = new OralHealth.CensusAddressDataTable();
        var CARow = CADT.NewCensusAddressRow();

        CARow.CAAddress = fullAddress;
        CARow.CAHHStatus = "2";        
        CARow.CAHasWoman = HasElgWoman.SelectedValue;
        CARow.CAMapUnit = ddlMapUnit.SelectedValue;
        CARow.CAPreprinted = "0";

        if (HasElgWoman.SelectedValue == "1")
        {
            if (!string.IsNullOrWhiteSpace(HOHFNames.Text))
                CARow.CAHOHFNames = HOHFNames.Text.Trim().ToUpper();
            else
                CARow.SetCAHOHFNamesNull();

            if (!string.IsNullOrWhiteSpace(HOHLName.Text))
                CARow.CAHOHLName = HOHLName.Text.Trim().ToUpper();
            else
                CARow.SetCAHOHLNameNull();

            if (!string.IsNullOrWhiteSpace(CAHOHMS.SelectedValue))
                CARow.CAHOHMS = CAHOHMS.SelectedValue;
            else
                CARow.SetCAHOHMSNull();

            if (!string.IsNullOrWhiteSpace(ResFNames.Text))
                CARow.CAResFNames = ResFNames.Text.Trim().ToUpper();
            else
                CARow.SetCAResFNamesNull();

            if (!string.IsNullOrWhiteSpace(ResLName.Text))
                CARow.CAResLName = ResLName.Text.Trim().ToUpper();
            else
                CARow.SetCAResLNameNull();

            if (!string.IsNullOrWhiteSpace(HHCons.SelectedValue))
                CARow.CAHHCons = HHCons.SelectedValue;
            else
                CARow.SetCAHHConsNull();

            if (HHCons.SelectedValue == "1" &&
                !string.IsNullOrWhiteSpace(PerCount.Text))
                CARow.CAPerCount = PerCount.Text;
            else
                CARow.SetCAPerCountNull();
        }
        else
        {
            CARow.SetCAHOHFNamesNull();
            CARow.SetCAHOHLNameNull();
            CARow.SetCAHOHMSNull();
            CARow.SetCAResFNamesNull();
            CARow.SetCAResLNameNull();
            CARow.SetCAHHConsNull();
            CARow.SetCAPerCountNull();
        }

        CADT.AddCensusAddressRow(CARow);

        // ============================
        // Save Transaction
        // ============================
        using (var scope = new System.Transactions.TransactionScope())
        {
            NNAdapter.Update(NNDT);
            CAAdapter.Update(CADT);
            scope.Complete();
        }

        LitAddress.Text = fullAddress;
        return true;
    }


    private void DisableHeaderTextBoxes()
    {
        foreach (string name in hdrObjectNames)
        {
            var tb = PanelHeader.FindControl(name) as TextBox;
            if (tb != null)
                tb.ReadOnly = true;
        }
    }


    private void LoadMapUnits()
    {
        LblMapError.Text = "";
        var adapter = new maharishiTableAdapters.NNIPSAddressTableAdapter();
        var dt = new maharishi.NNIPSAddressDataTable();

        ddlMapUnit.Items.Clear();
        ddlMapUnit.Items.Add(new ListItem("--Select--", ""));

        // Reset error panel at the start of the check
        //PanelError.Visible = false;
        //LitErrors.Text = "";

        string muniWardId = MuniId.Text + Ward.Text;

        // Fill the DataTable and check if records exist
        int recordCount = adapter.FillByMuniIdWard(dt, muniWardId);

        if (recordCount == 0)
        {
            //[cite_start]// Show message using the existing error panel controls 
            //PanelError.Visible = true;
            //PanelError.CssClass = "error-card show";
            LblMapError.Text = "<br /> No map units found for the selected Muni and Ward.";
            return;
        }

        var units = dt
            .Where(r => !r.IsMAPUNITNull())
            .Select(r => r.MAPUNIT.Trim())
            .Distinct()
            .OrderBy(x => x);

        // If there are records but they all have NULL MapUnits, show a message
        if (!units.Any())
        {
            //PanelError.Visible = true;
            LblMapError.Text = "Records exist, but no valid Map Units were found.";
            return;
        }

        foreach (var u in units)
        {
            ddlMapUnit.Items.Add(u);
        }
    }


    protected void cvHHLogic_ServerValidate(
    object source,
    ServerValidateEventArgs args)
    {
        args.IsValid = true;

        // =========================
        // REQUIRED ALWAYS
        // =========================
        if (  
            string.IsNullOrWhiteSpace(MuniId.Text) ||
            string.IsNullOrWhiteSpace(Ward.Text) || 
            string.IsNullOrWhiteSpace(HasElgWoman.SelectedValue))
        {
            cvHHLogic.ErrorMessage = "Missing required fields.";
            args.IsValid = false;
            return;
        }

        // =========================
        // HAS ELIGIBLE WOMAN?
        // =========================
        if (HasElgWoman.SelectedValue == "0")
        {
            // CLEAR FIELDS
            HOHFNames.Text = "";
            HOHLName.Text = "";
            CAHOHMS.SelectedValue = ""; 
            ResFNames.Text = "";
            ResLName.Text = "";
            HHCons.SelectedValue = "";
            PerCount.Text = "";            
            return; // valid, stop further checks
        }

        // =========================
        // HasElgWoman = 1
        // =========================
        if (string.IsNullOrWhiteSpace(HOHFNames.Text) ||
            string.IsNullOrWhiteSpace(HOHLName.Text) ||
            string.IsNullOrWhiteSpace(CAHOHMS.SelectedValue))
        {
            cvHHLogic.ErrorMessage =
                "Names and met status required when eligible woman exists.";
            args.IsValid = false;
            return;
        }

        if (string.IsNullOrWhiteSpace(HHCons.SelectedValue))
        {
            cvHHLogic.ErrorMessage =
                "Household consent required.";
            args.IsValid = false;
            return;
        }

        // =========================
        // HHCons LOGIC
        // =========================
        if (HHCons.SelectedValue == "6")
        {
            PerCount.Text = "";
            return;
        }

        if (HHCons.SelectedValue == "1" &&
            string.IsNullOrWhiteSpace(PerCount.Text))
        {
            cvHHLogic.ErrorMessage =
                "Family count required when consent is YES.";
            args.IsValid = false;
            return;
        }
    }


    protected string FormDateNep
    {
        get
        {
            return Core.BuildNepaliDate(
                Day.Text,
                Month.Text,
                Year.Text);
        }
    }



}