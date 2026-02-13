using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Transactions;
using OralHealthTableAdapters;

public partial class pages_OH_WOMENROSTER : System.Web.UI.Page
{
    // QueryString Variables
    protected string strID, strWeek, strNepDate, strWorkerID, strMsg;

    #region EVENTS

    protected void Page_Load(object sender, EventArgs e)
    {
        strID = Request.QueryString["id"];
        strWeek = Request.QueryString["wk"];
        strNepDate = Request.QueryString["dt"];
        strWorkerID = Request.QueryString["wr"];
        strMsg = Request.QueryString["msg"];

        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(strID))
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            PopulateWomen(strID);

            if (strMsg == "successa")
            {
                PanelSuccess.Visible = true;
                lblsucessmsg.Text = MsgHeaderSaved;
            }
            if (strMsg == "successmsg")
            {
                PanelSuccess.Visible = true;
                lblsucessmsg.Text = MsgWomanSaved;
            }
        }
    }

    protected void ButtonCreateNewWoman_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        // Uses a single, uniquely named class to avoid CS0121
        List<WomanEntry> womenToSave = GetWomenFromInputs();

        if (womenToSave.Count == 0)
        {
            lblsucessmsg.Text = "<span class='error-msg'>Please enter at least one woman (First and Last name).</span>";
            return;
        }

        try
        {
            using (TransactionScope scope = new TransactionScope())
            {
                foreach (WomanEntry w in womenToSave)
                {
                    // This calls your TableAdapter.Insert for each entry
                    SaveSingleWoman(w.First, w.Last);
                }
                scope.Complete();
            }

            // 1. Refresh the grid
            PopulateWomen(strID);

            // 2. Clear the input text boxes
            ClearInputFields();

            // 3. Optional: Show a success message
            lblsucessmsg.Text = "<span class='success-msg'>Women added successfully.</span>";
        }
        catch (Exception ex)
        {
            lblsucessmsg.Text = "<span class='error-msg'>Save failed. Error: " + ex.Message + "</span>";
        }
    }

    // Helper method to clear the text boxes
    private void ClearInputFields()
    {
        WOMFNAMES1.Text = ""; WOMLNAME1.Text = "";
        WOMFNAMES2.Text = ""; WOMLNAME2.Text = "";
        WOMFNAMES3.Text = ""; WOMLNAME3.Text = "";
        WOMFNAMES4.Text = ""; WOMLNAME4.Text = "";
    }

    #endregion

    #region SUPPORT METHODS

    private void PopulateWomen(string addr)
    {
        WomenRosterTableAdapter TA = new WomenRosterTableAdapter();
        GridWomanList.DataSource = TA.GetDataByAddress(addr);
        GridWomanList.DataBind();
    }

    private void SaveSingleWoman(string fName, string lName)
    {
        DateTime romDate = (DateTime)Core.GetRomDateFromNepDate(strNepDate, true);
        WomenRosterTableAdapter adapter = new WomenRosterTableAdapter();

        adapter.Insert(
            "",
            strID,
            strWeek,
            strNepDate,
            romDate,
            strWorkerID,
            fName.ToUpper().Trim(),
            lName.ToUpper().Trim(),
            "2", // Sex = Female
            "1",
            null, null, null, "1", null, null, null, null, null, "1",
            "0", // Status
            "2", //new woman
            Core.GetDEO(),
            DateTime.Now,
            DateTime.Now
        );
    }

    protected string GetDynamicUrl(object nnipsNum, object censusId)
    {
        // 1. Handle the IDs (NNIPSNUM or CensusID)
        string num = (nnipsNum == null || nnipsNum == DBNull.Value) ? "" : nnipsNum.ToString().Trim();
        string id = (censusId == null || censusId == DBNull.Value) ? "" : Convert.ToString(censusId).Trim();
        string strRosterID = Convert.ToString(censusId).Trim();

        // Prioritize the 6-digit standardized number, else use the Integer CensusID
        string targetId = (num.Length == 6) ? num : id;

        // 2. Build the URL with the additional variables from your QueryString
        // strID, strWeek, strNepDate, and strWorkerID are already available in your class
        return string.Format("~/pages/OH_CENSUS.aspx?id={0}&addr={1}&wk={2}&dt={3}&wr={4}&rid={5}",
            targetId,
            Server.UrlEncode(strID),
            Server.UrlEncode(strWeek),
            Server.UrlEncode(strNepDate),
            Server.UrlEncode(strWorkerID),
            Server.UrlEncode(strRosterID));
    }

    private List<WomanEntry> GetWomenFromInputs()
    {
        List<WomanEntry> list = new List<WomanEntry>();
        if (IsFilled(WOMFNAMES1, WOMLNAME1)) list.Add(new WomanEntry(WOMFNAMES1.Text, WOMLNAME1.Text));
        if (IsFilled(WOMFNAMES2, WOMLNAME2)) list.Add(new WomanEntry(WOMFNAMES2.Text, WOMLNAME2.Text));
        if (IsFilled(WOMFNAMES3, WOMLNAME3)) list.Add(new WomanEntry(WOMFNAMES3.Text, WOMLNAME3.Text));
        if (IsFilled(WOMFNAMES4, WOMLNAME4)) list.Add(new WomanEntry(WOMFNAMES4.Text, WOMLNAME4.Text));
        return list;
    }

    private bool IsFilled(TextBox fn, TextBox ln)
    {
        return !string.IsNullOrWhiteSpace(fn.Text) && !string.IsNullOrWhiteSpace(ln.Text);
    }

    // Renamed helper class to prevent ambiguity
    private class WomanEntry
    {
        public string First;
        public string Last;
        public WomanEntry(string f, string l)
        {
            First = f;
            Last = l;
        }
    }

    #endregion

    #region VALIDATIONS

    protected void ValidateNamePair_Row1(object source, ServerValidateEventArgs args) { args.IsValid = IsValidPair(WOMFNAMES1.Text, WOMLNAME1.Text); }
    protected void ValidateNamePair_Row2(object source, ServerValidateEventArgs args) { args.IsValid = IsValidPair(WOMFNAMES2.Text, WOMLNAME2.Text); }
    protected void ValidateNamePair_Row3(object source, ServerValidateEventArgs args) { args.IsValid = IsValidPair(WOMFNAMES3.Text, WOMLNAME3.Text); }
    protected void ValidateNamePair_Row4(object source, ServerValidateEventArgs args) { args.IsValid = IsValidPair(WOMFNAMES4.Text, WOMLNAME4.Text); }

    private bool IsValidPair(string fn, string ln)
    {
        fn = (fn ?? "").Trim();
        ln = (ln ?? "").Trim();
        if (fn == "" && ln == "") return true;
        if (fn != "" && ln != "") return true;
        return false;
    }

    #endregion

    // ---------- SUCCESS MESSAGES ----------
    private const string MsgHeaderSaved =
        "Success! Household header information has been saved.";

    private const string MsgWomanSaved =
        "Woman census information has been saved.";

}