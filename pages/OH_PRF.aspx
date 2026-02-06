<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OH_PRF.aspx.cs" Inherits="pages_OH_PRF" %>
<%@ MasterType VirtualPath="../site.master" %>  
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Literal ID="LitCurWeek" runat="server" Visible="false" />
    <div class="page-card">
 <h2 class="page-title">105-Pregnancy Report Form</h2>
        <div class="subnote">Show woman's info here where redirect from search page</div>


     <asp:Panel ID="Panel1"  runat="server" >
       
         <div class="table-wrap table-responsive">
  <table class="table">
      
  <tr>
                        <td>
                            Week<asp:Label ID="LblWeek" Text="" runat="server" />                            
                        </td>

                        <td>
                           Day<asp:Label ID="LblDay" Text="" runat="server" />    
                        </td>                                               

                        <td>
                            Mon<asp:Label ID="LblMonth" Text="" runat="server" />    
                        </td>

                        <td>
                            Year<asp:Label ID="LblYear" Text="" runat="server" />    
                        </td>

                        <td>
                            Worker<asp:Label ID="LblWorkerID" Text="" runat="server" />    
                        </td>
                    </tr>

          <tr>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="WEEK"  MaxLength="3" Width="70" />
                            <asp:RequiredFieldValidator ID="ReqWEEK" runat="server" ControlToValidate="WEEK"  SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                            <asp:RegularExpressionValidator runat="server" ID="RegExWEEK" ControlToValidate="WEEK" ValidationExpression="[6][0-9][0-9]|[7][0-9][0-9]" SetFocusOnError="true"  Display="Dynamic" CssClass="erroMsg" />
                        </td>
                        
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="Day" MaxLength="2" Width="60"  />
                            <asp:RequiredFieldValidator ID="ReqDay" runat="server" ControlToValidate="Day" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                            <asp:RegularExpressionValidator runat="server" ID="RegExDay" ControlToValidate="Day" ValidationExpression="0[1-9]|[1-2][0-9]|3[0-2]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="Month" MaxLength="2" Width="60"  />
                            <asp:RequiredFieldValidator ID="ReqMonth" runat="server" ControlToValidate="Month" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                            <asp:RegularExpressionValidator runat="server" ID="RegExMonth" ControlToValidate="Month" ValidationExpression="0[1-9]|1[0-2]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        </td>
                        
                        <td>
                             <asp:TextBox  AutoComplete="off" runat="server" ID="Year" MaxLength="2" Width="60"  />
                                <asp:RequiredFieldValidator ID="ReqYear" runat="server" ControlToValidate="Year" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                                <asp:RegularExpressionValidator runat="server" ID="RegExYear" ControlToValidate="Year" ValidationExpression="79|80|81" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        </td>
                        <td>
                               <asp:TextBox  AutoComplete="off" runat="server" ID="PEWORKER" MaxLength="3" Width="70"  />
                                <asp:RequiredFieldValidator ID="ReqWorkerID" runat="server" ControlToValidate="PEWORKER" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                                <asp:RegularExpressionValidator runat="server" ID="RegExWorkerID" ControlToValidate="PEWORKER" ValidationExpression="^\d{3}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        </td>
                    </tr>


                 <tr>
                        <td >
                        Muni    <asp:Label ID="LblNGP" Text="" runat="server" /> 
                        </td>
                        <td>
                          Ward  <asp:Label ID="LblWard" Text="" runat="server" />
                        </td>
                        <td>
                          HH  <asp:Label ID="LblHH" Text="" runat="server" />
                        </td>
                        <td colspan="2"></td>
                    </tr>

                    <tr>
                        <td >
                            <asp:TextBox  AutoComplete="off" runat="server" ID="MuniID" MaxLength="2" Width="60" />
                            <asp:RequiredFieldValidator ID="ReqMuniID" runat="server" ControlToValidate="MuniID" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                        	<asp:RegularExpressionValidator runat="server" ID="RegExMuniID" ControlToValidate="MuniID" ValidationExpression="19|22|27|70|75|76" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />                            
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="Ward" MaxLength="2" Width="60"  />
                            <asp:RequiredFieldValidator ID="ReqWard" runat="server" ControlToValidate="Ward" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                             <asp:RegularExpressionValidator runat="server" ID="RegExWard" ControlToValidate="Ward" ValidationExpression="0[1-9]|1[0-2]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="HH" MaxLength="4" Width="90" />
                            <asp:RequiredFieldValidator ID="ReqHH" runat="server" ControlToValidate="HH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                            <asp:RegularExpressionValidator runat="server" ID="RegExHH" ControlToValidate="HH" ValidationExpression="^\d{4}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        </td>
                        <td style="float:left;">
                         <asp:Button ID="ButtonHeaderSubmit" runat="server" Text="Submit"  CausesValidation="true"/>
                     </td>
                        <td></td>
                    </tr>
       
  </table>
       </div> 
 
        </asp:Panel>
        sdfdsf

              
  <table class="table">
      
       <tr>
             <td>VS<asp:Label ID="LblVS" Text="" runat="server" /></td>
             <td>MS<asp:Label ID="LblMS" Text="" runat="server" /></td>             
           <td>PS<asp:Label ID="Label2" Text="" runat="server" /></td>             
       </tr>

       <tr> 
            <td>
                 <asp:DropDownList ID="PEVS" runat="server"  /> 
            </td>
           <td>
                 <asp:DropDownList ID="DropDownList1" runat="server"  /> 
            </td>
           <td>
                 <asp:DropDownList ID="DropDownList2" runat="server"  /> 
            </td>
      </tr>


      </table>

   <table>

         <tr>
             <td>1.</td>
             <td style="text-align:left; padding-left:10px;">	Woman's Mobile: </td>
             <td  colspan="2" style="text-align:left; padding-left:10px;">
                 <asp:TextBox  AutoComplete="off" runat="server" ID="PRMOBILE" MaxLength="10" Width="380" />
                <asp:RegularExpressionValidator runat="server" ID="RegExPRMOBILE" ControlToValidate="PRMOBILE" ValidationExpression="^\d{10}$" SetFocusOnError="true" ErrorMessage="Mobile Numbers Only" Display="Dynamic" CssClass="erroMsg" />                            
             </td>
         </tr>
           
         <tr>
             <td>2.</td>
             <td style="text-align:left; padding-left:10px;">	LMP Week: </td>
             <td  colspan="2" style="text-align:left; padding-left:10px;">
                 <asp:TextBox  AutoComplete="off" runat="server" ID="PRLMPWK" MaxLength="3" Width="180" />
                <asp:RegularExpressionValidator runat="server" ID="RegExPRLMPWK" ControlToValidate="PRLMPWK" ValidationExpression="^\d{3}$" SetFocusOnError="true" ErrorMessage="LMP Week" Display="Dynamic" CssClass="erroMsg" />                            
                 
             </td>
         </tr>

         <tr>
             <td>3. </td>
             <td style="text-align:left; padding-left:10px;">	Notes: </td>
             <td colspan="2" style="text-align:left; padding-left:10px;">
                 <asp:TextBox  AutoComplete="off" runat="server" ID="PRNOTES" MaxLength="200" Width="380" />                 
            </td>
         </tr>


         <tr>
             <td></td>
              <td>
                 <asp:Button ID="ButtonSaveData" runat="server" CssClass="btn btn-primary" Text="Save Data" CausesValidation="true" />
             </td>
             <td colspan="2"></td>
       </tr>
    </table>
         

     </div> 
</asp:Content>
