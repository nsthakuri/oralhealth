<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OH_MBAF.aspx.cs" Inherits="pages_OH_MBAF" %>
<%@ MasterType VirtualPath="../site.master" %>  
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Literal ID="LitCurWeek" runat="server" Visible="false" />
    <div class="page-card">
 <h2 class="page-title">105-Birth Assessment Form</h2>
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
             <td colspan="2">
                 <div class="Form">                   
                     <asp:Label ID="LBPREGINFO" runat="server" />
                 </div>
             </td>
         </tr>        

        <tr>  
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBDODEL" Text="" runat="server" />                     
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <div class="col-xs-1"> 
                        &nbsp; &nbsp; <asp:Label ID="LBOUTDD" Text="" runat="server" />   
                        <asp:TextBox  AutoComplete="off" runat="server" ID="OutCDay" MaxLength="2" Width="60" />
                        <asp:RequiredFieldValidator ID="ReqOutCDay" runat="server" ControlToValidate="OutCDay" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExOutCDay" ControlToValidate="OutCDay" ValidationExpression="0[1-9]|[1-2][0-9]|3[0-2]|99" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    </div>

                    <div class="col-xs-1"> 
                        <asp:Label ID="LBOUTMM" Text="" runat="server" />
                        <asp:TextBox  AutoComplete="off" runat="server" ID="OutCMonth" MaxLength="2"  Width="60" />
                        <asp:RequiredFieldValidator ID="ReqOutCMonth" runat="server" ControlToValidate="OutCMonth" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExOutCMonth" ControlToValidate="OutCMonth" ValidationExpression="0[1-9]|1[0-2]|99" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    </div> 
                                
                    <div class="col-xs-1">
                        &nbsp; &nbsp; <asp:Label ID="LBOUTYY" Text="" runat="server" />                           
                        <asp:TextBox  AutoComplete="off" runat="server" ID="OutCYear"  MaxLength="2" Width="60"  onkeyup="RefreshUpdatePanel();" AutoPostBack="true"  />
                        <asp:RequiredFieldValidator ID="ReqOutCYear" runat="server" ControlToValidate="OutCYear" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExOutCYear" ControlToValidate="OutCYear" ValidationExpression="79|80|81|82" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator runat="server" ID="cvOutcome" OnServerValidate="Validate_OutComeDate" ValidateEmptyText="true" CssClass="erroMsg" />
                    </div>  
                </td> 
            </tr>

            
          <tr>
               <td style="text-align:left; padding-left:10px;">
                   2.<asp:Label ID="LBGESTAGE" Text="" runat="server" />                      
               </td>
              
               <td style="text-align:left; padding-left:10px;">                        
                   <%--<asp:UpdatePanel ID="Update1" runat="server">--%>
                    <ContentTemplate>  
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBGESTAGE"  MaxLength="3" Width="70" />
                   <asp:RequiredFieldValidator  ID="ReqMBGESTAGE" runat="server" ControlToValidate="MBGESTAGE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                   <asp:RegularExpressionValidator runat="server" ID="RegExMBGESTAGE" ControlToValidate="MBGESTAGE" ValidationExpression="^\d{3}$" SetFocusOnError="true" ErrorMessage=""  Display="Dynamic" CssClass="erroMsg" />

                       <asp:Label ID="ErrMBGest" runat="server" CssClass="successMsg" />                       
                       <asp:CustomValidator ID="CustomValidator8" runat="server" ControlToValidate="OutCYear"  EnableClientScript="false" OnServerValidate="CustVal_MBGESTAGERequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>                                        
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="OutCYear" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                   <asp:Label ID="LBLGESTAGE" Text="" runat="server" />
              </td>
           </tr>
            
            

            <tr>
               <td style="text-align:left; padding-left:10px;">
                   3.<asp:Label ID="LBMBBABYCNT" Text="" runat="server" />
               </td>
            
               <td style="text-align:left; padding-left:10px;">                   
                   <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABYNUM"  MaxLength="1" Width="40"  onkeyup="RefreshChildNumRowUpdatePanel();" AutoPostBack="true"  />
                   <asp:RequiredFieldValidator ID="ReqMBBABYCNT" runat="server" ControlToValidate="MBBABYNUM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                   <asp:RegularExpressionValidator runat="server" ID="RegExMBBABYCNT" ControlToValidate="MBBABYNUM" ValidationExpression="^[0123]$" SetFocusOnError="true" ErrorMessage=""  Display="Dynamic" CssClass="erroMsg" />                   
                   <asp:CustomValidator ID="cvMBBABYNUM" runat="server" ControlToValidate="MBBABYNUM" OnServerValidate="CustVal_MBBABYNUMValidation" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                   <asp:Label ID="LBCBABYCNT" Text="" runat="server" />
              </td>
           </tr>

         </table>

       <table>
            <tr>
                <td colspan="6" style="text-align:left; padding-left:10px;">
           4.<asp:Label ID="LBLOUTCOME" Text="" runat="server" />
                    </td>                
            </tr>

            <tr>
                <td>
                    <asp:Label ID="LBLINFTCNT" Text="" runat="server" />
                </td>
                <td>(a)
                    <asp:Label ID="LBLMBCRY" Text="" runat="server" />
                </td>
                <td>(b)
                    <asp:Label ID="LBLMBMVE" Text="" runat="server" />
                </td>
                <td>(c)
                    <asp:Label ID="LBLMBBRTH" Text="" runat="server" />
                </td>
                <td>(d)
                    <asp:Label ID="LBLMBPREG" Text="" runat="server" />
                </td>
                <td>(e)
                    <asp:Label ID="LBLMBCURVS" Text="" runat="server" />
                </td>
            </tr>             

            
            <tr>
                <td></td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBCRYRES" Text="" runat="server" />
                   </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBMVERES" Text="" runat="server" />
                    </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBBRTHRES" Text="" runat="server" />
                    </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBPREGRES" Text="" runat="server" />
                    </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBCURVSRES" Text="" runat="server" />
                    </td>                
            </tr>

            <tr>
                <td>#1
                    <asp:CustomValidator ID="CustomValidator68" runat="server"  OnServerValidate="CustVal_Infant1Required" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                </td>
                <td> 
                   <%--<asp:UpdatePanel ID="UpdatePanel12" runat="server">--%>
                    <ContentTemplate>  
                   <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY1CRY" MaxLength="1"  Width="40"  /> 
                    <asp:RequiredFieldValidator ID="ReqMBINFT1CRY"  Enabled="false"  runat="server" ControlToValidate="MBBABY1CRY" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator ID="RegExMBINFT1CRY" CssClass="erroMsg" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="MBBABY1CRY"   ErrorMessage="" runat="server"  />                    
                        </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABY1BRE" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                     <%--<asp:UpdatePanel ID="UpdatePanel13" runat="server">--%>
                    <ContentTemplate>  
                        <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY1MVE" MaxLength="1"  Width="40"  /> 
                    <asp:RequiredFieldValidator ID="ReqMBINFT1MVE"  Enabled="false" runat="server" ControlToValidate="MBBABY1MVE" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator ID="RegExMBINFT1MVE" CssClass="erroMsg" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="MBBABY1MVE"   ErrorMessage="" runat="server"  />
                        </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABY1BRE" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                     <%--<asp:UpdatePanel ID="UpdatePanel14" runat="server">--%>
                    <ContentTemplate>  
                        <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY1BRE"  MaxLength="1" Width="40"  onkeyup="RefreshUpdatePanelBaby1Breath();" AutoPostBack="true"  />
                    <asp:RequiredFieldValidator ID="ReqMBINFT1BRE"  Enabled="false" runat="server" ControlToValidate="MBBABY1BRE" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator ID="RegExMBINFT1BRE" CssClass="erroMsg" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="MBBABY1BRE"   ErrorMessage="" runat="server"  />
                        </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABY1BRE" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel11" runat="server">--%>
                    <ContentTemplate>  
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY1OUT" MaxLength="1"  Width="40"  /> 
                    <asp:RequiredFieldValidator ID="ReqMBINFT1OUT"  Enabled="false" runat="server" ControlToValidate="MBBABY1OUT" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator ID="RegExMBINFT1OUT" CssClass="erroMsg" ValidationExpression="1|2|3|9"  SetFocusOnError="true" ControlToValidate="MBBABY1OUT"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator6" runat="server" ControlToValidate="MBBABY1OUT" OnServerValidate="CustVal_MBBABY1OUTRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
					
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABY1BRE" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel15" runat="server">--%>
                    <ContentTemplate>  
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY1CURVS" MaxLength="1"  Width="40"  /> 
                    <asp:RequiredFieldValidator  Enabled="false" ID="ReqMBINFT1CURVS" runat="server" ControlToValidate="MBBABY1CURVS" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" />
                    <asp:RegularExpressionValidator ID="RegExMBINFT1CURVS" CssClass="erroMsg" ValidationExpression="1|8|9"  SetFocusOnError="true" ControlToValidate="MBBABY1CURVS"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator53" runat="server" ControlToValidate="MBBABY1CURVS" OnServerValidate="CustVal_MBBABY1CURVSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABY1BRE" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
            </tr>

           
            
                   
                <tr>
                <td>#2
                    <asp:CustomValidator ID="CustomValidator19" runat="server"  OnServerValidate="CustVal_Infant2Required" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                </td>
                <td> 
                   <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
                       <ContentTemplate> 
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY2CRY" MaxLength="1"  Width="40"  />                     
                    <asp:RegularExpressionValidator ID="RegExMBINFT2CRY" CssClass="erroMsg" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="MBBABY2CRY"   ErrorMessage="" runat="server"  />
                   </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABYNUM" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">--%>
                       <ContentTemplate> 
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY2MVE" MaxLength="1"  Width="40"  />                     
                    <asp:RegularExpressionValidator ID="RegExMBINFT2MVE" CssClass="erroMsg" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="MBBABY2MVE"   ErrorMessage="" runat="server"  />
                           </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABYNUM" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel3" runat="server">--%>
                       <ContentTemplate> 
                      <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY2BRE"  MaxLength="1" Width="40"  onkeyup="RefreshUpdatePanelBaby2Breath();" AutoPostBack="true" />
                      <asp:RegularExpressionValidator ID="RegExMBINFT2BRE" CssClass="erroMsg" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="MBBABY2BRE"   ErrorMessage="" runat="server"  />
                           </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABYNUM" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel4" runat="server">--%>
                       <ContentTemplate> 
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY2OUT" MaxLength="1"  Width="40"  />                     
                    <asp:RegularExpressionValidator ID="RegExMBINFT2OUT" CssClass="erroMsg" ValidationExpression="1|2|3|9"  SetFocusOnError="true" ControlToValidate="MBBABY2OUT"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator9" runat="server" ControlToValidate="MBBABY2OUT" OnServerValidate="CustVal_MBBABY2OUTRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                           </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABYNUM" />
                        <asp:AsyncPostBackTrigger ControlID="MBBABY2BRE" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel5" runat="server">--%>
                       <ContentTemplate> 
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY2CURVS" MaxLength="1"  Width="40"  />                     
                    <asp:RegularExpressionValidator ID="RegExMBINFT2CURVS" CssClass="erroMsg" ValidationExpression="1|8|9"  SetFocusOnError="true" ControlToValidate="MBBABY2CURVS"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator54" runat="server" ControlToValidate="MBBABY2CURVS" OnServerValidate="CustVal_MBBABY2CURVSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                           </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABYNUM" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
            </tr>
            
                    
            
            <tr>
                <td>#3</td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel6" runat="server">--%>
                       <ContentTemplate> 
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY3CRY" MaxLength="1"  Width="40"  />                     
                    <asp:RegularExpressionValidator ID="RegExMBINFT3CRY" CssClass="erroMsg" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="MBBABY3CRY"   ErrorMessage="" runat="server"  />
                           </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABYNUM" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel7" runat="server">--%>
                       <ContentTemplate> 
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY3MVE" MaxLength="1"  Width="40"  />                     
                    <asp:RegularExpressionValidator ID="RegExMBINFT3MVE" CssClass="erroMsg" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="MBBABY3MVE"   ErrorMessage="" runat="server"  />
                           </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABYNUM" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel8" runat="server">--%>
                       <ContentTemplate>
                           <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY3BRE"  MaxLength="1" Width="40"  onkeyup="RefreshUpdatePanelBaby3Breath();" AutoPostBack="true"  />
                    <asp:RegularExpressionValidator ID="RegExMBINFT3BRE" CssClass="erroMsg" ValidationExpression="0|1|9"  SetFocusOnError="true" ControlToValidate="MBBABY3BRE"   ErrorMessage="" runat="server"  />
                           </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABYNUM" />                        
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel9" runat="server">--%>
                       <ContentTemplate> 
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY3OUT" MaxLength="1"  Width="40"  />                     
                    <asp:RegularExpressionValidator ID="RegExMBINFT3OUT" CssClass="erroMsg" ValidationExpression="1|2|3|9"  SetFocusOnError="true" ControlToValidate="MBBABY3OUT"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator10" runat="server" ControlToValidate="MBBABY3OUT" OnServerValidate="CustVal_MBBABY3OUTRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                           </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABYNUM" />
                        <asp:AsyncPostBackTrigger ControlID="MBBABY3BRE" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
                <td> 
                    <%--<asp:UpdatePanel ID="UpdatePanel10" runat="server">--%>
                       <ContentTemplate> 
                    <asp:TextBox  AutoComplete="off" runat="server" ID="MBBABY3CURVS" MaxLength="1"  Width="40"  />                     
                    <asp:RegularExpressionValidator ID="RegExMBINFT3CURVS" CssClass="erroMsg" ValidationExpression="1|8|9"  SetFocusOnError="true" ControlToValidate="MBBABY3CURVS"   ErrorMessage="" runat="server"  />
                    <asp:CustomValidator ID="CustomValidator55" runat="server" ControlToValidate="MBBABY3CURVS" OnServerValidate="CustVal_MBBABY3CURVSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                           </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBBABYNUM" />
                    </Triggers>
                  <%--</asp:UpdatePanel>--%>
                </td>
            </tr>



            <tr>
             <td colspan="6" style="background:#efefef; padding:10px 10px 10px 10px; text-align:left;">               
                 <asp:Label ID="LBLOUTCNOTE" runat="server" />
            </td>
         </tr>   

        </table>

        <table>
            <tr>
             <td colspan="2">
                 <div class="Form">                   
                     <asp:Label ID="LBCONSENT" runat="server" />
                 </div>
             </td>
         </tr>    
       

            <tr>
              
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBVS" Text="" runat="server" />                    
                </td>
               <td style="text-align:left; padding-left:10px;">
                   <asp:DropDownList ID="MBVS" runat="server"  Width="210"  />                                         
                   <asp:RequiredFieldValidator ID="ReqMBVS"  SetFocusOnError="true" ControlToValidate="MBVS"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />                    
              </td>                
            </tr>

         <tr>
            <td  style="text-align:left;  padding-left:10px;">                
                <asp:Label ID="LBMBMS" Text="" runat="server" />                
            </td>
            <td  style="text-align:left; padding-left:10px;">
                <asp:DropDownList ID="MBMS" runat="server" Width="210"  /> 
            </td>
        </tr>

        <tr>
            <td  style="text-align:left; padding-left:10px;">                
                <asp:Label ID="LBMBFS" Text="" runat="server" />               
            </td>
            <td style="text-align:left; padding-left:10px;">
                <asp:DropDownList ID="MBFS" runat="server" Width="210"  />                 
                <asp:CustomValidator ID="cvMBFS" runat="server" ControlToValidate="MBFS" OnServerValidate="CustVal_MBFSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
            </td>
        </tr>
             <tr>
                <td colspan="2">
                    <asp:Button ID="ButtonConsent" runat="server"  CssClass="btn btn-primary" Text="Save"  CausesValidation="true"/>
                </td>
            </tr>
            </table>
        


          <table>
              <tr>
                  <td colspan="2">&nbsp;</td>
              </tr>
          <tr>
            <th class="SubSectionTitle" style="width:50%;">                
                 <asp:Label ID="LBLALLOCODE" runat="server" />           
            </th>

            <th class="SubSectionTitle"  style="width:50%;">
                [ <asp:Literal runat="server" ID="MBAFAllocCode" /> ]
            </th>
        </tr>
               <tr>
                  <td colspan="2">&nbsp;</td>
              </tr>
          </table>
  
    <table>
         <tr>
            <td colspan="4">
               <div class="Form">
                  Section A: Maternal Morbidity before Childbirth
               </div>
            </td>
        </tr>

            <tr>
                <td>....</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBACOLA" Text="" runat="server" />
                    </td>
                <td>
                    <asp:Label ID="LBACOLB" Text="" runat="server" />
                      </td>
                <td>
                    <asp:Label ID="LBACOLC" Text="" runat="server" />
                      </td>                                
            </tr>

            <tr>
                <td>1.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBVAGBLD30" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBVAGBLD30" runat="server"  Width="40" MaxLength="1" />                    
                    <asp:RequiredFieldValidator ID="ReqMBVAGBLD30" runat="server" ControlToValidate="MBVAGBLD30" ErrorMessage="req" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBVAGBLD30" ControlToValidate="MBVAGBLD30" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBVAGBLD7" runat="server"  Width="40" MaxLength="1" />                                        
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBVAGBLD7" ControlToValidate="MBVAGBLD7" ValidationExpression="^[019]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />                                        
                    <asp:CustomValidator ID="cvMBVAGBLD7" runat="server" ControlToValidate="MBVAGBLD7" OnServerValidate="CustVal_VaginalBleedingRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>                
            </tr>


            <tr>
                <td></td>
                <td style="text-align:left; padding-left:10px;">
                    1a. <asp:Label ID="LBMBVBLDD30" Text="" runat="server" />                   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBVBLDD30" runat="server"  Width="60" MaxLength="2" />
                    <asp:CustomValidator ID="cvMBVBLDD30" runat="server" ControlToValidate="MBVBLDD30" OnServerValidate="CustVal_VaginalBleedingRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBVBLDD30" runat="server" ControlToValidate="MBVBLDD30" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^(?:0[1-9]|[12]\d|30|99)$" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBVBLDD7" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvMBVBLDD7" runat="server" ControlToValidate="MBVBLDD7" OnServerValidate="CustVal_RequiredIfVagBld7" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegMBVBLDD7" runat="server" ControlToValidate="MBVBLDD7" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[01-79]$"/>
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    1b.<asp:Label ID="LBMBVBLDLAP30" Text="" runat="server" />                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBVBLDLAP30" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvMBVBLDLAP30" runat="server" ControlToValidate="MBVBLDLAP30" OnServerValidate="CustVal_VaginalBleedingRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBVBLDLAP30" runat="server" ControlToValidate="MBVBLDLAP30" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBVBLDLAP7" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvMBVBLDLAP7" runat="server" ControlToValidate="MBVBLDLAP7" OnServerValidate="CustVal_RequiredIfVagBld7b" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBVBLDLAP7" runat="server" ControlToValidate="MBVBLDLAP7" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
            </tr>

            <tr>
                <td>2.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBCONV30" Text="" runat="server" />                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBCONV30" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqMBCONV30" runat="server" ControlToValidate="MBCONV30" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBCONV30" runat="server" ControlToValidate="MBCONV30" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBCONV7" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExMBCONV7" runat="server" ControlToValidate="MBCONV7" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                    <asp:CustomValidator ID="cvMBCONV7" runat="server" ControlToValidate="MBCONV7" OnServerValidate="CustVal_MBCONV7Required" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td>3.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBFVR30" Text="" runat="server" />                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBFVR30" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqMBFVR30" runat="server" ControlToValidate="MBFVR30" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBFVR30" runat="server" ControlToValidate="MBFVR30" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBFVR7" runat="server"  Width="40" MaxLength="1" />                    
                    <asp:RegularExpressionValidator ID="RegExMBFVR7" runat="server" ControlToValidate="MBFVR7" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                    <asp:CustomValidator ID="cvMBFVR7" runat="server" ControlToValidate="MBFVR7" OnServerValidate="CustVal_MBFVR7Required" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td>4.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBSWELL30" Text="" runat="server" />                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBSWELL30" runat="server"   Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqMBSWELL30" runat="server" ControlToValidate="MBSWELL30" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBSWELL30" runat="server" ControlToValidate="MBSWELL30" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBSWELL7" runat="server"  Width="40" MaxLength="1" />                    
                    <asp:RegularExpressionValidator ID="RegExMBSWELL7" runat="server" ControlToValidate="MBSWELL7" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                    <asp:CustomValidator ID="cvMBSWELL7" runat="server" ControlToValidate="MBSWELL7" OnServerValidate="CustVal_MBSWELL7Required" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                </td>
            </tr>
       
            <tr>
                <td>5.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBHEAD30" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBHEAD30" runat="server"  Width="40" MaxLength="1" />
                   <asp:RequiredFieldValidator ID="ReqMBHEAD30" runat="server" ControlToValidate="MBHEAD30" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                   <asp:RegularExpressionValidator ID="RegExMBHEAD30" runat="server" ControlToValidate="MBHEAD30" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBHEAD7" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExMBHEAD7" runat="server" ControlToValidate="MBHEAD7" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                    <asp:CustomValidator ID="cvMBHEAD7" runat="server" ControlToValidate="MBHEAD7" OnServerValidate="CustVal_MBHEAD7Required" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td>6.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBACCINJ30" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBACCINJ30" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqMBACCINJ30" runat="server" ControlToValidate="MBACCINJ30" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                     <asp:RegularExpressionValidator ID="RegExMBACCINJ30" runat="server" ControlToValidate="MBACCINJ30" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBACCINJ7" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExMBACCINJ7" runat="server" ControlToValidate="MBACCINJ7" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                    <asp:CustomValidator ID="cvMBACCINJ7" runat="server" ControlToValidate="MBACCINJ7" OnServerValidate="CustVal_MBACCINJ7Required" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td colspan="3" style="text-align:left; padding-left:10px;">
                   6a. <asp:Label ID="LBMBACCINJSP" Text="" runat="server" />
                   
                    <asp:TextBox  AutoComplete="off" ID="MBACCINJSP" runat="server"  Width="250px" MaxLength="255" />
                    <asp:CustomValidator ID="cvMBACCINJSP" runat="server" ControlToValidate="MBACCINJSP" OnServerValidate="CustVal_RequiredIfAccident" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
            </tr>

           <tr>
                <td>7.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBBMOVEDAYS" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBBMOVEDAYS" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqMBBMOVEDAYS" runat="server" ControlToValidate="MBBMOVEDAYS"  ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBBMOVEDAYS" runat="server" ControlToValidate="MBBMOVEDAYS" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                 </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBBMOVEDAYS" Text="" runat="server" />
                </td>              
            </tr>

            <tr>
                <td>8.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBBMOVELAST" Text="" runat="server" />
                       
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBBMOVELAST" runat="server"  Width="60" MaxLength="2" />
                    <asp:RequiredFieldValidator ID="ReqMBBMOVELAST" runat="server" ControlToValidate="MBBMOVELAST" ErrorMessage=""  SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBBMOVELAST" runat="server" ControlToValidate="MBBMOVELAST" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^\d{2}$"/>
                 </td>
                <td style="text-align:left; padding-left:10px;" >
                <asp:Label ID="LCMBBMOVELAST" Text="" runat="server" />    
                </td>
            </tr>

            <tr>
                <td>9.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBMONPREG" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBMONTHSPREG" runat="server"  Width="60" MaxLength="2" />
                    <asp:RequiredFieldValidator ID="ReqMBMONTHSPREG" runat="server" ControlToValidate="MBMONTHSPREG" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBMONTHSPREG" runat="server" ControlToValidate="MBMONTHSPREG" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^(?:0[1-9]|10|99)$"/>
                    <asp:CustomValidator ID="cvMBMONTHSPREG" runat="server" ControlToValidate="MBMONTHSPREG" OnServerValidate="CustVal_ValidatePregMonWithPEF" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBMONPREG" Text="" runat="server" />                    
                </td>
            </tr>

            <tr>
                <td>10.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBANTECARE" Text="" runat="server" />                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBANTECARE" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqMBANTECARE" runat="server" ControlToValidate="MBANTECARE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBANTECARE" runat="server" ControlToValidate="MBANTECARE" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^\d$"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBANTECARE" Text="" runat="server" />
                </td>
            </tr>
        <asp:Panel Visible="false" runat="server" ID="PanelNote1">
      <tr>
            <th colspan="4">
               <div style="background:#efefef; padding:10px 10px 10px 10px; text-align:center;">
                   <asp:Label ID="LBLNOTE1" runat="server" /> </div>
                
            </th>
       </tr>
        </asp:Panel>

         <tr>
            <td colspan="4">
                <asp:Button ID="ButtonSectionA" runat="server"  CssClass="btn btn-primary" Text="Save" />
            </td>
        </tr>
        </table> 
   
    <table>
    <tr>
            <th colspan="4" class="SubSectionTitle"> Section B: Birth Location 
            </th>
        </tr>

            <tr>
                <td>1.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBDELLOC" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBDELLOC" runat="server" Width="40" MaxLength="1" onkeyup="RefreshUpdateFacilityPanel();" AutoPostBack="true"  />
                    <asp:CustomValidator ID="cvMBDELLOC" runat="server" ControlToValidate="MBDELLOC" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBDELLOC" runat="server" ControlToValidate="MBDELLOC" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-6]$"/>
                    <asp:RequiredFieldValidator ID="ReqMBDELLOC" runat="server" ControlToValidate="MBDELLOC" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBDELLOC" Text="" runat="server" />
                </td>
            </tr>


            <tr>
                <td>2.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBFACILITY" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:Panel ID="PanelTemp3" runat="server" Visible="false">
                    <asp:TextBox  AutoComplete="off" ID="TEMPMBFACILITY" runat="server"  Width="60" MaxLength="2" />                    
                    <asp:RegularExpressionValidator ID="RegExMBFACILITY" runat="server" ControlToValidate="MBFACILITY" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^0*([1-9]|[1-8][0-9]|9[0-8]|99)$"/>
                        <asp:CustomValidator ID="cvMBFACILITY" runat="server" ControlToValidate="MBFACILITY" OnServerValidate="CustVal_RequiredIfInsideFacility" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/> 
                      <button id="ButtonFacility" onclick="viewFacility()"                         
                        >स्वास्थ्य संस्थाको नाम हेर्नुहोस् </button>
                        <asp:Label ID="LCMBFACILITY" Text="" runat="server" />
                    </asp:Panel>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <%--<asp:UpdatePanel ID="UpdatePanel111" runat="server">--%>
                    <ContentTemplate> 
                        <asp:DropDownList ID="MBFACILITY" runat="server" />
                        <asp:CustomValidator ID="CustomValidator67" runat="server" ControlToValidate="MBFACILITY" OnServerValidate="CustVal_RequiredFacility" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/> 
                    </ContentTemplate> 
                       <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="MBDELLOC" />
                    </Triggers>
                    <%--</asp:UpdatePanel>--%>
                    
                </td>
            </tr>

        <tr>
           <td></td>
           <td>
               <asp:Label ID="LBLFACSPC" Text="" runat="server" />
                   &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="MBFACILITYSP" runat="server"  Width="250" MaxLength="150" />
           </td>
           <td><asp:CustomValidator ID="CustomValidator66" runat="server" 
                            ControlToValidate="MBFACILITYSP" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredMBFACILITYSP" SetFocusOnError="true" 
                            ValidateEmptyText="true" /></td>
           <td></td>
       </tr>
            
            <tr>
                <td>3.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBREASONA" Text="" runat="server" />
                    
                </td>
                <td>
                    A <asp:TextBox  AutoComplete="off" ID="MBREASONA" runat="server"  Width="40" MaxLength="1" />
                     <asp:CustomValidator ID="cvMBREASONA" runat="server" ControlToValidate="MBREASONA" OnServerValidate="CustVal_RequiredIfInsideFacility" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                     <asp:RegularExpressionValidator ID="RegExMBREASONA" runat="server" ControlToValidate="MBREASONA" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-59]$"/>
                     <asp:CustomValidator ID="cvMBREASONACmp" runat="server" ControlToValidate="MBREASONA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td rowspan="3" style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBREASONA" Text="" runat="server" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    B <asp:TextBox  AutoComplete="off" ID="MBREASONB" runat="server"  Width="40" MaxLength="1" />
                        <asp:RegularExpressionValidator ID="RegExMBREASONB" runat="server" ControlToValidate="MBREASONB" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-59]$"/>
                    <asp:CustomValidator ID="CustomValidator58" runat="server" 
                            ControlToValidate="MBREASONB" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredReason" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>                
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    C <asp:TextBox  AutoComplete="off" ID="MBREASONC" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExMBREASONC" runat="server" ControlToValidate="MBREASONC" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-59]$"/>
                    <asp:CustomValidator ID="CustomValidator59" runat="server" 
                            ControlToValidate="MBREASONC" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredReason" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>                
            </tr>
            <tr>
                <td colspan="4" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCMBREASONSP" runat="server" />
                                   
                    <asp:TextBox  AutoComplete="off" ID="MBREASONSP" runat="server"  Width="250" MaxLength="150" />
                    <asp:CustomValidator ID="cvMBREASONSP" runat="server" ControlToValidate="MBREASONSP" OnServerValidate="CustVal_RequiredIfDelLocReasonOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
            </tr>
        
        <tr>
            <td colspan="4">
                <asp:Button ID="ButtonSectionB" runat="server"  CssClass="btn btn-primary" Text="Save" />
            </td>
        </tr>
        </table>
    
    <table>
            <tr>
            <th colspan="4" class="SubSectionTitle">Section C: Labor and Delivery 
            </th>
        </tr>

        <tr>
                <td>1.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBDELTYP" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBDELTYP" runat="server"  Width="40" MaxLength="1" />                    
                    <asp:RegularExpressionValidator ID="RegExMBDELTYP" runat="server" ControlToValidate="MBDELTYP" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[12]$"/>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="MBDELTYP" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>                   
                    <asp:RequiredFieldValidator ID="ReqMBDELTYP" runat="server" ControlToValidate="MBDELTYP" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LNMBDELTYP" Text="" runat="server" />
                </td>
            </tr>

            

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    1a.<asp:Label ID="LBLMBWHYCSEC" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBWHYCSEC" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="MBWHYCSEC" OnServerValidate="CustVal_RequiredMBWHYCSEC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>                   
                    <asp:RegularExpressionValidator ID="RegExMBWHYCSEC" runat="server" ControlToValidate="MBWHYCSEC" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-9]$"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LNMBWHYCSEC" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td colspan="2"  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBWHYCSECSP" Text="" runat="server" />
                    
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="MBWHYCSECSP" runat="server"  Width="210" MaxLength="150" />                    
                    <asp:CustomValidator ID="CustomValidator56" runat="server" ControlToValidate="MBWHYCSECSP" OnServerValidate="CustVal_RequiredMBWHYCSECSP" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>                   
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="Label8" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    1b.<asp:Label ID="LBLMBWHOCSEC" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBWHOCSEC" runat="server"  Width="40" MaxLength="1" />                    
                    <asp:RegularExpressionValidator ID="RegExMBWHOCSEC" runat="server" ControlToValidate="MBWHOCSEC" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="0|1|9"/>
                    <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="MBWHOCSEC" OnServerValidate="CustVal_RequiredMBWHOCSEC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LNMBWHOCSEC" Text="" runat="server" />
                </td>
            </tr>
        
          <tr>
                <td>2.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBCOMP" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBCOMP" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqMBCOMP" runat="server" ControlToValidate="MBCOMP" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBCOMP" runat="server" ControlToValidate="MBCOMP" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                    <asp:CustomValidator ID="cvMBCOMP" runat="server" ControlToValidate="MBCOMP" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>                    
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBCOMP" Text="" runat="server" />
                </td>
            </tr>


            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    2a.<asp:Label ID="LBMBCOMPA" Text="" runat="server" />                    
                </td>
                <td>
                    A <asp:TextBox  AutoComplete="off" ID="MBCOMPA" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvMBCOMPA" runat="server" ControlToValidate="MBCOMPA" OnServerValidate="CustVal_RequiredIfOutsideFacilityDelComp" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBCOMPA" runat="server" ControlToValidate="MBCOMPA" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-69]$"/>
                    <asp:CustomValidator ID="cvMBCOMPACmp" runat="server" ControlToValidate="MBCOMPA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td rowspan="3" style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBCOMPA" Text="" runat="server" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    B <asp:TextBox  AutoComplete="off" ID="MBCOMPB" runat="server"  Width="40" MaxLength="1" />                    
                    <asp:RegularExpressionValidator ID="RegExMBCOMPB" runat="server" ControlToValidate="MBCOMPB" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-69]$"/>
                    <asp:CustomValidator ID="cvMBCOMPB" runat="server" 
                            ControlToValidate="MBCOMPB" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValidation" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    C <asp:TextBox  AutoComplete="off" ID="MBCOMPC" runat="server"  Width="40" MaxLength="1" />                    
                    <asp:RegularExpressionValidator ID="RegExMBCOMPC" runat="server" ControlToValidate="MBCOMPC" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-69]$"/>
                    <asp:CustomValidator ID="CustomValidator57" runat="server" 
                            ControlToValidate="MBCOMPC" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValidation" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
            </tr>
        <tr>
         <td colspan="4" style="text-align:left; padding-left:10px;" >
             <asp:Label ID="LCMBCOMPSP" runat="server" />
         &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="MBCOMPSP" runat="server"  Width="250" MaxLength="150" />
                    <asp:CustomValidator ID="cvMBCOMPSP" runat="server" ControlToValidate="MBCOMPSP" OnServerValidate="CustVal_RequiredIfFacilityCompOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
            </tr>

            <tr>
                <td>3.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBLBRPAIN" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLBRPAIN" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLBRPAIN" ControlToValidate="MBLBRPAIN" ValidationExpression="1|2|3|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator20" runat="server" ControlToValidate="MBLBRPAIN" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LNMBLBRPAIN" Text="" runat="server" />
                </td>
            </tr>
           
           
            <tr>
                    <td>
                        4.</td>
                    <td   style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLLBLMBLBRPAIN" Text="" runat="server" />   
                    </td>
                    <td >
                        <div class="col-xs-1"> 
                            <asp:Label ID="LBLMBLBRPAINDay" Text="" runat="server" /> 
                            <asp:TextBox  AutoComplete="off" ID="MBLBRPAINDay" runat="server" MaxLength="2" Width="60" />
                        </div>

                        <div class="col-xs-1"> 
                            <asp:Label ID="LBLMBLBRPAINMon" Text="" runat="server" />   
                            <asp:TextBox  AutoComplete="off" ID="MBLBRPAINMonth" runat="server" MaxLength="2" Width="60" />
                        </div>

                        <div class="col-xs-1"> 
                            <asp:Label ID="LBLMBLBRPAINYear" Text="" runat="server" />   
                            <asp:TextBox  AutoComplete="off" ID="MBLBRPAINYear" runat="server" 
                            MaxLength="2" Width="60" />      
                        </div>
                        
                        <asp:RegularExpressionValidator ID="RegExMBLBRPAINDay" runat="server" 
                            ControlToValidate="MBLBRPAINDay" CssClass="erroMsg" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="^(?:0[1-9]|[12]\d|3[012]|99)$" />
                        
                        <asp:RegularExpressionValidator ID="RegExMBLBRPAINMonth" runat="server" 
                            ControlToValidate="MBLBRPAINMonth" CssClass="erroMsg" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="^(?:0[1-9]|1[012])$" />
                       
                        <asp:RegularExpressionValidator ID="RegExMBLBRPAINYear" runat="server" 
                            ControlToValidate="MBLBRPAINYear" CssClass="erroMsg" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="78|79|80" />
                        <asp:CustomValidator ID="cvMBLBRPAIN" runat="server"  OnServerValidate="CustVal_ValidateContractDate" SetFocusOnError="true" Display="Dynamic"  ValidateEmptyText="true" CssClass="erroMsg" />
                        
                    </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLINSLMP" runat="server" Text="" />
                </td>
                </tr>

            <tr>
            <td>5. </td>
              <td style="text-align:left; padding-left:10px;">
                   <asp:Label ID="LBMBTOLP" Text="" runat="server" />
               </td>
            
               <td>
                   <div class="col-xs-1">
                       <asp:Label ID="LBMBTOLPHH" Text="" runat="server" /> 
                       <asp:TextBox  AutoComplete="off" ID="MBTOLPHH" runat="server"  MaxLength="2" Width="60"  />                   
                       <asp:RegularExpressionValidator ID="RegExMBTOLPHH" runat="server" ControlToValidate="MBTOLPHH" ValidationExpression="^(?:0[1-9]|1[012])$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                   </div>

                   <div class="col-xs-1">
                       <asp:Label ID="LBMBTOLPMM" Text="" runat="server" /> 
                       <asp:TextBox  AutoComplete="off" ID="MBTOLPMM" runat="server"  MaxLength="2" Width="60"  />
                       <asp:RegularExpressionValidator ID="RegExMBTOLPMM" runat="server" ControlToValidate="MBTOLPMM" ValidationExpression="^[0-5]\d$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                   </div>
                   
                   <div class="col-xs-1">
                       <asp:Label ID="LBMBTOLPAMPM" Text="" runat="server" /> 
                       <%--<asp:TextBox  AutoComplete="off" ID="MBTOLPAMPM" runat="server"  MaxLength="1" Width="40"  />
                        <asp:RegularExpressionValidator ID="RegExMBTOLPAMPM" runat="server" ControlToValidate="MBTOLPAMPM" ValidationExpression="^[12]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />--%>

                       <asp:DropDownList ID="MBTOLPAMPM" runat="server"  Width="70"  />

                    </div>
                   

              </td>      
            <td  style="text-align:left; padding-left:10px;"> 

                <asp:Label ID="LNMBTOLP" Text="" runat="server" />
            </td>
           </tr>

            
            <tr>
                <td>6.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBWTRBRK" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBWTRBRK" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBWTRBRK" ControlToValidate="MBWTRBRK" ValidationExpression="1|2|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator21" runat="server" ControlToValidate="MBWTRBRK" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LNMBWTRBRK" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                    <td>
                        7.</td>
                    <td   style="text-align:left; padding-left:10px;">                        
                        <asp:Label ID="LBLMBWTRBRKS" Text="" runat="server" />   
                    </td>
                    <td >
                        <div class="col-xs-1"> 
                            <asp:Label ID="LBLMBWTRBRKDay" Text="" runat="server" /> 
                            <asp:TextBox  AutoComplete="off" ID="MBWTRBRKDay" runat="server" MaxLength="2" Width="60" />
                        </div>

                        <div class="col-xs-1"> 
                            <asp:Label ID="LBLMBWTRBRKMon" Text="" runat="server" />   
                            <asp:TextBox  AutoComplete="off" ID="MBWTRBRKMonth" runat="server" MaxLength="2" Width="60" />
                        </div>

                        <div class="col-xs-1"> 
                            <asp:Label ID="LBLMBWTRBRKYear" Text="" runat="server" />   
                            <asp:TextBox  AutoComplete="off" ID="MBWTRBRKYear" runat="server" 
                            MaxLength="2" Width="60" />      
                        </div>
                                                
                        <asp:RegularExpressionValidator ID="RegExMBWTRBRKDay" runat="server" 
                            ControlToValidate="MBWTRBRKDay" CssClass="erroMsg" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="^(?:0[1-9]|[12]\d|3[012]|99)$" />
                        
                        <asp:RegularExpressionValidator ID="RegExMBWTRBRKMonth" runat="server" 
                            ControlToValidate="MBWTRBRKMonth" CssClass="erroMsg" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="^(?:0[1-9]|1[012])$" />
                        <asp:RegularExpressionValidator ID="RegExMBWTRBRKYear" runat="server" 
                            ControlToValidate="MBWTRBRKYear" CssClass="erroMsg" Display="Dynamic" 
                            ErrorMessage="" 
                            SetFocusOnError="true" ValidationExpression="78|79|80" />
                        <asp:CustomValidator ID="cvMBWTRBRK" runat="server" ControlToValidate="MBWTRBRKDay" OnServerValidate="CustVal_ValidateWaterBreakTime" SetFocusOnError="true" Display="Dynamic"  ValidateEmptyText="true" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="MBWTRBRKDay" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                        <asp:CustomValidator ID="CustomValidator23" runat="server" ControlToValidate="MBWTRBRKMonth" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                        <asp:CustomValidator ID="CustomValidator24" runat="server" ControlToValidate="MBWTRBRKYear" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="Label3" runat="server" Text="" />
                </td>
                </tr>

            <tr>
            <td>8. </td>
              <td style="text-align:left; padding-left:10px;">
                   <asp:Label ID="LBTOWB" Text="" runat="server" />
               </td>
            
               <td>
                   <div class="col-xs-1">
                       <asp:Label ID="LBMBTOWBHH" Text="" runat="server" /> 
                       <asp:TextBox  AutoComplete="off" ID="MBTOWBHH" runat="server"  MaxLength="2" Width="60"  />                                      
                       <asp:RegularExpressionValidator ID="RegExMBTOWBHH" runat="server" ControlToValidate="MBTOWBHH" ValidationExpression="^(?:0[1-9]|1[012])$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    </div>

                   <div class="col-xs-1">
                       <asp:Label ID="LBMBTOWBMM" Text="" runat="server" /> 
                       <asp:TextBox  AutoComplete="off" ID="MBTOWBMM" runat="server"  MaxLength="2" Width="60"  />                   
                       <asp:RegularExpressionValidator ID="RegExMBTOWBMM" runat="server" ControlToValidate="MBTOWBMM" ValidationExpression="^[0-5]\d$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                   </div>

                   <div class="col-xs-1">
                       <asp:Label ID="LBMBTOWBAMPM" Text="" runat="server" /> 
                       <asp:DropDownList ID="MBTOWBAMPM" runat="server"  Width="70"  />
                       
                      <%--<asp:TextBox  AutoComplete="off" ID="MBTOWBAMPM" runat="server"  MaxLength="1" Width="40"  />                   
                      <asp:RegularExpressionValidator ID="RegExMBTOWBAMPM" runat="server" ControlToValidate="MBTOWBAMPM" ValidationExpression="^[12]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />--%>
                    </div>
                   <asp:CustomValidator ID="CustomValidator25" runat="server" ControlToValidate="MBTOWBHH" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                   <asp:CustomValidator ID="CustomValidator26" runat="server" ControlToValidate="MBTOWBMM" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                   <asp:CustomValidator ID="CustomValidator27" runat="server" ControlToValidate="MBTOWBAMPM" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>

              </td>      
            <td  style="text-align:left; padding-left:10px;"> 

                <asp:Label ID="LNTOWB" Text="" runat="server" />
            </td>
           </tr>

            <tr>
            <td>9. </td>
               <td style="text-align:left; padding-left:10px;">
                   <asp:Label ID="LBLNMBWHNWTRBRK" Text="" runat="server" />
               </td>
            
               <td>
                   <asp:TextBox  AutoComplete="off" ID="MBWHNWTRBRK" runat="server"  MaxLength="1" Width="40"  />                   
                   <asp:RegularExpressionValidator runat="server" ID="RegExMBWHNWTRBRK" ControlToValidate="MBWHNWTRBRK" ValidationExpression="1|2|3|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                   <asp:CustomValidator ID="CustomValidator22" runat="server" ControlToValidate="MBWHNWTRBRK" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                   <asp:CustomValidator ID="CustomValidator69" runat="server" ControlToValidate="MBWHNWTRBRK" OnServerValidate="CustVal_WaterBreakVal" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                   </td>
               <td  style="text-align:left; padding-left:10px;">
                   <asp:Label ID="LNMBWHNWTRBRK" Text="" runat="server" />
               </td>
            </tr>
        <tr>
            <td colspan="5">
                <asp:Button ID="ButtonSectionCA" runat="server"  CssClass="btn btn-primary" Text="Save" />
            </td>
        </tr>
        </table>

 
    <table>
        
             <tr>
                 <td colspan="5">
                     <asp:CustomValidator ID="CustomValidator2" runat="server"  OnServerValidate="CustVal_ValidateQuesTen" SetFocusOnError="true" Display="Dynamic"  ValidateEmptyText="true" CssClass="erroMsg" />                        
                 </td>
             </tr>

         <tr>
            <td>10.</td>
            <td style="text-align:left; padding-left:10px;">                    
                a. <asp:Label ID="LBLLBRPAIN" runat="server" />  
            </td>
            <td style="text-align:left; padding-left:10px;">
                
                </td>
            <td style="text-align:left; padding-left:10px;">
                b.<asp:Label ID="LBLLBRPAINWH" runat="server" />
                </td>
            <td style="text-align:left; padding-left:10px;">
                c.<asp:Label ID="LBLLBRPAININJ" runat="server" />
            </td>
        </tr>

           <tr>
            <td></td>
            <td></td>
            <td><asp:Label ID="LBLLBRPAINYN" runat="server" /></td>
            <td><asp:Label ID="LBLLBRPAINWHCODE" runat="server" /></td>
            <td><asp:Label ID="LBLLBRPAININJCODE" runat="server" /></td>
        </tr>


            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    i.<asp:Label ID="LBLMBLPHOME" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPHOME" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPHOME" ControlToValidate="MBLPHOME" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPWHOHOME" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPWHOHOME" ControlToValidate="MBLPWHOHOME" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvMBLPWHOHOME" runat="server" ControlToValidate="MBLPWHOHOME" OnServerValidate="CustVal_RequiredMBLPWHOHOME" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    
                    ii. <asp:Label ID="LBLMBLPMSG" runat="server" /> </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPMSG" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPMSG" ControlToValidate="MBLPMSG" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPWHOMSG" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPWHOMSG" ControlToValidate="MBLPWHOMSG" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvMBLPWHOMSG" runat="server" ControlToValidate="MBLPWHOMSG" OnServerValidate="CustVal_RequiredMBLPWHOMSG" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">                    
                    iii. <asp:Label ID="LBLMBLPABDN" runat="server" /> </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPABDN" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPABDN" ControlToValidate="MBLPABDN" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPWHOABDN" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPWHOABDN" ControlToValidate="MBLPWHOABDN" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvMBLPWHOABDN" runat="server" ControlToValidate="MBLPWHOABDN" OnServerValidate="CustVal_RequiredMBLPWHOABDN" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>


            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    
                    iv. <asp:Label ID="LBLMBLPMISPTRL" runat="server" /> </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPMISPTRL" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPMISPTRL" ControlToValidate="MBLPMISPTRL" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPWHOMISPTRL" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPWHOMISPTRL" ControlToValidate="MBLPWHOMISPTRL" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvMBLPWHOMISPTRL" runat="server" ControlToValidate="MBLPWHOMISPTRL" OnServerValidate="CustVal_RequiredMBLPWHOMISPTRL" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    
                    v. <asp:Label ID="LBLMBLPINJ" runat="server" /> </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPINJ" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPINJ" ControlToValidate="MBLPINJ" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPWHOINJ" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPWHOINJ" ControlToValidate="MBLPWHOINJ" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvMBLPWHOINJ" runat="server" ControlToValidate="MBLPWHOINJ" OnServerValidate="CustVal_RequiredMBLPWHOINJ" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPINJGIVN" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPINJGIVN" ControlToValidate="MBLPINJGIVN" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator5" runat="server" ControlToValidate="MBLPINJGIVN" OnServerValidate="CustVal_RequiredMBLPINJGIVN" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
            </tr>


            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    
                    vi. <asp:Label ID="LBLMBLPINDUCSP" runat="server" />
                    <asp:TextBox  AutoComplete="off" ID="MBLPINDUCSP" runat="server" MaxLength="150" Width="250" />
                    <asp:CustomValidator ID="CustomValidator11" runat="server" ControlToValidate="MBLPINDUCSP" OnServerValidate="CustVal_RequiredMBLPINDUCSP" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPINDUCOTH" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPINDUCOTH" ControlToValidate="MBLPINDUCOTH" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBLPWHOINDUCOTH" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBLPWHOINDUCOTH" ControlToValidate="MBLPWHOINDUCOTH" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvMBLPWHOINDUCOTH" runat="server" ControlToValidate="MBLPWHOINDUCOTH" OnServerValidate="CustVal_RequiredMBLPWHOINDUCOTH" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>
        <tr>
            <td colspan="5">
                <asp:Button ID="ButtonSectionCB" runat="server" CssClass="btn btn-primary" Text="Save" />
            </td>
        </tr>
        </table>

    
   <table>
            <tr>
                <td >11.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBASSTDELA" Text="" runat="server" />                    
                </td>
                <td>
                    A <asp:TextBox  AutoComplete="off" ID="MBASSTDELA" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvMBASSTDELA" runat="server" ControlToValidate="MBASSTDELA" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                    <asp:RegularExpressionValidator ID="RegExMBASSTDELA" runat="server" ControlToValidate="MBASSTDELA" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[0-79]$"/>
                    <asp:CustomValidator ID="cvMBASSTDELACmp" runat="server" ControlToValidate="MBASSTDELA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td rowspan="3" style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBASSTDELA" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>
                    B <asp:TextBox  AutoComplete="off" ID="MBASSTDELB" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvMBASSTDELB" runat="server" ControlToValidate="MBASSTDELB" OnServerValidate="CustVal_RequiredMBASSTDEL" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBASSTDELB" runat="server" ControlToValidate="MBASSTDELB" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[0-79]$"/>
                </td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>
                    C <asp:TextBox  AutoComplete="off" ID="MBASSTDELC" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator28" runat="server" ControlToValidate="MBASSTDELC" OnServerValidate="CustVal_RequiredMBASSTDEL" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBASSTDELC" runat="server" ControlToValidate="MBASSTDELC" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[0-79]$"/>
                </td>
            </tr>

            <tr>
                <td>12.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBWASHSOAP" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBWASHSOAP" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvMBWASHSOAP" runat="server" ControlToValidate="MBWASHSOAP" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBWASHSOAP" runat="server" ControlToValidate="MBWASHSOAP" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBWASHSOAP" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                <td>13.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBPAINHRS" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBPAINHRS" runat="server"  Width="60" MaxLength="2" />
                    <asp:CustomValidator ID="cvMBPAINHRS" runat="server" ControlToValidate="MBPAINHRS" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBPAINHRS" runat="server" ControlToValidate="MBPAINHRS" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^\d{2}$"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBPAINHRS" Text="" runat="server" />
                </td>
            </tr>


            <tr>
                <td>14.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBWTRBRCOLOR" Text="" runat="server" />
                   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBWTRBRCOLOR" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvMBWTRBRCOLOR" runat="server" ControlToValidate="MBWTRBRCOLOR" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBWTRBRCOLOR" runat="server" ControlToValidate="MBWTRBRCOLOR" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-49]$"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBWTRBRCOLOR" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                <td colspan="4" style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBWTRBRCOLORSP" runat="server" />
                  &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="MBWTRBRCOLORSP" runat="server"  Width="250" MaxLength="25" />
                    <asp:CustomValidator ID="cvMBWTRBRCOLORSP" runat="server" ControlToValidate="MBWTRBRCOLORSP" OnServerValidate="CustVal_RequiredIfWtrColorOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
            </tr>

            <tr>
                <td>15.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBWTRFOUL" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBWTRFOUL" runat="server"   Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvMBWTRFOUL" runat="server" ControlToValidate="MBWTRFOUL" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBWTRFOUL" runat="server" ControlToValidate="MBWTRFOUL" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBWTRFOUL" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                <td>16.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBFVRLBRDEL" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBFVRLBRDEL" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvMBFVRLBRDEL" runat="server" ControlToValidate="MBFVRLBRDEL" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBFVRLBRDEL" runat="server" ControlToValidate="MBFVRLBRDEL" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBFVRLBRDEL" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                <td>17.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBDELHRS" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBDELHRS" runat="server"  Width="60" MaxLength="2" />
                    <asp:CustomValidator ID="cvMBDELHRS" runat="server" ControlToValidate="MBDELHRS" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBDELHRS" runat="server" ControlToValidate="MBDELHRS" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^\d{2}$"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBDELHRS" Text="" runat="server" />
                 </td>
            </tr>
       <tr>
            <td colspan="5">
                <asp:Button ID="ButtonSectionCC" runat="server" CssClass="btn btn-primary" Text="Save" />
            </td>
        </tr>
           </table>

    

    <table>
            <tr>
                <td>18</td>
                <td style="text-align:left; padding-left:10px;">
                    a.	<asp:Label ID="LBLINDUCE" runat="server" />
                <td style="text-align:left; padding-left:10px;">
                    
                    </td>
                <td style="text-align:left; padding-left:10px;">
                    b.<asp:Label ID="LBLINDUCEWH" runat="server" />
                <td style="text-align:left; padding-left:10px;">
                    c.	<asp:Label ID="LBLINDUCEINJ" runat="server" />
                   </td>
            </tr>

        <tr>
                <td></td>
                <td style="text-align:left; padding-left:10px;">
                    	 
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLINDUCEYN" runat="server" />
                    </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLINDUCEWHCODE" runat="server" />
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLINDUCEINJCODE" runat="server" />
                   </td>
            </tr>

            <tr>
                <td></td>
                <td   style="text-align:left; padding-left:10px;">
                    i.<asp:Label ID="LBLMBALHOME" runat="server" />
                     </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALHOME" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALHOME" ControlToValidate="MBALHOME" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator47" runat="server" ControlToValidate="MBALHOME" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALWHOHOME" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALWHOHOME" ControlToValidate="MBALWHOHOME" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator29" runat="server" ControlToValidate="MBALWHOHOME" OnServerValidate="CustVal_RequiredMBALWHOHOME" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    ii. <asp:Label ID="LBLMBALMSG" runat="server" />
                     </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALMSG" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALMSG" ControlToValidate="MBALMSG" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator46" runat="server" ControlToValidate="MBALMSG" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALWHOMSG" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALWHOMSG" ControlToValidate="MBALWHOMSG" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator30" runat="server" ControlToValidate="MBALWHOMSG" OnServerValidate="CustVal_RequiredMBALWHOMSG" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    iii. <asp:Label ID="LBLMBALABDN" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALABDN" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALABDN" ControlToValidate="MBALABDN" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator45" runat="server" ControlToValidate="MBALABDN" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALWHOABDN" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALWHOABDN" ControlToValidate="MBALWHOABDN" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator31" runat="server" ControlToValidate="MBALWHOABDN" OnServerValidate="CustVal_RequiredMBALWHOABDN" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>


            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    iv.<asp:Label ID="LBLMBFORCEP" runat="server" />
                     </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBFORCEP" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBFORCEP" ControlToValidate="MBFORCEP" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator44" runat="server" ControlToValidate="MBFORCEP" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBWHOFORCEP" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBWHOFORCEP" ControlToValidate="MBWHOFORCEP" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator32" runat="server" ControlToValidate="MBWHOFORCEP" OnServerValidate="CustVal_RequiredMBWHOFORCEP" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    v.<asp:Label ID="LBLMBVCUM" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBVCUM" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBVCUM" ControlToValidate="MBVCUM" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator43" runat="server" ControlToValidate="MBVCUM" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBWHOVCUM" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBWHOVCUM" ControlToValidate="MBWHOVCUM" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator33" runat="server" ControlToValidate="MBWHOVCUM" OnServerValidate="CustVal_RequiredMBWHOVCUM" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>


            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    vi. <asp:Label ID="LBLMBALMISPTRL" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALMISPTRL" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALMISPTRL" ControlToValidate="MBALMISPTRL" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator42" runat="server" ControlToValidate="MBALMISPTRL" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALWHOMISPTRL" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALWHOMISPTRL" ControlToValidate="MBALWHOMISPTRL" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator34" runat="server" ControlToValidate="MBALWHOMISPTRL" OnServerValidate="CustVal_RequiredMBALWHOMISPTRL" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>


            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    vii. <asp:Label ID="LBLMBALINJ" runat="server" />
                     </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALINJ" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALINJ" ControlToValidate="MBALINJ" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator41" runat="server" ControlToValidate="MBALINJ" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALWHOINJ" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALWHOINJ" ControlToValidate="MBALWHOINJ" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator35" runat="server" ControlToValidate="MBALWHOINJ" OnServerValidate="CustVal_RequiredMBALWHOINJ" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALINJGIVN" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALINJGIVN" ControlToValidate="MBALINJGIVN" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator36" runat="server" ControlToValidate="MBALINJGIVN" OnServerValidate="CustVal_RequiredMBALINJGIVN" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    viii.<asp:Label ID="LBLMBALEPSTMY" runat="server" />
                      </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALEPSTMY" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALEPSTMY" ControlToValidate="MBALEPSTMY" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator40" runat="server" ControlToValidate="MBALEPSTMY" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALWHOEPSTMY" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALWHOEPSTMY" ControlToValidate="MBALWHOEPSTMY" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator37" runat="server" ControlToValidate="MBALWHOEPSTMY" OnServerValidate="CustVal_RequiredMBALWHOEPSTMY" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>


            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    ix. <asp:Label ID="LBLMBALINDUCSP" runat="server" />
                    
                    <asp:TextBox  AutoComplete="off" ID="MBALINDUCSP" runat="server" MaxLength="150" Width="250" />
                    <asp:CustomValidator ID="CustomValidator12" runat="server" ControlToValidate="MBALINDUCSP" OnServerValidate="CustVal_RequiredMBALINDUCSP" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALINDUCOTH" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALINDUCOTH" ControlToValidate="MBALINDUCOTH" ValidationExpression="0|1|9" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator39" runat="server" ControlToValidate="MBALINDUCOTH" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBALWHOINDUCOTH" runat="server" MaxLength="1" Width="40" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExMBALWHOINDUCOTH" ControlToValidate="MBALWHOINDUCOTH" ValidationExpression="^[1-9]$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator38" runat="server" ControlToValidate="MBALWHOINDUCOTH" OnServerValidate="CustVal_RequiredMBALWHOINDUCOTH" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
                <td>
                </td>
            </tr>
        <tr>
            <td colspan="5">
                <asp:Button ID="ButtonSectionCD" runat="server" CssClass="btn btn-primary" Text="Save" />
            </td>
        </tr>
        </table>
    

    <table>
            <tr>
                <td>19.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBORAL" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBORAL" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator50" runat="server" ControlToValidate="MBORAL" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                    <asp:RegularExpressionValidator ID="RegExMBORAL" runat="server" ControlToValidate="MBORAL" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>                    
                </td>
                <td   style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBORAL" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                <td> 
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBORALA" Text="" runat="server" />
                                  
                </td>
                <td>
                    A <asp:TextBox  AutoComplete="off" ID="MBORALA" runat="server"  Width="40" MaxLength="1" /> <br />                    
                    <asp:CustomValidator ID="cvMBORALA" runat="server" ControlToValidate="MBORALA" OnServerValidate="CustVal_RequiredIfBabyGivenOral" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBORALA" runat="server" ControlToValidate="MBORALA" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-49]$"/>
                    <asp:CustomValidator ID="cvMBORALACmp" runat="server" ControlToValidate="MBORALA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>

                    <br />
                    B <asp:TextBox  AutoComplete="off" ID="MBORALB" runat="server"  Width="40" MaxLength="1" /> <br />
                    <asp:RegularExpressionValidator ID="RegExMBORALB" runat="server" ControlToValidate="MBORALB" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-49]$"/>
                    <asp:CustomValidator ID="CustomValidator60" runat="server" 
                            ControlToValidate="MBORALB" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValORAL" SetFocusOnError="true" 
                            ValidateEmptyText="true" />

                    <br />
                    C <asp:TextBox  AutoComplete="off" ID="MBORALC" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExMBORALC" runat="server" ControlToValidate="MBORALC" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-49]$"/>
                    <asp:CustomValidator ID="CustomValidator61" runat="server" 
                            ControlToValidate="MBORALC" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValORAL" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBORALA" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                <td colspan="4" style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LBMBTABLETSP" Text="" runat="server" />
                &nbsp;&nbsp;&nbsp;    
                    <asp:TextBox  AutoComplete="off" ID="MBORALSP" runat="server"  Width="250" MaxLength="75" />
                    <asp:CustomValidator ID="cvMBORALSP" runat="server" ControlToValidate="MBORALSP" OnServerValidate="CustVal_RequiredIfBabyGivenOralOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
            </tr>

            <tr>
                <td>20.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBPLACENTA" Text="" runat="server" />
                   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBPLACENTA" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="CustomValidator48" runat="server" ControlToValidate="MBPLACENTA" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                    <asp:RegularExpressionValidator ID="RegExMBPLACENTA" runat="server" ControlToValidate="MBPLACENTA" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBPLACENTA" Text="" runat="server" />
                </td>
            </tr>

            <tr>
                <td>
                </td>
                <td style="text-align:left; padding-left:10px;">
                   20a. <asp:Label ID="LBMBPLACHELPA" Text="" runat="server" />
                    
                </td>
                <td>
                    A <asp:TextBox  AutoComplete="off" ID="MBPLACHELPA" runat="server"  Width="40" MaxLength="1" /><br />
                    <asp:CustomValidator ID="cvMBPLACHELPA" runat="server" ControlToValidate="MBPLACHELPA" OnServerValidate="CustVal_RequiredMBPLACHELPA" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBPLACHELPA" runat="server" ControlToValidate="MBPLACHELPA" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-9]$"/>
                    <asp:CustomValidator ID="CustomValidator49" runat="server" ControlToValidate="MBPLACHELPA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>

                    <br />
                    B <asp:TextBox  AutoComplete="off" ID="MBPLACHELPB" runat="server"  Width="40" MaxLength="1" /><br />
                    <asp:RegularExpressionValidator ID="RegExMBPLACHELPB" runat="server" ControlToValidate="MBPLACHELPB" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-9]$"/>
                    <asp:CustomValidator ID="CustomValidator62" runat="server" 
                            ControlToValidate="MBPLACHELPB" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValPlacenta" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                
                    <br />
                    C <asp:TextBox  AutoComplete="off" ID="MBPLACHELPC" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExMBPLACHELPC" runat="server" ControlToValidate="MBPLACHELPC" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-9]$"/>
                    <asp:CustomValidator ID="CustomValidator63" runat="server" 
                            ControlToValidate="MBPLACHELPC" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValPlacenta" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBPLACHELPA" Text="" runat="server" />
                </td>
            </tr>
           

            <tr>
                <td colspan="4"  style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LBMBPLACHELPSP" Text="" runat="server" />                     
                    <asp:TextBox  AutoComplete="off" ID="MBPLACHELPSP" runat="server"  Width="250" MaxLength="150" />
                    <asp:CustomValidator ID="cvMBPLACHELPSP" runat="server" ControlToValidate="MBPLACHELPSP" OnServerValidate="CustVal_RequiredMBPLACHELPSP" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
            </tr>


            <tr>
                <td >
                </td>
                <td style="text-align:left; padding-left:10px;">
                   20b. <asp:Label ID="LBMBPLACINJA" Text="" runat="server" />
                                      
                </td>
                <td>
                    A <asp:TextBox  AutoComplete="off" ID="MBPLACINJA" runat="server"  Width="40" MaxLength="1" /><br />
                    <asp:CustomValidator ID="cvMBPLACINJA" runat="server" ControlToValidate="MBPLACINJA" OnServerValidate="CustVal_RequiredIfPlacentaInj" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBPLACINJA" runat="server" ControlToValidate="MBPLACINJA" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-69]$"/>
                    <asp:CustomValidator ID="cvMBPLACINJACmp" runat="server" ControlToValidate="MBPLACINJA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    
                    <br />
                    B <asp:TextBox  AutoComplete="off" ID="MBPLACINJB" runat="server"  Width="40" MaxLength="1" /><br />                    
                    <asp:RegularExpressionValidator ID="RegExMBPLACINJB" runat="server" ControlToValidate="MBPLACINJB" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-69]$"/>
                    <asp:CustomValidator ID="CustomValidator64" runat="server" 
                            ControlToValidate="MBPLACINJB" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValInject" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                    
                    <br />
                    C <asp:TextBox  AutoComplete="off" ID="MBPLACINJC" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExMBPLACINJC" runat="server" ControlToValidate="MBPLACINJC" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[1-69]$"/>
                    <asp:CustomValidator ID="CustomValidator65" runat="server" 
                            ControlToValidate="MBPLACINJC" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValInject" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBPLACINJA" Text="" runat="server" />                    
                </td>
            </tr>

            

            <tr>
                <td colspan="4"  style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LBMBPLACINJSP" Text="" runat="server" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="MBPLACINJSP" runat="server"  Width="250" MaxLength="75" />
                    <asp:CustomValidator ID="cvMBPLACINJSP" runat="server" ControlToValidate="MBPLACINJSP" OnServerValidate="CustVal_RequiredIfPlacentaInjOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
            </tr>
    
            <tr>
            <td >21.</td>
            <td  style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBMBPLACHRS" Text="" runat="server" />
                
            </td>
            <td>
                <asp:TextBox  AutoComplete="off" ID="MBPLACHRS" runat="server"  Width="60" MaxLength="2" />
                <br />
                <asp:Label ID="LBPLAHR" Text="" runat="server" />
                <br />
                <asp:TextBox  AutoComplete="off" ID="MBPLACMIN" runat="server"  Width="60" MaxLength="2" />
                <br />
                <asp:Label ID="LBPLAMIN" Text="" runat="server" />
            </td>
            <td>
                <asp:Label ID="LCPLAHHMIN" Text="" runat="server" />
                <asp:CustomValidator ID="CustomValidator18" runat="server" ControlToValidate="MBPLACHRS" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>                      
                <asp:CustomValidator ID="cvMBPLACHRS99" runat="server" ControlToValidate="MBPLACHRS" OnServerValidate="CustVal_ValidatePlacenta99" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                <asp:RegularExpressionValidator ID="RegExMBPLACHRS" runat="server" ControlToValidate="MBPLACHRS" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^(?:0[0-9]|1[012]|99)$"/>

                <asp:CustomValidator ID="CustomValidator51" runat="server" ControlToValidate="MBPLACMIN" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                <asp:CustomValidator ID="cvMBPLACMIN99" runat="server" ControlToValidate="MBPLACMIN" OnServerValidate="CustVal_ValidatePlacenta99" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                <asp:RegularExpressionValidator ID="RegExMBPLACMIN" runat="server" ControlToValidate="MBPLACMIN" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^(?:[0-5]\d|99)$"/>

            </td>
            </tr>
            

            <tr>
                <td>22.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBMBPLACWHOLE" Text="" runat="server" />
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBPLACWHOLE" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExMBPLACWHOLE" runat="server" ControlToValidate="MBPLACWHOLE" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^[019]$"/>
                    <asp:CustomValidator ID="CustomValidator52" runat="server" ControlToValidate="MBPLACWHOLE" OnServerValidate="CustVal_RequiredIfMiscarriageOrAbortion" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>  
                </td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCMBPLACWHOLE" Text="" runat="server" />
                </td>
            </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="ButtonSectionCE" runat="server" CssClass="btn btn-primary" Text="Save" />
            </td>
        </tr>
        
        </table>
    
    <table>
        <tr>
            <td colspan="4" class="SubSectionTitle"> Section D: Anthropometry/Measures 
            </td>
        </tr>
        <tr>
                <td  style="text-align:left; padding-left:20px;">
                    1.
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLMBWT1" runat="server" />
                </td>
                 <td>
                   <asp:TextBox  AutoComplete="off" ID="MBWT1Whole" runat="server" Width="60" MaxLength="2" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="MBWT1Fract" runat="server" Width="40" MaxLength="1" />                    
                    <asp:Label ID="LBLLPVWT1UNT" runat="server" />
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqLPVWT1Whole" runat="server" ControlToValidate="MBWT1Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RequiredFieldValidator ID="ReqLPVWT1Fract" runat="server" ControlToValidate="MBWT1Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT1Whole" ControlToValidate="MBWT1Whole" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT1Fract" ControlToValidate="MBWT1Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="cvLPVWT1" runat="server"  OnServerValidate="CustVal_Validate1Weight" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
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
                   <asp:TextBox  AutoComplete="off" ID="MBWT2Whole" runat="server" Width="60" MaxLength="2" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="MBWT2Fract" runat="server" Width="40" MaxLength="1" />                    
                    <asp:Label ID="LBLLPVWT2UNT" runat="server" />                                
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqLPVWT2Whole" runat="server" ControlToValidate="MBWT2Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RequiredFieldValidator ID="ReqLPVWT2Fract" runat="server" ControlToValidate="MBWT2Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT2Whole" ControlToValidate="MBWT2Whole" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT2Fract" ControlToValidate="MBWT2Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator13" runat="server"  OnServerValidate="CustVal_Validate2Weight" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
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
                   <asp:TextBox  AutoComplete="off" ID="MBWT3Whole" runat="server" Width="60" MaxLength="2" />
                    .
                    <asp:TextBox  AutoComplete="off" ID="MBWT3Fract" runat="server" Width="40" MaxLength="1" />                    
                    <asp:Label ID="LBLLPVWT3UNT" runat="server" />                                
                </td>

                <td  style="text-align:left; padding-left:10px;">
                    <asp:RequiredFieldValidator ID="ReqLPVWT3Whole" runat="server" ControlToValidate="MBWT3Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RequiredFieldValidator ID="ReqLPVWT3Fract" runat="server" ControlToValidate="MBWT3Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT3Whole" ControlToValidate="MBWT3Whole" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator runat="server" ID="RegExLPVWT3Fract" ControlToValidate="MBWT3Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator14" runat="server"  OnServerValidate="CustVal_Validate3Weight" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                    <asp:Label ID="LNWT3" runat="server" />
                </td>
           </tr>


            <tr>
                    <td style="text-align:left; padding-left:20px;">
                        2.
                        </td>
                    <td style="text-align:left; padding-left:10px;">
                       <asp:Label ID="LBMUAC1" runat="server" />
                         </td>
                    <td>
                         <asp:TextBox  AutoComplete="off" ID="MBMUAC1Whole" runat="server"  Width="60" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="MBMUAC1Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLPVMUAC1UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC1Whole" runat="server" ControlToValidate="MBMUAC1Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC1Fract" runat="server" ControlToValidate="MBMUAC1Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC1Whole" ControlToValidate="MBMUAC1Whole" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC1Fract" ControlToValidate="MBMUAC1Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator15" runat="server" OnServerValidate="CustVal_Validate1MUAC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
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
                         <asp:TextBox  AutoComplete="off" ID="MBMUAC2Whole" runat="server"  Width="60" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="MBMUAC2Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLPVMUAC2UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC2Whole" runat="server" ControlToValidate="MBMUAC2Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC2Fract" runat="server" ControlToValidate="MBMUAC2Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC2Whole" ControlToValidate="MBMUAC2Whole" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC2Fract" ControlToValidate="MBMUAC2Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator16" runat="server" OnServerValidate="CustVal_Validate2MUAC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
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
                         <asp:TextBox  AutoComplete="off" ID="MBMUAC3Whole" runat="server"  Width="60" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="MBMUAC3Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLPVMUAC3UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC3Whole" runat="server" ControlToValidate="MBMUAC3Whole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RequiredFieldValidator ID="ReqLPVMUAC3Fract" runat="server" ControlToValidate="MBMUAC3Fract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC3Whole" ControlToValidate="MBMUAC3Whole" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC3Fract" ControlToValidate="MBMUAC3Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator17" runat="server" OnServerValidate="CustVal_Validate3MUAC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                        <asp:Label ID="LNMUAC3" runat="server" />
                    </td>
                </tr>

        <tr>
                    <td style="text-align:left; padding-left:20px;">
                        3.
                   </td>
                    <td style="text-align:left; padding-left:10px;">
                        <asp:Label ID="LBLLPVTEMP" runat="server" />
                    </td>

                    <td>
                        <asp:TextBox  AutoComplete="off" ID="MBTEMPWhole" runat="server" Width="70" MaxLength="3" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="MBTEMPFract" runat="server" Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLLPVTEMPUNT" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        <asp:RequiredFieldValidator ID="ReqLPVTEMPWhole" runat="server" ControlToValidate="MBTEMPWhole" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RequiredFieldValidator ID="ReqLPVTEMPFract" runat="server" ControlToValidate="MBTEMPFract" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegLPVTEMPWhole" ControlToValidate="MBTEMPWhole" ValidationExpression="^(?:09[0-9]|10[0-7]|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegLPVTEMPFract" ControlToValidate="MBTEMPFract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="cvLPVTEMP" runat="server" OnServerValidate="CustVal_ValidateBodyTemperature" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                        <asp:Label ID="LNTEMP" runat="server" />
                    </td>
                </tr>


             <tr>
                <td >4.</td>
                <td style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LBMBSYS" Text="" runat="server" />
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBSYS" runat="server"  Width="70" MaxLength="3" />
                    /
                    <asp:TextBox  AutoComplete="off" ID="MBDIA" runat="server"  Width="70" MaxLength="3" />
                </td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LNPRES" runat="server" />
                    <asp:RequiredFieldValidator ID="ReqMBSYS" runat="server" ControlToValidate="MBSYS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator ID="RegExMBSYS" runat="server" ControlToValidate="MBSYS" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^(?:0[5-9]\d|1\d{2}|200|999)$"/>
                    <asp:RequiredFieldValidator ID="ReqMBDIA" runat="server" ControlToValidate="MBDIA" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/> 
                    <asp:RegularExpressionValidator ID="RegExMBDIA" runat="server" ControlToValidate="MBDIA" CssClass="erroMsg" Display="Dynamic" ErrorMessage="" SetFocusOnError="true" ValidationExpression="^(?:0(?:3[5-9]|[4-9]\d)|1(?:[0-3]\d|40)|999)$"/>
                    <asp:CustomValidator ID="cvMBBPCmp" runat="server"  OnServerValidate="CustVal_BloodPressureSysDia" ErrorMessage="" SetFocusOnError="true"  Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                </td>
             </tr>

             <tr>
                <td >5.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLPULSE" Text="" runat="server" />
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="MBPULSE" runat="server"  Width="70" MaxLength="3" />
                </td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LNPULSE" runat="server" />
                    <asp:RequiredFieldValidator ID="ReqMBPULSE" runat="server" ControlToValidate="MBPULSE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:RegularExpressionValidator runat="server" ID="RegExPULSE" ControlToValidate="MBPULSE" ValidationExpression="^(?:0[4-9]\d|1\d{2}|200|999)$" SetFocusOnError="true"  ErrorMessage="" Display="Dynamic" CssClass="erroMsg"/>
                </td>
             </tr>

        <tr>                
                <td>6.</td>
                <td  style="text-align:left; padding-left:10px;">
                     <asp:Label ID="LBLDATASTAT" runat="server" />
                </td>
                <td   style="text-align:left; padding-left:10px;" colspan="2">
                    <asp:DropDownList ID="MBCOMPFORM" runat="server"  Width="210"  />
                   <asp:RequiredFieldValidator ID="ReqDDFORMSTATUS"  SetFocusOnError="true" ControlToValidate="MBCOMPFORM"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />
                </td>
            </tr>

            <tr>
            <td style="text-align:center;" colspan="4">
                <asp:Button ID="ButtonSaveData" runat="server"  CssClass="btn btn-primary" Text="Submit" />
            </td>               
            </tr>
            </table>



     </div> 
</asp:Content>
