using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;
using employeeTableAdapters;

/// <summary>
/// $$ Create admin only menu for backup/users/etc
/// </summary>
partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //PanelAdmin.Visible = true;
            getUserInfo();
             

            if(Request.QueryString["page"] == "pef")
            {
                LblFormName.Text = "105-Pregnancy Enrollment Form";
            }
            else if (Request.QueryString["page"] == "profile")
            {
                LblFormName.Text = "Profile Details";
            }
            else if (Request.QueryString["page"] == "censusa")
            {
                LblFormName.Text = "Household Mapping and Census Form";
            }
            else if (Request.QueryString["page"] == "censusb")
            {
                LblFormName.Text = "Household Mapping and Census Form";
            }
            else if (Request.QueryString["page"] == "censusnew")
            {
                LblFormName.Text = "Add New Woman and Husband";
            }
            else if (Request.QueryString["page"] == "roster")
            {
                LblFormName.Text = "Create a list of women's names";
            }
            else if (Request.QueryString["page"] == "createhh")
            {
                LblFormName.Text = "Create New Household";
            }
            else
            {
                LblFormName.Text = "Census Search Home";
            }


            //LblFormName.Text = "Census Search Home";

            //105-Pregnancy Enrollment Form


            if (strUserRole == "2" || strUserRole == "3" || strUserRole == "4")
            {
                //PanelLeftSideBar.Visible = false;
            }

            //if (strUserRole == "1")
            //{
            //    // Administrator
            //    PanelCentral.Visible = true;
            //    //  LitLinkUser.Text = "< li >< a href = 'user.aspx' title = 'User' >< i class='fa fa-angle-double-right'></i> Usuário</a></li>";
            //}
            //else if (strUserRole == "2")
            //{
            //    // DEO 
            //    PanelCentral.Visible = true;
            //}
            //else if (strUserRole == "3")
            //{
            //    // Mobile Data Collector
            //    PanelCentral.Visible = true;
            //}
            //else if (strUserRole == "4")
            //{
            //    // Ultrasound Team
            //    PanelCentral.Visible = true;
            //}

            if (strLangType == "1")
            {
                //ChkBoxLang.Checked = true;
                LngType.Text = "नेप";
            }
            else
            {
                //ChkBoxLang.Checked = false;
                LngType.Text = "EN";
            }
            string strWeekAndDate = Core.GetNepWeekAndDate();
            if (strWeekAndDate.Length > 3)
            {
                NepaliDate.Text = "निप्स हप्ता: " + strWeekAndDate.Substring(0, 3) + " , " + strWeekAndDate.Substring(3, 2) + "-" + strWeekAndDate.Substring(5, 2) + "-" + strWeekAndDate.Substring(7, 4);
                if (strWeekAndDate.Substring(11, 1) == "1")
                {
                    LblDay.Text = " , आइतवार (Sunday)";
                }
                else if (strWeekAndDate.Substring(11, 1) == "2")
                {
                    LblDay.Text = " , सोमबार (Monday)";
                }
                else if (strWeekAndDate.Substring(11, 1) == "3")
                {
                    LblDay.Text = " , मंगलबार (Tuesday)";
                }
                else if (strWeekAndDate.Substring(11, 1) == "4")
                {
                    LblDay.Text = " , बुधवार (Wednesday)";
                }
                else if (strWeekAndDate.Substring(11, 1) == "5")
                {
                    LblDay.Text = " , बिहीबार (Thursday)";
                }
                else if (strWeekAndDate.Substring(11, 1) == "6")
                {
                    LblDay.Text = " , शुक्रवार (Friday)";
                }
                else if (strWeekAndDate.Substring(11, 1) == "7")
                {
                    LblDay.Text = " , शनिबार (Saturday)";
                }
            }
            LblFooterText.Text = "© " + DateTime.Now.Date.Year.ToString() + " Developed by Department of Data Management, NNIPS | Oral Health Study.Version 1.0.0";
        }
    }
    protected void ChkBoxLang_CheckedChanged(Object sender, EventArgs args)
    {
        STAFFTableAdapter StfTA = new STAFFTableAdapter();
        employee.STAFFDataTable StfDT = new employee.STAFFDataTable();
        string UserID = HttpContext.Current.User.Identity.Name.ToString();
        StfTA.FillByWorkerID(StfDT, UserID);// System.Web.HttpContext.Current.User.Identity.Name);
        if (StfDT.Rows.Count > 0)
        {
            employee.STAFFRow SFRow = (employee.STAFFRow)StfDT.Rows[0];
            if (strLangType == "1")
            {
                //NEPALI
                //   TxtLang.Text = "1";
                SFRow.SFLANG = "1";
            }
            else if (strLangType == "2")
            {
                //ENGLISH
                //   TxtLang.Text = "2";
                SFRow.SFLANG = "2";
            }
            StfTA.Update(SFRow);
        }
    }

    protected void getUserInfo()
    {
        // $$ SET Language here?  Probably not necessary to include in dictionary, but might save a trip to Db
        UserName.Text = System.Web.HttpContext.Current.User.Identity.Name;
        Dictionary<string, string> DictUser = Core.GetUser(UserName.Text);
        DisplayName.Text = "Welcome, " + DictUser["SFFIRSTNAMES"];
        UserFullName.Text = DictUser["SFFIRSTNAMES"] + " " + DictUser["SFLASTNAME"];
        UserRoleName.Text = Core.GetROLEName(DictUser["SFROLE"]);
        strUserRole = DictUser["SFROLE"];
        if (DictUser["SFADMIN"] == "1")
        {
            SFADMIN.Text = "Administrator";
            //PanelAdmin.Visible = true;
        }
        string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath);
        //General.LogUserPage(DictUser["WORKERID"], currentPage);
    }

    public string strUserRole
    {
        get
        {
            if (UserRole.Text == string.Empty)
            {
                getUserInfo();
            }
            return UserRole.Text;
        }
        set
        {
            UserRole.Text = value;
        }
    }

    public string strLangType
    {
        //$$ need to simplify this.  It is overly complicated.
        get
        {
            if (TxtLang.Text == string.Empty)
            {
                STAFFTableAdapter StfTA = new STAFFTableAdapter();
                employee.STAFFDataTable StfDT = new employee.STAFFDataTable();
                string UserID = HttpContext.Current.User.Identity.Name.ToString();
                StfTA.FillByWorkerID(StfDT, UserID); // System.Web.HttpContext.Current.User.Identity.Name);
                if (StfDT.Rows.Count > 0)
                {
                    employee.STAFFRow SFRow = (employee.STAFFRow)StfDT.Rows[0];
                    TxtLang.Text = SFRow.SFLANG;
                    if (TxtLang.Text == "1")
                    {
                        // Nepali (1)
                        //ChkBoxLang.Checked = true;
                    }
                    else
                    {
                        // English (2)
                        //ChkBoxLang.Checked = false;
                    }

                }
                else
                {
                    // Set default to Nepali (1)
                    TxtLang.Text = "1";
                    //ChkBoxLang.Checked = true;
                }
            }
            else
            {
                //if (ChkBoxLang.Checked == true)
                //{
                //    // Nepali
                //    TxtLang.Text = "1";
                //}
                //else if (ChkBoxLang.Checked == false)
                //{
                //    //English
                //    TxtLang.Text = "2";
                //}
            }
            return TxtLang.Text;
        }
        set
        {
            TxtLang.Text = value;
        }
    }
    //protected void ButtonToggle_Click(object sender, EventArgs e)
    //{
    //    ToggleLabelToolTip(Page);
    //}

    //public static void ToggleLabelToolTip(Control Parent)
    //{
    //    string strTemp = "";
    //    foreach (Control ctrl in Parent.Controls)
    //    {
    //        if (ctrl is Label)
    //        {
    //            Label c = (Label)ctrl;
    //            strTemp = c.ToolTip;
    //            c.ToolTip = c.Text;

    //            c.Text = strTemp;
    //        }
    //        else
    //        {
    //            if (ctrl.Controls.Count > 0)
    //            {
    //                ToggleLabelToolTip(ctrl);
    //            }
    //        }
    //        if (ctrl is Button)
    //        {
    //            Button b = (Button)ctrl;
    //            strTemp = b.ToolTip;
    //            b.ToolTip = b.Text;
    //            b.Text = strTemp;
    //        }
    //        if (ctrl is HyperLink)
    //        {
    //            HyperLink h = (HyperLink)ctrl;
    //            strTemp = h.ToolTip;
    //            h.ToolTip = h.Text;
    //            h.Text = strTemp;
    //        }
    //    }
    //}

}

