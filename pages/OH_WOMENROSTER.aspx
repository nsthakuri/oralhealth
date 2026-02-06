<%@ Page 
    Language="C#" 
    AutoEventWireup="true"
    MasterPageFile="~/Site.master"
    CodeFile="OH_WOMENROSTER.aspx.cs"
    Inherits="pages_OH_WOMENROSTER" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   

    <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="page-card">        
        <h4 class="page-title"> 
                <asp:Label ID="LblAddress" runat="server" CssClass="success-msg" />
                
            </h4>
            <br />
              
            <asp:Label ID="lblsucessmsg" runat="server" CssClass="success-msg" />        
             

        <asp:Panel ID="PanelNewWomenRoster" runat="server">     
       <table class="table">
           <tr>
               <td colspan="3">
                   
                   <div class="question-card">
                    <div class="question-text">        
                        <span class="question-sub">
                            Now, <strong>create</strong> a list of married women aged 15–35 years and ask 
                                   each woman the questions individually for participation.
                          </span>
                    </div>
                  </div>
               </td>
           </tr>
           <tr>
               <th>SN</th>
               <th>First names</th>
               <th>Last name</th>
           </tr>
           <tr>
               <td>1.</td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMFNAMES1" MaxLength="30" Width="210" />
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator3" 
                        runat="server" 
                        ControlToValidate="WOMFNAMES1"
                        ErrorMessage="Required Field"
                        CssClass="error-msg" 
                        Display="Dynamic" 
                        SetFocusOnError="true" />
               </td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMLNAME1" MaxLength="30" Width="210" />
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator4" 
                        runat="server" 
                        ControlToValidate="WOMLNAME1"
                        ErrorMessage="Required Field"
                        CssClass="error-msg" 
                        Display="Dynamic" 
                        SetFocusOnError="true" /></td>
           </tr>

           <tr>
               <td>2.</td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMFNAMES2" MaxLength="30" Width="210" />
                    
               </td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMLNAME2" MaxLength="30" Width="210" />
              <asp:CustomValidator 
                    ID="CV_Row2"
                    runat="server"
                    ErrorMessage="First name and last name must be entered together"
                    CssClass="error-msg"
                    Display="Dynamic"
                    ClientValidationFunction="validateNamePair_Row2"
                    OnServerValidate="ValidateNamePair_Row2" />

                   </td>
           </tr>

           <tr>
               <td>3.</td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMFNAMES3" MaxLength="30" Width="210" />
                     
               </td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMLNAME3" MaxLength="30" Width="210" />
                <asp:CustomValidator 
                ID="CV_Row3"
                runat="server"
                ErrorMessage="First name and last name must be entered together"
                CssClass="error-msg"
                Display="Dynamic"
                ClientValidationFunction="validateNamePair_Row3"
                OnServerValidate="ValidateNamePair_Row3" />

             </td>
           </tr>

           <tr>
               <td>4.</td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMFNAMES4" MaxLength="30" Width="210" />
                   
               </td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMLNAME4" MaxLength="30" Width="210" />
               <asp:CustomValidator 
                ID="CV_Row4"
                runat="server"
                ErrorMessage="First name and last name must be entered together"
                CssClass="error-msg"
                Display="Dynamic"
                ClientValidationFunction="validateNamePair_Row4"
                OnServerValidate="ValidateNamePair_Row4" />
             </td>
           </tr>

           <tr>
               <td colspan="3">
                   <asp:Button 
                ID="ButtonCreateNewWoman" 
                runat="server"
                CssClass="btn btn-primary"
                Text="Create New Woman List" 
                OnClick="ButtonCreateNewWoman_Click"
                CausesValidation="true"  />
               </td>
           </tr>
       </table>
          </asp:Panel>
             

         </div> 
</asp:Content>