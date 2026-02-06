<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OH_LPVF.aspx.cs" Inherits="pages_OH_LPVF" %>
<%@ MasterType VirtualPath="../Site.Master" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Literal ID="LitCurWeek" runat="server" Visible="false" />
    <div class="page-card">
 <h2 class="page-title">105-Late Pregnancy Visit Form</h2>
        <div class="subnote">Show woman's info here where redirect from search page</div>


     <asp:Panel ID="Panel1"  runat="server" >
       
         <div class="table-wrap table-responsive">
  <table class="table">
      
  <tr>
                        <td>
                            Week <asp:Label ID="LblWeek" Text="" runat="server" />                            
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
            <td colspan="4" class="SubSectionTitle"> Section A: First Blood Pressure Measurement
            </td>
        </tr>

        <tr>
            <td colspan="4" style="padding:10px 10px 10px 10px; text-align:left;">
                <asp:Label ID="LBANTHRONOTE" runat="server" />                
            </td>
        </tr>
        

        <tr>
                    <td style="text-align:left; padding-left:20px;">
                        1.
                   </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLLPVTEMP" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox  AutoComplete="off" ID="LPVTEMPWhole" runat="server" Width="70" MaxLength="3" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="LPVTEMPFract" runat="server" Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLLPVTEMPUNT" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqLPVTEMPWhole" runat="server" ControlToValidate="LPVTEMPWhole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RequiredFieldValidator ID="ReqLPVTEMPFract" runat="server" ControlToValidate="LPVTEMPFract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegLPVTEMPWhole" ControlToValidate="LPVTEMPWhole" ValidationExpression="^(?:09[0-9]|10[0-7]|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegLPVTEMPFract" ControlToValidate="LPVTEMPFract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="cvLPVTEMP" runat="server" OnServerValidate="CustVal_ValidateBodyTemperature" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
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
                    <td  style="text-align:left; padding-left:20px;">
                        <asp:TextBox  AutoComplete="off" ID="LPVSYS1" runat="server" Width="70" MaxLength="3" />
                        /
                        <asp:TextBox  AutoComplete="off" ID="LPVDIA1" runat="server" Width="70" MaxLength="3" onkeyup="RefreshUpdatePanel();" AutoPostBack="true" />
                        <asp:Label ID="LBPEBLDUNT1" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqLPVSYS1" runat="server" ControlToValidate="LPVSYS1" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator  ID="RegExLPVSYS1" runat="server" ControlToValidate="LPVSYS1" ValidationExpression="^(?:0[5-9]\d|1\d{2}|200|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RequiredFieldValidator ID="ReqLPVDIA1" runat="server" ControlToValidate="LPVDIA1" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVDIA1" ControlToValidate="LPVDIA1" ValidationExpression="^(?:0(?:3[5-9]|[4-9]\d)|1(?:[0-3]\d|40)|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:CustomValidator ID="CustomValidator1" runat="server"  OnServerValidate="CustVal_Validate1SYSDIA" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                        <asp:Label ID="LNPRES1" runat="server" />
                    </td>                   
                </tr>

        <tr>
            <td> </td>
              <td style="text-align:left; padding-left:10px;">
                 2a.  <asp:Label ID="LBTOB1" Text="" runat="server" />
                 
               </td>
            
               <td  style="text-align:left; padding-left:20px;">
                   <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">--%>
                    <ContentTemplate>
                   <asp:Label ID="LPBLDTOB1HH" Text="" runat="server" /> 
                   <asp:TextBox  AutoComplete="off" ID="LPVTOB1HH" runat="server"  MaxLength="2" Width="60"  />                   
                   <asp:RequiredFieldValidator ID="ReqLPVTOB1HH" runat="server" ControlToValidate="LPVTOB1HH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                   <asp:RegularExpressionValidator ID="RegExLPVTOB1HH" runat="server" ControlToValidate="LPVTOB1HH" ValidationExpression="^(?:0[1-9]|1[012])$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />

                   <asp:Label ID="LPBLDTOB1MM" Text="" runat="server" /> 
                   <asp:TextBox  AutoComplete="off" ID="LPVTOB1MM" runat="server"  MaxLength="2" Width="60"  />
                   <asp:RequiredFieldValidator ID="ReqLPVTOB1MM" runat="server" ControlToValidate="LPVTOB1MM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                   <asp:RegularExpressionValidator ID="RegExLPVTOB1MM" runat="server" ControlToValidate="LPVTOB1MM" ValidationExpression="^[0-5]\d$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                   
                   <asp:Label ID="LPBLDTOB1AMPM" Text="" runat="server" /> 
                  <%-- <asp:TextBox  AutoComplete="off" ID="LPVTOB1AMPM" runat="server"  MaxLength="1" Width="40"  />
                   <asp:RequiredFieldValidator ID="ReqLPVTOB1AMPM" runat="server" ControlToValidate="LPVTOB1AMPM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                  <asp:RegularExpressionValidator ID="RegExLPVTOB1AMPM" runat="server" ControlToValidate="LPVTOB1AMPM" ValidationExpression="^[12]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />--%>

                   <asp:DropDownList ID="LPVTOB1AMPM" runat="server"  Width="70"  />
                   <asp:RequiredFieldValidator ID="ReqLPVTOB1AMPM"  SetFocusOnError="true" ControlToValidate="LPVTOB1AMPM"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="LPVDIA1" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
              </td>      
            <td  style="text-align:left; padding-left:10px;"> 
                <asp:Label ID="LNTOB1" Text="" runat="server" />
            </td>
           </tr>

        <tr>
            <td> </td>
               <td style="text-align:left; padding-left:10px;">
              2b.     <asp:Label ID="LBLNLPVBP2REQ" Text="" runat="server" />
                   
               </td>
            
               <td  style="text-align:left; padding-left:20px;">
                   <%--<asp:UpdatePanel ID="Update1" runat="server">--%>
                    <ContentTemplate>
                        <asp:TextBox  AutoComplete="off" ID="LPVBP2REQ" runat="server"  MaxLength="1" Width="40"  />
                        <asp:RequiredFieldValidator ID="ReqLPVBP2REQ" runat="server" ControlToValidate="LPVBP2REQ" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVBP2REQ" ControlToValidate="LPVBP2REQ" ValidationExpression="0|1" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator2" runat="server"  OnServerValidate="CustVal_FRSTBPRequired" ControlToValidate="LPVBP2REQ" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="LPVDIA1" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                   </td>
               <td  style="text-align:left; padding-left:10px;">
                   <asp:Label ID="LNLPVBP2REQ" Text="" runat="server" />
               </td>
            </tr>


           <tr>
                <td style="text-align:left; padding-left:20px;">
                    3.
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPULSE" runat="server" />
                </td>
                <td  style="text-align:left; padding-left:20px;">
                    <asp:TextBox  AutoComplete="off" ID="LPVPULSE" runat="server" Width="70" MaxLength="3" />
                    <asp:Label ID="LBLPVPULSEUNT" runat="server" />
                </td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqLPVPULSE" runat="server" ControlToValidate="LPVPULSE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVPULSE" ControlToValidate="LPVPULSE" ValidationExpression="^(?:0[4-9]\d|1\d{2}|200|666|999)$" SetFocusOnError="true" ErrorMessage = "" Display="Dynamic" CssClass="erroMsg"/>
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
                         <asp:TextBox  AutoComplete="off" ID="LPVMUAC1Whole" runat="server"  Width="50" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="LPVMUAC1Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLPVMUAC1UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC1Whole" runat="server" ControlToValidate="LPVMUAC1Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC1Fract" runat="server" ControlToValidate="LPVMUAC1Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC1Whole" ControlToValidate="LPVMUAC1Whole" ValidationExpression="1[5-9]|2[0-9]|3[0-9]|4[0-9]|50|66|99" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC1Fract" ControlToValidate="LPVMUAC1Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator15" Enabled="false" runat="server" OnServerValidate="CustVal_Validate1MUAC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
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
                         <asp:TextBox  AutoComplete="off" ID="LPVMUAC2Whole" runat="server"  Width="50" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="LPVMUAC2Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLPVMUAC2UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC2Whole" runat="server" ControlToValidate="LPVMUAC2Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC2Fract" runat="server" ControlToValidate="LPVMUAC2Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC2Whole" ControlToValidate="LPVMUAC2Whole" ValidationExpression="1[5-9]|2[0-9]|3[0-9]|4[0-9]|50|66|99" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC2Fract" ControlToValidate="LPVMUAC2Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator16" Enabled="false" runat="server" OnServerValidate="CustVal_Validate2MUAC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
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
                         <asp:TextBox  AutoComplete="off" ID="LPVMUAC3Whole" runat="server"  Width="50" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="LPVMUAC3Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLPVMUAC3UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC3Whole" runat="server" ControlToValidate="LPVMUAC3Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC3Fract" runat="server" ControlToValidate="LPVMUAC3Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC3Whole" ControlToValidate="LPVMUAC3Whole" ValidationExpression="1[5-9]|2[0-9]|3[0-9]|4[0-9]|50|66|99" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC3Fract" ControlToValidate="LPVMUAC3Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator17" Enabled="false" runat="server" OnServerValidate="CustVal_Validate3MUAC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                        <asp:Label ID="LNMUAC3" runat="server" />
                    </td>
                </tr>


             <tr>
                <td  style="text-align:left; padding-left:20px;">
                    5.
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLLPVWT1" runat="server" />
                </td>
                 <td>
                   <asp:TextBox  AutoComplete="off" ID="LPVWT1Whole" runat="server" Width="50" MaxLength="2" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="LPVWT1Fract" runat="server" Width="40" MaxLength="1" />                    
                    <asp:Label ID="LBLLPVWT1UNT" runat="server" />
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqLPVWT1Whole" runat="server" ControlToValidate="LPVWT1Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RequiredFieldValidator ID="ReqLPVWT1Fract" runat="server" ControlToValidate="LPVWT1Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT1Whole" ControlToValidate="LPVWT1Whole" ValidationExpression="^(?:3[0-9]|4[0-9]|5[0-9]|6[0-9]|7[0-9]|8[0-9]|66|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT1Fract" ControlToValidate="LPVWT1Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="cvLPVWT1" runat="server" Enabled="false"  OnServerValidate="CustVal_Validate1Weight" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:Label ID="LNWT1" runat="server" />
                </td>
           </tr>


        <tr>
                <td  style="text-align:left; padding-left:20px;">
                    
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLLPVWT2" runat="server" />
                </td>
                 <td>
                   <asp:TextBox  AutoComplete="off" ID="LPVWT2Whole" runat="server" Width="50" MaxLength="2" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="LPVWT2Fract" runat="server" Width="40" MaxLength="1" />                    
                    <asp:Label ID="LBLLPVWT2UNT" runat="server" />                                
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqLPVWT2Whole" runat="server" ControlToValidate="LPVWT2Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RequiredFieldValidator ID="ReqLPVWT2Fract" runat="server" ControlToValidate="LPVWT2Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT2Whole" ControlToValidate="LPVWT2Whole" ValidationExpression="^(?:3[0-9]|4[0-9]|5[0-9]|6[0-9]|7[0-9]|8[0-9]|66|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT2Fract" ControlToValidate="LPVWT2Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator13" Enabled="false" runat="server"  OnServerValidate="CustVal_Validate2Weight" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:Label ID="LNWT2" runat="server" />
                </td>
           </tr>

        <tr>
                <td  style="text-align:left; padding-left:20px;">
                    
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLLPVWT3" runat="server" />
                </td>
                 <td>
                   <asp:TextBox  AutoComplete="off" ID="LPVWT3Whole" runat="server" Width="50" MaxLength="2" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="LPVWT3Fract" runat="server" Width="40" MaxLength="1" />                    
                    <asp:Label ID="LBLLPVWT3UNT" runat="server" />                                
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqLPVWT3Whole" runat="server" ControlToValidate="LPVWT3Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RequiredFieldValidator ID="ReqLPVWT3Fract" runat="server" ControlToValidate="LPVWT3Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT3Whole" ControlToValidate="LPVWT3Whole" ValidationExpression="^(?:3[0-9]|4[0-9]|5[0-9]|6[0-9]|7[0-9]|8[0-9]|66|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT3Fract" ControlToValidate="LPVWT3Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator14" Enabled="false" runat="server"  OnServerValidate="CustVal_Validate3Weight" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:Label ID="LNWT3" runat="server" />
                </td>
           </tr>
        
       <tr>
            <td colspan="4">
           <asp:Button ID="ButtonAnthroSubmit" runat="server"  CssClass="btn btn-primary" Text="Submit"  CausesValidation="true"/>
            </td>
        </tr>
        </table>
     
   
   <table>   
         <tr>
            <td colspan="4" class="SubSectionTitle">Section B: General Questions
            </td>
        </tr>
            <tr>
                <td>
                    1.
                </td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBTREAT" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVTREAT" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvLPVTREAT" runat="server" ControlToValidate="LPVTREAT" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVTREAT" ControlToValidate="LPVTREAT" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RequiredFieldValidator ID="ReqLPVTREAT" runat="server" ControlToValidate="LPVTREAT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td  style="text-align:left;padding-left:10px;">
                    <asp:Label ID="LCTREAT" Text="" runat="server" />
                </td>
            </tr>
            <tr>
                <td rowspan="3"></td>
                <td rowspan="3" style="text-align:left; padding-left:10px;">
                    1a. <asp:Label ID="LBTREATA" Text="" runat="server" />
                   </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVTREATA" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVTREATA" ControlToValidate="LPVTREATA" ValidationExpression="^[1-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator0" runat="server" ControlToValidate="LPVTREATA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvLPVTREATA" runat="server" ControlToValidate="LPVTREATA" OnServerValidate="CustVal_CareLocationsA" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />                    
                </td>
                <td rowspan="3"  style="text-align:left;padding-left:10px;">
                    <asp:Label ID="LCTREATA" Text="" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVTREATB" runat="server"  Width="40" MaxLength="1" />                    
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVTREATB" ControlToValidate="LPVTREATB" ValidationExpression="^[1-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="cvLPVTREATB" runat="server" ControlToValidate="LPVTREATB" OnServerValidate="CustVal_CareLocationsBandC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>                
            </tr>
            <tr>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVTREATC" runat="server"  Width="40" MaxLength="1" />                    
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVTREATC" ControlToValidate="LPVTREATC" ValidationExpression="^[1-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="cvLPVTREATC" runat="server" ControlToValidate="LPVTREATC" OnServerValidate="CustVal_CareLocationsBandC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>                
            </tr>
            
           <tr>
                <td>2.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBTT" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVTT" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvLPVTT" runat="server" ControlToValidate="LPVTT" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVTT" ControlToValidate="LPVTT" ValidationExpression="^[0-59]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RequiredFieldValidator ID="ReqLPVTT" runat="server" ControlToValidate="LPVTT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td style="text-align:left;padding-left:10px;">
                    <asp:Label ID="LCTT" Text="" runat="server" />
                </td>
            </tr>



          <tr>
                <td>3.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPVALBE" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVALBE" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator31" runat="server" ControlToValidate="LPVALBE" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVALBE" ControlToValidate="LPVALBE" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RequiredFieldValidator ID="ReqLPVALBE" runat="server" ControlToValidate="LPVALBE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td style="text-align:left;padding-left:10px;">
                    <asp:Label ID="LCLPVALBE" Text="" runat="server" />
                </td>
            </tr>

         <tr>
                <td>3a.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBALBEGIVN" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVALBEGIVN" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator77" runat="server" ControlToValidate="LPVALBEGIVN" OnServerValidate="CustVal_AbenValidation" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVALBEGIVN" ControlToValidate="LPVALBEGIVN" ValidationExpression="0|1|6" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />                    
                </td>
                <td style="text-align:left;padding-left:10px;">
                    <asp:Label ID="LCLALBEGIVN" Text="" runat="server" />
                </td>
            </tr>


       
       <tr>
                <td>4.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLLPVCOVID" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVCOVID" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator78" runat="server" ControlToValidate="LPVCOVID" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVCOVID" ControlToValidate="LPVCOVID" ValidationExpression="0|1|2|3|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RequiredFieldValidator ID="ReqLPVCOVID" runat="server" ControlToValidate="LPVCOVID" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td style="text-align:left;padding-left:10px;">
                    <asp:Label ID="LCLPVCOVID" Text="" runat="server" />
                </td>
            </tr>

         <tr>
                <td>4a.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLLPVCOVIDPREG" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVCOVIDPREG" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator79" runat="server" ControlToValidate="LPVCOVIDPREG" OnServerValidate="CustVal_CovidValidation" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVCOVIDPREG" ControlToValidate="LPVCOVIDPREG" ValidationExpression="0|1|2|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />                    
                </td>
                <td style="text-align:left;padding-left:10px;">
                    <asp:Label ID="LCLPVCOVIDPREG" Text="" runat="server" />
                </td>
            </tr>
       
            <tr>
                <td>5.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPVCALC" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVCALC" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator32" runat="server" ControlToValidate="LPVCALC" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVCALC" ControlToValidate="LPVCALC" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RequiredFieldValidator ID="ReqLPVCALC" runat="server" ControlToValidate="LPVCALC" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td style="text-align:left;padding-left:10px;">
                    <asp:Label ID="LCLPVCALC" Text="" runat="server" />
                </td>
            </tr>


          <tr>
                <td>5a.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPVCALCBUY" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVCALCBUY" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator33" runat="server" ControlToValidate="LPVCALCBUY"  OnServerValidate="CustVal_LPVCALCBUYRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVCALCBUY" ControlToValidate="LPVCALCBUY" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RequiredFieldValidator ID="ReqLPVCALCBUY" runat="server" ControlToValidate="LPVCALCBUY" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td style="text-align:left;padding-left:10px;">
                    <asp:Label ID="LCLPVCALCBUY" Text="" runat="server" />
                </td>
            </tr>


       <tr>
                <td>6.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPVHOSP" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVHOSP" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator76" runat="server" ControlToValidate="LPVHOSP" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVHOSP" ControlToValidate="LPVHOSP" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RequiredFieldValidator ID="ReqLPVHOSP" runat="server" ControlToValidate="LPVHOSP" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td style="text-align:left;padding-left:10px;">
                    <asp:Label ID="LCLPVHOSP" Text="" runat="server" />
                </td>
            </tr>



            <tr>
                <td>7.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPVDELLOC" Text="" runat="server" />
                    </td>
                <td colspan="2">
              
                    <asp:TextBox  AutoComplete="off" ID="LPVDELLOC" runat="server"  Width="40" MaxLength="1" onkeyup="RefreshUpdateFacilityPanel();" AutoPostBack="true"  />
                    <asp:CustomValidator ID="cvLPVDELLOC" runat="server" ControlToValidate="LPVDELLOC" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVDELLOC" ControlToValidate="LPVDELLOC" ValidationExpression="^[1-79]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RequiredFieldValidator ID="ReqLPVDELLOC" runat="server" ControlToValidate="LPVDELLOC" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>

                  <asp:Label ID="LCLPVDELLOC" Text="" runat="server" />
               

                    <%--<asp:DropDownList ID="LPVDELLOC" runat="server" onkeyup="RefreshUpdatePanel3();" AutoPostBack="true" OnSelectedIndexChanged="LPVDELLOC_SelectedIndexChanged"  /> 
                    <asp:RequiredFieldValidator ID="ReqDDLLPVDELLOC"  SetFocusOnError="true" ControlToValidate="LPVDELLOC"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />--%>

                </td>
            </tr>

    <tr>
                <td></td>
                <td colspan="2" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPVDELLOCSP" Text="" runat="server" />
                   &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="LPVDELLOCSP" runat="server"  Width="410" MaxLength="150" />
                    
                </td>
                <td style="text-align:left;padding-left:10px;">
                    <asp:CustomValidator ID="cvLPVDELLOCSP" runat="server" 
                            ControlToValidate="LPVDELLOCSP" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredLPVDELLOCSP" SetFocusOnError="true" ValidateEmptyText="true" />
                </td>
            </tr>
    <tr>
                <td>7a</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBFACILITY" Text="" runat="server" />
                    </td>
                <td colspan="2">
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
                    <ContentTemplate> 
                        <asp:DropDownList ID="LPVFACILITY" runat="server" />
                    </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="LPVDELLOC" />
                    </Triggers>
                    <%--</asp:UpdatePanel>--%>


                    <%--<asp:Panel ID="Panel1" runat="server" Visible="false">
                    <asp:TextBox  AutoComplete="off" ID="TEMPLPVFACILITY" runat="server"  Width="50" MaxLength="2" />
                    <asp:CustomValidator ID="cvFACILITY" runat="server" Enabled="false"  ControlToValidate="LPVFACILITY" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator30" runat="server"  ControlToValidate="LPVFACILITY" OnServerValidate="CustVal_LPVFACILITYRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExLPVFACILITY" runat="server" ControlToValidate="LPVFACILITY" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^0*([1-9]|[1-8][0-9]|9[0-8]|99)$"/>
                     </asp:Panel>--%>

                
                   <asp:Panel ID="PanelTemp2" runat="server" Visible="false">
                       <button id="ButtonFacility" onclick="viewFacility()"                         
                        >स्वास्थ्य संस्थाको नाम हेर्नुहोस् </button>
                      <asp:Label ID="LCFACILITY" Text=""  runat="server" />
                   </asp:Panel>
                    
                </td>
            </tr>

       <tr>
           <td></td>
           <td>
              <asp:Label ID="LBLFACSPC" Text="" runat="server" />
                   &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="LPVFACILITYSP" runat="server"  Width="410" MaxLength="150" />
           </td>
           <td><asp:CustomValidator ID="CustomValidator34" runat="server" 
                            ControlToValidate="LPVFACILITYSP" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredLPVFACILITYSP" SetFocusOnError="true" 
                            ValidateEmptyText="true" /></td>
           <td></td>
       </tr>
       </table>

        <table style="width:100%; font-size:26px;">
         <tr>
            <td>8.</td>
                <td   style="text-align:left; padding-left:10px;">                        
                    <asp:Label ID="LBLLPVPROSUPL" Text="" runat="server" />   
                </td>
                    <td>
                        <asp:TextBox  AutoComplete="off" ID="LPVPROSUPL" runat="server" Width="40" MaxLength="1" />
                        <asp:RequiredFieldValidator ID="ReqLPVPROSUPL" runat="server" ControlToValidate="LPVPROSUPL" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" />
                        <asp:RegularExpressionValidator ID="RegExLPVPROSUPL" runat="server" ControlToValidate="LPVPROSUPL" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$" />
                    </td>
                    <td style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLINSLPVPROSUPL" Text="" runat="server" />   
                    </td>
        </tr>
                <tr>
                <td colspan="4" style="vertical-align:top;">                    
                    
                    <table style="width:100%; font-size:26px;">
                        <tr>
                            <td style="text-align:left;padding-left:40px;" colspan="2">8a. <asp:Label ID="LBLSIXA" runat="server" /></td>
                            <td style="text-align:left;padding-left:10px;">8b. <asp:Label ID="LBLSIXB"  runat="server" />   </td>
                            <td style="text-align:left;padding-left:10px;">8c. <asp:Label ID="LBLSIXC"  runat="server" /></td>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                              i. <asp:Label ID="LBLLPVPROTIK" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROTIK" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator61" runat="server" ControlToValidate="LPVPROTIK" OnServerValidate="CustVal_RequiredIfYesProtein" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROTIK" ControlToValidate="LPVPROTIK" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROTIKWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="cvLPVPROTIKWK" runat="server" ControlToValidate="LPVPROTIKWK" OnServerValidate="CustVal_RequiredIfYesProtiking" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROTIKWK" ControlToValidate="LPVPROTIKWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROTIKADV" runat="server" Width="40" MaxLength="1" />                                
                                <asp:CustomValidator ID="CustomValidator52" runat="server" ControlToValidate="LPVPROTIKADV" OnServerValidate="CustVal_RequiredIfYesProtiking" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROTIKADV" ControlToValidate="LPVPROTIKADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVPROTIKSP" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVPROTIKSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="cvLPVPROTIKSP" runat="server"  ControlToValidate="LPVPROTIKSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequiredProtikingSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                              ii. <asp:Label ID="LBLLPVPROVIC" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROVIC" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator62" runat="server" ControlToValidate="LPVPROVIC" OnServerValidate="CustVal_RequiredIfYesProtein" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROVIC" ControlToValidate="LPVPROVIC" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROVICWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="CustomValidator35" runat="server" ControlToValidate="LPVPROVICWK" OnServerValidate="CustVal_RequiredIfYesProvical" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROVICWK" ControlToValidate="LPVPROVICWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROVICADV" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator53" runat="server" ControlToValidate="LPVPROVICADV" OnServerValidate="CustVal_RequiredIfYesProvical" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROVICADV" ControlToValidate="LPVPROVICADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVPROVICSP" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVPROVICSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator36" runat="server"  ControlToValidate="LPVPROVICSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequiredProvicalSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                              iii. <asp:Label ID="LBLLPVEXPROT" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVEXPROT" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator63" runat="server" ControlToValidate="LPVEXPROT" OnServerValidate="CustVal_RequiredIfYesProtein" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVEXPROT" ControlToValidate="LPVEXPROT" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVEXPROTWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="CustomValidator37" runat="server" ControlToValidate="LPVEXPROTWK" OnServerValidate="CustVal_RequiredIfYesExprot" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVEXPROTWK" ControlToValidate="LPVEXPROTWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVEXPROTADV" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator54" runat="server" ControlToValidate="LPVEXPROTADV" OnServerValidate="CustVal_RequiredIfYesExprot" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVEXPROTADV" ControlToValidate="LPVEXPROTADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVEXPROTSP" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVEXPROTSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator38" runat="server"  ControlToValidate="LPVEXPROTSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequiredExprotSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>


                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                              iv. <asp:Label ID="LBLLPVESPROT" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVESPROT" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator64" runat="server" ControlToValidate="LPVESPROT" OnServerValidate="CustVal_RequiredIfYesProtein" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVESPROT" ControlToValidate="LPVESPROT" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVESPROTWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="CustomValidator39" runat="server" ControlToValidate="LPVESPROTWK" OnServerValidate="CustVal_RequiredIfYesEsprot" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVESPROTWK" ControlToValidate="LPVESPROTWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVESPROTADV" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator55" runat="server" ControlToValidate="LPVESPROTADV" OnServerValidate="CustVal_RequiredIfYesEsprot" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVESPROTADV" ControlToValidate="LPVESPROTADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="Label10" Text="LBLLPVESPROTSP" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVESPROTSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator40" runat="server"  ControlToValidate="LPVESPROTSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequiredEsprotSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>


                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                              v. <asp:Label ID="LBLLPVSAMAPRO" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVSAMAPRO" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator65" runat="server" ControlToValidate="LPVSAMAPRO" OnServerValidate="CustVal_RequiredIfYesProtein" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVSAMAPRO" ControlToValidate="LPVSAMAPRO" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVSAMAPROWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="CustomValidator41" runat="server" ControlToValidate="LPVSAMAPROWK" OnServerValidate="CustVal_RequiredIfYesSamapro" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVSAMAPROWK" ControlToValidate="LPVSAMAPROWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVSAMAPROADV" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator56" runat="server" ControlToValidate="LPVSAMAPROADV" OnServerValidate="CustVal_RequiredIfYesSamapro" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVSAMAPROADV" ControlToValidate="LPVSAMAPROADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVSAMAPROSP" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVSAMAPROSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator42" runat="server"  ControlToValidate="LPVSAMAPROSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequireSamaproSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>


                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                              vi. <asp:Label ID="LBLLPVVITPRO" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVVITPRO" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator66" runat="server" ControlToValidate="LPVVITPRO" OnServerValidate="CustVal_RequiredIfYesProtein" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVVITPRO" ControlToValidate="LPVVITPRO" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVVITPROWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="CustomValidator43" runat="server" ControlToValidate="LPVVITPROWK" OnServerValidate="CustVal_RequiredIfYesVitPro" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVVITPROWK" ControlToValidate="LPVVITPROWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVVITPROADV" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator57" runat="server" ControlToValidate="LPVVITPROADV" OnServerValidate="CustVal_RequiredIfYesVitPro" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVVITPROADV" ControlToValidate="LPVVITPROADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVVITPROSP" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVVITPROSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator44" runat="server"  ControlToValidate="LPVVITPROSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequireVitProSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                              vii. <asp:Label ID="LBLLPVVITAPRO" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVVITAPRO" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator67" runat="server" ControlToValidate="LPVVITAPRO" OnServerValidate="CustVal_RequiredIfYesProtein" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVVITAPRO" ControlToValidate="LPVVITAPRO" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVVITAPROWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="CustomValidator45" runat="server" ControlToValidate="LPVVITAPROWK" OnServerValidate="CustVal_RequiredIfYesVitaPro" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVVITAPROWK" ControlToValidate="LPVVITAPROWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVVITAPROADV" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator58" runat="server" ControlToValidate="LPVVITAPROADV" OnServerValidate="CustVal_RequiredIfYesVitaPro" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVVITAPROADV" ControlToValidate="LPVVITAPROADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVVITAPROSP" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVVITAPROSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator46" runat="server"  ControlToValidate="LPVVITAPROSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequireVitaProSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                              viii. <asp:Label ID="LBLLPVPROPL" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROPL" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator68" runat="server" ControlToValidate="LPVPROPL" OnServerValidate="CustVal_RequiredIfYesProtein" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROPL" ControlToValidate="LPVPROPL" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROPLWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="CustomValidator47" runat="server" ControlToValidate="LPVPROPLWK" OnServerValidate="CustVal_RequiredIfYesProPL" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROPLWK" ControlToValidate="LPVPROPLWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROPLADV" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator59" runat="server" ControlToValidate="LPVPROPLADV" OnServerValidate="CustVal_RequiredIfYesProPL" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROPLADV" ControlToValidate="LPVPROPLADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVPROPLSP" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVPROPLSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator48" runat="server"  ControlToValidate="LPVPROPLSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequireProPLSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                              ix. <asp:Label ID="LBLLPVHLTHPOST" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVHLTHPOST" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator30" runat="server" ControlToValidate="LPVHLTHPOST" OnServerValidate="CustVal_RequiredIfYesHealthPost" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVHLTHPOST" ControlToValidate="LPVHLTHPOST" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVHLTHPOSTWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="CustomValidator81" runat="server" ControlToValidate="LPVHLTHPOSTWK" OnServerValidate="CustVal_RequiredIfYesHLTHPOST" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVHLTHPOSTWK" ControlToValidate="LPVHLTHPOSTWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVHLTHPOSTADV" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator82" runat="server" ControlToValidate="LPVHLTHPOSTADV" OnServerValidate="CustVal_RequiredIfYesHLTHPOST" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVHLTHPOSTADV" ControlToValidate="LPVHLTHPOSTADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVHLTHPOSTOTHSP" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVHLTHPOSTSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator83" runat="server"  ControlToValidate="LPVHLTHPOSTSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequireHealthPostSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:left;padding-left:40px;">
                              x. <asp:Label ID="LBLLPVPROSP" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROSP" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator69" runat="server" ControlToValidate="LPVPROSP" OnServerValidate="CustVal_RequiredIfYesProtein" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROSP" ControlToValidate="LPVPROSP" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVPROSPOTH" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVPROSPOTH" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator51" runat="server"  ControlToValidate="LPVPROSPOTH" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequiredLPVPROSPOTHOther" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROSPWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="CustomValidator49" runat="server" ControlToValidate="LPVPROSPWK" OnServerValidate="CustVal_RequiredIfYesOthers" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROSPWK" ControlToValidate="LPVPROSPWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPROSPADV" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator60" runat="server" ControlToValidate="LPVPROSPADV" OnServerValidate="CustVal_RequiredIfYesOthers" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPROSPADV" ControlToValidate="LPVPROSPADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVPROSPOTHSP" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVPROSPOTHSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator50" runat="server"  ControlToValidate="LPVPROSPOTHSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequireProteinSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>

                         <tr>
                            <td style="text-align:left;padding-left:40px;">
                              xi. <asp:Label ID="LBLLPVPRODK" Text="" runat="server" /></td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPRODK" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator70" runat="server" ControlToValidate="LPVPRODK" OnServerValidate="CustVal_RequiredIfYesProtein" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPRODK" ControlToValidate="LPVPRODK" ValidationExpression="^[01]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="Label1" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVPRODKOTHRS" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator75" runat="server"  ControlToValidate="LPVPRODKOTHRS" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequiredLPVPRODKOTHRS" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPRODKWK" runat="server" MaxLength="2" Width="60" />
                                <asp:CustomValidator ID="CustomValidator71" runat="server" ControlToValidate="LPVPRODKWK" OnServerValidate="CustVal_RequiredIfYesProDK" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPRODKWK" ControlToValidate="LPVPRODKWK" ValidationExpression="^(?:0[0-9]|[1-3]\d|40|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                            </td>
                            <td>
                                <asp:TextBox  AutoComplete="off" ID="LPVPRODKADV" runat="server" Width="40" MaxLength="1" />
                                <asp:CustomValidator ID="CustomValidator72" runat="server" ControlToValidate="LPVPRODKADV" OnServerValidate="CustVal_RequiredIfYesProDK" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                                <asp:RegularExpressionValidator runat="server" ID="RegExLPVPRODKADV" ControlToValidate="LPVPRODKADV" ValidationExpression="^[0123459]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                                <br />
                                <asp:Label ID="LBLLPVPRODKSP" Text="" runat="server" />   
                                   &nbsp;&nbsp;&nbsp;
                                <asp:TextBox  AutoComplete="off" ID="LPVPRODKSP" runat="server" CssClass="specify" MaxLength="150" Width="410" />
                                <asp:CustomValidator ID="CustomValidator73" runat="server"  ControlToValidate="LPVPRODKSP" CssClass="erroMsg" Display="Dynamic"  OnServerValidate="CustVal_RequireProDKSP" SetFocusOnError="true" ValidateEmptyText="true" />
                            </td>
                        </tr>

                    </table>

                    </td>
                    </tr>
             </table>

       <table>
        <tr>
                <td style="text-align:center;">
                    <asp:Button ID="ButtonSectionB" runat="server"   Text="Submit" />
                </td>
            </tr>
        </table>
     
       <table style="width:100%; font-size:26px;">
        <tr>
            <td colspan="4" class="SubSectionTitle">Section C: Health and Care Seeking
            </td>
        </tr>

            <tr>
                <td><b>#</b></td>
                <td><b>
                    <asp:Label ID="LBLSECDQUE" Text="" runat="server" />
                    </b>
                </td>

                <td><b>
                    <asp:Label ID="LBLSECDDAY" Text="" runat="server" />
                    </b>
                </td>

                <td><b>
                    <asp:Label ID="LBLSECDTRT" Text="" runat="server" />
                    </b>
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">1.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPECGH" Text="" runat="server" />
                </td>
                <td>     
                    <asp:TextBox  AutoComplete="off" ID="LPVCGH" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVCGHReq" runat="server" ControlToValidate="LPVCGH" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />   
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVCGH" ControlToValidate="LPVCGH" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVCGHTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVCGHTRT" runat="server" ControlToValidate="LPVCGHTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVCGHTRT" ControlToValidate="LPVCGHTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">2.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPESHBRTH" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVDIFFBR" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVDIFFBRReq" runat="server" ControlToValidate="LPVDIFFBR" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVDIFFBR" ControlToValidate="LPVDIFFBR" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVDIFFBRTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVDIFFBRTRT" runat="server" ControlToValidate="LPVDIFFBRTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVDIFFBRTRT" ControlToValidate="LPVDIFFBRTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>
        
            <tr>
                <td style="text-align:left; padding-left:40px;">3.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEPAPP" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVPAPP" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVPAPPReq" runat="server" ControlToValidate="LPVPAPP" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVPAPP" ControlToValidate="LPVPAPP" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVPAPPTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVPAPPTRT" runat="server" ControlToValidate="LPVPAPPTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVPAPPTRT" ControlToValidate="LPVPAPPTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">4.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPENAUS" Text="" runat="server" />
                   </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVNAUS" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVNAUSReq" runat="server" ControlToValidate="LPVNAUS" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVNAUS" ControlToValidate="LPVNAUS" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVNAUSTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVNAUSTRT" runat="server" ControlToValidate="LPVNAUSTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVNAUSTRT" ControlToValidate="LPVNAUSTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">5.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEVOM" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVVOM" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVVOMReq" runat="server" ControlToValidate="LPVVOM" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVVOM" ControlToValidate="LPVVOM" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVVOMTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVVOMTRT" runat="server" ControlToValidate="LPVVOMTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVVOMTRT" ControlToValidate="LPVVOMTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">6.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPECONV" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVCONV" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVCONVReq" runat="server" ControlToValidate="LPVCONV" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVCONV" ControlToValidate="LPVCONV" ValidationExpression="(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVCONVTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVCONVTRT" runat="server" ControlToValidate="LPVCONVTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVCONVTRT" ControlToValidate="LPVCONVTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">7.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPESWHND" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVSWHND" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVSWHNDReq" runat="server" ControlToValidate="LPVSWHND" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVSWHND" ControlToValidate="LPVSWHND" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVSWHNDTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVSWHNDTRT" runat="server" ControlToValidate="LPVSWHNDTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVSWHNDTRT" ControlToValidate="LPVSWHNDTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">8.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPESWFCE" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVSWFCE" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVSWFCEReq" runat="server" ControlToValidate="LPVSWFCE" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVSWFCE" ControlToValidate="LPVSWFCE" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVSWFCETRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVSWFCETRT" runat="server" ControlToValidate="LPVSWFCETRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVSWFCETRT" ControlToValidate="LPVSWFCETRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">9.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEHEAD" Text="" runat="server" />                  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVHEAD" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVHEADReq" runat="server" ControlToValidate="LPVHEAD" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVHEAD" ControlToValidate="LPVHEAD" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVHEADTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVHEADTRT" runat="server" ControlToValidate="LPVHEADTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVHEADTRT" ControlToValidate="LPVHEADTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">10.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEFVR" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVFVR" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVFVRReq" runat="server" ControlToValidate="LPVFVR" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVFVR" ControlToValidate="LPVFVR" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVFVRTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVFVRTRT" runat="server" ControlToValidate="LPVFVRTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVFVRTRT" ControlToValidate="LPVFVRTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">11.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEDIAR" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVDIAR" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVDIARReq" runat="server" ControlToValidate="LPVDIAR" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVDIAR" ControlToValidate="LPVDIAR" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVDIARTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVDIARTRT" runat="server" ControlToValidate="LPVDIARTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVDIARTRT" ControlToValidate="LPVDIARTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>            
           
            <tr>
                <td style="text-align:left; padding-left:40px;">12.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEURIN" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVURIN" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVURINReq" runat="server" ControlToValidate="LPVURIN" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVURIN" ControlToValidate="LPVURIN" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVURINTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVURINTRT" runat="server" ControlToValidate="LPVURINTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVURINTRT" ControlToValidate="LPVURINTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">13.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEVAGDIS" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVVAGDIS" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVVAGDISReq" runat="server" ControlToValidate="LPVVAGDIS" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVVAGDIS" ControlToValidate="LPVVAGDIS" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVVAGDISTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVVAGDISTRT" runat="server" ControlToValidate="LPVVAGDISTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVVAGDISTRT" ControlToValidate="LPVVAGDISTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>
            
            <tr>
                <td style="text-align:left; padding-left:40px;">14.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEVAGBLD" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVVAGBLD" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVVAGBLDReq" runat="server" ControlToValidate="LPVVAGBLD" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVVAGBLD" ControlToValidate="LPVVAGBLD" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVVAGBLDTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVVAGBLDTRT" runat="server" ControlToValidate="LPVVAGBLDTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVVAGBLDTRT" ControlToValidate="LPVVAGBLDTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">15.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEXN" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVNBLND" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVXNReq" runat="server" ControlToValidate="LPVNBLND" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVXN" ControlToValidate="LPVNBLND" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic"  CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVNBLNDTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVNBLNDTRT" runat="server" ControlToValidate="LPVNBLNDTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVXNTRT" ControlToValidate="LPVNBLNDTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>
          
            
            <tr>
                <td style="text-align:left; padding-left:40px;">16.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPERFETMV" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVBABYMV" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVRFETMVReq" runat="server" ControlToValidate="LPVBABYMV"  OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVRFETMV" ControlToValidate="LPVBABYMV" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVBABYMVTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVBABYMVTRT" runat="server" ControlToValidate="LPVBABYMVTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVRFETMVTRT" ControlToValidate="LPVBABYMVTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">17.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPELABD" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVLABD" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVLABDReq" runat="server" ControlToValidate="LPVLABD" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVLABD" ControlToValidate="LPVLABD" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVLABDTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVLABDTRT" runat="server" ControlToValidate="LPVLABDTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVLABDTRT" ControlToValidate="LPVLABDTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td style="text-align:left; padding-left:40px;">18.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEBLUR" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVBLUR" runat="server"  MaxLength="2" Width="60" />
                    <asp:CustomValidator ID="cvLPVBLURReq" runat="server" ControlToValidate="LPVBLUR" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVBLUR" ControlToValidate="LPVBLUR" ValidationExpression="^(?:[0-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVBLURTRT" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVBLURTRT" runat="server" ControlToValidate="LPVBLURTRT" OnServerValidate="CustVal_RequiredIfExperiencedSymptom" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVBLURTRT" ControlToValidate="LPVBLURTRT" ValidationExpression="^[0-69]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>


        <tr>
            <td colspan="5" style="text-align:left;padding-left:100px;">
                <asp:Label ID="LBLTREATINS" Text="" runat="server" />   
            </td>
        </tr>

        <tr>
               <th colspan="4">
                   <asp:Label ID="LBLTREATINSTITLE" Text="" runat="server" />   
               </th>
           </tr>

           <tr>
               <td colspan="2" style="text-align:left;padding-left:40px;">
                   <asp:Label ID="LBLTREATINS1" Text="" runat="server" />   
               </td>
               <td colspan="2" style="text-align:left;padding-left:40px;">
                   <asp:Label ID="LBLTREATINS2" Text="" runat="server" />   
               </td>
           </tr>
        <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionC" runat="server"   Text="Submit" CausesValidation="true" />
                </td>
            </tr>
        </table>
      

         
       <table style="width:100%; font-size:26px;">
         <tr>
             <td colspan="5" class="SubSectionTitle"> Section D. Tobacco, Alcohol Use 
             </td>
         </tr>
            <tr>
                <td><b>1.</b></td>
                <td style="text-align:left; padding-left:10px;"><b><asp:Label ID="LBLSECEDAY" Text="" runat="server" />
                    </b></td>
                <td style="text-align:left; padding-left:40px;"><b>
                    <asp:Label ID="LBLSECEYN" Text="" runat="server" />
                   </b> </td>
                <td style="text-align:left; padding-left:40px;">
                    <b><asp:Label ID="LBLSECEQUE" Text="" runat="server" />
                    </b></td>
                <td style="text-align:left; padding-left:40px;">
                    <b><asp:Label ID="LBLINSPEBLUR" Text="" runat="server" />
                    </b></td>
            </tr>
            <tr>
                <td style="text-align:left; padding-left:40px;">a.</td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBLPEBIDI" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVBIDI" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVBIDIReq" runat="server" ControlToValidate="LPVBIDI" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVBIDI" ControlToValidate="LPVBIDI" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVBIDID" runat="server"  MaxLength="2" Width="60" />
                    <br />
                    <asp:CustomValidator ID="cvLPVBIDID" runat="server" ControlToValidate="LPVBIDID" OnServerValidate="CustVal_RequiredIfYesBidi" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVBIDID" ControlToValidate="LPVBIDID" ValidationExpression="^(?:0[1-9]|[1-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVBIDIN" runat="server"  MaxLength="2" Width="60" />
                    <br />
                    <asp:CustomValidator ID="cvLPVBIDIN" runat="server" ControlToValidate="LPVBIDIN" OnServerValidate="CustVal_RequiredIfYesBidi" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVBIDIN" ControlToValidate="LPVBIDIN" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>
            <tr>
                <td style="text-align:left; padding-left:40px;">b.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPETOB" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVTOB" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVTOBReq" runat="server" ControlToValidate="LPVTOB" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVTOB" ControlToValidate="LPVTOB" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVTOBD" runat="server"  MaxLength="2" Width="60" />
                    <br />
                    <asp:CustomValidator ID="cvLPVTOBD" runat="server" ControlToValidate="LPVTOBD" OnServerValidate="CustVal_RequiredIfYesChwTob" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVTOBD" ControlToValidate="LPVTOBD" ValidationExpression="^(?:0[1-9]|[1-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVTOBN" runat="server"  MaxLength="2" Width="60" />
                    <br />
                    <asp:CustomValidator ID="cvLPVTOBN" runat="server" ControlToValidate="LPVTOBN" OnServerValidate="CustVal_RequiredIfYesChwTob" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVTOBN" ControlToValidate="LPVTOBN" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>
            <tr>
                <td style="text-align:left; padding-left:40px;">c.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEJAARD" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVJAARD" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVJAARDReq" runat="server" ControlToValidate="LPVJAARD" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVJAARD" ControlToValidate="LPVJAARD" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVJAARDD" runat="server"  MaxLength="2" Width="60" />
                    <br />
                    <asp:CustomValidator ID="cvLPVJAARDD" runat="server" ControlToValidate="LPVJAARDD" OnServerValidate="CustVal_RequiredIfYesJaard" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVJAARDD" ControlToValidate="LPVJAARDD" ValidationExpression="^(?:0[1-9]|[1-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVJAARDN" runat="server"  MaxLength="2" Width="60" />
                    <br />
                    <asp:CustomValidator ID="cvLPVJAARDN" runat="server" ControlToValidate="LPVJAARDN" OnServerValidate="CustVal_RequiredIfYesJaard" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVJAARDN" ControlToValidate="LPVJAARDN" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>
            <tr>
                <td style="text-align:left; padding-left:40px;">d.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPERAKSHI" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVRAKSHI" runat="server"  Width="40" MaxLength="1" />
                    <br />
                    <asp:CustomValidator ID="cvLPVRAKSHIReq" runat="server" ControlToValidate="LPVRAKSHI" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVRAKSHI" ControlToValidate="LPVRAKSHI" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVRAKSHID" runat="server"  MaxLength="2" Width="60" />
                    <br />
                    <asp:CustomValidator ID="cvLPVRAKSHID" runat="server" ControlToValidate="LPVRAKSHID" OnServerValidate="CustVal_RequiredIfYesRakshi" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVRAKSHID" ControlToValidate="LPVRAKSHID" ValidationExpression="^(?:0[1-9]|[1-2]\d|30|99)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVRAKSHIN" runat="server"  MaxLength="2" Width="60" />
                    <br />
                    <asp:CustomValidator ID="cvLPVRAKSHIN" runat="server" ControlToValidate="LPVRAKSHIN" OnServerValidate="CustVal_RequiredIfYesRakshi" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegEXLPVRAKSHIN" ControlToValidate="LPVRAKSHIN" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>
         <tr>
                <td style="text-align:left;padding-left:40px;">
                    2.  </td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPESMKFMLY" Text="" runat="server" /> 
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVSMKFMLY" runat="server" Width="40" MaxLength="1" />                     
                    <asp:RequiredFieldValidator ID="ReqLPVFSMKFMLY" runat="server" ControlToValidate="LPVSMKFMLY" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVFSMKFMLY" ControlToValidate="LPVSMKFMLY" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td>
                                
                    </td>
                <td>
                                
                </td>
            </tr>
        <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionD" runat="server"   Text="Submit" />
                </td>
            </tr>
        </table>
      
       <table style="width:100%; font-size:26px;">
         <tr>
            <td colspan="3" class="SubSectionTitle">Section E: Maternal Diet
            </td>
        </tr>
        <tr>
            <td colspan="3" style="padding:10px 10px 10px 10px; text-align:left;">               
                 <asp:Label ID="LBLSECGTITLE" runat="server" />
            </td>
        </tr>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVGRAIN" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEGRAIN" runat="server" ControlToValidate="LPVGRAIN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEGRAIN" ControlToValidate="LPVGRAIN" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVBEANS" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEBEANS" runat="server" ControlToValidate="LPVBEANS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEBEANS" ControlToValidate="LPVBEANS" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVLEAFVEG" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPELEAFVEG" runat="server" ControlToValidate="LPVLEAFVEG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPELEAFVEG" ControlToValidate="LPVLEAFVEG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVVITVEG" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEVITVEG" runat="server" ControlToValidate="LPVVITVEG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEVITVEG" ControlToValidate="LPVVITVEG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVOTHRVEG" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEOTHRVEG" runat="server" ControlToValidate="LPVOTHRVEG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEOTHRVEG" ControlToValidate="LPVOTHRVEG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVTUBER" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPETUBER" runat="server" ControlToValidate="LPVTUBER" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPETUBER" ControlToValidate="LPVTUBER" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVMEAT" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEMEAT" runat="server" ControlToValidate="LPVMEAT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEMEAT" ControlToValidate="LPVMEAT" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVMEATORGN" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEMEATORGN" runat="server" ControlToValidate="LPVMEATORGN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEMEATORGN" ControlToValidate="LPVMEATORGN" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVFISH" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEFISH" runat="server" ControlToValidate="LPVFISH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEFISH" ControlToValidate="LPVFISH" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVPROTEIN" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEPROTEIN" runat="server" ControlToValidate="LPVPROTEIN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEPROTEIN" ControlToValidate="LPVPROTEIN" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVEGG" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEEGG" runat="server" ControlToValidate="LPVEGG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEEGG" ControlToValidate="LPVEGG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                       </td>
                   </tr>

                    <tr>
                       <td> 
                            i.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEOILY" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="LPVOILY" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEOILY" runat="server" ControlToValidate="LPVOILY" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEOILY" ControlToValidate="LPVOILY" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVCONDMT" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPECONDMT" runat="server" ControlToValidate="LPVCONDMT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPECONDMT" ControlToValidate="LPVCONDMT" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVVITFRUIT" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEVITFRUIT" runat="server" ControlToValidate="LPVVITFRUIT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEVITFRUIT" ControlToValidate="LPVVITFRUIT" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVOTHRFRUIT" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEOTHRFRUIT" runat="server" ControlToValidate="LPVOTHRFRUIT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEOTHRFRUIT" ControlToValidate="LPVOTHRFRUIT" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVSAVORY" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPESAVORY" runat="server" ControlToValidate="LPVSAVORY" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPESAVORY" ControlToValidate="LPVSAVORY" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVNUTS" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPENUTS" runat="server" ControlToValidate="LPVNUTS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPENUTS" ControlToValidate="LPVNUTS" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVMILK" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPEMILK" runat="server" ControlToValidate="LPVMILK" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPEMILK" ControlToValidate="LPVMILK" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVTEACOFF" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPETEACOFF" runat="server" ControlToValidate="LPVTEACOFF" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPETEACOFF" ControlToValidate="LPVTEACOFF" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                       </td>
                   </tr>

                    <tr>
                       <td> 
                            t.(i)
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPESUGAR" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="LPVSUGAR" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPESUGAR" runat="server" ControlToValidate="LPVSUGAR" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPESUGAR" ControlToValidate="LPVSUGAR" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            t.(ii)
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPECHOCO" runat="server" />
                        
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="LPVCHOCO" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPECHOCO" runat="server" ControlToValidate="LPVCHOCO" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPECHOCO" ControlToValidate="LPVCHOCO" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
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
                           <asp:TextBox  AutoComplete="off" ID="LPVSWTBEVRG" runat="server" Width="40" MaxLength="1" />                     
                            <asp:RequiredFieldValidator ID="ReqPESWTBEVRG" runat="server" ControlToValidate="LPVSWTBEVRG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                            <asp:RegularExpressionValidator runat="server" ID="RegExPESWTBEVRG" ControlToValidate="LPVSWTBEVRG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                       </td>
                   </tr>

                   <tr>
                       <td> 
                            v.
                       </td>
                       <td  style="text-align:left; padding-left:40px;">
                           <asp:Label ID="LBLPEOTHRBEVRG" runat="server" />
                           <asp:TextBox  AutoComplete="off" ID="LPVOTHRBEVRGSP" runat="server" Width="410" MaxLength="150" />                     
                           <asp:CustomValidator runat="server" ID="cvPEOTHRBEVRGSP" ControlToValidate="LPVOTHRBEVRGSP" OnServerValidate="Validate_RequiredPEOTHRBEVRGSP" ValidateEmptyText="true" CssClass="erroMsg" />
                       </td>
                       <td> 
                           <asp:TextBox  AutoComplete="off" ID="LPVOTHRBEVRG" runat="server" Width="40" MaxLength="1" />                     
                           <asp:RequiredFieldValidator ID="ReqPEOTHRBEVRG" runat="server" ControlToValidate="LPVOTHRBEVRG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                           <asp:RegularExpressionValidator runat="server" ID="RegExPEOTHRBEVRG" ControlToValidate="LPVOTHRBEVRG" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                       </td>
                   </tr>
        <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionE" runat="server" Text="Submit" />
                </td>
            </tr>
               </table>
         
       <table style="width:100%; font-size:26px;">
          <tr>
            <td colspan="4" class="SubSectionTitle"> Section F: Maternal Depression Scale   
            </td>
        </tr>

          <tr>
                <td style="padding:10px 10px 10px 10px; text-align:left;"
                    colspan="4">
                  <b> <asp:Label ID="LBSECHTITLE" Text="" runat="server" /></b>
                </td>
         </tr>
        
        <tr>
                <td style="text-align:left; padding-left:40px;vertical-align:top;" 
                    colspan="4">
                  <b> <asp:Label ID="LBSECHSUBTITLE" Text="" runat="server" /></b>
                </td>
         </tr>

        
        <tr>
                <td style="text-align:left; padding-left:40px;">1.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPVLAUGH" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVLAUGH" runat="server"  MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator ID="RegExLPVLAUGH" CssClass="erroMsg" ValidationExpression="[0-3]"  SetFocusOnError="true" ControlToValidate="LPVLAUGH"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="LPVLAUGH" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:40px;">
                    <asp:Label ID="LNPELAUGH" Text="" runat="server" />
                </td>
         </tr>

        <tr>
                <td style="text-align:left; padding-left:40px;">2.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEENJOY" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVENJOY" runat="server"  MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator ID="RegExLPVFEAR" CssClass="erroMsg" ValidationExpression="[0-3]"  SetFocusOnError="true" ControlToValidate="LPVENJOY"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="LPVENJOY" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
            <td style="text-align:left; padding-left:40px;">
                <asp:Label ID="LNPEENJOY" Text="" runat="server" />
            </td>
         </tr>

        <tr>
                <td style="text-align:left; padding-left:40px;">3.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEBLAME" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVBLAME" runat="server"  MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator ID="RegExLPVBLAME" CssClass="erroMsg" ValidationExpression="[0-3]"  SetFocusOnError="true" ControlToValidate="LPVBLAME"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator5" runat="server" ControlToValidate="LPVBLAME" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
            <td style="text-align:left; padding-left:40px;">
                <asp:Label ID="LNPEBLAME" Text="" runat="server" />
            </td>
         </tr>

        <tr>
                <td style="text-align:left; padding-left:40px;">4.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEANXUS" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVANXUS" runat="server"  MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator ID="RegExLPVANXUS" CssClass="erroMsg" ValidationExpression="[0-3]"  SetFocusOnError="true" ControlToValidate="LPVANXUS"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator6" runat="server" ControlToValidate="LPVANXUS" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
            <td style="text-align:left; padding-left:40px;">
                <asp:Label ID="LNPEANXUS" Text="" runat="server" />
            </td>
         </tr>

        <tr>
                <td style="text-align:left; padding-left:40px;">5.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEPANIC" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVPANIC" runat="server"  MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator ID="RegExLPVPANIC" CssClass="erroMsg" ValidationExpression="[0-3]"  SetFocusOnError="true" ControlToValidate="LPVPANIC"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="LPVPANIC" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
            <td style="text-align:left; padding-left:40px;">
                <asp:Label ID="LNPEPANIC" Text="" runat="server" />
            </td>
         </tr>
        
         <tr>
                <td style="text-align:left; padding-left:40px;">6.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPETOPYOU" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVTOPYOU" runat="server"  MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator ID="RegExLPVTOPYOU" CssClass="erroMsg" ValidationExpression="[0-3]"  SetFocusOnError="true" ControlToValidate="LPVTOPYOU"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator8" runat="server" ControlToValidate="LPVTOPYOU" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
             <td style="text-align:left; padding-left:40px;">
                <asp:Label ID="LNPETOPYOU" Text="" runat="server" />
            </td>
         </tr>

        <tr>
                <td style="text-align:left; padding-left:40px;">7.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEUNHAPY" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVUNHAPY" runat="server"  MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator ID="RegExLPVUNHAPY" CssClass="erroMsg" ValidationExpression="[0-3]"  SetFocusOnError="true" ControlToValidate="LPVUNHAPY"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator9" runat="server" ControlToValidate="LPVUNHAPY" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
             <td style="text-align:left; padding-left:40px;">
                <asp:Label ID="LNPEUNHAPY" Text="" runat="server" />
            </td>
         </tr>

        <tr>
                <td style="text-align:left; padding-left:40px;">8.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPESAD" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVSAD" runat="server"  MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator ID="RegExLPVSAD" CssClass="erroMsg" ValidationExpression="[0-3]"  SetFocusOnError="true" ControlToValidate="LPVSAD"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator10" runat="server" ControlToValidate="LPVSAD" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
            <td style="text-align:left; padding-left:40px;">
                <asp:Label ID="LNPESAD" Text="" runat="server" />
            </td>
         </tr>

        <tr>
                <td style="text-align:left; padding-left:40px;">9.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPECRY" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVCRY" runat="server"  MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator ID="RegExLPVCRY" CssClass="erroMsg" ValidationExpression="[0-3]"  SetFocusOnError="true" ControlToValidate="LPVCRY"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator11" runat="server" ControlToValidate="LPVCRY" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
            <td style="text-align:left; padding-left:40px;">
                <asp:Label ID="LNPECRY" Text="" runat="server" />
            </td>
         </tr>

        <tr>
                <td style="text-align:left; padding-left:40px;">10.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPEHARM" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="LPVHARM" runat="server"  MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator ID="RegExLPVHARM" CssClass="erroMsg" ValidationExpression="[0-3]"  SetFocusOnError="true" ControlToValidate="LPVHARM"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator12" runat="server" ControlToValidate="LPVHARM" OnServerValidate="CustVal_SectionABCDGeneric" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
             <td style="text-align:left; padding-left:40px;">
                <asp:Label ID="LNPEHARM" Text="" runat="server" />
            </td>
         </tr>
      <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionF" runat="server"   Text="Submit" />
                </td>
            </tr>
        </table>
      
        <table style="width:100%;font-size:26px;">
         <tr>
            <th colspan="4" class="SubSectionTitle"> Section G: Household Food Security 
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
                <asp:TextBox  AutoComplete="off" runat="server" ID="LPVWORRYFOOD" MaxLength="1"  Width="40"  /> <br />
                <asp:RequiredFieldValidator ID="ReqHFWORRYFOOD"  SetFocusOnError="true" ControlToValidate="LPVWORRYFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                <asp:RegularExpressionValidator ID="RegexHFWORRYFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="LPVWORRYFOOD" CssClass="erroMsg"  ErrorMessage="" runat="server"  />      
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
                    <asp:TextBox  AutoComplete="off" runat="server" ID="LPVWORRYTIMS" MaxLength="1"  Width="40" /><br />                    
                    <asp:RegularExpressionValidator ID="RegexHFWORRYTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" CssClass="erroMsg" ControlToValidate="LPVWORRYTIMS"   
                        ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CVHFWORRYTIMS" runat="server" ControlToValidate="LPVWORRYTIMS"  OnServerValidate="CustVal_HFWORRYTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVLACKFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFLACKFOOD"  SetFocusOnError="true" ControlToValidate="LPVLACKFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFLACKFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="LPVLACKFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVLACKTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFLACKTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="LPVLACKTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator22" runat="server" ControlToValidate="LPVLACKTIMS"  OnServerValidate="CustVal_HFLACKTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVLMTFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFLMTFOOD"  SetFocusOnError="true" ControlToValidate="LPVLMTFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFLMTFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="LPVLMTFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVLMTTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFLMTTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="LPVLMTTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                            <asp:CustomValidator ID="CustomValidator23" runat="server" ControlToValidate="LPVLMTTIMS"  OnServerValidate="CustVal_HFLMTTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVRESRCFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFRESRCFOOD"  SetFocusOnError="true" ControlToValidate="LPVRESRCFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFRESRCFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="LPVRESRCFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVRESRCTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFRESRCTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="LPVRESRCTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator24" runat="server" ControlToValidate="LPVRESRCTIMS"  OnServerValidate="CustVal_HFRESRCTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVSMALLFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFSMALLFOOD"  SetFocusOnError="true" ControlToValidate="LPVSMALLFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFSMALLFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="LPVSMALLFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVSMALLTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFSMALLTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="LPVSMALLTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator25" runat="server" ControlToValidate="LPVSMALLTIMS"  OnServerValidate="CustVal_HFSMALLTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVFEWFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFFEWFOOD"  SetFocusOnError="true" ControlToValidate="LPVFEWFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFFEWFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="LPVFEWFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVFEWTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFFEWTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="LPVFEWTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator26" runat="server" ControlToValidate="LPVFEWTIMS"  OnServerValidate="CustVal_HFFEWTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVNOFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFNOFOOD"  SetFocusOnError="true" ControlToValidate="LPVNOFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFNOFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="LPVNOFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVNOFOODTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFNOFOODTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="LPVNOFOODTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator27" runat="server" ControlToValidate="LPVNOFOODTIMS"  OnServerValidate="CustVal_HFNOFOODTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVHUNGRYFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFHUNGRYFOOD"  SetFocusOnError="true" ControlToValidate="LPVHUNGRYFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFHUNGRYFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="LPVHUNGRYFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVHUNGRYTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFHUNGRYTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="LPVHUNGRYTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator28" runat="server" ControlToValidate="LPVHUNGRYTIMS"  OnServerValidate="CustVal_HFHUNGRYTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVENGHFOOD" MaxLength="1" Enabled="true" Width="40" /><br />
                            <asp:RequiredFieldValidator ID="ReqHFENGHFOOD"  SetFocusOnError="true" ControlToValidate="LPVENGHFOOD"   ErrorMessage="" CssClass="erroMsg" runat="server" />
                            <asp:RegularExpressionValidator ID="RegExHFENGHFOOD" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="LPVENGHFOOD"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                       
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
                            <asp:TextBox  AutoComplete="off" runat="server" ID="LPVENGHTIMS" MaxLength="1" Enabled="true" Width="40" /><br />                            
                            <asp:RegularExpressionValidator ID="RegExHFENGHTIMS" ValidationExpression="1|2|3"  SetFocusOnError="true" ControlToValidate="LPVENGHTIMS"  CssClass="erroMsg" ErrorMessage="" runat="server"  />
                           <asp:CustomValidator ID="CustomValidator29" runat="server" ControlToValidate="LPVENGHTIMS"  OnServerValidate="CustVal_HFENGHTIMSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                        </td>
                        <td style="text-align:left; padding-left:10px;">                            
                            <asp:Label ID="LNHFENGHTIMS" Text="" runat="server" />       
                        </td>
                    </tr>
         <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionG" runat="server" Text="Submit" />
                </td>
            </tr>
        </table>
    
      <table style="width:100%; font-size:26px;">
           <tr>
            <td colspan="3" class="SubSectionTitle">
                Section H: Common Late Pregnancy Interventions
            </td>
        </tr>
          
          <tr>
              <td colspan="3" style="padding:10px 10px 10px 10px; text-align:left;">
                  <asp:Label ID="LBSECFINFO" runat="server" />
              </td>
          </tr>
            <tr>
                <t style="text-align:left; padding-left:40px;">#</td>
                <t style="text-align: left;"><b>Intervention</b></td>
                <td  style="text-align:left; padding-left:10px;"><b><asp:Label ID="LBINTRCODE" runat="server" /></b></td>
            </tr>

             <asp:Panel ID="PanelSecGQ1" runat="server">
                <tr>
                    <td style="text-align:left; padding-left:40px;">1.</td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLPVLDINS" Text="" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox  AutoComplete="off" ID="LPVLDINS" runat="server"  Width="40" MaxLength="1" />
                        <asp:RequiredFieldValidator ID="ReqtxtLPVLDINS" runat="server" ControlToValidate="LPVLDINS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" Enabled="false" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVLDINS" ControlToValidate="LPVLDINS" ValidationExpression="^[016]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator runat="server" ID="ValLPVLDINS"  OnServerValidate="Validate_LPVLDINS"  CssClass="erroMsg" />
                    </td>
                </tr>
           </asp:Panel>

                <tr>
                    <td style="text-align:left; padding-left:40px;">2.</td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLPVPICTPAMPH" Text="" runat="server" />
                        </td>
                    <td><asp:TextBox  AutoComplete="off" ID="LPVPICTPAMPH" runat="server"  Width="40" MaxLength="1" />
                        <asp:RequiredFieldValidator ID="ReqtxtLPVPICTPAMPH" runat="server" ControlToValidate="LPVPICTPAMPH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" Enabled="false" />    
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVPICTPAMPH" ControlToValidate="LPVPICTPAMPH" ValidationExpression="^[016]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator runat="server" ID="ValLPVPICTPAMPH"  OnServerValidate="Validate_LPVPICTPAMPH"  CssClass="erroMsg" />
                    </td>
                </tr>
            
           <asp:Panel ID="PanelSecGQ2" runat="server">
              <tr>
                    <td style="text-align:left; padding-left:40px;">3.</td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLPVCBK" Text="" runat="server" />
                        </td>
                    <td><asp:TextBox  AutoComplete="off" ID="LPVCBK" runat="server"  Width="40" MaxLength="1" />
                        <asp:RequiredFieldValidator ID="ReqtxtLPVCBK" runat="server" ControlToValidate="LPVCBK" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" Enabled="false" />    
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVCBK" ControlToValidate="LPVCBK" ValidationExpression="^[016]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator runat="server" ID="ValLPVCBK"  OnServerValidate="Validate_LPVCBK"  CssClass="erroMsg" />
                    </td>
                </tr>
           </asp:Panel>

            <%--<tr>
                <td style="text-align:left; padding-left:40px;">4.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPVBRSTFDTHERM" Text="" runat="server" />
                    </td>
                <td><asp:TextBox  AutoComplete="off" ID="LPVBRSTFDTHERM" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqLPVBRSTFDTHERM" runat="server" ControlToValidate="LPVBRSTFDTHERM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVBRSTFDTHERM" ControlToValidate="LPVBRSTFDTHERM" ValidationExpression="^[016]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>            
            
            <tr>
                <td style="text-align:left; padding-left:40px;">5.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPVCORDINS" Text="" runat="server" />
                    </td>
                <td><asp:TextBox  AutoComplete="off" ID="LPVCORDINS" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqLPVCORDINS" runat="server" ControlToValidate="LPVCORDINS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVCORDINS" ControlToValidate="LPVCORDINS" ValidationExpression="^[016]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>
            
            
            <tr>
                <td style="text-align:left; padding-left:40px;">6.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPVPOSTNAT" Text="" runat="server" />
                    </td>
                <td><asp:TextBox  AutoComplete="off" ID="LPVPOSTNAT" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqLPVPOSTNAT" runat="server" ControlToValidate="LPVPOSTNAT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVPOSTNAT" ControlToValidate="LPVPOSTNAT" ValidationExpression="^[016]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                </td>
            </tr>--%>
           <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionH" runat="server" Text="Submit" />
                </td>
            </tr>
          </table>
      
    <table style="width:100%; font-size:26px;">
        <tr>
            <td colspan="4" class="SubSectionTitle">
              Section I. Anthropometry / Measures
            </td>
        </tr>
        

        <tr>
                    <td style="text-align:left; padding-left:20px;">
                       1. 
                        </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLPEBLD2" runat="server" />
                        </td>
                    <td>
                        <asp:TextBox  AutoComplete="off" ID="LPVSYS2" runat="server" Width="70" MaxLength="3" />
                        /
                        <asp:TextBox  AutoComplete="off" ID="LPVDIA2" runat="server" Width="70" MaxLength="3"  onkeyup="RefreshUpdatePanel2();" AutoPostBack="true" />
                        <asp:Label ID="LBPEBLDUNT2" runat="server" />
                        <asp:CustomValidator ID="CustomValidator18" runat="server"  OnServerValidate="CustVal_Validate2DIA" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">                        
                        <asp:RegularExpressionValidator  ID="RegExLPVSYS2" runat="server" ControlToValidate="LPVSYS2" ValidationExpression="^(?:0[5-9]\d|1\d{2}|200|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>                        
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVDIA2" ControlToValidate="LPVDIA2" ValidationExpression="^(?:0(?:3[5-9]|[4-9]\d)|1(?:[0-3]\d|40)|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:CustomValidator ID="CustomValidator19" runat="server"  OnServerValidate="CustVal_Validate2SYSDIA" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                        <asp:Label ID="LNPRES2" runat="server" />
                    </td>                   
                </tr>

        <tr>
            <td> </td>
             <td style="text-align:left; padding-left:10px;">
                 1.  <asp:Label ID="LBTOB2" Text="" runat="server" />
                 
               </td>
            
               <td>
                   <%--<asp:UpdatePanel ID="UpdatePanel3" runat="server">--%>
                    <ContentTemplate>
                   <asp:Label ID="LBLPVTOB2HH" Text="" runat="server" /> 
                   <asp:TextBox  AutoComplete="off" ID="LPVTOB2HH" runat="server"  MaxLength="2" Width="60"  />                                      
                   <asp:RegularExpressionValidator ID="RegExLPVTOB2HH" runat="server" ControlToValidate="LPVTOB2HH" ValidationExpression="^(?:0[1-9]|1[012])$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />

                   <asp:Label ID="LBLPVTOB2MM" Text="" runat="server" /> 
                   <asp:TextBox  AutoComplete="off" ID="LPVTOB2MM" runat="server"  MaxLength="2" Width="60"  />
                   <asp:RegularExpressionValidator ID="RegExLPVTOB2MM" runat="server" ControlToValidate="LPVTOB2MM" ValidationExpression="^[0-5]\d$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                   
                   <asp:Label ID="LBLPVTOB2AMPM" Text="" runat="server" /> 
                  <%-- <asp:TextBox  AutoComplete="off" ID="LPVTOB2AMPM" runat="server"  MaxLength="1" Width="40"  />
                  <asp:RegularExpressionValidator ID="RegExLPVTOB2AMPM" runat="server" ControlToValidate="LPVTOB2AMPM" ValidationExpression="^[12]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />--%>
                   <asp:DropDownList ID="LPVTOB2AMPM" runat="server"  Width="70"  />
                   <asp:RequiredFieldValidator ID="ReqLPVTOB2AMPM"  SetFocusOnError="true" ControlToValidate="LPVTOB2AMPM"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />
                   <asp:CustomValidator ID="CustomValidator20" runat="server"  OnServerValidate="CustVal_ValidateTOB2AMPM" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                         </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="LPVDIA2" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
              </td>      
            <td  style="text-align:left; padding-left:10px;"><asp:Label ID="LNTOB2" Text="" runat="server" /> </td>
           </tr>
      

        <tr>
               <th colspan="4" style="padding:10px 10px 10px 10px; text-align:left;">
                   <asp:Label ID="LBLINSTPROTEIN" runat="server" />
               </th>
           </tr>

        <tr>
                    <td style="text-align:left; padding-left:20px;">
                       2.
                   </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLLPVPRTN" runat="server" />
                    </td>

                    <td>
                    <%--<asp:UpdatePanel ID="UpdatePanel4" runat="server">--%>
                    <ContentTemplate>
                        <asp:TextBox  AutoComplete="off" ID="LPVPRTN" runat="server" Width="40" MaxLength="1" />
                        <asp:RequiredFieldValidator ID="ReqLPVPRTN" runat="server" ControlToValidate="LPVPRTN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegLPVPRTN" ControlToValidate="LPVPRTN" ValidationExpression="0|1|6" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="LPVDIA2" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                        <asp:CustomValidator ID="CustomValidator74" runat="server"  OnServerValidate="CustVal_LPVPRTN" SetFocusOnError="true" Display="Dynamic" ControlToValidate="LPVPRTN"  CssClass="erroMsg" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LNLPVPRTN" runat="server" />
                    </td>
                </tr>
                   

        <tr>
                    <td style="text-align:left; padding-left:20px;">
                        2a.
                   </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLLPVPRTNRES" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox  AutoComplete="off" ID="LPVPRTNRES" runat="server" Width="40" MaxLength="1" />                        
                        <asp:RegularExpressionValidator runat="server" ID="RegLPVPRTNRES" ControlToValidate="LPVPRTNRES" ValidationExpression="0|1|2|3|4" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator21" runat="server"  OnServerValidate="CustVal_LPVPRTNRES" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" ControlToValidate="LPVPRTNRES"  CssClass="erroMsg" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LNLPVPRTNRES" runat="server" />
                    </td>
                </tr>  
        
        <tr>
               <th colspan="4" style="padding:10px 10px 10px 10px; text-align:left;">
                   <asp:Label ID="LBLRESTPROTEIN" runat="server" />
               </th>
           </tr>

        </table> 
    </asp:Panel> 

    
        <table>
         <tr>                
                <td>...</td>
                <td  style="text-align:left; padding-left:10px;">
                     <asp:Label ID="LBLDATASTAT" runat="server" />
                </td>
                <td   style="text-align:left; padding-left:10px;" colspan="2">
                    <asp:DropDownList ID="LPVCOMPFORM" runat="server"  Width="210"  />
                   <asp:RequiredFieldValidator ID="ReqDDFORMSTATUS"  SetFocusOnError="true" ControlToValidate="LPVCOMPFORM"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button runat="server" ID="ButtonSaveData" Text="Submit"   />             
                </td>
            </tr>
             </table>

     </div> 
</asp:Content>
