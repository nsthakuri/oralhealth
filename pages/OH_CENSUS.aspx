<%@ Page 
    Language="C#" 
    AutoEventWireup="true"
    MasterPageFile="~/Site.master"
    CodeFile="OH_CENSUS.aspx.cs"
    Inherits="pages_OH_CENSUS" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
  <script type="text/javascript">
      function RefreshWomNNIPSNum() {
          __doPostBack('<%= CensusNNIPSNumStatus.ClientID %>', '');
      };
      function RefreshHusbNNIPSNum() {
          __doPostBack('<%= CensusNNIPSNumStatus.ClientID %>', '');
      };

  </script>

    <asp:CustomValidator
                ID="cvCensus"
                runat="server"
                ValidationGroup="vgCensus"
                Display="None"
                OnServerValidate="cvCensus_ServerValidate" />

        <asp:Panel ID="PanelError" runat="server" CssClass="error-card" Visible="false">
            <div class="error-card-body">
                <asp:Literal ID="LitErrors" runat="server" /> 
 
            </div>
        </asp:Panel> 
             

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
        <asp:Panel ID="PanelCensusPeople" runat="server">
            <h4 class="page-title"> 
                <asp:Label ID="LblAddress" runat="server" CssClass="success-msg" />                
                
            </h4>
             
            <!-- =================== WOMAN SECTION =================== -->

                     
                         <asp:Panel ID="PanelWomanNNIPSNUM" runat="server">     
                     <table class="table" style="width: 100%; border-collapse: collapse;">
                         <tr>
                    <td><asp:Label ID="Label1" Text="Assign NNIPSNUM" runat="server" CssClass="question-label" /> :</td>
                    <td><asp:DropDownList ID="CensusNNIPSNumStatus" runat="server"
                            AutoPostBack="true" onchange="RefreshWomNNIPSNum();"
                            OnSelectedIndexChanged="CensusNNIPSNumStatus_SelectedIndexChanged">
                        <asp:ListItem Value="">---</asp:ListItem>
                        <asp:ListItem Value="1">Auto assign</asp:ListItem>
                        <asp:ListItem Value="2">Manual assign</asp:ListItem>
                        <asp:ListItem Value="3">Correction</asp:ListItem>
                    </asp:DropDownList>

                        <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" 
                                runat="server" 
                                ControlToValidate="CensusNNIPSNumStatus"
                                InitialValue=""
                                ErrorMessage="Select NNIPSNum status" 
                                CssClass="error-msg" 
                                Display="Dynamic" />                         
                    </td>
                </tr>
                          

                     </table>
                    </asp:Panel>

                    <asp:UpdatePanel ID="Update1" runat="server">
                    <ContentTemplate>  
                    <asp:Panel ID="PanelWomNNIPSNum" runat="server">
                  <table class="table">
                      <tr>
                          <td colspan="2">
                              <asp:Label ID="LblNote" runat="server" CssClass="card-title" />
                          </td>
                      </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" Text="NNIPSNUM" runat="server" CssClass="question-label" /> :
                            </td>
                            <td>
                                <asp:TextBox ID="WomanNNIPSNUM" runat="server"
                                    Text='<%# Eval("CensusNNIPSnum") %>' 
                                    MaxLength="6"
                                    CssClass="question-label" />
                            </td>
                        </tr>
                          </table>
                        </asp:Panel> 
                         </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="CensusNNIPSNumStatus" />
                    </Triggers>
                  </asp:UpdatePanel>
                        
                         <!-- First Names -->

                  <table class="table">
                      <tr> 
                            <td class="label-cell">
                                <asp:Label ID="Label10" Text="First Names" runat="server" CssClass="question-label" /> :
                            </td>
                            <td>
                                <asp:TextBox ID="WomanFirstNames" runat="server"
                                    Text='<%# Eval("CensusFirstNames") %>'
                                    MaxLength="30"
                                    CssClass="question-label" />
                            </td>
                        </tr>

                        <!-- Last Name -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label11" Text="Last Name" runat="server" CssClass="question-label" /> :
                            </td>
                            <td>
                                <asp:TextBox ID="WomanLastName" runat="server"
                                    Text='<%# Eval("CensusLastName") %>'
                                    MaxLength="30"
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
                                <asp:RequiredFieldValidator ID="ReqWomVS"  SetFocusOnError="true"
                                    ValidationGroup="vgCensus" InitialValue=""
                                    ControlToValidate="CensusVS"  runat="server" CssClass="error-msg" />
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
                                 MaxLength="8"
                                 Text='<%# Eval("CensusDOBNep") %>'
                                 onkeyup="calcAge(this);"
                                 onchange="calcAge(this);" />

                         <asp:CustomValidator ID="cvDOBNep"
                                runat="server"
                                ControlToValidate="CensusDOBNep"
                                ErrorMessage="Invalid date format. Use DDMMYYYY."
                                OnServerValidate="cvDOBNep_ServerValidate"
                                Display="Dynamic"
                                ForeColor="Red"
                                ValidationGroup="vgCensus" />




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
                                   CssClass="question-label" /> years

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
                      </table>

                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>  
                    <asp:Panel ID="PanelHusbandNNIPSNUM" runat="server">     
                  <table class="table">
                         
                         <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label3" Text="Assign NNIPSNUM" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="CensusHusbNNIPSNumStatus" runat="server"
                                    AutoPostBack="true" onchange="RefreshHusbNNIPSNum();"
                                    OnSelectedIndexChanged="CensusHusbNNIPSNumStatus_SelectedIndexChanged">
                                    <asp:ListItem Value="1">Auto assign</asp:ListItem>
                                    <asp:ListItem Value="2">Manual assign</asp:ListItem>                                    
                                </asp:DropDownList>
                            </td>
                        </tr>
                             </table>
                        </asp:Panel> 
                         </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="CensusNNIPSNumStatus" />
                    </Triggers>
                  </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>  
                    <asp:Panel ID="PanelHusbNNIPSNum" runat="server">     
                  <table class="table">
              
               <table class="table">

                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label17" Text="Husband NNIPSNUM" runat="server" CssClass="question-label" />
                            </td>
                            <td> 
                                <asp:TextBox ID="HusbandNNIPSNUM" runat="server"
                                    Text='<%# Eval("CensusHusbNNIPSnum") %>'                                     
                                    MaxLength="6"
                                    CssClass="question-label" />                                 
                            </td>
                        </tr>

                              </table>
                        </asp:Panel> 
                         </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="CensusNNIPSNumStatus" />
                        <asp:AsyncPostBackTrigger ControlID="CensusHusbNNIPSNumStatus" />
                    </Triggers>
                  </asp:UpdatePanel>

               
                <table class="table">
                    <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label21" Text="Husband First Names" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:TextBox ID="CensusHusbFirstNames" runat="server"
                                    Text='<%# Eval("CensusHusbFirstNames") %>'                                                                          
                                    MaxLength="30"
                                    CssClass="question-label" /> 
                            </td>
                        </tr>

                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label22" Text="Husband Last Name" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:TextBox ID="CensusHusbLastName" runat="server"
                                    Text='<%# Eval("CensusHusbLastName") %>' 
                                    MaxLength="30"
                                    CssClass="question-label" /> 
                            </td>
                        </tr>

                        <!-- Husband Vital Status -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label18" Text="Husband Vital Status" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="CensusHusbandVS" runat="server">
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
                    

            <asp:Button 
               ID="ButtonSaveData" 
               runat="server" 
               CssClass="btn btn-primary"
               Text="Save Data"
               CausesValidation="true"
               ValidationGroup="vgCensus"
               OnClick="ButtonSaveData_Click" />
      </asp:Panel>
                
    <br />
      <asp:Panel ID="PanelPopulateHusbandList" runat="server" Visible="false"> 
          <div class="alert-heading">     
          <b>Select Husband from Household Roster: </b> The names of husbands aged 15 years and above living in this household are listed below. 
          If one of them is your husband, please select him from the list. The NNIPS number should select 
              manual assignment option.
          </div>
           <asp:GridView 
            ID="GridHusbandList" 
            runat="server"
            AutoGenerateColumns="false"
            CssClass="woman-grid"
            AllowSorting="false"
            AllowPaging="false"
            ShowHeaderWhenEmpty="true"
            EmptyDataText="No record found."
            EmptyDataRowStyle-CssClass="grid-empty-msg">
             
                <Columns> 
         <asp:BoundField 
            DataField="NNIPSNum" 
            HeaderText="NNIPSNum"
            ItemStyle-CssClass="cell-text" />
                     
        <asp:BoundField 
            DataField="FirstNames" 
            HeaderText="First Name"
            ItemStyle-CssClass="cell-text" />


        <asp:BoundField 
            DataField="LastName" 
            HeaderText="Last Name"
            ItemStyle-CssClass="cell-text" />

        <asp:BoundField 
            DataField="DOBNep" 
            HeaderText="DOB"
            ItemStyle-CssClass="cell-text" />
            
        <asp:BoundField 
            DataField="CalculatedAge" 
            HeaderText="Age"
            ItemStyle-CssClass="cell-text" />
                     
                     
    </Columns>
</asp:GridView>  
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

            const ageLabel = row.querySelector("[id$='CensusAge']");
            const ageHidden = row.querySelector("[id$='CalculatedAge']");
            if (!ageLabel || !ageHidden) return;

            let dob = dobTextbox.value.trim();

            // allow unknown DOB
            if (dob === "99999999") {
                ageLabel.innerText = "";
                ageHidden.value = "";
                return;
            }

            // must be 8 digits
            if (!/^\d{8}$/.test(dob)) {
                ageLabel.innerText = "";
                ageHidden.value = "";
                return;
            }

            let dd = parseInt(dob.substring(0, 2), 10);
            let mm = parseInt(dob.substring(2, 4), 10);
            let yy = parseInt(dob.substring(4, 8), 10);

            // handle unknown day/month
            if (dd === 99) dd = 1;
            if (mm === 99) mm = 1;

            // convert BS -> AD (approximation: AD = BS - 57)
            let adYear = yy - 57;
            let adMonth = mm - 1; // JS months 0-11
            let adDay = dd;

            let dobAd = new Date(adYear, adMonth, adDay);
            let today = new Date();

            let age = today.getFullYear() - dobAd.getFullYear();
            let m = today.getMonth() - dobAd.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < dobAd.getDate())) age--;

            if (!isNaN(age) && age >= 0) {
                ageLabel.innerText = age;
                ageHidden.value = age; // hiddenfield updated
            } else {
                ageLabel.innerText = "";
                ageHidden.value = "";
            }
        }

           
         
  </script>
           
</asp:Content>