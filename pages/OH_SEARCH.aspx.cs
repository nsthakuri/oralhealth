using System;
using System.Web.UI;
using OralHealthTableAdapters;

public partial class pages_OH_SEARCH : Page
{ 
    protected string strID;
    protected string searchType;

    protected void Page_Load(object sender, EventArgs e)
    {
        strID = Request.QueryString["id"];
        searchType = Request.QueryString["type"];

        if (!IsPostBack)
        {     

            if (searchType == "nnipsnum")
            {
                GetWomanProfileByNNIPSNum();
            }
            else
            {
                GetWomanProfileByNNIPSNum();
            } 
            
        }
    }


    protected void ButtonCensusASave_Click(object sender, EventArgs e)
    {    
        Response.Redirect("~/pages/OH_CENSUSa.aspx?id=" + Request.QueryString["id"] + "&page=censusa", endResponse: true);
    }

    protected void ButtonCensusBSave_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/pages/OH_CENSUSb.aspx?id=" + Request.QueryString["id"] + "&page=censusb", endResponse: true);
    }

    private void GetWomanProfileByNNIPSNum()
    {
        View_WomanProfileTableAdapter TA = new View_WomanProfileTableAdapter();
        OralHealth.View_WomanProfileDataTable DT = new OralHealth.View_WomanProfileDataTable();

        if (searchType == "nnipsnum")
            TA.FillByNNIPSnum(DT, strID);
        else
            TA.FillByAddress(DT, strID);

        if (DT.Rows.Count > 0)
        {
            LitErrors.Text = ""; // clear message

            OralHealth.View_WomanProfileRow CARow =
                (OralHealth.View_WomanProfileRow)DT.Rows[0];

            LblNNIPSNum.Text = CARow.CensusNNIPSnum;
            LblName.Text = CARow.CensusFirstNames + " " + CARow.CensusLastName;
            LblHusbNNIPSNum.Text = CARow.CensusHusbNNIPSnum;
            LblHusbName.Text = CARow.CensusHusbFirstNames + " " + CARow.CensusHusbLastName;
            LblDOB.Text = CARow.CensusDOBNep;
            LblAgeAtEnroll.Text = CARow.CalculatedAge + " Years";
            LblAddress.Text = CARow.CensusAddress;
        }
        else
        {
            // No record found
            PanelError.Visible = true;
            LitErrors.Text = "No record found.";
            PanelData.Visible = false;             
        }
    }


}
