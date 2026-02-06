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

public partial class pages_OH_WOMENROSTER : System.Web.UI.Page
{
    // Stores Household Address ID (Muni+Ward+HH)
    // Passed from previous screen using QueryString
    protected string strID;
    protected string strWeek;
    protected string strNepDate;
    protected string strWorkerID;
     
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
        }
    }

    protected void ButtonCreateNewWoman_Click(object sender, EventArgs e)
    {
        lblsucessmsg.Text = "";

        if (!Page.IsValid)
            return;

        var women = GetWomenRows();

        // At least one complete row
        bool hasAtLeastOneWoman = women.Any(x =>
            !string.IsNullOrWhiteSpace(x.First) &&
            !string.IsNullOrWhiteSpace(x.Last));

        if (!hasAtLeastOneWoman)
        {
            lblsucessmsg.Text =
                "<span class='error-msg'>Please enter at least one woman (both first and last name).</span>";
            return;
        }

        try
        {
            using (var scope = new TransactionScope())
            {
                foreach (var w in women)
                {
                    SaveWomenRosterRow(
                        addressId: strID,
                        week: strWeek,
                        nepDate: strNepDate,
                        workerId: strWorkerID,
                        firstName: w.First,
                        lastName: w.Last
                    );
                }

                scope.Complete();
            }

            // Redirect only if save succeeded
            Response.Redirect(
                "~/pages/OH_CENSUSb.aspx?id=" + strID +
                "&wk=" + strWeek +
                "&dt=" + strNepDate +
                "&wr=" + strWorkerID +
                "&page=censusb");
        }
        catch (Exception ex)
        {
            // Better message for field team; log ex.Message internally if needed
            lblsucessmsg.Text =
                "<span class='error-msg'>Save failed. Please try again.</span>";
        }
    }



    #endregion

    #region SUPPORTMETHODS
    /***************************
     *    SUPPORT METHODS      *
     ***************************/
    private class WomanRow
    {
        public string First;
        public string Last;

        public WomanRow(string f, string l)
        {
            First = f;
            Last = l;
        }
    }

    private List<WomanRow> GetWomenRows()
    {
        return new List<WomanRow>
    {
        new WomanRow(WOMFNAMES1.Text, WOMLNAME1.Text),
        new WomanRow(WOMFNAMES2.Text, WOMLNAME2.Text),
        new WomanRow(WOMFNAMES3.Text, WOMLNAME3.Text),
        new WomanRow(WOMFNAMES4.Text, WOMLNAME4.Text)
    };
    }



    private void SaveWomenRosterRow(
    string addressId,
    string week,
    string nepDate,
    string workerId,
    string firstName,
    string lastName)
    {
        firstName = (firstName ?? "").Trim();
        lastName = (lastName ?? "").Trim();

        // Skip empty row
        if (firstName == "" && lastName == "")
            return;

        // Pair validation safety (UI already validates)
        if (firstName == "" || lastName == "")
            throw new ApplicationException("Invalid woman name pair.");

        DateTime romDate = (DateTime)Core.GetRomDateFromNepDate(nepDate, true);

        var adapter = new OralHealthTableAdapters.WomenRosterTableAdapter();

        adapter.Insert(
            addressId,   // CensusAddress
            week,        // CensusWeek
            nepDate,     // CensusNepDate
            romDate,     // CensusRomDate
            workerId,    // CensusWorkerID

            firstName.ToUpper().Trim(),
            lastName.ToUpper().Trim(),
            "2",         // Sex = Female
            "1",
            null,
            null,
            null,

            null,
            null,
            null,
            null,
            null,
            null,
            null,

            "0",          // CensusStatus (incomplete)
            Core.GetDEO(),
            DateTime.Now,
            DateTime.Now
        );
    }


    private void SaveWomenRoster(
        string addressId,
        string firstName,
        string lastName,
        string deo)
    {
        firstName = (firstName ?? "").Trim();
        lastName = (lastName ?? "").Trim();

        // Skip empty optional rows
        if (firstName == "" && lastName == "")
            return;

        // Safety: validation should already catch this
        if (firstName == "" || lastName == "")
            throw new ApplicationException("Invalid woman name pair.");
        var WLAdapter = new OralHealthTableAdapters.WomenRosterTableAdapter();
        // =======================
        // INSERT INTO WOMENROSTER
        // =======================  
        WLAdapter.Insert(
            strID,              // CensusAddress
            strWeek,            // CensusWeek
            strNepDate,         // CensusNepDate
            (DateTime)Core.GetRomDateFromNepDate(strNepDate, true),
            strWorkerID,

            firstName,
            lastName,
            "2",
            null,
            null,
            null,
            null,

            null,
            null,
            null,
            null,            
            null,
            null,
            null,
            "0",
            Core.GetDEO(),
            DateTime.Now,        // CensusCreateDate
            DateTime.Now        // CensusCreateDate
        );

    }

    #endregion

    #region VALIDATIONS
    /***************************
     *    VALIDATIONS      *
     ***************************/
    protected void ValidateNamePair_Row1(object source, ServerValidateEventArgs args)
    {
        args.IsValid = IsValidPair(WOMFNAMES1.Text, WOMLNAME1.Text);
    }

    protected void ValidateNamePair_Row2(object source, ServerValidateEventArgs args)
    {
        args.IsValid = IsValidPair(WOMFNAMES2.Text, WOMLNAME2.Text);
    }

    protected void ValidateNamePair_Row3(object source, ServerValidateEventArgs args)
    {
        args.IsValid = IsValidPair(WOMFNAMES3.Text, WOMLNAME3.Text);
    }

    protected void ValidateNamePair_Row4(object source, ServerValidateEventArgs args)
    {
        args.IsValid = IsValidPair(WOMFNAMES4.Text, WOMLNAME4.Text);
    }

    private bool IsValidPair(string fn, string ln)
    {
        fn = (fn ?? "").Trim();
        ln = (ln ?? "").Trim();

        if (fn == "" && ln == "") return true;
        if (fn != "" && ln != "") return true;

        return false;
    }
     

    #endregion

}