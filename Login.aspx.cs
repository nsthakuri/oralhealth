using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using employeeTableAdapters;
using System.Web.Security;

partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
	{

        WorkerID.Focus(); 

    }
	public void Logon_Click(object sender, EventArgs e)
	{        
        STAFFTableAdapter TA = new STAFFTableAdapter();
        employee.STAFFDataTable DT = new employee.STAFFDataTable();
        TA.FillByActiveWorkerID(DT, WorkerID.Text);
        if (DT.Rows.Count > 0)
        {
            employee.STAFFRow uRow = (employee.STAFFRow)DT.Rows[0];
            string hashedPassword = Core.HashSHA1(Userpass.Text + uRow.SFSALT);
            //if(uRow.SFPASSWORD == Userpass.Text)
            if (uRow.SFPASSWORD == hashedPassword)
            {
                Msg.Text = "Success";
                //uRow.SFLANG = "1"; //set default lang = NEP

                //set user cookie                 
                    HttpCookie _UserCookie = new HttpCookie("_UserCookie");
                    Response.Cookies.Add(new HttpCookie("_UserCookie", WorkerID.Text));
                    _UserCookie.Expires = DateTime.Now.AddMinutes(15);
                    HttpContext.Current.Response.Cookies.Add(_UserCookie);
                //end of set user cookie 


                TA.Update(uRow);
             //   General.LogUserLogin(uRow.USER_COD);
                FormsAuthentication.RedirectFromLoginPage(WorkerID.Text, Persist.Checked);
            }
        }
        else
        {
            PanelError.Visible = true;
            ImgError.ImageUrl = "images/error.png";
            ErrorMsg.Text = "Invalid credentials. Please try again.";
        }
  //      if (((WorkerID.Text == "comsa1") & (Userpass.Text == "pass1"))) {
		//	FormsAuthentication.RedirectFromLoginPage(WorkerID.Text, Persist.Checked);
		//}
  //      else {
			//Msg.Text = "Invalid credentials. Please try again.";
		//}
	}
}


