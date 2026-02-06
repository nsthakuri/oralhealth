<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OH_SESF.aspx.cs" Inherits="pages_OH_SESF" %>
<%@ MasterType VirtualPath="~/Site.Master" %> 
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Literal ID="LitCurWeek" runat="server" Visible="false" />
    <div class="page-card">
 <h2 class="page-title">105-Socio-Economic Status Form</h2>
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



        <table style="font-size:26px;">
      <tr>
            <th colspan="4" class="SubSectionTitle"> Section A: Household Information
            </th>
        </tr>
        
        <tr>
            <td>1. </td>
            <td style="text-align:left; padding-left:40px;">                
                <asp:Label ID="LBSEPAHMAD" Text="" runat="server" />
            </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEPAHMAD" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEPAHMAD" ControlToValidate="SEPAHMAD" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEPAHMAD" ControlToValidate="SEPAHMAD" ValidationExpression="1|2|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
           <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LBINSSEPAHMAD" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td>2. </td>
            <td style="text-align:left; padding-left:10px;">                
                <asp:Label ID="LBSEREGLN" Text="" runat="server" />
            </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEREGLN" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEREGLN" ControlToValidate="SEREGLN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEREGLN" ControlToValidate="SEREGLN" ValidationExpression="[1-5]|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
           <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LBINSSEREGLN" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2" style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEREGLNSP" Text="" runat="server" />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEREGLNSP" Width="410" MaxLength="50" />
                <asp:CustomValidator runat="server" ID="ValSEREGLN"  OnServerValidate="Validate_ValSEREGLN"  CssClass="erroMsg" />
             </td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEGFLOOR" Text="" runat="server" />
                </td>
	
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEGFLOOR" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEGFLOOR" ControlToValidate="SEGFLOOR" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEGFLOOR" ControlToValidate="SEGFLOOR" ValidationExpression="[0-5]|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEGFLOOR" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEFFLOOR" Text="" runat="server" />
                 </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEFFLOOR" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEFFLOOR" ControlToValidate="SEFFLOOR" ErrorMessage="Required Field" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEFFLOOR" ControlToValidate="SEFFLOOR" ValidationExpression="[0-5]|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEFFLOOR" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEROOF" Text="" runat="server" />
                 </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEROOF" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEROOF" ControlToValidate="SEROOF" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEROOF" ControlToValidate="SEROOF" ValidationExpression="[0-4]|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEROOF" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td>4. </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEROOM" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEROOM" Width="50" MaxLength="2" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEROOM" ControlToValidate="SEROOM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEROOM" ControlToValidate="SEROOM" ValidationExpression="[0-1][0-9]|20|99" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEROOM" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td>5. </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEDWATER" Text="" runat="server" />
               </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEDWATER" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEDWATER" ControlToValidate="SEDWATER" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEDWATER" ControlToValidate="SEDWATER" ValidationExpression="[1-4]|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEDWATER" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td>6. </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSELATRN" Text="" runat="server" />
                 </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SELATRN" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSELATRN" ControlToValidate="SELATRN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSELATRN" ControlToValidate="SELATRN" ValidationExpression="[0-3]|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSELATRN" Text="" runat="server" />
           </td>
        </tr>   
        <tr>
            <td></td>
            <td colspan="3" style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSELATRNSP" Text="" runat="server" />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SELATRNSP" Width="410" MaxLength="50" />
                <asp:CustomValidator runat="server" ID="ValSELATRN"  OnServerValidate="Validate_ValSELATRN"  CssClass="erroMsg" />
            </td>
        </tr>
        <tr>
            <td>7. </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSESERVNT" Text="" runat="server" />
                 </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SESERVNT" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSESERVNT" ControlToValidate="SESERVNT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSESERVNT" ControlToValidate="SESERVNT" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSESERVNT" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td>8. </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSECATTLE" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SECATTLE" Width="50" MaxLength="2" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSECATTLE" ControlToValidate="SECATTLE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSECATTLE" ControlToValidate="SECATTLE" ValidationExpression="[0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSECATTLE" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td>9. </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEGOAT" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEGOAT" Width="50" MaxLength="2" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEGOAT" ControlToValidate="SEGOAT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEGOAT" ControlToValidate="SEGOAT" ValidationExpression="[0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEGOAT" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td>10. </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEKHET" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="IntSEKHET" Width="70" MaxLength="3" /> . 
                <asp:TextBox  AutoComplete="off" runat="server"  ID="FractSEKHET" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEKHET" ControlToValidate="IntSEKHET" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RequiredFieldValidator runat="server" ID="ReqFractSEKHET" ControlToValidate="FractSEKHET" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIntSEKHET" ControlToValidate="IntSEKHET" ValidationExpression="[0-9][0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegexFractSEKHET" ControlToValidate="FractSEKHET" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
           </td>
           <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEKHET" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td>11. </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEBARI" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="IntSEBARI" Width="70" MaxLength="3" /> . 
                <asp:TextBox  AutoComplete="off" runat="server"  ID="FractSEBARI" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEBARI" ControlToValidate="IntSEBARI" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RequiredFieldValidator runat="server" ID="ReqFractSEBARI" ControlToValidate="FractSEBARI" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEBARI" ControlToValidate="IntSEBARI" ValidationExpression="[0-9][0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegexFractSEBARI" ControlToValidate="FractSEBARI" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
           </td>
           <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEBARI" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td>12. </td>
            <td>
                <asp:Label ID="LBQTWVL" Text="" runat="server" />
                </td>
            <td>  </td>
            <td>
               <asp:Label ID="Label56" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td> </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSECART" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SECART" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSECART" ControlToValidate="SECART" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSECART" ControlToValidate="SECART" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSECART" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEBICYCLE" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEBICYCLE" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEBICYCLE" ControlToValidate="SEBICYCLE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEBICYCLE" ControlToValidate="SEBICYCLE" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEBICYCLE" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEMOCYCLE" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEMOCYCLE" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEMOCYCLE" ControlToValidate="SEMOCYCLE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEMOCYCLE" ControlToValidate="SEMOCYCLE" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEMOCYCLE" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSETRACTOR" Text="" runat="server" />
               </td>	
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SETRACTOR" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSETRACTOR" ControlToValidate="SETRACTOR" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSETRACTOR" ControlToValidate="SETRACTOR" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSETRACTOR" Text="" runat="server" />
           </td>
        </tr>
        
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSECLOCK" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SECLOCK" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSECLOCK" ControlToValidate="SECLOCK" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSECLOCK" ControlToValidate="SECLOCK" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSECLOCK" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEWATCH" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEWATCH" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEWATCH" ControlToValidate="SEWATCH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEWATCH" ControlToValidate="SEWATCH" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEWATCH" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSERADIO" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SERADIO" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSERADIO" ControlToValidate="SERADIO" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSERADIO" ControlToValidate="SERADIO" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSERADIO" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSETV" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SETV" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSETV" ControlToValidate="SETV" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSETV" ControlToValidate="SETV" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSETV" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSESATDISH" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SESATDISH" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSESATDISH" ControlToValidate="SESATDISH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSESATDISH" ControlToValidate="SESATDISH" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSESATDISH" Text="" runat="server" />
           </td>
        </tr>        

        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEMOBILE" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEMOBILE" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEMOBILE" ControlToValidate="SEMOBILE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEMOBILE" ControlToValidate="SEMOBILE" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEMOBILE" Text="" runat="server" />
           </td>
        </tr>


         <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBLSEOTHER" Text="" runat="server" />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox  AutoComplete="off" ID="SEOTHERSP" runat="server" CssClass="specify" 
                            MaxLength="150" Width="410" />
                <asp:CustomValidator runat="server" ID="cvSEOTHERSP" ControlToValidate="SEOTHERSP" OnServerValidate="Validate_RequiredSEOTHERSP" ValidateEmptyText="true" CssClass="erroMsg" />
                
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEOTHER" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEOTHER" ControlToValidate="SEOTHER" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEOTHER" ControlToValidate="SEOTHER" ValidationExpression="[0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEOTHER" Text="" runat="server" />
           </td>
        </tr>


        <tr>
            <td>13.</td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEELECTR" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEELECTR" Width="40" MaxLength="1" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEELECTR" ControlToValidate="SEELECTR" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEELECTR" ControlToValidate="SEELECTR" ValidationExpression="[0,1,9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEELECTR" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td>14.</td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBSEOUTHOME" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEOUTHOME" Width="50" MaxLength="2" />
                <asp:RequiredFieldValidator runat="server" ID="ReqSEOUTHOME" ControlToValidate="SEOUTHOME" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEOUTHOME" ControlToValidate="SEOUTHOME" ValidationExpression="[0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                <asp:CustomValidator runat="server" ID="ValSEOUTHOME"  OnServerValidate="Validate_ValSEOUTHOME" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEOUTHOME" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                a. <asp:Label ID="LBSEOUTKAT" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEOUTKAT" Width="50" MaxLength="2" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEOUTKAT" ControlToValidate="SEOUTKAT" ValidationExpression="[0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEOUTKAT" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                b. <asp:Label ID="LBSEOUTNEP" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEOUTNEP" Width="50" MaxLength="2" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEOUTNEP" ControlToValidate="SEOUTNEP" ValidationExpression="[0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEOUTNEP" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                c. <asp:Label ID="LBSEOUTIND" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEOUTIND" Width="50" MaxLength="2" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEOUTIND" ControlToValidate="SEOUTIND" ValidationExpression="[0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEOUTIND" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                d. <asp:Label ID="LBSEOUTGULF" Text="" runat="server" />
               </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEOUTGULF" Width="50" MaxLength="2" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEOUTGULF" ControlToValidate="SEOUTGULF" ValidationExpression="[0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEOUTGULF" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                e. <asp:Label ID="LBSEOUTSEA" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEOUTSEA" Width="50" MaxLength="2" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEOUTSEA" ControlToValidate="SEOUTSEA" ValidationExpression="[0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEOUTSEA" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                f. <asp:Label ID="LBSEOUTNEA" Text="" runat="server" />
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEOUTNEA" Width="50" MaxLength="2" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEOUTNEA" ControlToValidate="SEOUTNEA" ValidationExpression="[0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEOUTNEA" Text="" runat="server" />
           </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
                g. <asp:Label ID="LBSEOUTOTH" Text="" runat="server" />

                <asp:Label ID="LBLSEOUTOTHSP" Text="" runat="server" />
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox  AutoComplete="off" ID="SEOUTOTHSP" runat="server" CssClass="specify" 
                            MaxLength="150" Width="410" />
                <asp:CustomValidator runat="server" ID="cvSEOUTOTHSP" ControlToValidate="SEOUTOTHSP" OnServerValidate="Validate_RequiredSEOUTOTHSP" ValidateEmptyText="true" CssClass="erroMsg" />

                </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server"  ID="SEOUTOTH" Width="50" MaxLength="2" />
                <asp:RegularExpressionValidator runat="server" ID="RegExSEOUTOTH" ControlToValidate="SEOUTOTH" ValidationExpression="[0-9][0-9]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            </td>
            <td style="text-align:left; padding-left:10px;">
               <asp:Label ID="LCSEOUTOTH" Text="" runat="server" />
           </td>
        </tr>

        <tr>
            <td colspan="5" style="text-align:left; padding-left:30px;">
                <asp:Label ID="LBLOUTINFO" Text="" runat="server" />
                </td>
        </tr>
        <tr>
            <td colspan="4"  style="text-align:center;">
                <asp:Button ID="ButtonSectionA" runat="server"  CssClass="btn btn-primary" Text="Submit" />            
            </td>
        </tr>
    </table>
 
 
        
        <table style="width:100%;  font-size:26px;">
         <tr>
            <th colspan="4" class="SubSectionTitle"> Section B: Household Food Security
            </th>
        </tr>
       
       <tr>
            <td style="padding:10px; width:80px;">
                1.
            </td>
            <td style="text-align:left; padding-left:10px;">                
                <asp:Label ID="LBLHFWORRYFOOD" Text="" runat="server" />       
            </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server" ID="SEWORRYFOOD" MaxLength="1"  Width="40"  /> <br />
                <asp:RequiredFieldValidator ID="ReqHFWORRYFOOD"  SetFocusOnError="true" ControlToValidate="SEWORRYFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                <asp:RegularExpressionValidator ID="RegexHFWORRYFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="SEWORRYFOOD" CssClass="erroMsg"  ErrorMessage="" runat="server"  />      
            </td>
            <td style="text-align:left; padding-left:10px;">                
                <asp:Label ID="LBLINSFMP" Text="" runat="server" />       
            </td>
        </tr>


        <tr>
                <td style="padding:10px;width:80px;"></td>
                <td style="text-align:left; padding-left:10px;">                    
                  1a.  <asp:Label ID="LBLHFWORRYTIMS" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" runat="server" ID="SEWORRYTIMS" MaxLength="1"  Width="40" /><br />                    
                    <asp:RegularExpressionValidator ID="RegexHFWORRYTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" CssClass="erroMsg" ControlToValidate="SEWORRYTIMS"   
                        ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CVHFWORRYTIMS" runat="server" ControlToValidate="SEWORRYTIMS"  OnServerValidate="CustVal_HFWORRYTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSHFWORRYTIMS" Text="" runat="server" />       
                </td>
        </tr>


                    <tr>
                        <td>2.</td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LBLHFLACKFOOD" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SELACKFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFLACKFOOD"  SetFocusOnError="true" ControlToValidate="SELACKFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFLACKFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="SELACKFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFLACKFOOD" Text="" runat="server" />       
                        </td>
                    </tr>
					
<tr>
                        <td></td>
                        <td style="text-align:left; padding-left:10px;">                            
                           2a. <asp:Label ID="LBLHFLACKTIMS" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SELACKTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFLACKTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="SELACKTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator22" runat="server" ControlToValidate="SELACKTIMS"  OnServerValidate="CustVal_HFLACKTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFLACKTIMS" Text="" runat="server" />       
                        </td>
                    </tr>
        <tr>
                        <td>3.</td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LBLHFLMTFOOD" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SELMTFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFLMTFOOD"  SetFocusOnError="true" ControlToValidate="SELMTFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFLMTFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="SELMTFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFLMTFOOD" Text="" runat="server" />       
                        </td>
                    </tr>
					
<tr>
                        <td></td>
                        <td style="text-align:left; padding-left:10px;">                            
                           3a. <asp:Label ID="LBLHFLMTTIMS" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SELMTTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFLMTTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="SELMTTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                            <asp:CustomValidator ID="CustomValidator23" runat="server" ControlToValidate="SELMTTIMS"  OnServerValidate="CustVal_HFLMTTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFLMTTIMS" Text="" runat="server" />       
                        </td>
                    </tr>


        <tr>
                        <td>4.</td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LBLHFRESRCFOOD" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SERESRCFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFRESRCFOOD"  SetFocusOnError="true" ControlToValidate="SERESRCFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFRESRCFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="SERESRCFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFRESRCFOOD" Text="" runat="server" />       
                        </td>
                    </tr>
					
<tr>
                        <td></td>
                        <td style="text-align:left; padding-left:10px;">                            
                          4a.  <asp:Label ID="LBLHFRESRCTIMS" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SERESRCTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFRESRCTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="SERESRCTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator24" runat="server" ControlToValidate="SERESRCTIMS"  OnServerValidate="CustVal_HFRESRCTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFRESRCTIMS" Text="" runat="server" />       
                        </td>
                    </tr>

        <tr>
                        <td>5.</td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LBLHFSMALLFOOD" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SESMALLFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFSMALLFOOD"  SetFocusOnError="true" ControlToValidate="SESMALLFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFSMALLFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="SESMALLFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFSMALLFOOD" Text="" runat="server" />       
                        </td>
                    </tr>
					
<tr>
                        <td></td>
                        <td style="text-align:left; padding-left:10px;">                            
                          5a.  <asp:Label ID="LBLHFSMALLTIMS" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SESMALLTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFSMALLTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="SESMALLTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator25" runat="server" ControlToValidate="SESMALLTIMS"  OnServerValidate="CustVal_HFSMALLTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFSMALLTIMS" Text="" runat="server" />       
                        </td>
                    </tr>

        <tr>
                        <td>6.</td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LBLHFFEWFOOD" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SEFEWFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFFEWFOOD"  SetFocusOnError="true" ControlToValidate="SEFEWFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFFEWFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="SEFEWFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFFEWFOOD" Text="" runat="server" />       
                        </td>
                    </tr>
					
<tr>
                        <td></td>
                        <td style="text-align:left; padding-left:10px;">                            
                           6a. <asp:Label ID="LBLHFFEWTIMS" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SEFEWTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFFEWTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="SEFEWTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator26" runat="server" ControlToValidate="SEFEWTIMS"  OnServerValidate="CustVal_HFFEWTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFFEWTIMS" Text="" runat="server" />       
                        </td>
                    </tr>

        <tr>
                        <td>7.</td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LBLHFNOFOOD" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SENOFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFNOFOOD"  SetFocusOnError="true" ControlToValidate="SENOFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFNOFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="SENOFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFNOFOOD" Text="" runat="server" />       
                        </td>
                    </tr>
					
<tr>
                        <td></td>
                        <td style="text-align:left; padding-left:10px;">                            
                          7a.  <asp:Label ID="LBLHFNOFOODTIMS" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SENOFOODTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFNOFOODTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="SENOFOODTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator27" runat="server" ControlToValidate="SENOFOODTIMS"  OnServerValidate="CustVal_HFNOFOODTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFNOFOODTIMS" Text="" runat="server" />       
                        </td>
                    </tr>

        <tr>
                        <td>8.</td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LBLHFHUNGRYFOOD" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SEHUNGRYFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFHUNGRYFOOD"  SetFocusOnError="true" ControlToValidate="SEHUNGRYFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFHUNGRYFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="SEHUNGRYFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFHUNGRYFOOD" Text="" runat="server" />       
                        </td>
                    </tr>
					
<tr>
                        <td></td>
                        <td style="text-align:left; padding-left:10px;">                            
                           8a. <asp:Label ID="LBLHFHUNGRYTIMS" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SEHUNGRYTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFHUNGRYTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="SEHUNGRYTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator28" runat="server" ControlToValidate="SEHUNGRYTIMS"  OnServerValidate="CustVal_HFHUNGRYTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFHUNGRYTIMS" Text="" runat="server" />       
                        </td>
                    </tr>

        <tr>
                        <td>9.</td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LBLHFENGHFOOD" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SEENGHFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFENGHFOOD"  SetFocusOnError="true" ControlToValidate="SEENGHFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFENGHFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="SEENGHFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFENGHFOOD" Text="" runat="server" />       
                        </td>
                    </tr>
					
                   <tr>
                        <td></td>
                        <td style="text-align:left; padding-left:10px;">                            
                           9a. <asp:Label ID="LBLHFENGHTIMS" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="SEENGHTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFENGHTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="SEENGHTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator29" runat="server" ControlToValidate="SEENGHTIMS"  OnServerValidate="CustVal_HFENGHTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFENGHTIMS" Text="" runat="server" />       
                        </td>
                    </tr>

                <tr>                
                <td>...</td>
                <td  style="text-align:left; padding-left:10px;">
                     <asp:Label ID="LBLDATASTAT" runat="server" />
                </td>
                <td   style="text-align:left; padding-left:10px;" colspan="2">
                    <asp:DropDownList ID="SECOMPFORM" runat="server"  Width="210"  />
                   <asp:RequiredFieldValidator ID="ReqDDFORMSTATUS"  SetFocusOnError="true" ControlToValidate="SECOMPFORM"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />
                </td>
            </tr>

                <tr>
            <td colspan="4"  style="text-align:center;">
                <asp:Button ID="ButtonSectionB" runat="server" CssClass="btn btn-primary" Text="Submit" />            
            </td>
        </tr>
        </table>

     </div> 
</asp:Content>
