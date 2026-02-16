<%@ Page 
    Language="C#" 
    AutoEventWireup="true"
    MasterPageFile="~/Site.master"
    CodeFile="OH_CENSUSa.aspx.cs"
    Inherits="pages_OH_CENSUSa" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <asp:Literal ID="LitElgWoman" runat="server" Visible="false"  />
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
  <script type="text/javascript">
    function RefreshHHStatusUpdate() {
        __doPostBack('<%= HHStatus.ClientID %>', '');
      };
      function RefreshElgWomanUpdate() {
          __doPostBack('<%= HasElgWoman.ClientID %>', '');
      };
      function RefreshHOHMSUpdate() {
          __doPostBack('<%= CAHOHMS.ClientID %>', '');
      };
      function RefreshHHConsentUpdate() {
          __doPostBack('<%= HHCons.ClientID %>', '');
      };

  </script>

        <div class="page-card">        
        <div class="subnote"> </div>
         <!-- =================== DATE / WORKER / LOCATION =================== -->
         <asp:Panel ID="PanelHeader" runat="server">
            <table class="table">
            <tr>
                <td>
                    <asp:Label ID="LblWeek" Text="Week" runat="server" CssClass="question-label" />
                </td>
                <td>
                    <asp:Label ID="LblDay" Text="Day" runat="server" CssClass="question-label" />
                </td>
                <td>
                    <asp:Label ID="LblMonth" Text="Mon" runat="server" CssClass="question-label" />
                </td>
                <td>
                    <asp:Label ID="LblYear" Text="Year" runat="server" CssClass="question-label" />
                </td>
                <td>
                    <asp:Label ID="LblWorkerID" Text="Worker" runat="server" CssClass="question-label" />
                </td>
            </tr>

            <tr>
                <!-- WEEK -->
                <td>
                    <asp:TextBox AutoComplete="off" runat="server" ID="Week" MaxLength="4" Width="90" />
                    <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="Week"
                            ErrorMessage="Required Field"
                            CssClass="error-msg"
                            Display="Dynamic"
                            EnableClientScript="false" />
                    <asp:CustomValidator
                        ID="CustWeek"
                        runat="server"
                        ControlToValidate="Week"
                        ClientValidationFunction="validateWeek"
                        ErrorMessage="Week must be between 0870 and 1050."
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>

                <!-- DAY -->
                <td>
                    <asp:TextBox AutoComplete="off" runat="server" ID="Day" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator 
                        ID="ReqDay" 
                        runat="server" 
                        ControlToValidate="Day"
                        ErrorMessage="Day is required."
                        CssClass="error-msg" 
                        Display="Dynamic" 
                        SetFocusOnError="true" />
                    <asp:RegularExpressionValidator 
                        ID="RegExDay" 
                        runat="server" 
                        ControlToValidate="Day"
                        ValidationExpression="0[1-9]|[1-2][0-9]|3[0-2]"
                        ErrorMessage="Enter valid day (01–32)." 
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>

                <!-- MONTH -->
                <td>
                    <asp:TextBox AutoComplete="off" runat="server" ID="Month" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator 
                        ID="ReqMonth" 
                        runat="server" 
                        ControlToValidate="Month"
                        ErrorMessage="Month is required."
                        CssClass="error-msg" 
                        Display="Dynamic" 
                        SetFocusOnError="true" />
                    <asp:RegularExpressionValidator 
                        ID="RegExMonth" 
                        runat="server" 
                        ControlToValidate="Month"
                        ValidationExpression="0[1-9]|1[0-2]"
                        ErrorMessage="Enter valid month (01–12)." 
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>

                <!-- YEAR -->
                <td>
                    <asp:TextBox AutoComplete="off" runat="server" ID="Year" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator 
                        ID="ReqYear" 
                        runat="server" 
                        ControlToValidate="Year"
                        ErrorMessage="Year is required."
                        CssClass="error-msg" 
                        Display="Dynamic" 
                        SetFocusOnError="true" />
                    <asp:RegularExpressionValidator 
                        ID="RegExYear" 
                        runat="server" 
                        ControlToValidate="Year"
                        ValidationExpression="82|83|84"
                        ErrorMessage="Year must be 82, 83 or 84."
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>

                <!-- WORKER -->
                <td>
                    <asp:TextBox AutoComplete="off" runat="server" ID="WorkerId" MaxLength="3" Width="70" />
                    <asp:RequiredFieldValidator 
                        ID="ReqWorkerID" 
                        runat="server" 
                        ControlToValidate="WorkerId"
                        ErrorMessage="Worker ID is required."
                        CssClass="error-msg" 
                        Display="Dynamic" 
                        SetFocusOnError="true" />
                    <asp:RegularExpressionValidator 
                        ID="RegExWorkerID" 
                        runat="server" 
                        ControlToValidate="WorkerId"
                        ValidationExpression="^\d{3}$"
                        ErrorMessage="Worker ID must be 3 digits."
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>
            </tr>

            <!-- MUNI / WARD / HH LABELS -->
            <tr>
                <td>
                    <asp:Label ID="LblNGP" Text="Muni ID" runat="server" CssClass="question-label" />
                </td>
                <td>
                    <asp:Label ID="LblWard" Text="Ward" runat="server" CssClass="question-label" />
                </td>
                <td>
                    <asp:Label ID="LblHH" Text="HH" runat="server" CssClass="question-label" />
                </td>
                <td>
                    <asp:Label ID="Label1" Text="Map Unit" runat="server" CssClass="question-label" />
                </td>
            </tr>

            <!-- MUNI / WARD / HH INPUTS -->
            <tr>
                <td>
                    <asp:TextBox AutoComplete="off" runat="server" ID="MuniId" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator 
                        ID="ReqMuniID" 
                        runat="server" 
                        ControlToValidate="MuniId"
                        ErrorMessage="Muni ID is required."
                        CssClass="error-msg" 
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator 
                        ID="RegExMuniID" 
                        runat="server" 
                        ControlToValidate="MuniId"
                        ValidationExpression="19|22|70|75"
                        ErrorMessage="Enter valid Muni ID (19, 22, 70, 75)."
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>

                <td>
                    <asp:TextBox AutoComplete="off" runat="server" ID="Ward" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator 
                        ID="ReqWard" 
                        runat="server" 
                        ControlToValidate="Ward"
                        ErrorMessage="Ward is required."
                        CssClass="error-msg" 
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator 
                        ID="RegExWard" 
                        runat="server" 
                        ControlToValidate="Ward"
                        ValidationExpression="0[1-9]|1[0-2]"
                        ErrorMessage="Enter valid ward (01–12)." 
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>

                <td>
                    <asp:TextBox AutoComplete="off" runat="server" ID="HH" MaxLength="4" Width="90" />
                    <asp:RequiredFieldValidator 
                        ID="ReqHH" 
                        runat="server" 
                        ControlToValidate="HH"
                        ErrorMessage="HH is required."
                        CssClass="error-msg" 
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator 
                        ID="RegExHH" 
                        runat="server" 
                        ControlToValidate="HH"
                        ValidationExpression="^\d{4}$"
                        ErrorMessage="HH must be 4 digits." 
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>

                <td>
                    <asp:TextBox AutoComplete="off" runat="server" ID="MapUnit" MaxLength="4" Width="90" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

              <!-- =================== TOP HOUSEHOLD SECTION =================== -->       
             
               <asp:Panel ID="PanelError" runat="server" CssClass="error-card" Visible="false">
                <div class="error-card-header">
                    <div class="error-card-icon">!</div>
                    <div class="error-card-title">Error</div>
                </div>

                <div class="error-card-body">
                    <asp:Literal ID="LitErrors" runat="server" />
                </div>
            </asp:Panel>

            <asp:Panel ID="PanelTopHHSection" runat="server">
            <div class="table-wrap table-responsive">

                <table class="table">
                    <tr>
                        <td>
                            <button type="button" onclick="getLocation()" 
                                class="btn btn-primary">
                                  Get GPS
                            </button>                                
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <span class="required-field">*</span>                             
                            <asp:Label ID="LabelLat" Text="Latitude" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="LAT" Width="210" />
                            <asp:HiddenField ID="hfLat" runat="server" />                            
                            <asp:RequiredFieldValidator
                                runat="server"
                                ControlToValidate="LAT"
                                ErrorMessage="Latitude required"
                                ValidationGroup="vgHeader"
                                ForeColor="Red" />
                            <asp:RegularExpressionValidator 
                                ID="RegExLat" 
                                runat="server"  
                                ControlToValidate="LAT"
                                ValidationExpression="^([2][6-9]|30)\.[0-9]{1,6}$"
                                ErrorMessage="Enter valid latitude (26.000000 - 30.999999)."
                                CssClass="error-msg"
                                Display="Dynamic" /> 
                             
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <span class="required-field">*</span>                             
                            <asp:Label ID="Label3" Text="Longitude" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <asp:TextBox runat="server" ID="LONG" Width="210" />
                            <asp:HiddenField ID="hfLong" runat="server" />
                            <asp:RequiredFieldValidator
                                runat="server"
                                ControlToValidate="LONG"
                                ErrorMessage="Longitude required"
                                ValidationGroup="vgHeader"
                                ForeColor="Red" />
                            <asp:RegularExpressionValidator 
                                ID="RegExLong" 
                                runat="server"
                                ControlToValidate="LONG"
                                ValidationExpression="^(8[0-8])\.[0-9]{1,6}$"
                                ErrorMessage="Enter valid longitude (80.000000 - 88.999999)."
                                CssClass="error-msg"
                                Display="Dynamic" />
                             
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <span class="required-field">*</span> 
                            <asp:Label ID="Label25" Text="Select Household Status" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList 
                            ID="HHStatus" 
                            runat="server"
                            AutoPostBack="true"
                            ValidationGroup="vgHeader"
                            onchange="RefreshHHStatusUpdate();"
                            OnSelectedIndexChanged="HHStatus_SelectedIndexChanged">
                            <asp:ListItem Enabled="true" Value="">-----</asp:ListItem>
                            <asp:ListItem Text="Exists Old HH (continue)" Value="1" />                            
                            <asp:ListItem Text="Not regularly habited (stop)" Value="3" />
                            <asp:ListItem Text="Not found (stop)" Value="4" />
                            <asp:ListItem Text="No longer exist (stop)" Value="5" />
                        </asp:DropDownList>

                            <asp:RequiredFieldValidator
                                ID="rfvHHStatus"
                                runat="server"
                                ControlToValidate="HHStatus"
                                InitialValue=""
                                ErrorMessage="HH Status required"
                                ForeColor="Red"
                                ValidationGroup="saveGroup" />
                    </td>
                        </tr>
                    </table>
                          
                                            
                    
                        <asp:UpdatePanel ID="Update1" runat="server">
                    <ContentTemplate>  
                    <asp:Panel ID="PanelHeaderData" runat="server" Visible="false">                            
                  <table class="table">
                    <tr>
                        <td>
                            <span class="required-field">*</span> 
                            <asp:Label ID="lbl1" Text="Does this household have an eligible woman (15–35 years old and married)?" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="HasElgWoman" runat="server"
                                AutoPostBack="true"
                                onchange="RefreshElgWomanUpdate();"                                
                                OnSelectedIndexChanged="HasElgWoman_SelectedIndexChanged">
                                <asp:ListItem Enabled="true" Value="">-----</asp:ListItem>
                                <asp:ListItem Text="No" Value="0" />
                                <asp:ListItem Text="Yes" Value="1" />
                            </asp:DropDownList> 
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator2" 
                                runat="server" 
                                ControlToValidate="HasElgWoman"
                                ErrorMessage="Required field"
                                CssClass="error-msg" 
                                Display="Dynamic" />
                        </td>
                    </tr>
                      </table>
                        </asp:Panel> 
                         </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="HHStatus" />
                    </Triggers>
                  </asp:UpdatePanel>
                

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>  
                    <asp:Panel ID="PanelHOH" runat="server" Visible="false">                                              
                    <table class="table">
                    <tr>
                        <td>
                            <asp:Label ID="Label4" Text="First Names of head of household" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox AutoComplete="off" runat="server" ID="HOHFNames" Width="210" />
                          

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label5" Text="Last Name of head of household" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox AutoComplete="off" runat="server" ID="HOHLName" Width="210" />
                           
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label15" Text="Met Status" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                        
                       <tr>
                        <td>
                            <asp:DropDownList ID="CAHOHMS" runat="server"
                                AutoPostBack="true"
                                onchange="RefreshHOHMSUpdate();"                                
                                OnSelectedIndexChanged="CAHOHMS_SelectedIndexChanged">
                                <asp:ListItem Enabled="true" Value="">-----</asp:ListItem>
                                <asp:ListItem Text="Met" Value="1" />
                                <asp:ListItem Text="Not met" Value="2" />
                            </asp:DropDownList>  
                        </td>
                    </tr>

                        <!-- HH CONSENT -->
                    <tr>
                        <td>
                            <asp:Label ID="Label8" Text="Household consent" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="HHCons" runat="server" CssClass="dd-input"
                                AutoPostBack="true"
                                onchange="RefreshHHConsentUpdate();"                                
                                OnSelectedIndexChanged="HHCons_SelectedIndexChanged">
                                <asp:ListItem Value="">-----</asp:ListItem>
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="6">Refused</asp:ListItem>
                            </asp:DropDownList>
                      
                        </td>
                    </tr> 

                    
                      
                        </table>
                        </asp:Panel> 
                         </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="HasElgWoman" />
                    </Triggers>
                  </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>  
                    <asp:Panel ID="PanelRespondent" runat="server" Visible="false">                                              
                    <table class="table">                
                <table>
                      <!-- RESPONDENT -->
                    <tr>
                        <td>
                            <asp:Label ID="Label7" Text="First Names of Respondent" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox AutoComplete="off" runat="server" ID="ResFNames" Width="210" ValidationGroup="vgHeader" />
                            
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="Label6" Text="Last Name of Respondent" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox AutoComplete="off" runat="server" ID="ResLName" Width="210" ValidationGroup="vgHeader" />
                           

                        </td>
                    </tr>
                     
                   </table>
                        </asp:Panel> 
                         </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="CAHOHMS" />
                    </Triggers>
                  </asp:UpdatePanel>

                 
            
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>  
                    <asp:Panel ID="PanelHHConsent" runat="server" Visible="false">                                              
                    <table class="table">                
                <table>
                <!-- FAMILY COUNT -->
                    <tr>
                        <td>
                            <asp:Label ID="Label9" Text="Total family count" runat="server" CssClass="question-label" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox AutoComplete="off" runat="server" ID="PerCount" Width="210" MaxLength="2" ValidationGroup="vgHeader" />
                             
                    <asp:RangeValidator 
                        ID="RangeValidatorPerCount" 
                        runat="server" 
                        ControlToValidate="PerCount" 
                        MinimumValue="01" 
                        MaximumValue="25" 
                        Type="String"
                        ErrorMessage="Enter a value between 01 and 25." 
                        ValidationGroup="vgHeader" 
                        Display="Dynamic" 
                        CssClass="error-msg" />

                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1" 
                        runat="server" 
                        ControlToValidate="PerCount" 
                        ValidationExpression="^(0[1-9]|1[0-9]|2[0-5])$" 
                        ErrorMessage="Must be numerical value."
                        ValidationGroup="vgHeader"
                        CssClass="error-msg" 
                        Display="Dynamic" />
                             
                        </td>
                    </tr>
                    
                 </table>
                        </asp:Panel> 
                         </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="HHCons" />
                    </Triggers>
                  </asp:UpdatePanel>
                 

                <table class="table">
                    <tr>
                    <td>
                        <asp:Button 
                        ID="ButtonSaveHeaderData" 
                        runat="server" 
                        CssClass="btn btn-primary"
                        Text="Submit" 
                        OnClick="ButtonSaveHeaderData_Click"
                        CausesValidation="true"
                        ValidationGroup="vgHeader"
                        OnClientClick="syncGpsToHidden(); return true;" />

                    </td>
                </tr>
                </table> 
                      
            </div>
           </asp:Panel>
              
               

        <asp:CustomValidator 
            ID="cvRepeaterWomen"
            runat="server"
            EnableClientScript="false"
            Display="None"
            OnServerValidate="ValidateRepeaterWomen"
            ValidationGroup="vgCensus" />



             <asp:Panel ID="PanelSuccess" runat="server" Visible="false">
            <div class="success-card">
                <div class="success-card-header">
                    <div class="success-card-icon">✓</div>
                    <div class="success-card-title">Data Saved Successfully</div>
                </div> 
                <div class="success-card-body">
                    <asp:Label ID="lblsucessmsg" runat="server" />  
                </div>
            </div>
            </asp:Panel>
        

         <!-- =================== REPEATER: WOMAN + HUSBAND DETAILS =================== -->
        <asp:Panel ID="PanelCensusPeople" runat="server"  Visible="false">
            <h4 class="page-title"> 
                <asp:Label ID="LblAddress" runat="server" CssClass="success-msg" />                
                
            </h4>
             
            <asp:Repeater ID="RepeaterCensus" runat="server" OnItemDataBound="RepeaterCensus_ItemDataBound" EnableViewState="true">
                <ItemTemplate>
            <!-- =================== WOMAN SECTION =================== -->
                     <table class="table" style="width: 100%; border-collapse: collapse;">
                        <tr>
                            <td colspan="2">
                                <div class="woman-section-title">
                                    <%# (Container.ItemIndex + 1) + ". Woman Details" %>
                                </div>
                            </td>
                        </tr>

                        <!-- NNIPS Number -->
                        <tr>
                            <td>
                                <asp:Label ID="Label2" Text="NNIPSNUM" runat="server" CssClass="question-label" /> :
                            </td>
                            <td>
                                <asp:Label ID="WomanNNIPSNUM" runat="server"
                                    Text='<%# Eval("CensusNNIPSnum") %>' 
                                    CssClass="question-label" />
                            </td>
                        </tr>

                        <!-- First Names -->
                        <tr> 
                            <td class="label-cell">
                                <asp:Label ID="Label10" Text="First Names" runat="server" CssClass="question-label" /> :
                            </td>
                            <td>
                                <asp:Label ID="WomanFirstNames" runat="server"
                                    Text='<%# Eval("CensusFirstNames") %>'
                                    CssClass="question-label" />
                            </td>
                        </tr>

                        <!-- Last Name -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label11" Text="Last Name" runat="server" CssClass="question-label" /> :
                            </td>
                            <td>
                                <asp:Label ID="WomanLastName" runat="server"
                                    Text='<%# Eval("CensusLastName") %>'
                                    CssClass="question-label" />
                            </td>
                        </tr>

                        <!-- Vital Status -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label12" Text="Vital Status" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="CensusVS" runat="server" CssClass="dd-input">
                                    <asp:ListItem Value="">-----</asp:ListItem>
                                    <asp:ListItem Value="1">Alive</asp:ListItem>
                                    <asp:ListItem Value="8">Death</asp:ListItem>
                                    <asp:ListItem Value="9">Unknown</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="ReqWomVS"  SetFocusOnError="true" ValidationGroup="vgCensus"
                                    ControlToValidate="CensusVS"   ErrorMessage="Select VS" runat="server" CssClass="error-msg" />
                            </td>
                        </tr>

                          
                        <!-- DOB (Nepali ddmmyyyy) + Verified/Reported -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label20" Text="Date of Birth (eg. ddmmyyyy)" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                 
                            <asp:TextBox ID="CensusDOBNep"
                                runat="server"
                                CssClass="text-input"
                                Width="120"
                                Text='<%# Eval("CensusDOBNep") %>'
                                onkeyup="calcAge(this);"
                                onblur="calcAge(this);" />

                            <asp:RequiredFieldValidator
                                runat="server"
                                ControlToValidate="CensusDOBNep"
                                ErrorMessage="Required Field"
                                CssClass="error-msg"
                                ValidationGroup="vgCensus"
                                Display="Dynamic"
                                onkeyup="calcAge(this)"
                                onchange="calcAge(this)"
                                EnableClientScript="false" />

                                -
                                <asp:Label ID="CensusAge" runat="server"
                                    Text='<%# Eval("CalculatedAge") %>'
                                    CssClass="question-label" />


                                years
                                 <asp:HiddenField ID="CalculatedAge" runat="server"
                                        Value='<%# Eval("CalculatedAge") %>' />

                            </td>
                        </tr>
                           

                        <!-- Married Status -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label14" Text="Marital Status" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="CensusMarr" runat="server">
                                    <asp:ListItem Value="">-----</asp:ListItem>                                    
                                    <asp:ListItem Value="1">Married with husband</asp:ListItem>
                                    <asp:ListItem Value="2">Married without husband
                                    </asp:ListItem>
                                    <asp:ListItem Value="9">Unknown</asp:ListItem>
                                </asp:DropDownList> <br /><br />
                                Note: Married without husband = Divorced, separated, widowed
                            </td>
                        </tr>

                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label17" Text="Husband NNIPSNUM" runat="server" CssClass="question-label" />
                            </td>
                            <td> 
                                <asp:Label ID="HusbandNNIPSNUM" runat="server"
                                    Text='<%# Eval("CensusHusbNNIPSnum") %>' 
                                    CssClass="question-label" />                                 
                            </td>
                        </tr>

                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label21" Text="Husband First Names" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:Label ID="CensusHusbFirstNames" runat="server"
                                    Text='<%# Eval("CensusHusbFirstNames") %>'                                      
                                    CssClass="question-label" /> 
                            </td>
                        </tr>

                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label22" Text="Husband Last Name" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:Label ID="CensusHusbLastName" runat="server"
                                    Text='<%# Eval("CensusHusbLastName") %>' 
                                    CssClass="question-label" /> 
                            </td>
                        </tr>

                        <!-- Husband Vital Status -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label18" Text="Husband Vital Status" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="CensusHusbVS" runat="server">
                                    <asp:ListItem Value="">-----</asp:ListItem>
                                    <asp:ListItem Value="1">Alive</asp:ListItem>
                                    <asp:ListItem Value="8">Death</asp:ListItem>
                                    <asp:ListItem Value="9">Unknown</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                         
                         <!-- Met Status -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label13" Text="Woman Met Status" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="CensusMS" runat="server">
                                    <asp:ListItem Value="">-----</asp:ListItem>
                                    <asp:ListItem Value="1">Met</asp:ListItem>
                                    <asp:ListItem Value="2">Not Met</asp:ListItem>
                                    <asp:ListItem Value="7">Permanently Moved</asp:ListItem>
                                    <asp:ListItem Value="9">Unknown</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                          

                        <!-- Consent -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label16" Text="Consent to participate" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="CensusConsent" runat="server">
                                    <asp:ListItem Value="">-----</asp:ListItem>
                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                    <asp:ListItem Value="6">Refused</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                          
                    </table>                     
                    </ItemTemplate>
            </asp:Repeater>
            <asp:Button 
               ID="ButtonSaveData" 
               runat="server" 
               CssClass="btn btn-primary"
               Text="Save Data"
               CausesValidation="true"
               ValidationGroup="vgCensus"
               OnClick="ButtonSaveData_Click" />
      </asp:Panel>
              
    <asp:Panel ID="PanelNewWomanConfirm" runat="server" Visible="false">      
          <div class="question-card">
    <div class="question-text">
        Does this household have an eligible woman
        <span class="question-sub">
            (married and 15–35 years old)?
         
        If yes, click <strong>Yes</strong> and record information for all
        married women aged 15–35 years.</span>
    </div>

    <div class="question-actions">
        <asp:Button
            ID="ButtonYes"
            runat="server"
            Text="Yes, continue"
            CssClass="btn btn-yes"
            OnClick="ButtonYes_Click" />

        <asp:Button
            ID="ButtonNo"
            runat="server"
            Text="No, stop"
            CssClass="btn btn-no"
            OnClick="ButtonNo_Click" />
    </div>

</div>      
          
    </asp:Panel>
             


    <!-- =================== CLIENT-SIDE SCRIPTS =================== -->
    <script type="text/javascript">

        // -----------------------------
        // Error highlighting helpers
        // -----------------------------
        function applyErrorClass() {

            // Remove old error highlights
            document.querySelectorAll(".error-msg").forEach(function (el) {
                el.classList.remove("error-msg");
            });

            // ASP.NET validators array
            if (typeof Page_Validators === "undefined") return;
            if (typeof Page_Validators === "undefined") return;

            for (var i = 0; i < Page_Validators.length; i++) {
                var v = Page_Validators[i];

                if (!v.isvalid && v.controltovalidate) {

                    var ctrl = document.getElementById(v.controltovalidate);
                    if (ctrl) {
                        ctrl.classList.add("error-msg");

                        // OPTIONAL: highlight entire repeater row
                        var row = ctrl.closest("div");
                        if (row) {
                            row.classList.add("error-msg");
                        }
                    }
                }
            }
        }

        // Hook into ASP.NET validation display
        if (typeof ValidatorUpdateDisplay === "function") {

            var originalValidatorUpdateDisplay = ValidatorUpdateDisplay;

            ValidatorUpdateDisplay = function (val) {
                originalValidatorUpdateDisplay(val);
                applyErrorClass();
            };
        }


        function calcAge(dobTextbox) {
            const row = dobTextbox.closest("table");
            if (!row) return;

            const ageLabel = row.querySelector("span[id*='CensusAge']");
            const ageHidden = row.querySelector("input[id*='CalculatedAge']");

            if (!ageLabel || !ageHidden) return;

            let dob = dobTextbox.value.trim();
            if (dob.length !== 8) {
                ageLabel.innerText = "";
                ageHidden.value = "";
                return;
            }

            let dd = parseInt(dob.substring(0, 2));
            let mm = parseInt(dob.substring(2, 4)) - 1;
            let yy = parseInt(dob.substring(4, 8));

            let today = new Date();
            let currentBSYear = today.getFullYear() + 57;
            let currentBSMonth = today.getMonth();
            let currentBSDay = today.getDate();

            let age = currentBSYear - yy;

            if (
                mm > currentBSMonth ||
                (mm === currentBSMonth && dd > currentBSDay)
            ) {
                age--;
            }

            if (!isNaN(age) && age >= 0) {
                ageLabel.innerText = age;
                ageHidden.value = age;
            }
        }


 
            function getLocation() {
    if (!navigator.geolocation) {
                alert("GPS not supported");
            return;
    }

            navigator.geolocation.getCurrentPosition(function (pos) {
        var lat = pos.coords.latitude.toFixed(6);
            var lng = pos.coords.longitude.toFixed(6);

        // visible fields
        document.getElementById('<%= LAT.ClientID %>').value = lat;
        document.getElementById('<%= LONG.ClientID %>').value = lng;

        // hidden fields (CRITICAL)
        document.getElementById('<%= hfLat.ClientID %>').value = lat;
        document.getElementById('<%= hfLong.ClientID %>').value = lng;
    });
}
  


// VERY IMPORTANT: sync before postback
function syncGpsToHidden() {

    var latBox = document.getElementById('<%= LAT.ClientID %>');
    var lonBox = document.getElementById('<%= LONG.ClientID %>');

    var hfLat = document.getElementById('<%= hfLat.ClientID %>');
            var hfLong = document.getElementById('<%= hfLong.ClientID %>');

            if (latBox && lonBox) {
                hfLat.value = latBox.value;
                hfLong.value = lonBox.value;
            }
        } 
         
        function validatePair(fnId, lnId, args) {
        var fn = document.getElementById(fnId).value.trim();
            var ln = document.getElementById(lnId).value.trim();

            // both empty = OK
            if (fn === "" && ln === "") {
                args.IsValid = true;
            return;
        }

            // both filled = OK
            if (fn !== "" && ln !== "") {
                args.IsValid = true;
            return;
        }

            // only one filled = INVALID
            args.IsValid = false;
    }
         
</script>



         </div> 
</asp:Content>