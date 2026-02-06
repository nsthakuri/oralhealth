<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OH_PEF.aspx.cs" Inherits="pages_OH_PEF" %>
<%@ MasterType VirtualPath="~/Site.Master" %> 
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Literal ID="LitCurWeek" runat="server" Visible="false" />
    <div class="page-card"> 
         

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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="WEEK"  MaxLength="3" Width="70" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="ReqWEEK" runat="server" ControlToValidate="WEEK"  SetFocusOnError="true" Display="Dynamic" CssClass="error-message" ErrorMessage="NNIPS number is required." />
                            <asp:RegularExpressionValidator runat="server" ID="RegExWEEK" ControlToValidate="WEEK" ValidationExpression="[6][0-9][0-9]|[7][0-9][0-9]" SetFocusOnError="true"  Display="Dynamic" CssClass="error-message" />
                        </td>
                        
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="Day" MaxLength="2" Width="60"  />
                            <asp:RequiredFieldValidator ID="ReqDay" runat="server" ControlToValidate="Day" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                            <asp:RegularExpressionValidator runat="server" ID="RegExDay" ControlToValidate="Day" ValidationExpression="0[1-9]|[1-2][0-9]|3[0-2]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="Month" MaxLength="2" Width="60"  />
                            <asp:RequiredFieldValidator ID="ReqMonth" runat="server" ControlToValidate="Month" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                            <asp:RegularExpressionValidator runat="server" ID="RegExMonth" ControlToValidate="Month" ValidationExpression="0[1-9]|1[0-2]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        </td>
                        
                        <td>
                             <asp:TextBox  AutoComplete="off" runat="server" ID="Year" MaxLength="2" Width="60"  />
                                <asp:RequiredFieldValidator ID="ReqYear" runat="server" ControlToValidate="Year" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                                <asp:RegularExpressionValidator runat="server" ID="RegExYear" ControlToValidate="Year" ValidationExpression="79|80|81" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        </td>
                        <td>
                               <asp:TextBox  AutoComplete="off" runat="server" ID="PEWORKER" MaxLength="3" Width="70"  />
                                <asp:RequiredFieldValidator ID="ReqWorkerID" runat="server" ControlToValidate="PEWORKER" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                                <asp:RegularExpressionValidator runat="server" ID="RegExWorkerID" ControlToValidate="PEWORKER" ValidationExpression="^\d{3}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
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
                            <asp:RequiredFieldValidator ID="ReqMuniID" runat="server" ControlToValidate="MuniID" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                        	<asp:RegularExpressionValidator runat="server" ID="RegExMuniID" ControlToValidate="MuniID" ValidationExpression="19|22|27|70|75|76" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />                            
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="Ward" MaxLength="2" Width="60"  />
                            <asp:RequiredFieldValidator ID="ReqWard" runat="server" ControlToValidate="Ward" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                             <asp:RegularExpressionValidator runat="server" ID="RegExWard" ControlToValidate="Ward" ValidationExpression="0[1-9]|1[0-2]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="HH" MaxLength="4" Width="90" />
                            <asp:RequiredFieldValidator ID="ReqHH" runat="server" ControlToValidate="HH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                            <asp:RegularExpressionValidator runat="server" ID="RegExHH" ControlToValidate="HH" ValidationExpression="^\d{4}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        </td>
                        <td style="float:left;" colspan="2">
                         <asp:Button ID="ButtonHeaderSubmit" runat="server" Text="Submit"  CausesValidation="true" class="btn btn-primary" />
                     </td> 
                    </tr>
       
            </table>
       </div>  
        </asp:Panel>
         

              
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

        <table class="table">
            <tr>
            <td style="padding:40px; text-align:left;">
             Mobile   <asp:Label ID="LblWMobile" Text="" runat="server" /></td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server" ID="PEWMOBILE" Enabled="true" MaxLength="10"   />
                <asp:RequiredFieldValidator ID="ReqPEWMOBILE" SetFocusOnError="true"  ControlToValidate="PEWMOBILE"   ErrorMessage="" runat="server" CssClass="error-message" />
                <asp:RegularExpressionValidator runat="server" ID="RegExPEWMOBILE" ControlToValidate="PEWMOBILE" ValidationExpression="^\d{10}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
            </td>
        </tr>

        <tr>
            <td style="padding:40px; text-align:left;">                
            Mobile    <asp:Label ID="LblFMobile" Text="" runat="server" />
            </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server" ID="PEFMOBILE" Enabled="true" MaxLength="10"   />
                <asp:RequiredFieldValidator ID="ReqPEFMOBILE" SetFocusOnError="true"  ControlToValidate="PEFMOBILE"   ErrorMessage="" runat="server" CssClass="error-message" />
                <asp:RegularExpressionValidator runat="server" ID="RegExPEFMOBILE" ControlToValidate="PEFMOBILE" ValidationExpression="^\d{10}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
            </td>
        </tr>
    </table>


        <table class="table">
        <tr>
            <th colspan="4" class="SubSectionTitle">
             Section A: Anthropometry/Measures Part-1
            </th>
        </tr>

        <tr>
            <td colspan="4" style="background:#efefef; padding:10px 10px 10px 10px; text-align:left;">
                <asp:Label ID="LBANTHRONOTE" runat="server" />
                
            </td>
        </tr>

        <tr>
                    <td style="text-align:left; padding-left:20px;">
                        1.
                   </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLPETEMP" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox  AutoComplete="off" ID="PETempWhole" runat="server" Width="70" MaxLength="3" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="PETempFract" runat="server" Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLPETEMPUNT" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqPETempWhole" runat="server" ControlToValidate="PETempWhole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RequiredFieldValidator ID="ReqPETempFract" runat="server" ControlToValidate="PETempFract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegPETempWhole" ControlToValidate="PETempWhole" ValidationExpression="^(?:09[0-9]|10[0-7]|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        <asp:RegularExpressionValidator runat="server" ID="RegPETempFract" ControlToValidate="PETempFract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        <asp:CustomValidator ID="cvPETemp" runat="server" OnServerValidate="CustVal_ValidateBodyTemperature" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                        <asp:Label ID="LNTEMP" runat="server" />
                    </td>
                </tr>

        
        <tr>
                    <td style="text-align:left; padding-left:20px;">
                        2.
                        </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLPEBLD1" runat="server" />
                        </td>
                    <td style="text-align:left; padding-left:20px;">
                        <asp:TextBox  AutoComplete="off" ID="PESYS1" runat="server" Width="70" MaxLength="3" />
                        /
                        
                        <asp:TextBox  AutoComplete="off" ID="PEDIA1" runat="server" Width="70" MaxLength="3" onkeyup="RefreshUpdatePanel();" AutoPostBack="true" />
                        <asp:Label ID="LBPEBLDUNT1" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqPESYS1" runat="server" ControlToValidate="PESYS1" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RegularExpressionValidator  ID="RegExPESYS1" runat="server" ControlToValidate="PESYS1" ValidationExpression="^(?:0[5-9]\d|1\d{2}|200|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                        <asp:RequiredFieldValidator ID="ReqPEDIA1" runat="server" ControlToValidate="PEDIA1" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExPEDIA1" ControlToValidate="PEDIA1" ValidationExpression="^(?:0(?:3[5-9]|[4-9]\d)|1(?:[0-3]\d|40)|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                        <asp:CustomValidator ID="CustomValidator15" runat="server"  OnServerValidate="CustVal_Validate1SYSDIA" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                        <asp:Label ID="LNPRES1" runat="server" />
                    </td>                   
                </tr>

         

        <tr>
            <td></td>
              <td style="text-align:left; padding-left:10px;">
                  2a. <asp:Label ID="LBTOB1" Text="" runat="server" />                 
               </td>
            
               <td style="text-align:left; padding-left:20px;">
                   <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">--%>
                    <ContentTemplate>
                   <asp:Label ID="LBPETOB1HH" Text="" runat="server" /> 
                   <asp:TextBox  AutoComplete="off" ID="PETOB1HH" runat="server"  MaxLength="2" Width="60"  />                   
                   <asp:RequiredFieldValidator ID="ReqPETOB1HH" runat="server" ControlToValidate="PETOB1HH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                   <asp:RegularExpressionValidator ID="RegExPETOB1HH" runat="server" ControlToValidate="PETOB1HH" ValidationExpression="^(?:0[1-9]|1[012])$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />

                   <asp:Label ID="LBPETOB1MM" Text="" runat="server" /> 
                   <asp:TextBox  AutoComplete="off" ID="PETOB1MM" runat="server"  MaxLength="2" Width="60"  />
                   <asp:RequiredFieldValidator ID="ReqPETOB1MM" runat="server" ControlToValidate="PETOB1MM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                   <asp:RegularExpressionValidator ID="RegExPETOB1MM" runat="server" ControlToValidate="PETOB1MM" ValidationExpression="^[0-5]\d$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                   
                   <asp:Label ID="LBPETOB1AMPM" Text="" runat="server" /> 
                  <%-- <asp:TextBox  AutoComplete="off" ID="PETOB1AMPM" runat="server"  MaxLength="1" Width="40"  />
                   <asp:RequiredFieldValidator ID="ReqPETOB1AMPM" runat="server" ControlToValidate="PETOB1AMPM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                  <asp:RegularExpressionValidator ID="RegExPETOB1AMPM" runat="server" ControlToValidate="PETOB1AMPM" ValidationExpression="^[12]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />--%>
                                      
                  <asp:DropDownList ID="PETOB1AMPM" runat="server"  Width="70"  />
                  <asp:RequiredFieldValidator ID="ReqPETOB1AMPM"  SetFocusOnError="true" ControlToValidate="PETOB1AMPM"   ErrorMessage="" runat="server" CssClass="error-message" InitialValue="X" />
                   </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="PEDIA1" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>

              </td>      
            <td  style="text-align:left; padding-left:10px;"> 

                <asp:Label ID="LNTOB1" Text="" runat="server" />
            </td>
           </tr>

        <tr>
            <td></td>
               <td style="text-align:left; padding-left:10px;">
                 2b.  <asp:Label ID="LBLNPEBP2REQ" Text="" runat="server" />
                   
               </td>
            
               <td style="text-align:left; padding-left:20px;">
                   <%--<asp:UpdatePanel ID="Update1" runat="server">--%>
                    <ContentTemplate>
                       <asp:TextBox  AutoComplete="off" ID="PEBP2REQ" runat="server"  MaxLength="1" Width="40"  />
                       <asp:RequiredFieldValidator ID="ReqPEBP2REQ" runat="server" ControlToValidate="PEBP2REQ" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                       <asp:RegularExpressionValidator runat="server" ID="RegExPEBP2REQ" ControlToValidate="PEBP2REQ" ValidationExpression="0|1" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                       <asp:CustomValidator ID="CustomValidator7" runat="server"  OnServerValidate="CustVal_FRSTBPRequired" ControlToValidate="PEBP2REQ" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="error-message" />
                   </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="PEDIA1" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>

               </td>
               <td  style="text-align:left; padding-left:10px;">
                   <asp:Label ID="LNPEBP2REQ" Text="" runat="server" />
               </td>
            </tr>


           <tr>
                <td style="text-align:left; padding-left:20px;">
                   3.
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPULSE" runat="server" />
                </td>
                <td style="text-align:left; padding-left:20px;">
                    <asp:TextBox  AutoComplete="off" ID="PEPULSE" runat="server" Width="70" MaxLength="3" />
                    <asp:Label ID="LBPEPULSEUNT" runat="server" />
                </td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqPEPULSE" runat="server" ControlToValidate="PEPULSE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEPULSE" ControlToValidate="PEPULSE" ValidationExpression="^(?:0[4-9]\d|1\d{2}|200|666|999)$" SetFocusOnError="true" ErrorMessage = "" Display="Dynamic" CssClass="error-message"/>
                    <asp:Label ID="LNPULSE" runat="server" />
                </td>
            </tr>

         <tr>
                    <td style="text-align:left; padding-left:20px;">
                        4.
                        </td>
                    <td style="text-align:left; padding-left:10px;">
                       <asp:Label ID="LBMUAC1" runat="server" />
                         </td>
                    <td>
                         <asp:TextBox  AutoComplete="off" ID="PEMUAC1Whole" runat="server"  Width="50" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="PEMUAC1Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBPEMUAC1UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqPEMUAC1Whole" runat="server" ControlToValidate="PEMUAC1Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RequiredFieldValidator ID="ReqPEMUAC1Fract" runat="server" ControlToValidate="PEMUAC1Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExPEMUAC1Whole" ControlToValidate="PEMUAC1Whole" ValidationExpression="1[5-9]|2[0-9]|3[0-9]|4[0-9]|50|66|99" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExPEMUAC1Fract" ControlToValidate="PEMUAC1Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        <asp:CustomValidator ID="CustomValidator12" runat="server" OnServerValidate="CustVal_Validate1MUAC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                        <asp:Label ID="LNMUAC1" runat="server" />
                    </td>
                </tr>


        <tr>
                    <td style="text-align:left; padding-left:20px;">
                        
                        </td>
                    <td style="text-align:left; padding-left:10px;">
                       <asp:Label ID="LBMUAC2" runat="server" />
                         </td>
                    <td>
                         <asp:TextBox  AutoComplete="off" ID="PEMUAC2Whole" runat="server"  Width="50" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="PEMUAC2Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBPEMUAC2UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqPEMUAC2Whole" runat="server" ControlToValidate="PEMUAC2Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RequiredFieldValidator ID="ReqPEMUAC2Fract" runat="server" ControlToValidate="PEMUAC2Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExPEMUAC2Whole" ControlToValidate="PEMUAC2Whole" ValidationExpression="1[5-9]|2[0-9]|3[0-9]|4[0-9]|50|66|99" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExPEMUAC2Fract" ControlToValidate="PEMUAC2Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        <asp:CustomValidator ID="CustomValidator13" runat="server" OnServerValidate="CustVal_Validate2MUAC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                        <asp:Label ID="LNMUAC2" runat="server" />
                    </td>
                </tr>


        <tr>
                    <td style="text-align:left; padding-left:20px;">
                       
                        </td>
                    <td style="text-align:left; padding-left:10px;">
                       <asp:Label ID="LBMUAC3" runat="server" />
                         </td>
                    <td>
                         <asp:TextBox  AutoComplete="off" ID="PEMUAC3Whole" runat="server"  Width="50" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="PEMUAC3Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBPEMUAC3UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqPEMUAC3Whole" runat="server" ControlToValidate="PEMUAC3Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RequiredFieldValidator ID="ReqPEMUAC3Fract" runat="server" ControlToValidate="PEMUAC3Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExPEMUAC3Whole" ControlToValidate="PEMUAC3Whole" ValidationExpression="1[5-9]|2[0-9]|3[0-9]|4[0-9]|50|66|99" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExPEMUAC3Fract" ControlToValidate="PEMUAC3Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        <asp:CustomValidator ID="CustomValidator14" runat="server" OnServerValidate="CustVal_Validate3MUAC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                        <asp:Label ID="LNMUAC3" runat="server" />
                    </td>
                </tr>


        <tr>
                <td  style="text-align:left; padding-left:20px;">                    
                    5.
                </td>

                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBHT1" runat="server" />
                </td>

                <td style="text-align:left; padding-left:20px;">
                    <asp:TextBox  AutoComplete="off" ID="PEHT1Whole" runat="server" Width="70" MaxLength="3" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="PEHT1Fract" runat="server" Width="40" MaxLength="1" />
                    
                    <asp:Label ID="LBLPEHT1UNT" runat="server" />
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqPEHT1Whole" runat="server" ControlToValidate="PEHT1Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RequiredFieldValidator ID="ReqPEHT1Fract" runat="server" ControlToValidate="PEHT1Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHT1Whole" ControlToValidate="PEHT1Whole" ValidationExpression="^(?:1(?:[0-9][0-9])|200|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHT1Fract" ControlToValidate="PEHT1Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="0-9" Display="Dynamic" CssClass="error-message" />
                    <asp:CustomValidator ID="cvPEHT1" runat="server" OnServerValidate="CustVal_Validate1Height" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:Label ID="LNHT1" runat="server" />
                </td>                    
           </tr>   
		   <tr>
                <td  style="text-align:left; padding-left:20px;"> 
                </td>

                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBHT2" runat="server" />
                </td>

                <td style="text-align:left; padding-left:20px;">
                    <asp:TextBox  AutoComplete="off" ID="PEHT2Whole" runat="server" Width="70" MaxLength="3" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="PEHT2Fract" runat="server" Width="40" MaxLength="1" />
                    
                    <asp:Label ID="LBLPEHT2UNT" runat="server" />
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqPEHT2Whole" runat="server" ControlToValidate="PEHT2Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RequiredFieldValidator ID="ReqPEHT2Fract" runat="server" ControlToValidate="PEHT2Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHT2Whole" ControlToValidate="PEHT2Whole" ValidationExpression="^(?:1(?:[0-9][0-9])|200|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHT2Fract" ControlToValidate="PEHT2Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="0-9" Display="Dynamic" CssClass="error-message" />
                    <asp:CustomValidator ID="CustomValidator10" runat="server" OnServerValidate="CustVal_Validate2Height" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:Label ID="LNHT2" runat="server" />
                </td>                    
           </tr>
		      <tr>
                <td  style="text-align:left; padding-left:20px;">    
                </td>

                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBHT3" runat="server" />
                </td>

                <td style="text-align:left; padding-left:20px;">
                    <asp:TextBox  AutoComplete="off" ID="PEHT3Whole" runat="server" Width="70" MaxLength="3" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="PEHT3Fract" runat="server" Width="40" MaxLength="1" />
                    
                    <asp:Label ID="LBLPEHT3UNT" runat="server" />
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqPEHT3Whole" runat="server" ControlToValidate="PEHT3Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RequiredFieldValidator ID="ReqPEHT3Fract" runat="server" ControlToValidate="PEHT3Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHT3Whole" ControlToValidate="PEHT3Whole" ValidationExpression="^(?:1(?:[0-9][0-9])|200|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHT3Fract" ControlToValidate="PEHT3Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="0-9" Display="Dynamic" CssClass="error-message" />
                    <asp:CustomValidator ID="CustomValidator11" runat="server" OnServerValidate="CustVal_Validate3Height" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:Label ID="LNHT3" runat="server" />
                </td>                    
           </tr>

         <tr>
                <td  style="text-align:left; padding-left:20px;">
                   6.
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEWT1" runat="server" />
                </td>
                 <td>
                   <asp:TextBox  AutoComplete="off" ID="PEWT1Whole" runat="server" Width="50" MaxLength="2" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="PEWT1Fract" runat="server" Width="40" MaxLength="1" />                    
                    <asp:Label ID="LBLPEWT1UNT" runat="server" />
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqPEWT1Whole" runat="server" ControlToValidate="PEWT1Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RequiredFieldValidator ID="ReqPEWT1Fract" runat="server" ControlToValidate="PEWT1Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEWT1Whole" ControlToValidate="PEWT1Whole" ValidationExpression="^(?:3[0-9]|4[0-9]|5[0-9]|6[0-9]|7[0-9]|8[0-9]|66|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEWT1Fract" ControlToValidate="PEWT1Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:CustomValidator ID="cvPEWT1" runat="server"  OnServerValidate="CustVal_Validate1Weight" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:Label ID="LNWT1" runat="server" />
                </td>
           </tr>


        <tr>
                <td  style="text-align:left; padding-left:20px;">
                    
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEWT2" runat="server" />
                </td>
                 <td>
                   <asp:TextBox  AutoComplete="off" ID="PEWT2Whole" runat="server" Width="50" MaxLength="2" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="PEWT2Fract" runat="server" Width="40" MaxLength="1" />                    
                    <asp:Label ID="LBLPEWT2UNT" runat="server" />                                
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqPEWT2Whole" runat="server" ControlToValidate="PEWT2Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RequiredFieldValidator ID="ReqPEWT2Fract" runat="server" ControlToValidate="PEWT2Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEWT2Whole" ControlToValidate="PEWT2Whole" ValidationExpression="^(?:3[0-9]|4[0-9]|5[0-9]|6[0-9]|7[0-9]|8[0-9]|66|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEWT2Fract" ControlToValidate="PEWT2Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:CustomValidator ID="CustomValidator8" runat="server"  OnServerValidate="CustVal_Validate2Weight" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:Label ID="LNWT2" runat="server" />
                </td>
           </tr>

        <tr>
                <td  style="text-align:left; padding-left:20px;">
                    
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEWT3" runat="server" />
                </td>
                 <td>
                   <asp:TextBox  AutoComplete="off" ID="PEWT3Whole" runat="server" Width="50" MaxLength="2" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="PEWT3Fract" runat="server" Width="40" MaxLength="1" />                    
                    <asp:Label ID="LBLPEWT3UNT" runat="server" />                                
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqPEWT3Whole" runat="server" ControlToValidate="PEWT3Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RequiredFieldValidator ID="ReqPEWT3Fract" runat="server" ControlToValidate="PEWT3Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEWT3Whole" ControlToValidate="PEWT3Whole" ValidationExpression="^(?:3[0-9]|4[0-9]|5[0-9]|6[0-9]|7[0-9]|8[0-9]|66|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEWT3Fract" ControlToValidate="PEWT3Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:CustomValidator ID="CustomValidator9" runat="server"  OnServerValidate="CustVal_Validate3Weight" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:Label ID="LNWT3" runat="server" />
                </td>
           </tr> 

        <tr>
            <td colspan="4">
           <asp:Button ID="ButtonSectionA" runat="server" Text="Submit"  CausesValidation="true" class="btn btn-primary" />
            </td>
        </tr>
</table>
     

           
      <table class="table">
         <tr>
            <th colspan="4" class="SubSectionTitle">
               Section B: General History
            </th>
        </tr>

        <tr>
            <td style="padding:10px; width:80px;">
                1.
            </td>
            <td style="text-align:left; padding-left:10px;">                
                <asp:Label ID="LBLPEFMP" Text="" runat="server" />       
            </td>
            <td>
                <asp:TextBox  AutoComplete="off" runat="server" ID="PEFMP" MaxLength="2"  Width="60"  /> <br />
                <asp:RequiredFieldValidator ID="ReqPEFMP"  SetFocusOnError="true" ControlToValidate="PEFMP"   ErrorMessage="" CssClass="error-message" runat="server" />
                <asp:RegularExpressionValidator ID="RegexPEFMP" ValidationExpression="0[8-9]|1[0-9]|2[0-9]|30|99"  SetFocusOnError="true" ControlToValidate="PEFMP" CssClass="error-message"  ErrorMessage="" runat="server"  />      
            </td>
            <td style="text-align:left; padding-left:10px;">                
                <asp:Label ID="LBLINSFMP" Text="" runat="server" />       
            </td>
        </tr>


        <tr>
                <td style="padding:10px;width:80px;">2.</td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLPEAGEMARRY" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" runat="server" ID="PEAGEMARRY" MaxLength="2"  Width="60" /><br />
                    <asp:RequiredFieldValidator ID="ReqPEAGEMARRY"  SetFocusOnError="true" ControlToValidate="PEAGEMARRY"   ErrorMessage="Required" CssClass="error-message" runat="server" />
                    <asp:RegularExpressionValidator ID="RegexPEAGEMARRY" ValidationExpression="0[5-9]|1[0-9]|2[0-9]|30|99"  SetFocusOnError="true" CssClass="error-message" ControlToValidate="PEAGEMARRY"   
                        ErrorMessage="" runat="server"  />
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSPEAGEMARRY" Text="" runat="server" />       
                </td>
        </tr>


                    <tr>
                        <td>3.</td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LBLPEFIRSTPREG" Text="" runat="server" />   
                        </td>
                        <td>
                            <asp:TextBox  AutoComplete="off" runat="server" ID="PEFIRSTPREG" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqPEFIRSTPREG"  SetFocusOnError="true" ControlToValidate="PEFIRSTPREG"   ErrorMessage="" CssClass="error-message" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExPEFIRSTPREG" ValidationExpression="0|1"  SetFocusOnError="true" ControlToValidate="PEFIRSTPREG"  CssClass="error-message" ErrorMessage="" runat="server"  />
                       
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LBLINSPEFIRSTPREG" Text="" runat="server" />       
                        </td>
                    </tr>

                        <tr>
                            <td>4.</td>
                            <td style="text-align:left; padding-left:10px;">                                
                                <asp:Label ID="LBLPEPREGN" Text="" runat="server" />   
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" runat="server" ID="PEPREGN" MaxLength="2" Width="60" /><br />                                
                                <asp:RegularExpressionValidator ID="RegexPEPREGN" ValidationExpression="0[1-9]|10|99" 
                                    SetFocusOnError="true" ControlToValidate="PEPREGN"   
                                    ErrorMessage="" runat="server"  CssClass="error-message"/><br />
                                <asp:CustomValidator ID="cvPEPREGN" runat="server" CssClass="error-message"
                                ControlToValidate="PEPREGN"  Display="Dynamic" 
                                OnServerValidate="CustVal_RequiredIfEverPreg" SetFocusOnError="true" 
                                ValidateEmptyText="true" />
                          </td>
                           <td style="text-align:left; padding-left:10px;">                                
                               <asp:Label ID="LBLINSPEPREGN" Text="" runat="server" />       
                            </td>
                        </tr>
                        <tr>
                            <td>5.</td>
                            <td style="text-align:left; padding-left:10px;">                                
                                <asp:Label ID="LBLPEOUTC" Text="" runat="server" />   
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" runat="server" ID="PEOUTC" MaxLength="1"  Width="40" /><br />                                
                                <asp:RegularExpressionValidator ID="RegExPEOUTC" CssClass="error-message" ValidationExpression="1|2|3|4|9"  SetFocusOnError="true" ControlToValidate="PEOUTC"   ErrorMessage="" runat="server"  />
                                <asp:CustomValidator ID="cvPEOUTC" runat="server" ControlToValidate="PEOUTC" 
                                CssClass="error-message" Display="Dynamic" 
                                OnServerValidate="CustVal_RequiredIfEverPreg" SetFocusOnError="true" 
                                ValidateEmptyText="true" />
                            </td>
                            <td style="text-align:left; padding-left:10px;">                                
                                <asp:Label ID="LBLINSPEOUTC" Text="" runat="server" />       
                            </td>
                        </tr>
                        <tr>
                            <td>6.</td>
                            <td style="text-align:left; padding-left:10px;">                                
                                <asp:Label ID="LBLOutNep" Text="" runat="server" />   
                            </td>
                            <td>
                                <div class="col-xs-1"> 
                                <asp:Label ID="LBLOutCDay" Text="" runat="server" />   
                                <asp:TextBox  AutoComplete="off" runat="server" ID="OutCDay" MaxLength="2" Width="60" />
                                </div>

                                <div class="col-xs-1"> 
                                <asp:Label ID="LBLOutCMon" Text="" runat="server" />
                                <asp:TextBox  AutoComplete="off" runat="server" ID="OutCMonth" MaxLength="2"  Width="60" />
                                </div> 
                                
                                <div class="col-xs-1">
                                    <asp:Label ID="LBLOutCYear" Text="" runat="server" />   
                                    <asp:TextBox  AutoComplete="off" runat="server" ID="OutCYear" MaxLength="2" Width="60" />
                                </div>  

                                <asp:RegularExpressionValidator ID="RegExOutCDay" runat="server" 
                            ControlToValidate="OutCDay" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="^(?:0[1-9]|[12]\d|3[012]|99)$" />

                         <asp:CustomValidator ID="cvPEOUTCNEPDay" runat="server" 
                            ControlToValidate="OutCDay" CssClass="error-message" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredOUTCNEPDay" SetFocusOnError="true" 
                            ValidateEmptyText="true" />

                        
                        
                       <asp:CustomValidator ID="cvPEOUTCNEPMonth" runat="server" 
                            ControlToValidate="OutCMonth" CssClass="error-message" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredOUTCNEPMonth" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                        <asp:RegularExpressionValidator ID="RegExPEOUTCNEPMonth" runat="server" 
                            ControlToValidate="OutCMonth" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="(?:0[1-9]|1[012]|99)$" />
                        
                          <asp:CustomValidator ID="cvPEOUTCNEPYear" runat="server" 
                            ControlToValidate="OutCYear" CssClass="error-message" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredOUTCNEPYear" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                        <asp:RegularExpressionValidator ID="RegExPEOUTCNEPYear" runat="server" 
                            ControlToValidate="OutCYear" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" 
                            ValidationExpression="(?:4[6-9]|[56]\d|7[0123456789]|80|81|82)$" />
               
                        <asp:CustomValidator ID="cvPEOUTCNEP" runat="server" ControlToValidate="OutCDay" OnServerValidate="CustVal_ValidateLastPregAll99orNone99" SetFocusOnError="true" Display="Dynamic"  ValidateEmptyText="true" CssClass="error-message" />


                            </td>
                            <td style="text-align:left; padding-left:10px;">
                                <asp:Label ID="LBLINSPEOUTCNEP" Text="" runat="server" />   
                            </td>
                        </tr>
                        <tr>
                            <td>7.</td>
                            <td style="text-align:left; padding-left:10px;">                                
                                <asp:Label ID="LBLPENTBLND" Text="" runat="server" />   
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" runat="server" ID="PENTBLND" MaxLength="1" Enabled="true" Width="40" /><br />                                
                                <asp:RegularExpressionValidator ID="RegExPENTBLND" CssClass="error-message" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="PENTBLND"   ErrorMessage="" runat="server"  />
                                <asp:CustomValidator ID="cvPENTBLND" runat="server" 
                            ControlToValidate="PENTBLND" CssClass="error-message" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredIfEverPreg" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                            </td>
                            <td style="text-align:left; padding-left:10px;">                                
                                <asp:Label ID="LBLINSPENTBLND" Text="" runat="server" />   
                            </td>
                        </tr>
        <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionB" runat="server"   Text="Submit" class="btn btn-primary" />
                </td>
            </tr>
        </table>
     

       <table class="table">
                <tr>
                        <td colspan="4" class="SubSectionTitle">
                           <div > Section C: Pregnancy History</div>
                        </td>
                    </tr>

          <tr>
                <td>1.</td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLPEDAU" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEDAU" runat="server" MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvPEDAU" runat="server" ControlToValidate="PEDAU" OnServerValidate="CustVal_RequiredIfEverPreg" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEDAU" ControlToValidate="PEDAU" ValidationExpression="^(?:[01][0-9]|20|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSPEDAU" Text="" runat="server" />   
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">                    
                   1a. <asp:Label ID="LBLPEDAUDIED" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEDAUDIED" runat="server" MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvPEDAUDIED" runat="server" ControlToValidate="PEDAUDIED" OnServerValidate="CustVal_RequiredIfAnyDaughtDied" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEDAUDIED" ControlToValidate="PEDAUDIED" ValidationExpression="^(?:[01][0-9]|20|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:CompareValidator runat="server" ID="cmpPEDAUDIED" ControlToValidate="PEDAUDIED" ControlToCompare="PEDAU" Type="Integer" Operator="LessThanEqual" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSPEDAUDIED" Text="" runat="server" />   
                </td>
            </tr>

            <tr>
                <td>2.</td>
                <td  style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLPESON" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PESON" runat="server" MaxLength="2" Width="60" />                
                    <asp:RegularExpressionValidator runat="server" ID="RegExPESON" ControlToValidate="PESON" ValidationExpression="^(?:[01][0-9]|20|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:CustomValidator ID="cvPESON" runat="server" ControlToValidate="PESON" OnServerValidate="CustVal_RequiredIfEverPreg" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="PESON" OnServerValidate="CustVal_ValidationPESON" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />
                    
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSPESON" Text="" runat="server" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">                    
                    2a. <asp:Label ID="LBLPESONDIED" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PESONDIED" runat="server" MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvPESONDIED" runat="server" ControlToValidate="PESONDIED" OnServerValidate="CustVal_RequiredIfAnySonsDied" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPESONDIED" ControlToValidate="PESONDIED" ValidationExpression="^(?:[01][0-9]|20|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                    <asp:CompareValidator runat="server" ID="cmpPEDSONDIED" ControlToValidate="PESONDIED" ControlToCompare="PESON" Type="Integer" Operator="LessThanEqual" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSPESONDIED" Text="" runat="server" />   
                </td>
            </tr>
            <tr>
                <td>3.</td>
                <td  style="text-align:left; padding-left:10px;" >                    
                    <asp:Label ID="LBLPESBN" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PESBN" runat="server" MaxLength="2" Width="60" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPESBN" ControlToValidate="PESBN" ValidationExpression="^(?:[01][0-9]|20|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:CustomValidator ID="cvPESBN" runat="server" ControlToValidate="PESBN" OnServerValidate="CustVal_RequiredIfEverPreg" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />                    
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="PESBN" OnServerValidate="CustVal_ValidationPESBN" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" Enabled="false" />
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSPESBN" Text="" runat="server" />   
                </td>
            </tr>

            <tr>
                <td>4.</td>
                <td  style="text-align:left; padding-left:10px;" >                    
                    <asp:Label ID="LBLPEMCN" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEMCN" runat="server" MaxLength="2" Width="60" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEMCN" ControlToValidate="PEMCN" ValidationExpression="^(?:[01][0-9]|20|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:CustomValidator ID="cvPEMCN" runat="server" ControlToValidate="PEMCN" OnServerValidate="CustVal_RequiredIfEverPreg" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />                    
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="PEMCN" OnServerValidate="CustVal_ValidationPEMCN" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSPEMCN" Text="" runat="server" />   
                </td>
            </tr>

           <tr>
                <td>5.</td>
                <td  style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLPEABORT" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEABORT" runat="server" MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="CustomValidator20" runat="server" ControlToValidate="PEABORT" OnServerValidate="CustVal_RequiredIfEverPreg" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />                    
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEABORT" ControlToValidate="PEABORT" ValidationExpression="^(?:[01][0-9]|20|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                    <asp:CustomValidator ID="CustomValidator21" runat="server" ControlToValidate="PEABORT" OnServerValidate="CustVal_ValidationPEABORT" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSPEABORT" Text="" runat="server" />   
                </td>
            </tr>

            <tr>
                <td>6.</td>
                <td  style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLPETWIN" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PETWIN" runat="server" MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvPETWIN" runat="server" ControlToValidate="PETWIN" OnServerValidate="CustVal_RequiredIfEverPreg" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />                    
                    <asp:RegularExpressionValidator runat="server" ID="RegExPETWIN" ControlToValidate="PETWIN" ValidationExpression="^(?:[01][0-9]|20|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSPETWIN" Text="" runat="server" />   
                </td>
            </tr>
            <tr>
                <td>7.</td>
                <td  style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLPETRIP" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PETRIP" runat="server" MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvPETRIP" runat="server" ControlToValidate="PETRIP" OnServerValidate="CustVal_RequiredIfEverPreg" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />
                    <asp:CustomValidator ID="CustomValidator18" runat="server" ControlToValidate="PETRIP" OnServerValidate="CustVal_RequiredPETRIP" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPETRIP" ControlToValidate="PETRIP" ValidationExpression="^(?:[01][0-9]|20|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLINSPETRIP" Text="" runat="server" />   

                </td>
            </tr>        
        <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionC" runat="server"   Text="Submit" class="btn btn-primary" />
                </td>
            </tr>
        </table>
    

       <table class="table">
         <tr>
            <th colspan="4" class="SubSectionTitle">
               <div > Section D: Information about Current Pregnancy</div>
            </th>
        </tr>
           <tr>
                    <td>
                        1.</td>
                    <td   style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLPEMONPREG" Text="" runat="server" />   
                    </td>
                    <td>
                        <asp:TextBox  AutoComplete="off" ID="PEMONPREG" runat="server" MaxLength="2" Width="60" />
                        <asp:RequiredFieldValidator ID="ReqPEMONPREG" runat="server" 
                            ControlToValidate="PEMONPREG" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" />

                        <asp:RegularExpressionValidator ID="RegExPEMONPREG" runat="server" 
                            ControlToValidate="PEMONPREG" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" 
                            ValidationExpression="(?:0[1-9]|10|99)$" />
                    </td>
                    <td style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLINSPEMONPREG" Text="" runat="server" />   
                    </td>
                </tr>

            <tr>
                    <td>
                        2.</td>
                    <td   style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLPELMPNEP" Text="" runat="server" />   
                        <br /><asp:CustomValidator ID="cvPELMPNEP" runat="server" ControlToValidate="PELMPNEPDay" OnServerValidate="CustVal_ValidateMenstrualDateAll99orNone99" SetFocusOnError="true" Display="Dynamic"  ValidateEmptyText="true" CssClass="error-message" />
                        <br /><asp:CustomValidator ID="cvLMPvsFormDate" runat="server" ControlToValidate="PELMPNEPDay" OnServerValidate="CustVal_LMPDateValidation" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message" />
                    </td>
                    <td style="width:80px;" >                        
                        <div class="col-xs-1"> 
                            <asp:Label ID="LBLPELMPNEPDay" Text="" runat="server" /> 
                            <asp:TextBox  AutoComplete="off" ID="PELMPNEPDay" runat="server" MaxLength="2" Width="60" />
                        </div>

                        <div class="col-xs-1"> 
                            <asp:Label ID="LBLPELMPNEPMon" Text="" runat="server" />   
                            <asp:TextBox  AutoComplete="off" ID="PELMPNEPMonth" runat="server" MaxLength="2" Width="60" />
                        </div>

                        <div class="col-xs-1"> 
                            <asp:Label ID="LBLPELMPNEPYear" Text="" runat="server" />   
                            <asp:TextBox  AutoComplete="off" ID="PELMPNEPYear" runat="server" 
                            MaxLength="2" Width="60" />
      
                        </div>

                        <asp:RequiredFieldValidator ID="ReqPELMPNEPDay" runat="server" 
                            ControlToValidate="PELMPNEPDay" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" />
                        <asp:RegularExpressionValidator ID="RegExPELMPNEPDay" runat="server" 
                            ControlToValidate="PELMPNEPDay" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="^(?:0[1-9]|[12]\d|3[012]|99)$" />
                        <asp:RequiredFieldValidator ID="ReqPELMPNEPMonth" runat="server" 
                            ControlToValidate="PELMPNEPMonth" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" />
                        <asp:RegularExpressionValidator ID="RegExPELMPNEPMonth" runat="server" 
                            ControlToValidate="PELMPNEPMonth" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="^(?:0[1-9]|1[012]|99)$" />
                        <asp:RequiredFieldValidator ID="ReqPELMPNEPYear" runat="server" 
                            ControlToValidate="PELMPNEPYear" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" />
                        <asp:RegularExpressionValidator ID="RegExPELMPNEPYear" runat="server" 
                            ControlToValidate="PELMPNEPYear" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="79|80|81" />
                        
                    </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLINSLMP" runat="server" Text="" />
                </td>
                </tr>

            <tr>
                    <td>
                        3.</td>
                    <td  style="text-align:left; padding-left:10px;" >                        
                        <asp:Label ID="LBLPETT" Text="" runat="server" />   
                    </td>
                    <td>
                        <asp:TextBox  AutoComplete="off" ID="PETT" runat="server" Width="40" MaxLength="1" />
                        <asp:RequiredFieldValidator ID="ReqPETT" runat="server" 
                            ControlToValidate="PETT" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" />
                        <asp:RegularExpressionValidator ID="RegExPETT" runat="server" 
                            ControlToValidate="PETT" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" 
                            ValidationExpression="^[0-79]$" />
                    </td>
                    <td style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLINSPETT" Text="" runat="server" />   
                    </td>
                </tr>

                    <tr>
                    <td>
                        4.</td>
                    <td   style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLPEDELLOC" Text="" runat="server" />   
                    </td>
                    <td>
                        <asp:TextBox  AutoComplete="off" ID="PEDELLOC" runat="server" Width="40" MaxLength="1" />
                        <asp:RequiredFieldValidator ID="ReqPEDELLOC" runat="server" 
                            ControlToValidate="PEDELLOC" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" />
                        <asp:RegularExpressionValidator ID="RegExPEDELLOC" runat="server" 
                            ControlToValidate="PEDELLOC" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" 
                            ValidationExpression="^[1-79]$" />
                    </td>
                    <td style="text-align:left; padding-left:10px;">                       
                        <asp:Label ID="LBLINSPEDELLOC" Text="" runat="server" />   
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="3" style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLPEDELLOCSP" Text="" runat="server" />   
                        &nbsp;&nbsp;&nbsp;
                        <asp:TextBox  AutoComplete="off" ID="PEDELLOCSP" runat="server" CssClass="specify" 
                            MaxLength="50" Width="410" />
                        <asp:CustomValidator ID="cvPEDELLOCSP" runat="server" 
                            ControlToValidate="PEDELLOCSP" CssClass="error-message" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredIfDelLocOther" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                    </td>
                </tr>

                    <tr>
                    <td>
                        5.</td>
                    <td   style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLPETREAT" Text="" runat="server" />   
                    </td>
                    <td>
                        <asp:TextBox  AutoComplete="off" ID="PETREAT" runat="server" Width="40" MaxLength="1" />
                        <asp:RequiredFieldValidator ID="ReqPETREAT" runat="server" 
                            ControlToValidate="PETREAT" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" />
                        <asp:RegularExpressionValidator ID="RegExPETREAT" runat="server" 
                            ControlToValidate="PETREAT" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" 
                            ValidationExpression="^[019]$" />
                    </td>
                    <td style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLINSPETREAT" Text="" runat="server" />   
                    </td>
                </tr>
                <tr>
                    <td >
                    </td>
                    <td   style="text-align:left; padding-left:10px;">                        
                       5a. <asp:Label ID="LBLPETREATA" Text="" runat="server" />   
                    </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLTREATQA" Text="" runat="server" />   
                        <asp:TextBox  AutoComplete="off" ID="PETREATA" runat="server" Width="40" MaxLength="1" />
                        <asp:CustomValidator ID="CustomValidator0" runat="server" ControlToValidate="PETREATA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                        <asp:CustomValidator ID="cvPETREATA" runat="server" 
                            ControlToValidate="PETREATA" CssClass="error-message" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValidationA" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                        <asp:RegularExpressionValidator ID="RegExPETREATA" runat="server" 
                            ControlToValidate="PETREATA" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" 
                            ValidationExpression="^[1-69]$" />

                        <br />
                        <asp:Label ID="LBLTREATQB" Text="" runat="server" />   
                        <asp:TextBox  AutoComplete="off" ID="PETREATB" runat="server" Width="40" MaxLength="1" />                        
                        <asp:CustomValidator ID="cvPETREATB" runat="server" 
                            ControlToValidate="PETREATB" CssClass="error-message" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValidation" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                        <asp:RegularExpressionValidator ID="RegExPETREATB" runat="server" 
                            ControlToValidate="PETREATB" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" 
                            ValidationExpression="^[1-69]$" />


                        <br />
                        <asp:Label ID="LBLTREATQC" Text="" runat="server" />   
                        <asp:TextBox  AutoComplete="off" ID="PETREATC" runat="server" Width="40" MaxLength="1" />                                            
                        <asp:CustomValidator ID="cvPETREATC" runat="server" 
                            ControlToValidate="PETREATC" CssClass="error-message" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValidation" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                        <asp:RegularExpressionValidator ID="RegExPETREATC" runat="server" 
                            ControlToValidate="PETREATC" CssClass="error-message" Display="Dynamic" 
                            ErrorMessage="" SetFocusOnError="true" 
                            ValidationExpression="^[1-69]$" />
                    </td>
                    <td style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLINSTREAT" Text="" runat="server" />   
                    </td>
                </tr>    
           <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionD" runat="server"   Text="Submit" class="btn btn-primary" />
                </td>
            </tr>
        
        </table>
    


       <table class="table">
         <tr>
            <th colspan="4" class="SubSectionTitle">
               <div > Section E: Health and Care Seeking</div>
            </th>
        </tr>

           <tr>
               <td colspan="4" class ="SubSectionTitle2"></td>
           </tr>

                <tr>
                <th class ="SubSectionTitle2" colspan="2" style="text-align:left; padding-left:10px;">                    
                    <b><asp:Label ID="LBLSECDQUE" Text="" runat="server" />   </b>
                </th>
                <th class ="SubSectionTitle2"><b><asp:Label ID="LBLSECDDAY" Text="" runat="server" />   
                    </b></th>
                <th class ="SubSectionTitle2">
                    <b><asp:Label ID="LBLSECDTRT" Text="" runat="server" />
                    </b></th>
            </tr>

            <tr>
                <td>1.</td>
                <td  style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPECGH" Text="" runat="server" />   
                </td>
                <td>     
                    <asp:TextBox  AutoComplete="off" ID="PECGH" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPECGH" runat="server" ControlToValidate="PECGH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPECGH" ControlToValidate="PECGH" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PECGHTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPECGHTRT" runat="server" ControlToValidate="PECGHTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPECGHTRT" ControlToValidate="PECGHTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>

       <tr>
                <td>2.</td>
                <td  style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPESHBRTH" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PESHBRTH" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPESHBRTH" runat="server" ControlToValidate="PESHBRTH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPESHBRTH" ControlToValidate="PESHBRTH" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PESHBRTHTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPESHBRTHTRT" runat="server" ControlToValidate="PESHBRTHTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPESHBRTHTRT" ControlToValidate="PESHBRTHTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>

        <tr>
                <td>3.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPEPAPP" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEPAPP" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPEPAPP" runat="server" ControlToValidate="PEPAPP" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEPAPP" ControlToValidate="PEPAPP" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEPAPPTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPEPAPPTRT" runat="server" ControlToValidate="PEPAPPTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEPAPPTRT" ControlToValidate="PEPAPPTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
                     <tr>
                <td>4.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPENAUS" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PENAUS" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPENAUS" runat="server" ControlToValidate="PENAUS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPENAUS" ControlToValidate="PENAUS" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PENAUSTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPENAUSTRT" runat="server" ControlToValidate="PENAUSTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPENAUSTRT" ControlToValidate="PENAUSTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
            <tr>
                <td>5.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPEVOM" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEVOM" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPEVOM" runat="server" ControlToValidate="PEVOM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEVOM" ControlToValidate="PEVOM" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEVOMTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPEVOMTRT" runat="server" ControlToValidate="PEVOMTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEVOMTRT" ControlToValidate="PEVOMTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
            <tr>
                <td>6.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPECONV" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PECONV" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPECONV" runat="server" ControlToValidate="PECONV" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPECONV" ControlToValidate="PECONV" ValidationExpression="(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PECONVTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPECONVTRT" runat="server" ControlToValidate="PECONVTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPECONVTRT" ControlToValidate="PECONVTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
            <tr>
                <td>7.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPESWHND" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PESWHND" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPESWHND" runat="server" ControlToValidate="PESWHND" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPESWHND" ControlToValidate="PESWHND" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PESWHNDTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPESWHNDTRT" runat="server" ControlToValidate="PESWHNDTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPESWHNDTRT" ControlToValidate="PESWHNDTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
            <tr>
                <td>8.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPESWFCE" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PESWFCE" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPESWFCE" runat="server" ControlToValidate="PESWFCE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPESWFCE" ControlToValidate="PESWFCE" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PESWFCETRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPESWFCETRT" runat="server" ControlToValidate="PESWFCETRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPESWFCETRT" ControlToValidate="PESWFCETRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
            <tr>
                <td>9.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPEHEAD" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEHEAD" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPEHEAD" runat="server" ControlToValidate="PEHEAD" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHEAD" ControlToValidate="PEHEAD" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEHEADTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPEHEADTRT" runat="server" ControlToValidate="PEHEADTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHEADTRT" ControlToValidate="PEHEADTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>

                    <tr>
                <td>10.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPEFVR" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEFVR" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPEFVR" runat="server" ControlToValidate="PEFVR" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEFVR" ControlToValidate="PEFVR" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEFVRTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPEFVRTRT" runat="server" ControlToValidate="PEFVRTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEFVRTRT" ControlToValidate="PEFVRTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
            <tr>
                <td>11.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPEDIAR" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEDIAR" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPEDIAR" runat="server" ControlToValidate="PEDIAR" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEDIAR" ControlToValidate="PEDIAR" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEDIARTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPEDIARTRT" runat="server" ControlToValidate="PEDIARTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEDIARTRT" ControlToValidate="PEDIARTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
                    <tr>
                <td>12.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPEURIN" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEURIN" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPEURIN" runat="server" ControlToValidate="PEURIN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEURIN" ControlToValidate="PEURIN" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEURINTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPEURINTRT" runat="server" ControlToValidate="PEURINTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEURINTRT" ControlToValidate="PEURINTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
            <tr>
                <td>13.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPEVAGDIS" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEVAGDIS" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPEVAGDIS" runat="server" ControlToValidate="PEVAGDIS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEVAGDIS" ControlToValidate="PEVAGDIS" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEVAGDISTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPEVAGDISTRT" runat="server" ControlToValidate="PEVAGDISTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEVAGDISTRT" ControlToValidate="PEVAGDISTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
                    <tr>
                <td>14.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPEVAGBLD" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEVAGBLD" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPEVAGBLD" runat="server" ControlToValidate="PEVAGBLD" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEVAGBLD" ControlToValidate="PEVAGBLD" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEVAGBLDTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPEVAGBLDTRT" runat="server" ControlToValidate="PEVAGBLDTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEVAGBLDTRT" ControlToValidate="PEVAGBLDTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
            <tr>
                <td>15.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPEXN" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PENBLND" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPEXN" runat="server" ControlToValidate="PENBLND" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEXN" ControlToValidate="PENBLND" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic"  CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PENBLNDTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPENBLNDTRT" runat="server" ControlToValidate="PENBLNDTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEXNTRT" ControlToValidate="PENBLNDTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
                    <tr>
                <td>16.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPERFETMV" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEBABYMV" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPERFETMV" runat="server" ControlToValidate="PEBABYMV" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPERFETMV" ControlToValidate="PEBABYMV" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEBABYMVTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPEBABYMVTRT" runat="server" ControlToValidate="PEBABYMVTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPERFETMVTRT" ControlToValidate="PEBABYMVTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
            <tr>
                <td>17.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPELABD" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PELABD" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPELABD" runat="server" ControlToValidate="PELABD" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPELABD" ControlToValidate="PELABD" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PELABDTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPELABDTRT" runat="server" ControlToValidate="PELABDTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPELABDTRT" ControlToValidate="PELABDTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
            <tr>
                <td>18.</td>
                <td   style="text-align:left; padding-left:10px;">
                    
                    <asp:Label ID="LBLPEBLUR" Text="" runat="server" />   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEBLUR" runat="server" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator ID="ReqPEBLUR" runat="server" ControlToValidate="PEBLUR" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEBLUR" ControlToValidate="PEBLUR" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEBLURTRT" runat="server" Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvPEBLURTRT" runat="server" ControlToValidate="PEBLURTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEBLURTRT" ControlToValidate="PEBLURTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
           
           <tr>
               <th colspan="4">
                   <asp:Label ID="LBLINSPETITLE" Text="" runat="server" />   
               </th>
           </tr>

           <tr>
               <td colspan="2" style="text-align:left;padding-left:40px;">
                   <asp:Label ID="LBLINSPEBLUR1" Text="" runat="server" />   
               </td>
               <td colspan="2" style="text-align:left;padding-left:40px;">
                   <asp:Label ID="LBLINSPEBLUR2" Text="" runat="server" />   
               </td>
           </tr>
        <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionE" runat="server"  Text="Submit" class="btn btn-primary" />
                </td>
            </tr>
        </table>



      <table class="table">
         <tr>
            <th colspan="4" class="SubSectionTitle">
               <div > Section F. Tobacco, Alcohol Use</div>
            </th>
        </tr>
                <tr>
                <th colspan="4" style="vertical-align:top;" class="SubSectionTitle2">                    
                    
                    <table class="table">
                        <tr>
                            <th style="text-align:left;padding-left:40px;" class="SubSectionTitle2"><b><asp:Label ID="LBLSECEQUE" Text="" runat="server" /> </b>  </th>
                            <th style="text-align:left;padding-left:10px;" class="SubSectionTitle2"><b><asp:Label ID="LBLSECEYN" Text="" runat="server" /></b></th>
                            <th style="text-align:left;padding-left:10px;" class="SubSectionTitle2"><b><asp:Label ID="LBLSECEDAY" Text="" runat="server" /> </b>  </th>
                            <th style="text-align:left;padding-left:10px;" class="SubSectionTitle2"><b><asp:Label ID="LBLSECETMS" Text="" runat="server" /></b></th>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                                <asp:Label ID="LBLPEBIDI" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PEBIDI" runat="server" Width="40" MaxLength="1" />
                                <asp:RequiredFieldValidator ID="ReqPEBIDI" runat="server" ControlToValidate="PEBIDI" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/> 
                                <asp:RegularExpressionValidator runat="server" ID="RegExPEBIDI" ControlToValidate="PEBIDI" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PEBIDID" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="cvPEBIDID" runat="server" ControlToValidate="PEBIDID" OnServerValidate="CustVal_RequiredIfYesBidi" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExPEBIDID" ControlToValidate="PEBIDID" ValidationExpression="^(?:0[1-9]|[1-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PEBIDIN" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="cvPEBIDIN" runat="server" ControlToValidate="PEBIDIN" OnServerValidate="CustVal_RequiredIfYesBidi" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExPEBIDIN" ControlToValidate="PEBIDIN" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;"><asp:Label ID="LBLPETOB" Text="" runat="server" />   </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PETOB" runat="server" Width="40" MaxLength="1" /> 
                                <asp:RequiredFieldValidator ID="ReqPETOB" runat="server" ControlToValidate="PETOB" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>      
                                <asp:RegularExpressionValidator runat="server" ID="RegExPETOB" ControlToValidate="PETOB" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PETOBD" runat="server" MaxLength="2" Width="60" />                                       
                                <asp:CustomValidator ID="cvPETOBD" runat="server" ControlToValidate="PETOBD" OnServerValidate="CustVal_RequiredIfYesChwTob" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExPETOBD" ControlToValidate="PETOBD" ValidationExpression="^(?:0[1-9]|[1-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                                </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PETOBN" runat="server" MaxLength="2" Width="60" />                                
                                <asp:CustomValidator ID="cvPETOBN" runat="server" ControlToValidate="PETOBN" OnServerValidate="CustVal_RequiredIfYesChwTob" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExPETOBN" ControlToValidate="PETOBN" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;"><asp:Label ID="LBLPEJAARD" Text="" runat="server" />   </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PEJAARD" runat="server" Width="40" MaxLength="1" />                  
                                <asp:RequiredFieldValidator ID="ReqPEJAARD" runat="server" ControlToValidate="PEJAARD" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExPEJAARD" ControlToValidate="PEJAARD" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PEJAARDD" runat="server" MaxLength="2" Width="60" />         
                                <asp:CustomValidator ID="cvPEJAARDD" runat="server" ControlToValidate="PEJAARDD" OnServerValidate="CustVal_RequiredIfYesJaard" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExPEJAARDD" ControlToValidate="PEJAARDD" ValidationExpression="^(?:0[1-9]|[1-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PEJAARDN" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="cvPEJAARDN" runat="server" ControlToValidate="PEJAARDN" OnServerValidate="CustVal_RequiredIfYesJaard" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExPEJAARDN" ControlToValidate="PEJAARDN" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;"><asp:Label ID="LBLPERAKSHI" Text="" runat="server" />   </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PERAKSHI" runat="server" Width="40" MaxLength="1" />                     
                                <asp:RequiredFieldValidator ID="ReqPERAKSHI" runat="server" ControlToValidate="PERAKSHI" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExPERAKSHI" ControlToValidate="PERAKSHI" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PERAKSHID" runat="server" MaxLength="2" Width="60" />                    
                                <asp:CustomValidator ID="cvPERAKSHID" runat="server" ControlToValidate="PERAKSHID" OnServerValidate="CustVal_RequiredIfYesRakshi" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExPERAKSHID" ControlToValidate="PERAKSHID" ValidationExpression="^(?:0[1-9]|[1-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                             </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PERAKSHIN" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="cvPERAKSHIN" runat="server" ControlToValidate="PERAKSHIN" OnServerValidate="CustVal_RequiredIfYesRakshi" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegEXPERAKSHIN" ControlToValidate="PERAKSHIN" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                                2. <asp:Label ID="LBLPESMKFMLY" Text="" runat="server" />   </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="PESMKFMLY" runat="server" Width="40" MaxLength="1" />                     
                                <asp:RequiredFieldValidator ID="ReqPESMKFMLY" runat="server" ControlToValidate="PESMKFMLY" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExPESMKFMLY" ControlToValidate="PESMKFMLY" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                            </td>
                            <td>
                                
                             </td>
                            <td>
                                
                            </td>
                        </tr>
                    </table>
                </th>
            </tr>
          <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionF" runat="server"   Text="Submit" class="btn btn-primary" />
                </td>
            </tr>
        </table>
    


      <table class="table">
         <tr>
            <td colspan="4" class="SubSectionTitle">
               <div >Section G: Maternal Diet</div>
            </td>
        </tr>

        <tr>
            <td colspan="4" style="background:#efefef; padding:10px 10px 10px 10px; text-align:left;">               
                 <asp:Label ID="LBLSECGTITLE" runat="server" />
            </td>
        </tr>

        <tr>
            <td colspan="4">
               <table class="table">
                   <tr>
                       <td> 
                            1.
                       </td>
                       <td style="text-align:left;padding-left:40px;">                           
                          <asp:Label ID="LBLSECG" runat="server" />
                       </td>
                       <td style="text-align:left;padding-left:40px;"> 
                           <asp:Label ID="LNSECG" runat="server" />
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            a.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEGRAIN" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEGRAIN" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEGRAIN" runat="server" ControlToValidate="PEGRAIN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEGRAIN" ControlToValidate="PEGRAIN" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            b.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEBEANS" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEBEANS" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEBEANS" runat="server" ControlToValidate="PEBEANS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEBEANS" ControlToValidate="PEBEANS" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>
                   
                   <tr>
                       <td> 
                            c.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPELEAFVEG" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PELEAFVEG" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPELEAFVEG" runat="server" ControlToValidate="PELEAFVEG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPELEAFVEG" ControlToValidate="PELEAFVEG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            d.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEVITVEG" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEVITVEG" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEVITVEG" runat="server" ControlToValidate="PEVITVEG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEVITVEG" ControlToValidate="PEVITVEG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            e.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEOTHRVEG" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEOTHRVEG" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEOTHRVEG" runat="server" ControlToValidate="PEOTHRVEG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEOTHRVEG" ControlToValidate="PEOTHRVEG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   
                   <tr>
                       <td> 
                            f.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPETUBER" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PETUBER" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPETUBER" runat="server" ControlToValidate="PETUBER" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPETUBER" ControlToValidate="PETUBER" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            g.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEMEAT" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEMEAT" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEMEAT" runat="server" ControlToValidate="PEMEAT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEMEAT" ControlToValidate="PEMEAT" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>
                   
                   <tr>
                       <td> 
                            h.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEMEATORGN" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEMEATORGN" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEMEATORGN" runat="server" ControlToValidate="PEMEATORGN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEMEATORGN" ControlToValidate="PEMEATORGN" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                    <tr>
                       <td> 
                            i.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEFISH" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEFISH" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEFISH" runat="server" ControlToValidate="PEFISH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEFISH" ControlToValidate="PEFISH" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            j.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEPROTEIN" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEPROTEIN" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEPROTEIN" runat="server" ControlToValidate="PEPROTEIN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEPROTEIN" ControlToValidate="PEPROTEIN" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>
                  
                   
                   <tr>
                       <td> 
                            k.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEEGG" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEEGG" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEEGG" runat="server" ControlToValidate="PEEGG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEEGG" ControlToValidate="PEEGG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            l.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEOILY" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEOILY" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEOILY" runat="server" ControlToValidate="PEOILY" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEOILY" ControlToValidate="PEOILY" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            m.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPECONDMT" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PECONDMT" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPECONDMT" runat="server" ControlToValidate="PECONDMT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPECONDMT" ControlToValidate="PECONDMT" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>
                   
                   
                   <tr>
                       <td> 
                            n.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEVITFRUIT" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEVITFRUIT" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEVITFRUIT" runat="server" ControlToValidate="PEVITFRUIT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEVITFRUIT" ControlToValidate="PEVITFRUIT" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>
                   
                   
                   <tr>
                       <td> 
                            o.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEOTHRFRUIT" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEOTHRFRUIT" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEOTHRFRUIT" runat="server" ControlToValidate="PEOTHRFRUIT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEOTHRFRUIT" ControlToValidate="PEOTHRFRUIT" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>
                   
                   <tr>
                       <td> 
                            p.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPESAVORY" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PESAVORY" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPESAVORY" runat="server" ControlToValidate="PESAVORY" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPESAVORY" ControlToValidate="PESAVORY" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>
                   

                   <tr>
                       <td> 
                            q.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPENUTS" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PENUTS" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPENUTS" runat="server" ControlToValidate="PENUTS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPENUTS" ControlToValidate="PENUTS" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   
                   <tr>
                       <td> 
                            r.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEMILK" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEMILK" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEMILK" runat="server" ControlToValidate="PEMILK" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEMILK" ControlToValidate="PEMILK" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            s.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPETEACOFF" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PETEACOFF" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPETEACOFF" runat="server" ControlToValidate="PETEACOFF" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPETEACOFF" ControlToValidate="PETEACOFF" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>


                   <tr>
                       <td> 
                            t.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           i. &nbsp; <asp:Label ID="LBLPESUGAR" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PESUGAR" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPESUGAR" runat="server" ControlToValidate="PESUGAR" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPESUGAR" ControlToValidate="PESUGAR" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                          ii. &nbsp; <asp:Label ID="LBLPECHOCO" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PECHOCO" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPECHOCO" runat="server" ControlToValidate="PECHOCO" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPECHOCO" ControlToValidate="PECHOCO" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

                   
                   <tr>
                       <td> 
                            u.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPESWTBEVRG" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PESWTBEVRG" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPESWTBEVRG" runat="server" ControlToValidate="PESWTBEVRG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPESWTBEVRG" ControlToValidate="PESWTBEVRG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>
                                      


                   <tr>
                       <td> 
                            v.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEOTHRBEVRG" runat="server" />
                           &nbsp;&nbsp;&nbsp;
                           <asp:TextBox  AutoComplete="off" ID="PEOTHRBEVRGSP" runat="server" Width="410" MaxLength="150" />                     
                           <asp:CustomValidator runat="server" ID="cvPEOTHRBEVRGSP" ControlToValidate="PEOTHRBEVRGSP" OnServerValidate="Validate_RequiredPEOTHRBEVRGSP" ValidateEmptyText="true" CssClass="error-message" />
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="PEOTHRBEVRG" runat="server" Width="40" MaxLength="1" />                     
                           <asp:RequiredFieldValidator ID="ReqPEOTHRBEVRG" runat="server" ControlToValidate="PEOTHRBEVRG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                           <asp:RegularExpressionValidator runat="server" ID="RegExPEOTHRBEVRG" ControlToValidate="PEOTHRBEVRG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                       </td>
                   </tr>

               </table>
            </td>
        </tr>
          <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionG" runat="server"  Text="Submit" class="btn btn-primary" />
                </td>
            </tr>
        </table>


      <table class="table">
        <tr>
            <td colspan="4" class="SubSectionTitle">
               <div >Section H. Literacy, Education, and Occupation</div>
            </td>
        </tr>


			<tr>
                <td  style="text-align:left; padding-left:40px;">
                    <asp:Label ID="LBLWOM" runat="server" />
                    </td>
                <td>
					<asp:Label ID="LBLPEWOMLIT" runat="server" />
                    <br />
                    <asp:TextBox  AutoComplete="off" ID="PEWOMLIT" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqPEWOMLIT" runat="server" ControlToValidate="PEWOMLIT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEWOMLIT" ControlToValidate="PEWOMLIT" ValidationExpression="^[0169]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                </td>
                <td>
                    <asp:Label ID="LBLPEWOMEDU" runat="server" />
                    <br />
					<asp:TextBox  AutoComplete="off" ID="PEWOMEDU" runat="server"  Width="50" MaxLength="2" />
                    <asp:RequiredFieldValidator ID="ReqPEWOMEDU" runat="server" ControlToValidate="PEWOMEDU" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEWOMEDU" ControlToValidate="PEWOMEDU" ValidationExpression="^(?:[01]\d|20|66|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                </td>
				<td>
					<asp:Label ID="LBLPEWOMOCC" runat="server" />
                    <br />
					<asp:TextBox  AutoComplete="off" ID="PEWOMOCC" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqPEWOMOCC" runat="server" ControlToValidate="PEWOMOCC" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEWOMOCC" ControlToValidate="PEWOMOCC" ValidationExpression="^[0-79]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
				</td>
                </tr>

        <tr>
                <td  style="text-align:left; padding-left:40px;">
                    <asp:Label ID="LBLHUSB" runat="server" />
                    </td>
                <td>
					
                    <asp:TextBox  AutoComplete="off" ID="PEHUSBLIT" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqPEHUSBLIT" runat="server" ControlToValidate="PEHUSBLIT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHUSBLIT" ControlToValidate="PEHUSBLIT" ValidationExpression="^[0169]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                </td>
                <td>
                    
					<asp:TextBox  AutoComplete="off" ID="PEHUSBEDU" runat="server"  Width="50" MaxLength="2" />
                    <asp:RequiredFieldValidator ID="ReqPEHUSBEDU" runat="server" ControlToValidate="PEHUSBEDU" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHUSBEDU" ControlToValidate="PEHUSBEDU" ValidationExpression="^(?:[01]\d|20|66|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                </td>
				<td>
					
					<asp:TextBox  AutoComplete="off" ID="PEHUSBOCC" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqPEHUSBOCC" runat="server" ControlToValidate="PEHUSBOCC" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEHUSBOCC" ControlToValidate="PEHUSBOCC" ValidationExpression="^[0-79]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
				</td>
                </tr>

        <tr>
            <td></td>
            <td   style="text-align:left; vertical-align:top; padding-left:10px;">                
                <asp:Label ID="LBLLIT" runat="server" Text="" />
                </td>
            <td   style="text-align:left;  vertical-align:top;padding-left:10px;">
                
                <asp:Label ID="LBLEDU" runat="server" Text="" />
            </td>
            <td   style="text-align:left; vertical-align:top; padding-left:10px;">
                
                <asp:Label ID="LBLOCCUP" runat="server" Text="" />
            </td>
        </tr>
          <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionH" runat="server"  Text="Submit" class="btn btn-primary" />
                </td>
            </tr>
        </table>

      





      <table class="table">
         <tr>
            <td colspan="4" class="SubSectionTitle">
               <div >Section I: Common Enrollment Interventions</div>
            </td>
        </tr>

		<tr>
            <td colspan="4"  style="text-align:left; padding-left:10px;">               
                <b><asp:Label ID="LBLSECH" runat="server" Text="" /></b>
            </td>
        </tr>
		
		<tr>
                <th class="SubSectionTitle2"><b>#</b></th>
                <th colspan="2" class="SubSectionTitle2"><b>Intervention</b></th>
                <td class="SubSectionTitle2">                      
                    <b><asp:Label ID="LBLINSPEINSTR" runat="server" Text="" /></b>
                </td>
            </tr>
			
            <tr>
                <td>1.</td>
                <td  colspan="2" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEINSTR" runat="server" Text="" /></td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEINSTR" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqPEINSTR" runat="server" ControlToValidate="PEINSTR" ErrorMessage="Field Required" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEINSTR" ControlToValidate="PEINSTR" ValidationExpression="^[016]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>                
            </tr>

            <tr>
                <td>2.</td>
                <td  colspan="2" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEADVICE" runat="server" Text="" /></td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="PEADVICE" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqPEADVICE" runat="server" ControlToValidate="PEADVICE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPEADVICE" ControlToValidate="PEADVICE" ValidationExpression="^[016]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                </td>
            </tr>
          <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionI" runat="server"  Text="Submt" CssClass="btn btn-primary" class="btn btn-primary" />
                </td>
            </tr>
        </table>
      
     
       <table>
         <tr>
            <td colspan="4" class="SubSectionTitle">
               <div >Section J. Anthropometry/Measures Part 2</div>
            </td>
        </tr>

        
        <tr>
                    <td style="text-align:left; padding-left:20px;">
                        4.
                        </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLPEBLD2" runat="server" />
                        </td>
                    <td>
                        <asp:TextBox  AutoComplete="off" ID="PESYS2" runat="server" Width="70" MaxLength="3" />
                        /                        
                        <asp:TextBox  AutoComplete="off" ID="PEDIA2" runat="server" Width="70" MaxLength="3" onkeyup="RefreshUpdatePanel2();" AutoPostBack="true" />
                        <asp:Label ID="LBPEBLDUNT2" runat="server" />
                        <asp:CustomValidator ID="CustomValidator6" runat="server"  OnServerValidate="CustVal_PESYS2DIA" SetFocusOnError="true" Display="Dynamic"  CssClass="error-message" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">                        
                        <asp:RegularExpressionValidator  ID="RegExPESYS2" runat="server" ControlToValidate="PESYS2" ValidationExpression="^(?:0[5-9]\d|1\d{2}|200|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>                        
                        <asp:RegularExpressionValidator runat="server" ID="RegExPEDIA2" ControlToValidate="PEDIA2" ValidationExpression="^(?:0(?:3[5-9]|[4-9]\d)|1(?:[0-3]\d|40)|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message"/>
                        <asp:CustomValidator ID="CustomValidator16" runat="server"  OnServerValidate="CustVal_Validate2SYSDIA" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="error-message"/>
                        <asp:Label ID="LNPRES2" runat="server" />
                    </td>                   
                </tr>

        <tr>
            <td> </td>
              <td style="text-align:left; padding-left:10px;">
                  4a. <asp:Label ID="LBTOB2" Text="" runat="server" />
                 
               </td>
            
               <td>
                   <%--<asp:UpdatePanel ID="UpdatePanel3" runat="server">--%>
                    <ContentTemplate>
                   <asp:Label ID="LBPETOB2HH" Text="" runat="server" /> 
                   <asp:TextBox  AutoComplete="off" ID="PETOB2HH" runat="server"  MaxLength="2" Width="60"  />                                      
                   <asp:RegularExpressionValidator ID="RegExPETOB2HH" runat="server" ControlToValidate="PETOB2HH" ValidationExpression="^(?:0[1-9]|1[012])$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />

                   <asp:Label ID="LBPETOB2MM" Text="" runat="server" /> 
                   <asp:TextBox  AutoComplete="off" ID="PETOB2MM" runat="server"  MaxLength="2" Width="60"  />
                   <asp:RegularExpressionValidator ID="RegExPETOB2MM" runat="server" ControlToValidate="PETOB2MM" ValidationExpression="^[0-5]\d$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message" />
                   
                   <asp:Label ID="LBPETOB2AMPM" Text="" runat="server" /> 
                   
                   <asp:DropDownList ID="PETOB2AMPM" runat="server"  Width="70"  />
                   <asp:RequiredFieldValidator Enabled="false" ID="ReqPETOB2AMPM"  SetFocusOnError="true" ControlToValidate="PETOB2AMPM"   ErrorMessage="" runat="server" CssClass="error-message" InitialValue="X" />

                   <asp:CustomValidator ID="CustomValidator5" runat="server"  OnServerValidate="CustVal_PETOB2AMPM" SetFocusOnError="true" Display="Dynamic"   CssClass="error-message" />
                        </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="PEDIA2" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>

              </td>      
            <td  style="text-align:left; padding-left:10px;"><asp:Label ID="LNTOB2" Text="" runat="server" /> </td>
           </tr>


           <tr>
               <th colspan="4" style="background:#efefef; padding:10px 10px 10px 10px; text-align:left;">
                   <asp:Label ID="LBLINSTPROTEIN" runat="server" />
               </th>
           </tr>

        <tr>
                    <td style="text-align:left; padding-left:20px;">
                        5.
                   </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLPEPRTN" runat="server" />
                    </td>

                    <td> 

                   <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
                    <ContentTemplate>
                        <asp:TextBox  AutoComplete="off" ID="PEPRTN" runat="server" Width="40" MaxLength="1" />
                        <asp:RequiredFieldValidator ID="ReqPEPRTN" runat="server" ControlToValidate="PEPRTN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="error-message"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegPEPRTN" ControlToValidate="PEPRTN" ValidationExpression="0|1|6" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                   </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="PEDIA2" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                   <asp:CustomValidator ID="CustomValidator19" runat="server"  OnServerValidate="CustVal_PEPRTN" SetFocusOnError="true" Display="Dynamic" ControlToValidate="PEPRTN"  CssClass="error-message" />

                    </td>
                    <td  style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LNPEPRTN" runat="server" />
                    </td>
                </tr>
                   

        <tr>
                    <td style="text-align:left; padding-left:20px;">
                        6.
                   </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLPEPRTNRES" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox  AutoComplete="off" ID="PEPRTNRES" runat="server" Width="40" MaxLength="1" />                        
                        <asp:RegularExpressionValidator runat="server" ID="RegPEPRTNRES" ControlToValidate="PEPRTNRES" ValidationExpression="0|1|2|3|4" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="error-message" />
                        <asp:CustomValidator ID="CustomValidator4" runat="server"  OnServerValidate="CustVal_PEPRTNRES" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" ControlToValidate="PEPRTNRES"  CssClass="error-message" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LNPEPRTNRES" runat="server" />
                    </td>
                </tr>

        <tr>
               <th colspan="4" style="background:#efefef; padding:10px 10px 10px 10px; text-align:left;">
                   <asp:Label ID="LBLRESTPROTEIN" runat="server" />
               </th>
           </tr>
         
        </table>       

        

        
       <table>
         <tr>                
                <td>...</td>
                <td  style="text-align:left; padding-left:10px;">
                     <asp:Label ID="LBLDATASTAT" runat="server" />
                </td>
                <td   style="text-align:left; padding-left:10px;" colspan="2">
                    <asp:DropDownList ID="PECOMPFORM" runat="server"  Width="210"  />
                   <asp:RequiredFieldValidator ID="ReqDDFORMSTATUS"  SetFocusOnError="true" ControlToValidate="PECOMPFORM"   ErrorMessage="" runat="server" CssClass="error-message" InitialValue="X" />
                </td>
            </tr>

            <tr>

                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSaveData" runat="server"   Text="Submit" />
                </td>
            </tr>
        </table>      

     </div> 
</asp:Content>
