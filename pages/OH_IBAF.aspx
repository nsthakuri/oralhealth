<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OH_IBAF.aspx.cs" Inherits="pages_OH_IBAF" %>
<%@ MasterType VirtualPath="~/Site.Master" %> 
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Literal ID="LitCurWeek" runat="server" Visible="false" />
    <div class="page-card">
 <h2 class="page-title">105-Infant Birth Assessment Form</h2>
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
             <td colspan="2" class="SubSectionTitle">
                   <asp:Label ID="LBCONSENT" runat="server" />
                
             </td>
         </tr>   

           <tr>  
                <td style="text-align:left; padding-left:10px;">                    
                    1. <asp:Label ID="LBDOB" Text="" runat="server" />   
                         
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <div class="col-xs-1"> 
                       &nbsp;&nbsp; <asp:Label ID="LBIBAFDOBDD" Text="" runat="server" />   
                        <asp:TextBox  AutoComplete="off" runat="server" ID="IBAFDOBDD" MaxLength="2" Width="60" />
                        <asp:RequiredFieldValidator ID="ReqIBAFDOBDD" runat="server" ControlToValidate="IBAFDOBDD" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExIBAFDOBDD" ControlToValidate="IBAFDOBDD" ValidationExpression="0[1-9]|[1-2][0-9]|3[0-2]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    </div>
                
                    
                    <div class="col-xs-1"> 
                        <asp:Label ID="LBIBAFDOBMM" Text="" runat="server" />
                        <asp:TextBox  AutoComplete="off" runat="server" ID="IBAFDOBMM" MaxLength="2"  Width="60" />
                        <asp:RequiredFieldValidator ID="ReqIBAFDOBMM" runat="server" ControlToValidate="IBAFDOBMM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExIBAFDOBMM" ControlToValidate="IBAFDOBMM" ValidationExpression="0[1-9]|1[0-2]" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                    </div> 
                                
                    <div class="col-xs-1">
                        &nbsp;&nbsp;<asp:Label ID="LBIBAFDOBYY" Text="" runat="server" />   
                        <asp:TextBox  AutoComplete="off" runat="server" ID="IBAFDOBYY" MaxLength="2" Width="60" />
                        <asp:RequiredFieldValidator ID="ReqIBAFDOBYY" runat="server" ControlToValidate="IBAFDOBYY" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                        <asp:RegularExpressionValidator runat="server" ID="RegExIBAFDOBYY" ControlToValidate="IBAFDOBYY" ValidationExpression="79|80|81" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />                        
                    </div>  
                </td>
            </tr>

         <tr>
               <td style="text-align:left; padding-left:10px;">
                  2. <asp:Label ID="LBTOB" Text="" runat="server" />
                   <br />
                   <br />
                <asp:Label ID="LNTOB1" Text="" runat="server" />
            
               </td>
            
               <td style="text-align:left; padding-left:10px;">
                   <div class="col-xs-1">
                       <asp:Label ID="LBIBAFTOBHH" Text="" runat="server" /> 
                       <asp:TextBox  AutoComplete="off" ID="IBAFTOBHH" runat="server"  MaxLength="2" Width="60"  />                   
                       <asp:RequiredFieldValidator ID="ReqIBAFTOBHH" runat="server" ControlToValidate="IBAFTOBHH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                       <asp:RegularExpressionValidator ID="RegExIBAFTOBHH" runat="server" ControlToValidate="IBAFTOBHH" ValidationExpression="^(?:0[1-9]|1[012])$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                   </div>

                   <div class="col-xs-1">
                       <asp:Label ID="LBIBAFTOBMM" Text="" runat="server" /> 
                       <asp:TextBox  AutoComplete="off" ID="IBAFTOBMM" runat="server"  MaxLength="2" Width="60"  />
                       <asp:RequiredFieldValidator ID="ReqIBAFTOBMM" runat="server" ControlToValidate="IBAFTOBMM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                       <asp:RegularExpressionValidator ID="RegExIBAFTOBMM" runat="server" ControlToValidate="IBAFTOBMM" ValidationExpression="^[0-5]\d$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    </div>
                  
                   <div class="col-xs-1">
                       <asp:Label ID="LBIBAFTOBAMPM" Text="" runat="server" /> 
                       <%--<asp:TextBox  AutoComplete="off" ID="IBAFTOBAMPM" runat="server"  MaxLength="1" Width="40"  />
                       <asp:RequiredFieldValidator ID="ReqIBAFTOBAMPM" runat="server" ControlToValidate="IBAFTOBAMPM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                       <asp:RegularExpressionValidator ID="RegExIBAFTOBAMPM" runat="server" ControlToValidate="IBAFTOBAMPM" ValidationExpression="^[12]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />--%>

                       <asp:DropDownList ID="IBAFTOBAMPM" runat="server"  Width="70"  />
                       <asp:RequiredFieldValidator ID="ReqIBAFTOBAMPM"  SetFocusOnError="true" ControlToValidate="IBAFTOBAMPM"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />
                   </div>
              </td>             
           </tr>

         
         <tr>
               <td style="text-align:left; padding-left:10px;">
                   3. <asp:Label ID="LBLIBAFOUTC" Text="" runat="server" />                  
                  
               </td>
            
               <td style="text-align:left; padding-left:10px;">
                    <asp:TextBox  AutoComplete="off" ID="IBAFOUTC" runat="server"  MaxLength="1" Width="50"  />
                   <asp:RequiredFieldValidator ID="ReqIBAFOUTC" runat="server" ControlToValidate="IBAFOUTC" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                  <asp:RegularExpressionValidator ID="RegExIBAFOUTC" runat="server" ControlToValidate="IBAFOUTC" ValidationExpression="^[13]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />                   
                   <asp:Label ID="LBLINIBAFOUTC" Text="" runat="server" />                  
              </td>             
           </tr>
         

         <tr>
                <td style="text-align:left; padding-left:10px;">
                   3a. <asp:Label ID="LBVSNOW" Text="" runat="server" />   
                    </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:TextBox  AutoComplete="off" ID="IBAFVSNOW" runat="server"  MaxLength="1" Width="50"  />
                    <asp:RegularExpressionValidator Enabled="false" ID="RegExIBAFVSNOW" runat="server" ControlToValidate="IBAFVSNOW" ValidationExpression="^[189]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                     <asp:CustomValidator ID="cvIBAFVSNOW"  runat="server" ControlToValidate="IBAFVSNOW" OnServerValidate="CustVal_ValidateIBAFVSNOW" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                     <asp:Label ID="LBINVSNOW" Text="" runat="server" />   
                 </td>            
        </tr>


         <tr>
               <td style="text-align:left; padding-left:10px;">
                   4.<asp:Label ID="LBSEX" Text="" runat="server" />                  
                  
               </td>
            
               <td style="text-align:left; padding-left:10px;">
                   <asp:DropDownList ID="IBAFSEX" runat="server"  Width="210"  />
                   <asp:RequiredFieldValidator ID="ReqIBAFSEX"  SetFocusOnError="true" ControlToValidate="IBAFSEX"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />                                        
              </td>             
           </tr>

         <tr>
              
                <td style="text-align:left; padding-left:10px;">
                    5.<asp:Label ID="LBLIBAFMS" Text="" runat="server" />
                </td>
               <td style="text-align:left; padding-left:10px;">
                   <asp:DropDownList ID="IBAFMS" runat="server"  Width="210"  />                   
                   <asp:RequiredFieldValidator ID="ReqIBAFMS"  SetFocusOnError="true" ControlToValidate="IBAFMS"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />                                        
                   <asp:CustomValidator ID="cvIBAFDOB"  runat="server" ControlToValidate="IBAFMS" ErrorMessage="" OnServerValidate="CustVal_DOBValidation" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
              </td>
            </tr>

         <tr>
              
                <td style="text-align:left; padding-left:10px;">
                    6.<asp:Label ID="LBIBAFFS" Text="" runat="server" />
                </td>
               <td style="text-align:left; padding-left:10px;">
                   <asp:DropDownList ID="IBAFFS" runat="server"  Width="210"  />
                   <asp:CustomValidator ID="cvIBAFFS" runat="server" ControlToValidate="IBAFFS" OnServerValidate="CustVal_IBAFFSRequired" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true"  CssClass="erroMsg" />
              </td>
            </tr>

         <tr>
             <td></td>
             <td  style="text-align:left; padding-left:10px;">
                 <asp:Button ID="ButtonConsent" runat="server"  CssClass="btn btn-primary" Text="Save" CausesValidation="true" />
             </td>             
       </tr>
    </table>
  


         <table>   
             <tr>
                <td colspan="4"  style="background:#efefef; padding:10px 10px 10px 10px; text-align:left;">
                    <asp:Label ID="LBLNOTEA" runat="server" />
                </td>
            </tr>

             <tr>
                <td colspan="4" class="SubSectionTitle"> Section A: Labor and Delivery Care Practices 
                </td>
            </tr>
            <tr>
                <td>1.</td>
                <td  colspan="3"  style="text-align:left; padding-left:10px;">
                   <asp:Label ID="LBSECATITLEA" Text="" runat="server" />  
                </td>                
            </tr>

            <tr>                
                <td></td>     
                <td style="text-align:left; padding-left:10px;">
                   1a. <asp:Label ID="LBIBAFWIPEDCLOTH" Text="" runat="server" />  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFWIPEDCLOTH" runat="server"  Width="40" MaxLength="1" />                
                    <asp:RequiredFieldValidator ID="ReqIBAFWIPEDCLOTH" runat="server" ControlToValidate="IBAFWIPEDCLOTH" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFWIPEDCLOTH" runat="server" ControlToValidate="IBAFWIPEDCLOTH" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFWIPEDCLOTH" runat="server" ControlToValidate="IBAFWIPEDCLOTH" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">                     
                    <asp:Label ID="LCIBAFWIPEDCLOTHA" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    1b. <asp:Label ID="LBIBAFWASHEDWATER" Text="" runat="server" />  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFWASHEDWATER" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFWASHEDWATER" runat="server" ControlToValidate="IBAFWASHEDWATER" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFWASHEDWATER" runat="server" ControlToValidate="IBAFWASHEDWATER" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFWASHEDWATER" runat="server" ControlToValidate="IBAFWASHEDWATER" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFWASHEDWATER" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    1c. <asp:Label ID="LBIBAFWRAPPEDBLNKT" Text="" runat="server" />  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFWRAPPEDBLNKT" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFWRAPPEDBLNKT" runat="server" ControlToValidate="IBAFWRAPPEDBLNKT" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>               
                    <asp:CustomValidator ID="cvIBAFWrappedBlnkt" runat="server" ControlToValidate="IBAFWRAPPEDBLNKT" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFWrappedBlnkt" runat="server" ControlToValidate="IBAFWRAPPEDBLNKT" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFWRAPPEDBLNKT" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align:left; padding-left:10px;">
                    1d. <asp:Label ID="LBIBAFMSGOIL" Text="" runat="server" />  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFMSGOIL" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFMSGOIL" runat="server" ControlToValidate="IBAFMSGOIL" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFMassageOil" runat="server" ControlToValidate="IBAFMSGOIL" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFMSGOIL" runat="server" ControlToValidate="IBAFMSGOIL" ValidationExpression="^[019]$"  ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFMSGOIL" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align:left; padding-left:10px;">
                    1e. <asp:Label ID="LBIBAFBEFOREPLAC" Text="" runat="server" />  

                    <asp:TextBox  AutoComplete="off" ID="IBAFBEFOREPLACSP" runat="server"  Width="310" MaxLength="80" />                        
                    <asp:CustomValidator ID="cvIBAFBEFOREPLACSP" runat="server" ControlToValidate="IBAFBEFOREPLACSP" OnServerValidate="CustVal_RequIfBabyCaredForOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFBEFOREPLAC" runat="server"  Width="40" MaxLength="1" />                
                    <asp:RequiredFieldValidator ID="ReqIBAFBEFOREPLAC" runat="server" ControlToValidate="IBAFBEFOREPLAC" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFBeforePlacOther" runat="server" ControlToValidate="IBAFBEFOREPLAC" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFBeforePlacOther" runat="server" ControlToValidate="IBAFBEFOREPLAC" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">                  
                    <asp:Label ID="LCIBAFBEFOREPLAC" Text="" runat="server" />  
                </td>
            </tr>

            

            <tr>
                <td>2.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFBABYPLACED" Text="" runat="server" />  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFBABYPLACED" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFBABYPLACED" runat="server" ControlToValidate="IBAFBABYPLACED" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFBabyPlaced" runat="server" ControlToValidate="IBAFBABYPLACED" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFBabyPlaced" runat="server" ControlToValidate="IBAFBABYPLACED" ValidationExpression="^[12349]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFBABYPLACED" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td>3.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFCORDCUTWHEN" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFCORDCUTWHEN" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFCORDCUTWHEN" runat="server" ControlToValidate="IBAFCORDCUTWHEN" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFCordCutWhen" runat="server" ControlToValidate="IBAFCORDCUTWHEN" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFCORDCUTWHEN" runat="server" ControlToValidate="IBAFCORDCUTWHEN" ValidationExpression="^[129]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFCORDCUTWHEN" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td>4.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLIBAFCORDSTOPPULS" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFCORDSTOPPULS" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFCORDSTOPPULS" runat="server" ControlToValidate="IBAFCORDSTOPPULS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="IBAFCORDSTOPPULS" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFCORDSTOPPULS" runat="server" ControlToValidate="IBAFCORDSTOPPULS" ValidationExpression="^[129]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LNIBAFCORDSTOPPULS" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td>5.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFCORDCUTINSTRM" Text="" runat="server" />  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFCORDCUTINSTRM" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFCORDCUTINSTRM" runat="server" ControlToValidate="IBAFCORDCUTINSTRM" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFCordCutInstrm" runat="server" ControlToValidate="IBAFCORDCUTINSTRM" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFCORDCUTINSTRM" runat="server" ControlToValidate="IBAFCORDCUTINSTRM" ValidationExpression="^[1-59]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFCORDCUTINSTRM" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td colspan="2" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFCORDCUTINSTRMSP" Text="" runat="server" />  
                &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="IBAFCORDCUTINSTRMSP" runat="server"  Width="200" MaxLength="80" />     
                    <asp:CustomValidator ID="cvIBAFCORDCUTINSTRMSP" runat="server" ControlToValidate="IBAFCORDCUTINSTRMSP" OnServerValidate="CustVal_RequIfCordOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
                
                <td>
                    
                </td>
            </tr>

            <tr>
                <td>6.</td>
                <td style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBIBAFAPPLCORD" Text="" runat="server" />  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFAPPLCORD" runat="server"  Width="40" MaxLength="1" />
                     <asp:RequiredFieldValidator ID="ReqIBAFAPPLCORD" runat="server" ControlToValidate="IBAFAPPLCORD" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFAppliedCord" runat="server" ControlToValidate="IBAFAPPLCORD" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFAPPLCORD" runat="server" ControlToValidate="IBAFAPPLCORD" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFAPPLCORD" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align:left; padding-left:10px;">
                   6a.  <asp:Label ID="LBIBAFAPPLCORDA" Text="" runat="server" />  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFAPPLCORDA" runat="server"  Width="40" MaxLength="1" />
               
                    <asp:CustomValidator ID="cvIBAFAPPLCORDA" runat="server" ControlToValidate="IBAFAPPLCORDA" OnServerValidate="CustVal_RequIfAnythingApplied" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFAPPLCORDA" runat="server" ControlToValidate="IBAFAPPLCORDA" ValidationExpression="^[1-9]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="cvIBAFAPPLCORDACmp" runat="server" ControlToValidate="IBAFAPPLCORDA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
                <td rowspan="3" style="text-align:left; padding-left:10px;" >
                    <asp:Label ID="LCIBAFAPPLCORDA" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>  
                <td></td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFAPPLCORDB" runat="server"  Width="40" MaxLength="1" />
                                   
                    <asp:RegularExpressionValidator ID="RegExIBAFAPPLCORDB" runat="server" ControlToValidate="IBAFAPPLCORDB" ValidationExpression="^[1-9]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator57" runat="server" 
                            ControlToValidate="IBAFAPPLCORDB" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValCord" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFAPPLCORDC" runat="server"  Width="40" MaxLength="1" />    
                
                    <asp:RegularExpressionValidator ID="RegExIBAFAPPLCORDC" runat="server" ControlToValidate="IBAFAPPLCORDC" ValidationExpression="^[1-9]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator24" runat="server" 
                            ControlToValidate="IBAFAPPLCORDC" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValCord" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td colspan="2" style="text-align:left; padding-left:10px;">                    
                    <asp:Label ID="LBIBAFAPPLCORDSP" Text="" runat="server" />  
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox  AutoComplete="off" ID="IBAFAPPLCORDSP" runat="server"  Width="200" MaxLength="80" />
                <asp:CustomValidator ID="cvIBAFAPPLCORDSP" runat="server" ControlToValidate="IBAFAPPLCORDSP" OnServerValidate="CustVal_RequIfAnythingAppliedOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
            </td>
                <td>
                     
                 </td>
            </tr>

            <tr>
                <td>7.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFBREASTFED" Text="" runat="server" />  
                </td>
                <td >
                    <asp:TextBox  AutoComplete="off" ID="IBAFBREASTFED" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFBREASTFED" runat="server" ControlToValidate="IBAFBREASTFED" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFBREASTFED" runat="server" ControlToValidate="IBAFBREASTFED" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFBREASTFED" runat="server" ControlToValidate="IBAFBREASTFED" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFBREASTFED" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    7a. <asp:Label ID="LBIBAFBREASTFEDWHO" Text="" runat="server" />  
                </td>
                <td >
                    <asp:TextBox  AutoComplete="off" ID="IBAFBREASTFEDWHO" runat="server"  Width="40" MaxLength="1" />
                
                    <asp:CustomValidator ID="cvIBAFBREASTFEDWHO" runat="server" ControlToValidate="IBAFBREASTFEDWHO" OnServerValidate="CustVal_RequIfBabyBreastFed" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFBREASTFEDWHO" runat="server" ControlToValidate="IBAFBREASTFEDWHO" ValidationExpression="^[129]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFBREASTFEDWHO" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    7b.<asp:Label ID="LBIBAFBREASTFEDHRS" Text="" runat="server" />  
                    </td>
                <td >
                    <asp:TextBox  AutoComplete="off" ID="IBAFBREASTFEDHRS" runat="server"  Width="50" MaxLength="2" />
               
                    <asp:CustomValidator ID="cvIBAFBREASTFEDHRS" runat="server" ControlToValidate="IBAFBREASTFEDHRS" OnServerValidate="CustVal_RequIfBabyBreastFed" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFBREASTFEDHRS" runat="server" ControlToValidate="IBAFBREASTFEDHRS" ValidationExpression="^\d{2}$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFBREASTFEDHRS" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td  style="text-align:left; padding-left:10px;">
                    7c. <asp:Label ID="LBIBAFCOLOSTRUM" Text="" runat="server" />  
                    </td>
                <td >
                    <asp:TextBox  AutoComplete="off" ID="IBAFCOLOSTRUM" runat="server"  Width="40" MaxLength="1" />
               
                    <asp:CustomValidator ID="cvIBAFCOLOSTRUM" runat="server" ControlToValidate="IBAFCOLOSTRUM" OnServerValidate="CustVal_RequIfBabyBreastFed" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFCOLOSTRUM" runat="server" ControlToValidate="IBAFCOLOSTRUM" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFCOLOSTRUM" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td>8.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFGIVENBABY" Text="" runat="server" /> </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFGIVENBABYA" runat="server"  Width="60" MaxLength="2" />                    
                    <asp:RequiredFieldValidator ID="ReqIBAFGIVENBABYA" runat="server" ControlToValidate="IBAFGIVENBABYA" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFGIVENBABYA" runat="server" ControlToValidate="IBAFGIVENBABYA" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:CustomValidator ID="cvIBAFGIVENBABYACmp" runat="server" ControlToValidate="IBAFGIVENBABYA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />                    
                    <asp:RegularExpressionValidator ID="RegExIBAFGIVENBABYA" runat="server" ControlToValidate="IBAFGIVENBABYA" ValidationExpression="^(?:0[0-9]|99)$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />                    
                </td>
                <td rowspan="3" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFGIVENBABY" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFGIVENBABYB" runat="server"  Width="60" MaxLength="2" />
                    <asp:RegularExpressionValidator ID="RegExIBAFGIVENBABYB" runat="server" ControlToValidate="IBAFGIVENBABYB" ValidationExpression="^(?:0[0-9]|99)$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" /> 
                    <asp:CustomValidator ID="CustomValidator25" runat="server" 
                            ControlToValidate="IBAFGIVENBABYB" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValGiven" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFGIVENBABYC" runat="server"  Width="60" MaxLength="2" />
                    <asp:RegularExpressionValidator ID="RegExIBAFGIVENBABYC" runat="server" ControlToValidate="IBAFGIVENBABYC" ValidationExpression="^(?:0[0-9]|99)$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator26" runat="server" 
                            ControlToValidate="IBAFGIVENBABYC" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValGiven" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
                <td></td>
            </tr>
                


            <tr>
                <td></td>
                <td colspan="2" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFGIVENBABYSP" Text="" runat="server" /> 
                     &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="IBAFGIVENBABYSP" runat="server"  Width="200" MaxLength="50" />
                    <asp:CustomValidator ID="cvIBAFGIVENBABYSP" runat="server" ControlToValidate="IBAFGIVENBABYSP" OnServerValidate="CustVal_RequIfBreastMilkAltOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
                <td>
                </td>

            </tr>
             
             <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionA" runat="server"   Text="Save" />
                </td>
            </tr>
        </table>
     


         <table>
            <tr>
                <td colspan="4" class="SubSectionTitle"> Section B: Infant Condition at Birth 
                </td>
            </tr>
            <tr>
                <td>1.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFBIRTHINJ" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFBIRTHINJ" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFBIRTHINJ" runat="server" ControlToValidate="IBAFBIRTHINJ" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFBIRTHINJ" runat="server" ControlToValidate="IBAFBIRTHINJ" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFBIRTHINJ" runat="server" ControlToValidate="IBAFBIRTHINJ" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFBIRTHINJ" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align:left; padding-left:10px;">
                    1a. <asp:Label ID="LBIBAFBIRTHINJSIGNS" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFBIRTHINJSIGNSA" runat="server"  Width="40" MaxLength="1" />                    
                
                    <asp:CustomValidator ID="cvIBAFBIRTHINJSIGNSA" runat="server" ControlToValidate="IBAFBIRTHINJSIGNSA" OnServerValidate="CustVal_RequIfSignsOfInjury" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />                    
                    <asp:RegularExpressionValidator ID="RegExIBAFBIRTHINJSIGNSA" runat="server" ControlToValidate="IBAFBIRTHINJSIGNSA" ValidationExpression="^[1239]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />                                        
                </td>
                <td rowspan="2" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFBIRTHINJSIGNS" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFBIRTHINJSIGNSB" runat="server"  Width="40" MaxLength="1" />
                
                    <asp:RegularExpressionValidator ID="RegExIBAFBIRTHINJSIGNSB" runat="server" ControlToValidate="IBAFBIRTHINJSIGNSB" ValidationExpression="^[1239]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CompareValidator ID="RegExIBAFBirthInjSigns" runat="server" ControlToValidate="IBAFBIRTHINJSIGNSA" ControlToCompare="IBAFBIRTHINJSIGNSB" Type="Integer" Operator="NotEqual" ErrorMessage="For #1a, A and B must be unique" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator27" runat="server" 
                            ControlToValidate="IBAFBIRTHINJSIGNSB" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValSign" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
            </tr>


            <tr>
                <td></td>
                <td colspan="2" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFBIRTHINJSIGNSP" Text="" runat="server" />  
                &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="IBAFBIRTHINJSIGNSP" runat="server"  Width="200" MaxLength="80" />
                    <asp:CustomValidator ID="cvIBAFBIRTHINJSIGNSP" runat="server" ControlToValidate="IBAFBIRTHINJSIGNSP" OnServerValidate="CustVal_RequIfSignsOfInjuryOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td> 
                <td>
                    
                </td> 
            </tr>

            <tr>
                <td>2.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFCRYBREATHTIME" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFCRYBREATHTIME" runat="server"  Width="40" MaxLength="1" />
                   <asp:RequiredFieldValidator ID="ReqIBAFCRYBREATHTIME" runat="server" ControlToValidate="IBAFCRYBREATHTIME" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFCRYBREATHTIME" runat="server" ControlToValidate="IBAFCRYBREATHTIME" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFCRYBREATHTIME" runat="server" ControlToValidate="IBAFCRYBREATHTIME" ValidationExpression="^[1-59]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFCRYBREATHTIME" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td>3</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFCRYBREATHMEAS" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFCRYBREATHMEAS" runat="server"  Width="40" MaxLength="1" />
                   <asp:RequiredFieldValidator ID="ReqIBAFCRYBREATHMEAS" runat="server" ControlToValidate="IBAFCRYBREATHMEAS" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFCRYBREATHMEAS" runat="server" ControlToValidate="IBAFCRYBREATHMEAS" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFCRYBREATHMEAS" runat="server" ControlToValidate="IBAFCRYBREATHMEAS" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFCRYBREATHMEAS" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td style="text-align:left; padding-left:10px;">
                    3a. <asp:Label ID="LBIBAFCRYBREATHMEASA" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFCRYBREATHMEASA" runat="server"  Width="40" MaxLength="1" />                    
               
                    <asp:CustomValidator ID="cvIBAFCRYBREATHMEASA" runat="server" ControlToValidate="IBAFCRYBREATHMEASA" OnServerValidate="CustVal_RequIfCryBreathingMeas" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:CustomValidator ID="cvIBAFCRYBREATHMEASCmp" runat="server" ControlToValidate="IBAFCRYBREATHMEASA" OnServerValidate="CustVal_ABCDuplicate" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />                    
                    <asp:RegularExpressionValidator ID="RegExIBAFCRYBREATHMEASA" runat="server" ControlToValidate="IBAFCRYBREATHMEASA" ValidationExpression="^[1-9]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />                    
                </td>
                 <td rowspan="3" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFCRYBREATHMEASA" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFCRYBREATHMEASB" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExIBAFCRYBREATHMEASB" runat="server" ControlToValidate="IBAFCRYBREATHMEASB" ValidationExpression="^[1-9]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator28" runat="server" 
                            ControlToValidate="IBAFCRYBREATHMEASB" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValCry" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
                <td></td>
            </tr>

             <tr>
                <td></td>
                <td>
                    <asp:Label ID="Label22" Text="" runat="server" />  
                   </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFCRYBREATHMEASC" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExIBAFCRYBREATHMEASC" runat="server" ControlToValidate="IBAFCRYBREATHMEASC" ValidationExpression="^[1-9]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                    <asp:CustomValidator ID="CustomValidator29" runat="server" 
                            ControlToValidate="IBAFCRYBREATHMEASC" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredValCry" SetFocusOnError="true" 
                            ValidateEmptyText="true" />
                </td>
                 <td></td>
            </tr>


            <tr>
                <td></td>
                <td colspan="2" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFCRYBREATHMEASP" Text="" runat="server" />  
                   &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="IBAFCRYBREATHMEASP" runat="server"  Width="200" MaxLength="75" />
                    <asp:CustomValidator ID="cvIBAFCRYBREATHMEASP" runat="server" ControlToValidate="IBAFCRYBREATHMEASP" OnServerValidate="CustVal_RequIfCryBreathingMeasOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
                <td>
                    
                </td>
            </tr>

            <tr>
                <td>4</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFAFTBIRTHCRY" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFAFTBIRTHCRY" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFAFTBIRTHCRY" runat="server" ControlToValidate="IBAFAFTBIRTHCRY" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFAFTBIRTHCRY" runat="server" ControlToValidate="IBAFAFTBIRTHCRY" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFAFTBIRTHCRY" runat="server" ControlToValidate="IBAFAFTBIRTHCRY" ValidationExpression="^[0129]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td> 
                 <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFAFTBIRTHCRY" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td>5</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFAFTBIRTHMOVE" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFAFTBIRTHMOVE" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFAFTBIRTHMOVE" runat="server" ControlToValidate="IBAFAFTBIRTHMOVE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFAFTBIRTHMOVE" runat="server" ControlToValidate="IBAFAFTBIRTHMOVE" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFAFTBIRTHMOVE" runat="server" ControlToValidate="IBAFAFTBIRTHMOVE" ValidationExpression="^[0129]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFAFTBIRTHMOVE" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td>6</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFAFTBIRTHCOLOR" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFAFTBIRTHCOLOR" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFAFTBIRTHCOLOR" runat="server" ControlToValidate="IBAFAFTBIRTHCOLOR" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFAFTBIRTHCOLOR" runat="server" ControlToValidate="IBAFAFTBIRTHCOLOR" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFAFTBIRTHCOLOR" runat="server" ControlToValidate="IBAFAFTBIRTHCOLOR" ValidationExpression="^[1-39]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFAFTBIRTHCOLOR" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td>7</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFAFTBIRTHSTIFCONV" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFAFTBIRTHSTIFCONV" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFAFTBIRTHSTIFCONV" runat="server" ControlToValidate="IBAFAFTBIRTHSTIFCONV" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFAFTBIRTHSTIFCONV" runat="server" ControlToValidate="IBAFAFTBIRTHSTIFCONV" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFAFTBIRTHSTIFCONV" runat="server" ControlToValidate="IBAFAFTBIRTHSTIFCONV" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFAFTBIRTHSTIFCONV" Text="" runat="server" />  
                </td>
            </tr>

            <tr>
                <td>8</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFAFTBIRTHUNCONSC" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFAFTBIRTHUNCONSC" runat="server"  Width="40" MaxLength="1" />
                    <asp:RequiredFieldValidator ID="ReqIBAFAFTBIRTHUNCONSC" runat="server" ControlToValidate="IBAFAFTBIRTHUNCONSC" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="cvIBAFAFTBIRTHUNCONSC" runat="server" ControlToValidate="IBAFAFTBIRTHUNCONSC" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFAFTBIRTHUNCONSC" runat="server" ControlToValidate="IBAFAFTBIRTHUNCONSC" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFAFTBIRTHUNCONSC" Text="" runat="server" />  
                </td>
            </tr>  
             
             <!-- new question -->

              <tr>
                <td>9.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLQUESNINEA" Text="" runat="server" />  
                    </td>
                  <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLQUESNINEB" Text="" runat="server" />  
                    </td>
                  <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLQUESNINEC" Text="" runat="server" />  
                    </td>
              </tr>



             <tr>
                <td>a.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFCLEFTLIP" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFCLEFTLIP" runat="server"  Width="40" MaxLength="1" />                
                    <asp:RequiredFieldValidator ID="ReqIBAFCLEFTLIP" runat="server" ControlToValidate="IBAFCLEFTLIP" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator30" runat="server" ControlToValidate="IBAFCLEFTLIP" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFCLEFTLIP" runat="server" ControlToValidate="IBAFCLEFTLIP" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:TextBox  AutoComplete="off" ID="IBAFCLEFTLIPSP" runat="server"  Width="410" MaxLength="150" />
                     <asp:CustomValidator ID="cvIBAFCLEFTLIPSP" runat="server" 
                            ControlToValidate="IBAFCLEFTLIPSP" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredIBAFCLEFTLIPSP" SetFocusOnError="true" ValidateEmptyText="true" /> 
                 </td>
              </tr>



             <tr>
                <td>b.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFNEUTUBE" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFNEUTUBE" runat="server"  Width="40" MaxLength="1" />                
                    <asp:RequiredFieldValidator ID="ReqIBAFNEUTUBE" runat="server" ControlToValidate="IBAFNEUTUBE" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator31" runat="server" ControlToValidate="IBAFNEUTUBE" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFNEUTUBE" runat="server" ControlToValidate="IBAFNEUTUBE" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:TextBox  AutoComplete="off" ID="IBAFNEUTUBESP" runat="server"  Width="410" MaxLength="150" />
                     <asp:CustomValidator ID="cvIBAFNEUTUBESP" runat="server" 
                            ControlToValidate="IBAFNEUTUBESP" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredIBAFNEUTUBESP" SetFocusOnError="true" ValidateEmptyText="true" /> 
                 </td>
              </tr>


             <tr>
                <td>c.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFLIMB" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFLIMB" runat="server"  Width="40" MaxLength="1" />                
                    <asp:RequiredFieldValidator ID="ReqIBAFLIMB" runat="server" ControlToValidate="IBAFLIMB" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator32" runat="server" ControlToValidate="IBAFLIMB" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFLIMB" runat="server" ControlToValidate="IBAFLIMB" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:TextBox  AutoComplete="off" ID="IBAFLIMBSP" runat="server"  Width="410" MaxLength="150" />
                     <asp:CustomValidator ID="cvIBAFLIMBSP" runat="server" 
                            ControlToValidate="IBAFLIMBSP" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredIBAFLIMBSP" SetFocusOnError="true" ValidateEmptyText="true" /> 
                 </td>
              </tr>


             <tr>
                <td>d.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBLIBAFEYES" Text="" runat="server" />  
                    </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFEYES" runat="server"  Width="40" MaxLength="1" />                
                    <asp:RequiredFieldValidator ID="ReqIBAFEYES" runat="server" ControlToValidate="IBAFEYES" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg"/>
                    <asp:CustomValidator ID="CustomValidator33" runat="server" ControlToValidate="IBAFEYES" OnServerValidate="CustVal_ReqIfBabyLiveBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFEYES" runat="server" ControlToValidate="IBAFEYES" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:TextBox  AutoComplete="off" ID="IBAFEYESSP" runat="server"  Width="410" MaxLength="150" />
                     <asp:CustomValidator ID="CustomValidator34" runat="server" 
                            ControlToValidate="IBAFEYESSP" CssClass="erroMsg" Display="Dynamic" 
                            OnServerValidate="CustVal_RequiredIBAFEYESSP" SetFocusOnError="true" ValidateEmptyText="true" /> 
                 </td>

              </tr>


             <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionB" runat="server"   Text="Save" />
                </td>
            </tr>
            </table>

        <table>
             <tr>
            <td colspan="4" class="SubSectionTitle">
                  Section C: Anthropometry / Measures
               
            </td>
        </tr>

            <tr>
            <td>1</td>
            <td style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBIBAFASSTIME" Text="" runat="server" />  
          </td>
            <td>
                <div class="col-xs-1"> 
                <asp:Label ID="LBIBAFASSTIMEHH" Text="" runat="server" />  
                    <asp:TextBox  AutoComplete="off" ID="IBAFASSESSTIMEHH" runat="server"  Width="50" MaxLength="2" />
                    <asp:CustomValidator ID="cvIBAFASSESSTIMEHH" runat="server" ControlToValidate="IBAFASSESSTIMEHH" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFASSESSTIMEHH" runat="server" ControlToValidate="IBAFASSESSTIMEHH" ValidationExpression="^(?:0[1-9]|1[0-2])$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </div>

                <div class="col-xs-1"> 
                <asp:Label ID="LBIBAFASSTIMEMM" Text="" runat="server" />  
                   <asp:TextBox  AutoComplete="off" ID="IBAFASSESSTIMEMM" runat="server"  Width="50" MaxLength="2" />
                   <asp:CustomValidator ID="cvIBAFASSESSTIMEMM" runat="server" ControlToValidate="IBAFASSESSTIMEMM" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />   
                    <asp:RegularExpressionValidator ID="RegExIBAFASSESSTIMEMM" runat="server" ControlToValidate="IBAFASSESSTIMEMM" ValidationExpression="^[0-5]\d$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </div>

                <div class="col-xs-1"> 
                    <asp:Label ID="LBIBAFASSTIMEAMPM" Text="" runat="server" />  
                    <%--<asp:TextBox  AutoComplete="off" ID="IBAFASSESSTIMEAMPM" runat="server"  Width="40" MaxLength="1" />
                    <asp:RegularExpressionValidator ID="RegExIBAFASSESSTIMEAMPM" runat="server" ControlToValidate="IBAFASSESSTIMEAMPM" ValidationExpression="^[12]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />--%>
                    <asp:DropDownList ID="IBAFASSESSTIMEAMPM" runat="server"  Width="70"  />
                    <asp:CustomValidator ID="cvIBAFASSESSTIMEAMPM" runat="server" ControlToValidate="IBAFASSESSTIMEAMPM" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />                    
                   <asp:CustomValidator ID="cvTimeCompare" runat="server" ControlToValidate="IBAFASSESSTIMEAMPM" OnServerValidate="CustVal_TimeCompare" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                 </div>                
             </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFASSTIME" Text="" runat="server" />  
                </td>
        </tr>


        <tr>
            <td>2</td>
            <td  style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBIBAFWEIGHT" Text="" runat="server" />  
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" ID="IBAFWT" runat="server"  MaxLength="4" Width="150" />            
                <asp:CustomValidator ID="cvIBAFWeight" runat="server" ControlToValidate="IBAFWT" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:RegularExpressionValidator ID="RegExIBAFWeight" runat="server" ControlToValidate="IBAFWT" ValidationExpression="^\d{4}$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                <asp:CustomValidator runat="server" ID="cvIBAFWEIGHTVal"  OnServerValidate="Validate_ValIBAFWeight" ControlToValidate="IBAFWT" />
            </td>
             <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFWEIGHT" Text="" runat="server" />  
                </td>
        </tr>

        <tr>
            <td>3</td>
            <td  style="text-align:left; padding-left:10px;">
               a. <asp:Label ID="LBIBAFLENGTH1" Text="" runat="server" />  
               </td>
            <td>
                <asp:TextBox  AutoComplete="off" ID="IBAFLENGTH1Int" runat="server"  Width="50" MaxLength="2" />
                .
                <asp:TextBox  AutoComplete="off" ID="IBAFLENGTH1Fract" runat="server"  Width="40" MaxLength="1" />
                
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFLENGTH1Int" ControlToValidate="IBAFLENGTH1Int" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFLENGTH1Fract" ControlToValidate="IBAFLENGTH1Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />

                <asp:CustomValidator ID="cvIBAFLENGTHInt" runat="server" ControlToValidate="IBAFLENGTH1Int" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="cvIBAFLENGTHFract" runat="server" ControlToValidate="IBAFLENGTH1Fract" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="cvIBAFLENGTH" runat="server" ControlToVAlidate="IBAFLENGTH1Int" OnServerValidate="CustVal_Length1Range" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
            </td>
             <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFLENGTH1" Text="" runat="server" />  
             </td>
        </tr>

             <tr>
            <td></td>
            <td  style="text-align:left; padding-left:10px;">
               b.  <asp:Label ID="LBIBAFLENGTH2" Text="" runat="server" />  
               </td>
            <td>
                <asp:TextBox  AutoComplete="off" ID="IBAFLENGTH2Int" runat="server"  Width="50" MaxLength="2" />
                .
                <asp:TextBox  AutoComplete="off" ID="IBAFLENGTH2Fract" runat="server"  Width="40" MaxLength="1" />
           
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFLENGTH2Int" ControlToValidate="IBAFLENGTH2Int" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFLENGTH2Fract" ControlToValidate="IBAFLENGTH2Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />

                <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="IBAFLENGTH2Int" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="IBAFLENGTH2Fract" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToVAlidate="IBAFLENGTH2Int" OnServerValidate="CustVal_Length2Range" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
            </td>
             <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFLENGTH2" Text="" runat="server" />  
             </td>
        </tr>

             <tr>
            <td></td>
            <td  style="text-align:left; padding-left:10px;">
               c.  <asp:Label ID="LBIBAFLENGTH3" Text="" runat="server" />  
               </td>
            <td>
                <asp:TextBox  AutoComplete="off" ID="IBAFLENGTH3Int" runat="server"  Width="50" MaxLength="2" />
                .
                <asp:TextBox  AutoComplete="off" ID="IBAFLENGTH3Fract" runat="server"  Width="40" MaxLength="1" />
           
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFLENGTH3Int" ControlToValidate="IBAFLENGTH3Int" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFLENGTH3Fract" ControlToValidate="IBAFLENGTH3Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />

                <asp:CustomValidator ID="CustomValidator5" runat="server" ControlToValidate="IBAFLENGTH3Int" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="CustomValidator6" runat="server" ControlToValidate="IBAFLENGTH3Fract" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToVAlidate="IBAFLENGTH3Int" OnServerValidate="CustVal_Length3Range" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
            </td>
             <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFLENGTH3" Text="" runat="server" />  
             </td>
        </tr>

        <tr>
            <td>4</td>
            <td style="text-align:left; padding-left:10px;">
               a.  <asp:Label ID="LBIBAFCIRCUM1" Text="" runat="server" />  
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" ID="IBAFCIRCUMFERENCE1Int" runat="server"  Width="50" MaxLength="2" />
                .
                <asp:TextBox  AutoComplete="off" ID="IBAFCIRCUMFERENCE1Fract" runat="server"  Width="40" MaxLength="1" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFCIRCUMFERENCE1Int" ControlToValidate="IBAFCIRCUMFERENCE1Int" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFCIRCUMFERENCE1Fract" ControlToValidate="IBAFCIRCUMFERENCE1Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />

            
                <asp:CustomValidator ID="cvIBAFCIRCUMFERENCEInt" runat="server" ControlToValidate="IBAFCIRCUMFERENCE1Int" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="cvIBAFCIRCUMFERENCEFract" runat="server" ControlToValidate="IBAFCIRCUMFERENCE1Fract" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="cvIBAFCIRCUMFERENCE" runat="server" ControlToValidate="IBAFCIRCUMFERENCE1Int" OnServerValidate="CustVal_HeadCircumference1Range" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
            </td>
             <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFCIRCUM1" Text="" runat="server" />  
                </td>
        </tr>

            <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
               b.  <asp:Label ID="LBIBAFCIRCUM2" Text="" runat="server" />  
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" ID="IBAFCIRCUMFERENCE2Int" runat="server"  Width="50" MaxLength="2" />
                .
                <asp:TextBox  AutoComplete="off" ID="IBAFCIRCUMFERENCE2Fract" runat="server"  Width="40" MaxLength="1" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFCIRCUMFERENCE2Int" ControlToValidate="IBAFCIRCUMFERENCE2Int" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFCIRCUMFERENCE2Fract" ControlToValidate="IBAFCIRCUMFERENCE2Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />

                <asp:CustomValidator ID="CustomValidator8" runat="server" ControlToValidate="IBAFCIRCUMFERENCE1Int" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="CustomValidator9" runat="server" ControlToValidate="IBAFCIRCUMFERENCE1Fract" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="CustomValidator10" runat="server" ControlToValidate="IBAFCIRCUMFERENCE1Int" OnServerValidate="CustVal_HeadCircumference2Range" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
            </td>
             <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFCIRCUM2" Text="" runat="server" />  
                </td>
        </tr>

            <tr>
            <td></td>
            <td style="text-align:left; padding-left:10px;">
              c.   <asp:Label ID="LBIBAFCIRCUM3" Text="" runat="server" />  
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" ID="IBAFCIRCUMFERENCE3Int" runat="server"  Width="50" MaxLength="2" />
                .
                <asp:TextBox  AutoComplete="off" ID="IBAFCIRCUMFERENCE3Fract" runat="server"  Width="40" MaxLength="1" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFCIRCUMFERENCE3Int" ControlToValidate="IBAFCIRCUMFERENCE3Int" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFCIRCUMFERENCE3Fract" ControlToValidate="IBAFCIRCUMFERENCE3Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
            
                <asp:CustomValidator ID="CustomValidator11" runat="server" ControlToValidate="IBAFCIRCUMFERENCE1Int" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="CustomValidator12" runat="server" ControlToValidate="IBAFCIRCUMFERENCE1Fract" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="CustomValidator13" runat="server" ControlToValidate="IBAFCIRCUMFERENCE1Int" OnServerValidate="CustVal_HeadCircumference3Range" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
            </td>
             <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFCIRCUM3" Text="" runat="server" />  
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
                         <asp:TextBox  AutoComplete="off" ID="IBAFMUAC1Whole" runat="server"  Width="50" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="IBAFMUAC1Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLPVMUAC1UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC1Whole" ControlToValidate="IBAFMUAC1Whole" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC1Fract" ControlToValidate="IBAFMUAC1Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator18" runat="server" ControlToValidate="IBAFMUAC1Whole" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator19" runat="server" ControlToValidate="IBAFMUAC1Fract" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                        
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
                         <asp:TextBox  AutoComplete="off" ID="IBAFMUAC2Whole" runat="server"  Width="50" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="IBAFMUAC2Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLPVMUAC2UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC2Whole" ControlToValidate="IBAFMUAC2Whole" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC2Fract" ControlToValidate="IBAFMUAC2Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator20" runat="server" ControlToValidate="IBAFMUAC2Whole" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator21" runat="server" ControlToValidate="IBAFMUAC2Fract" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
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
                         <asp:TextBox  AutoComplete="off" ID="IBAFMUAC3Whole" runat="server"  Width="50" MaxLength="2" />
                        .
                        <asp:TextBox  AutoComplete="off" ID="IBAFMUAC3Fract" runat="server"  Width="40" MaxLength="1" />
                        
                        <asp:Label ID="LBLPVMUAC3UNT" Text="" runat="server" />
                    </td>
                    <td  style="text-align:left; padding-left:10px;">
                        
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC3Whole" ControlToValidate="IBAFMUAC3Whole" ValidationExpression="^(?:0[1-9]|[1-9]\d)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:RegularExpressionValidator runat="server" ID="RegExLPVMUAC3Fract" ControlToValidate="IBAFMUAC3Fract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator22" runat="server" ControlToValidate="IBAFMUAC3Whole" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator23" runat="server" ControlToValidate="IBAFMUAC3Fract" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                        <asp:CustomValidator ID="CustomValidator17" runat="server" OnServerValidate="CustVal_Validate3MUAC" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg"/>
                        <asp:Label ID="LNMUAC3" runat="server" />
                    </td>
                </tr>



        <tr>
            <td>5</td>
            <td  style="text-align:left; padding-left:10px;">
                <asp:Label ID="LBIBAFTEMP" Text="" runat="server" />  
                </td>
            <td>
                <asp:TextBox  AutoComplete="off" ID="IBAFTEMPInt" runat="server"  MaxLength="3" Width="70" />
                .
                <asp:TextBox  AutoComplete="off" ID="IBAFTEMPFract" runat="server"  Width="40" MaxLength="1" /> 
           
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFTEMPInt" ControlToValidate="IBAFTEMPInt" ValidationExpression="^(?:09[0-9]|10[0-7]|666|999)$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />
                <asp:RegularExpressionValidator runat="server" ID="RegExIBAFTEMPFract" ControlToValidate="IBAFTEMPFract" ValidationExpression="^\d{1}$" SetFocusOnError="true" ErrorMessage="" Display="Dynamic" CssClass="erroMsg" />

                <asp:CustomValidator ID="cvIBAFTEMPInt" runat="server" ControlToValidate="IBAFTEMPInt" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="cvIBAFTEMPFract" runat="server" ControlToValidate="IBAFTEMPFract" OnServerValidate="CustVal_ReqIfBabyLiveBirthAndAliveNow" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                <asp:CustomValidator ID="cvIBAFTEMP" runat="server" ControlToValidate="IBAFTEMPInt" OnServerValidate="CustVal_TemperatureRange" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
            </td>
             <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFTEMP" Text="" runat="server" />  
                </td>
        </tr>        
            <tr>
                <td colspan="4" style="text-align:center;">
                    <asp:Button ID="ButtonSectionC" runat="server"  Text="Save" />
                </td>
            </tr>
        </table>




         <table>
             <tr>
                <td colspan="4" class="SubSectionTitle"> Section D: Stillbirth Verbal Autopsy 
                </td>
            </tr>

        <%--<tr>
            <td colspan="4" style="background:#ff6a00; color:#ffffff; padding:10px 10px 10px 10px; text-align:center;">               
                 <asp:Label ID="LBLSECDTITLE" runat="server" />
            </td>
        </tr>--%>

            <tr>
                <td>1.</td>
                <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFRESPONDREL" Text="" runat="server" />  
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFRESPONDREL" runat="server"  Width="40" MaxLength="1" />
               
                    <asp:CustomValidator ID="cvIBAFRESPONDREL" runat="server" ControlToValidate="IBAFRESPONDREL" OnServerValidate="CustVal_ReqIfBabyStillBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFRESPONDREL" runat="server" ControlToValidate="IBAFRESPONDREL" ValidationExpression="^[1-9]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                 <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFRESPONDREL" Text="" runat="server" />  
                </td>
             </tr>

             <tr>
                 <td></td>
                <td colspan="2" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFRESPONDRELSP" Text="" runat="server" />  
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="IBAFRESPONDRELSP" runat="server"  Width="200" MaxLength="25" />
                    <asp:CustomValidator ID="cvIBAFRESPONDRELSP" runat="server" ControlToValidate="IBAFRESPONDRELSP" OnServerValidate="CustVal_RequIfRelationshipOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
                 <td>
                    
                </td>
             </tr>

             <tr>
                <td>2.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFRESPONDAGE" Text="" runat="server" />  
               
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFRESPONDAGE" runat="server"  Width="50" MaxLength="2" />
                    <asp:CustomValidator ID="cvIBAFRESPONDAGE" runat="server" ControlToValidate="IBAFRESPONDAGE" OnServerValidate="CustVal_ReqIfBabyStillBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFRESPONDAGE" runat="server" ControlToValidate="IBAFRESPONDAGE" ValidationExpression="^(?:1[5-9]|[2-9]\d)$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                  <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFRESPONDAGE" Text="" runat="server" />  
                </td>
             </tr>

             <tr>
                <td>3.</td>
                <td  style="text-align:left; padding-left:10px;">
                   <asp:Label ID="LBIBAFRESPONDEDU" Text="" runat="server" />  
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFRESPONDEDU" runat="server"  Width="50" MaxLength="2" />
                
                    <asp:CustomValidator ID="cvIBAFRESPONDEDU" runat="server" ControlToValidate="IBAFRESPONDEDU" OnServerValidate="CustVal_ReqIfBabyStillBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFRESPONDEDU" runat="server" ControlToValidate="IBAFRESPONDEDU" ValidationExpression="^(?:[01]\d|20|99)$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                  <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFRESPONDEDU" Text="" runat="server" />  
                </td>
             </tr>

             <tr>
                <td>4.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFYOUPRESENT" Text="" runat="server" />  
                   
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFYOUPRESENT" runat="server"  Width="40" MaxLength="1" />
                
                    <asp:CustomValidator ID="cvIBAFYOUPRESENT" runat="server" ControlToValidate="IBAFYOUPRESENT" OnServerValidate="CustVal_ReqIfBabyStillBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFYOUPRESENT" runat="server" ControlToValidate="IBAFYOUPRESENT" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                  <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFYOUPRESENT" Text="" runat="server" />  
                </td>
             </tr>

             <tr>
                <td>5.</td>
                <td  style="text-align:left; padding-left:10px;">
                   <asp:Label ID="LBIBAFINJURY" Text="" runat="server" />  
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFINJURY" runat="server"  Width="40" MaxLength="1" />
                
                    <asp:CustomValidator ID="cvIBAFINJURY" runat="server" ControlToValidate="IBAFINJURY" OnServerValidate="CustVal_ReqIfBabyStillBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFINJURY" runat="server" ControlToValidate="IBAFINJURY" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                  <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFINJURY" Text="" runat="server" />  
                </td>
             </tr>

             <tr>
                <td>6.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFPULPYSKIN" Text="" runat="server" />  
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFPULPYSKIN" runat="server"  Width="40" MaxLength="1" />
                
                    <asp:CustomValidator ID="cvIBAFPULPYSKIN" runat="server" ControlToValidate="IBAFPULPYSKIN" OnServerValidate="CustVal_ReqIfBabyStillBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFPULPYSKIN" runat="server" ControlToValidate="IBAFPULPYSKIN" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                  <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFPULPYSKIN" Text="" runat="server" />  
                </td>
             </tr>

             <tr>
                <td>7.</td>
                <td  style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFPHYSABN" Text="" runat="server" />  
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFPHYSABN" runat="server"  Width="40" MaxLength="1" />
                    <asp:CustomValidator ID="cvIBAFPHYSABN" runat="server" ControlToValidate="IBAFPHYSABN" OnServerValidate="CustVal_ReqIfBabyStillBirth" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFPHYSABN" runat="server" ControlToValidate="IBAFPHYSABN" ValidationExpression="^[019]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                  <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFPHYSABN" Text="" runat="server" />  
                </td>
             </tr>

             <tr>
                <td></td>
                <td style="text-align:left; padding-left:10px;">
                    7a. <asp:Label ID="LBIBAFABNDETAIL" runat="server" /> 
                    
                </td>
                <td>
                    <asp:TextBox  AutoComplete="off" ID="IBAFABNDETAIL" runat="server"  Width="40" MaxLength="1" />
               
                    <asp:CustomValidator ID="cvIBAFABNDETAIL" runat="server" ControlToValidate="IBAFABNDETAIL" OnServerValidate="CustVal_RequIfPhysAbnAtDelivery" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                    <asp:RegularExpressionValidator ID="RegExIBAFABNDETAIL" runat="server" ControlToValidate="IBAFABNDETAIL" ValidationExpression="^[1-49]$" ErrorMessage="" SetFocusOnError="true" Display="Dynamic" CssClass="erroMsg" />
                </td>
                  <td style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LCIBAFABNDETAIL" Text="" runat="server" />  
                </td>
             </tr>

             <tr>
                 <td></td>
                <td colspan="2" style="text-align:left; padding-left:10px;">
                    <asp:Label ID="LBIBAFABNDETAILSP" Text="" runat="server" />  
                   
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox  AutoComplete="off" ID="IBAFABNDETAILSP" runat="server"  Width="200" MaxLength="2000" />
                    <asp:CustomValidator ID="cvIBAFABNDETAILSP" runat="server" ControlToValidate="IBAFABNDETAILSP" OnServerValidate="CustVal_RequIfPhysAbnAtDeliveryOther" SetFocusOnError="true" Display="Dynamic" ValidateEmptyText="true" CssClass="erroMsg" />
                </td>
                 <td>
                
               </td>
             </tr>
               
        <tr>
            <td></td>
            <td>
                <asp:Button ID="ButtonSectionD" runat="server"  CssClass="btn btn-primary" Text="Save" />            
            </td>
            <td colspan="2"></td>
        </tr>
</table>
    

        
            <table>
             <tr>   
                <td  style="text-align:left; padding-left:10px;">
                    # <asp:Label ID="LBLDATASTAT" runat="server" />
                </td>
                 
                <td   style="text-align:left; padding-left:10px;">
                    <asp:DropDownList ID="IBAFCOMPFORM" runat="server"  Width="210"  />
                   <asp:RequiredFieldValidator ID="ReqDDFORMSTATUS"  SetFocusOnError="true" ControlToValidate="IBAFCOMPFORM"   ErrorMessage="" runat="server" CssClass="erroMsg" InitialValue="X" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td   style="text-align:left; padding-left:10px;">
                    <asp:Button ID="ButtonSaveData" runat="server" CssClass="btn btn-primary" Text="Save" />            
                </td>
            </tr>
        </table>
        



     </div> 
</asp:Content>
