<%@ Page Language="C#" AutoEventWireup="false" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>MINT4 | Login Panel </title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" type="text/css" href="css/login.css">
<!--===============================================================================================-->
</head>
<body>
	<asp:Panel ID="PanelError" runat="server" Visible="false" HorizontalAlign="Center">
		<asp:Image runat="server" ID="ImgError" Height="30" />
		<asp:Label ID="ErrorMsg" runat="server"  ForeColor="Red" BackColor="White"/>
	</asp:Panel>
	<asp:Panel ID="PanelLogin" runat="server" DefaultButton="Submit1">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form ID="form1" runat="server" class="login100-form validate-form">
					<span class="login100-form-logo">                        
						<i class="zmdi zmdi-landscape"></i>
					</span>
                    <asp:Label ID="Msg" ForeColor="red" runat="server" />
					<div style="padding:10px 0px 10px 0;font-weight:bold; text-align:center; font-size:24px;color:#ffffff;">                         
                       Sign in to MINT4 Website
                     </div>

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
                        <asp:Label ID="Label1" Text="User ID" runat="server" Font-Bold="true" ForeColor="MistyRose" />
						<asp:TextBox  AutoComplete="off" ID="WorkerID" runat="server" class="input100" MaxLength="3" placeholder="WorkerID" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                         SetFocusOnError="true" ControlToValidate="WorkerID"
                        Display="Dynamic" 
                        ForeColor="#f56954" CssClass="fa fa-times-circle-o" ErrorMessage="Cannot be empty." 
                        runat="server" />
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
                        <asp:Label ID="Label2" Text="Password"  runat="server"  Font-Bold="true" ForeColor="MistyRose" />
						<asp:TextBox  AutoComplete="off" ID="Userpass" class="input100" TextMode="Password" placeholder="Password"
                            runat="server"  />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                             SetFocusOnError="true" ControlToValidate="Userpass"
                            ForeColor="#f56954" CssClass="fa fa-times-circle-o" ErrorMessage="Cannot be empty." 
                            runat="server" />
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>
                    
					<div class="container-login100-form-btn">						
                        <asp:Button ID="Submit1" OnClick="Logon_Click" Text="Sign In" CssClass="login100-form-btn"
       runat="server" />
					</div>

                    <div class="contact100-form-checkbox">
                    <asp:CheckBox ID="Persist" Visible="false" runat="server" Text="Remember Me"/>
                        </div>
					
				</form>		
				<div style="color:#ffffff;margin:0 auto; font-weight:bold; text-align:center;">
					बाल पोषण योजना-सर्लाही - २०२२  </div>
			</div>
		</div>
	</div>
	</asp:Panel>
</body>
</html>