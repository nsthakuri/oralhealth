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
    protected void Page_Load(object sender, EventArgs e)
    {
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

        }
    }

    protected void ButtonCreateHH_Click(object sender, EventArgs e)
    {
        try
        {
            if (!Page.IsValid) return;

            if (!CheckMapUnit())
            {
                PanelError.Visible = true;
                LitErrors.Text = "Map Unit mismatch.";
                return;
            }

            // =========================
            // GPS
            // =========================             
            decimal temp;
            decimal? lat = decimal.TryParse(hfLat.Value, out temp) ? temp : (decimal?)null;
            decimal? lng = decimal.TryParse(hfLong.Value, out temp) ? temp : (decimal?)null; 

            // =========================
            // CREATE HH
            // =========================
            bool ok = CreateNewHH(lat, lng);

            if (!ok) return;

            // =========================
            // PANEL LOGIC
            // =========================
            PanelHeader.Visible = false;
            PanelError.Visible = false;
            PanelSuccess.Visible = true;

            // Show confirmation ONLY when needed
            if (HasElgWoman.SelectedValue == "1" &&
                HHCons.SelectedValue == "1")
            {
                PanelNewWomanConfirm.Visible = true;
            }
            else
            {
                PanelNewWomanConfirm.Visible = false;
            }
            Core.InsertDataEntryLogWorkerID(WorkerId.Text);
        }
        catch (Exception ex)
        {
            PanelError.Visible = true;
            PanelSuccess.Visible = false;
            PanelNewWomanConfirm.Visible = false;
            LitErrors.Text = "System error occurred. Please retry with valid inputs.";
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
        Response.Redirect(string.Format(
            "~/pages/OH_CENSUSb.aspx?id={0}&wk={1}&dt={2}&wr={3}&page=censusb",
            LitAddress.Text,
            Week.Text,
            FormDateNep,
            WorkerId.Text));

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
        var CAAdapter = new OralHealthTableAdapters.CensusAddressTableAdapter();
        var NNAddrAdapter = new maharishiTableAdapters.NNIPSAddressTableAdapter();

        // ============================
        // 1) Generate HHID
        // ============================
        object obj = NNAddrAdapter.GetMaxHH(
            MuniId.Text,
            Ward.Text,
            strMapUnit
        );

        int nextHH = 1;

        if (obj != null && obj != DBNull.Value)
            nextHH = Convert.ToInt32(obj) + 1;

        string hhStr = nextHH.ToString("D4");

        string fullAddress =
            MuniId.Text +
            Ward.Text +
            hhStr;

        // ============================
        // 2) Duplicate Check
        // ============================
        if (NNAddrAdapter.GetDataByAddress(fullAddress).Rows.Count > 0)
            throw new Exception("Duplicate household detected.");

        // ============================
        // 3) NNIPSAddress Row
        // ============================
        var NNDT = new maharishi.NNIPSAddressDataTable();
        var NNRow = NNDT.NewNNIPSAddressRow();

        NNRow.ADDRESS = fullAddress;

        if (lat.HasValue) NNRow.LAT = lat.Value;
        else NNRow.SetLATNull();

        if (lng.HasValue) NNRow.LONG = lng.Value;
        else NNRow.SetLONGNull();

        NNRow.MAPUNIT = strMapUnit;
        NNRow.COMMENT = "Added via OralHealth";
        NNRow.NACREATE = DateTime.Now;
        NNRow.NAUPDATE = DateTime.Now;

        NNDT.AddNNIPSAddressRow(NNRow);

        // ============================
        // 4) CensusAddress Row
        // ============================
        var CADT = new OralHealth.CensusAddressDataTable();
        var CARow = CADT.NewCensusAddressRow();

        CARow.CAAddress = fullAddress;
        CARow.CAHHStatus = "2"; //new HH
        CARow.CAHasWoman = HasElgWoman.SelectedValue;
        CARow.CAMapUnit = strMapUnit;
        CARow.CAPreprinted = "0";  
        if (HasElgWoman.SelectedValue == "1")
        {
            if (!string.IsNullOrWhiteSpace(HOHFNames.Text))
                CARow.CAHOHFNames = HOHFNames.Text.Trim().ToUpper();
            else CARow.SetCAHOHFNamesNull();

            if (!string.IsNullOrWhiteSpace(HOHLName.Text))
                CARow.CAHOHLName = HOHLName.Text.Trim().ToUpper();
            else CARow.SetCAHOHLNameNull();

            if (!string.IsNullOrWhiteSpace(ResFNames.Text))
                CARow.CAResFNames = ResFNames.Text.Trim().ToUpper();
            else CARow.SetCAResFNamesNull();

            if (!string.IsNullOrWhiteSpace(ResLName.Text))
                CARow.CAResLName = ResLName.Text.Trim().ToUpper();
            else CARow.SetCAResLNameNull();

            if (!string.IsNullOrWhiteSpace(HHCons.SelectedValue))
                CARow.CAHHCons = HHCons.SelectedValue;
            else CARow.SetCAHHConsNull();

            if (HHCons.SelectedValue == "1" &&
                !string.IsNullOrWhiteSpace(PerCount.Text))
                CARow.CAPerCount = PerCount.Text;
            else CARow.SetCAPerCountNull();
        }
        else
        {
            // No eligible woman → clear fields
            CARow.SetCAHOHFNamesNull();
            CARow.SetCAHOHLNameNull();
            CARow.SetCAResFNamesNull();
            CARow.SetCAResLNameNull();
            CARow.SetCAHHConsNull();
            CARow.SetCAPerCountNull();
        }

        CADT.AddCensusAddressRow(CARow);

        // ============================
        // 5) Save in Transaction
        // ============================
        using (var scope = new System.Transactions.TransactionScope())
        {
            NNAddrAdapter.Update(NNDT);
            CAAdapter.Update(CADT);
            scope.Complete();
        }

        LitAddress.Text = fullAddress;

        return true;
    }

    protected bool CheckMapUnit()
    {
        var adapter = new maharishiTableAdapters.NNIPSAddressTableAdapter();
        var dt = new maharishi.NNIPSAddressDataTable();

        if (adapter.FillByMuniIdWard(dt, MuniId.Text + Ward.Text) == 0)
            return false;

        string dbMapUnit = dt[0]["MapUnit"].ToString().Trim();
        return dbMapUnit.Equals(strMapUnit.Trim(),
               StringComparison.OrdinalIgnoreCase);
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
            string.IsNullOrWhiteSpace(MapUnit.Text) ||
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
            string.IsNullOrWhiteSpace(ResFNames.Text) ||
            string.IsNullOrWhiteSpace(ResLName.Text))
        {
            cvHHLogic.ErrorMessage =
                "Names required when eligible woman exists.";
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
                Year.Text
            );
        }
    }

    protected string strMapUnit
    {
        get
        {
            return ("M" + MapUnit.Text); 
        }
    }

}