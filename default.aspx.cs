using System;
using System.Web;
using System.Web.UI;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpContext ctx = HttpContext.Current;

            // ----- USER AUTHENTICATION CHECK -----
            HttpCookie userCookie = ctx.Request.Cookies["_UserCookie"];

            // Refresh cookie safely
            RefreshCookieSafe(ctx, userCookie);

            // If cookie missing after refresh -> redirect to login
            if (HttpContext.Current.Request.Cookies["_UserCookie"] == null)
            {
                Response.Redirect("~/Login.aspx", endResponse: true);
                return;
            }
        }

        // ----- DATE HANDLING -----
        var dictDate = Core.GetDateElements(DateTime.Today);
        if (dictDate != null && dictDate.Count > 0)
        {
            LitCurWeek.Text = dictDate["Week"];
        }

        // ----- Focus on the search textbox -----
        if (!IsPostBack)
        {
            TBSearch.Focus();
        }
    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        // ----- Server-side safety validation -----        
        if (TBSearch.Text.Length == 6)
        {
            // Redirect to OH_SEARCH page
            Response.Redirect("~/pages/OH_SEARCH.aspx?id=" + TBSearch.Text + "&page=profile" + "&type=nnipsnum", endResponse: true);
        }
        else if (TBSearch.Text.Length == 8)
        {
            // Redirect to OH_SEARCH page
            Response.Redirect("~/pages/OH_SEARCH.aspx?id=" + TBSearch.Text + "&page=profile" + "&type=address", endResponse: true);
        }
        else
        {
            Response.Redirect("OH_ERROR.aspx");
        } 
    }


    // ============================================================
    // HELPER: Safe Cookie Refresh
    // ============================================================
    private void RefreshCookieSafe(HttpContext ctx, HttpCookie cookie)
    {
        try
        {
            if (cookie != null)
            {
                // update expiry (extend session)
                cookie.Expires = DateTime.Now.AddMinutes(30);
                ctx.Response.Cookies.Set(cookie);
            }
        }
        catch
        {
            // Silent catch: do not break the page on cookie refresh error
        }
    }
}
