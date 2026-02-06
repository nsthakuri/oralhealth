<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OH_WOMENLISTS.aspx.cs" Inherits="dashboard_OH_WOMENLISTS" %>
<%@ Register TagPrefix="HeaderController" TagName="HeaderRow" Src="Header.ascx" %>
<%@ Register TagPrefix="LeftMenuController" TagName="LeftMenuRow" Src="LeftMenu.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Oral Health Admin — Women Lists</title>
    <!-- Favicons -->
  <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/study_logo.png" />
  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet" />
  <link href="assets/style.css" rel="stylesheet" />
  <link href="<%= ResolveUrl("../assets/css/gridstyle.css") %>" rel="stylesheet" />    
</head>
<body>
    <form id="form1" runat="server">
        <div>
 
             <!-- Topbar -->  
        <HeaderController:HeaderRow ID="HeaderRow" runat="server" />
 
  <!-- Sidebar -->
  <aside class="sidebar" id="sidebar">
   <LeftMenuController:LeftMenuRow ID="LeftMenuRow" runat="server" /> 
  </aside>

  <!-- Main Content -->
  <main class="content">
    <div class="container-fluid py-4">

        <asp:Panel ID="PanelSearch" runat="server">     
            Enter Address: <asp:TextBox ID="Address" runat="server" CssClass="text-input" Width="280" />
            <asp:Button 
                        ID="ButtonCensusSaveData" 
                        runat="server" 
                        CssClass="btn btn-primary"
                        Text="Search"
                        CausesValidation="false"
                        OnClick="ButtonSearch_Click" />
        </asp:Panel>

               <asp:Panel ID="PanelCensusForm" runat="server" DefaultButton="ButtonCensusSaveData" Visible="false">
 
            <!-- =================== WOMAN SECTION =================== -->
                     <table class="table" style="width: 100%; border-collapse: collapse;">
            
                         <tr>
                             <td colspan="2">
                                 <asp:Label runat="server" ID="LblWomanType" />
                                  
                                 </td>
                         </tr>

                         <tr>
                             <th colspan="2">&nbsp; </th>
                         </tr>
                         <tr>
                            <td class="label-cell"><asp:Label ID="Label1" Text="NNIPSNUM" runat="server" CssClass="question-label" /> :</td>
                            <td>
                               <asp:Label ID="TBCensusID" runat="server" CssClass="text-input" Width="50" Visible="false" />

                                <asp:TextBox ID="NewCensusNNIPSnum" runat="server" CssClass="text-input" Width="280" />
                                <br />
                                <asp:CheckBox ID="ChkCensusNNIPSnum" runat="server" Visible="false" /> 
                                <asp:Label ID="LblCensusNNIPSnum" runat="server" CssClass="text-input" Visible="false">
                                Enter the NNIPS number or check here to auto-assign a new NNIPS number.
                                </asp:Label>
                                
                                
                                
                                <asp:CustomValidator
                            ID="cvWomanNNIPS"
                            runat="server"
                            ControlToValidate="NewCensusNNIPSnum"
                            ValidationGroup="vgCensus"
                            ErrorMessage="Invalid NNIPS number selection"
                            CssClass="error-msg"
                            Display="Dynamic"
                            OnServerValidate="ValidateWomanNNIPS" />


                            </td>
                        </tr>
 
                         <!-- First Names -->
                        <tr> 
                            <td class="label-cell">
                                <asp:Label ID="Label10" Text="First Names" runat="server" CssClass="question-label" /> :
                            </td>
                            <td>
                                <asp:TextBox
                                ID="NewCensusFirstNames"
                                runat="server"
                                MaxLength="30"
                                Width="280" />

                            <asp:RequiredFieldValidator
                                runat="server"
                                ControlToValidate="NewCensusFirstNames"
                                ErrorMessage="Required Field"
                                CssClass="error-msg"
                                Display="Dynamic"
                                EnableClientScript="false" />



                            </td>
                        </tr>

                        <!-- Last Name -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label11" Text="Last Name" runat="server" CssClass="question-label" /> :
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" runat="server"
                                    ID="NewCensusLastName" 
                                    ErrorMessage="Required Field"
                                CssClass="error-msg"
                                Display="Dynamic"
                                EnableClientScript="false" />

                            <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="NewCensusLastName"
                            ErrorMessage="Required Field"
                            CssClass="error-msg"
                            Display="Dynamic"
                            EnableClientScript="false" />

                            </td>
                        </tr>

                        <!-- Vital Status -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label12" Text="Vital Status" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="NewCensusVS" runat="server" CssClass="dd-input">                                    
                                    <asp:ListItem Value="1">Alive</asp:ListItem> 
                                </asp:DropDownList>                                
                            </td>
                        </tr>

                          
                        
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label20" Text="Date of Birth (eg. ddmmyyyy)" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                            <asp:TextBox ID="NewCensusDOBNep"
                            runat="server"
                            CssClass="text-input"
                            Width="120"
                            onkeyup="calcAge(this);"
                            onblur="calcAge(this);" />

                            <asp:RequiredFieldValidator
                                runat="server"
                                ControlToValidate="NewCensusDOBNep"
                                ErrorMessage="Required Field"
                                CssClass="error-msg"
                                Display="Dynamic"
                                EnableClientScript="false" />

                                -
                                <asp:TextBox ID="NewCensusAge" runat="server" CssClass="text-input" Width="60" />
                                years
                        <asp:RegularExpressionValidator
                            runat="server"
                            ControlToValidate="NewCensusDOBNep"
                            ValidationExpression="^\d{8}$"
                            ErrorMessage="DOB must be ddmmyyyy"
                            CssClass="error-msg" />

                                
                            </td>
                        </tr>
                           

                        <!-- Married Status -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label14" Text="Marital Status" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="NewCensusMarr" runat="server">                                    
                                    <asp:ListItem Value="1">Married with husband</asp:ListItem>                                    
                                </asp:DropDownList> <br /><br />
                                
                            </td>
                        </tr>

                        <tr>
                    <td class="label-cell"><asp:Label ID="Label2" Text="Husband NNIPSNUM" runat="server" CssClass="question-label" /> :</td>
                    <td>
                        <asp:TextBox ID="NewHusbandNNIPSNUM" runat="server" CssClass="text-input" Width="280" />
                        <br />
                        <asp:CheckBox ID="ChkNewHusbandNNIPSNUM" runat="server" /> 
                        Enter the NNIPS number or check here to auto-assign a new NNIPS number.

                        <asp:CustomValidator
                            runat="server"
                            ErrorMessage="Invalid Husband NNIPS selection"
                            CssClass="error-msg"
                            Display="Dynamic"
                            EnableClientScript="false"
                            OnServerValidate="ValidateHusbandNNIPS" />


                    </td>
                </tr>

                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label21" Text="Husband First Names" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:TextBox AutoComplete="off" runat="server" 
                                    ID="NewCensusHusbFirstNames" 
                                    ErrorMessage="Required Field"
                                    CssClass="error-msg"
                                    Display="Dynamic"
                                    EnableClientScript="false" />

                            <asp:RequiredFieldValidator
                                runat="server"
                                ControlToValidate="NewCensusHusbFirstNames"
                                ErrorMessage="Required Field"
                                CssClass="error-msg"
                                Display="Dynamic"
                                EnableClientScript="false" />

                            </td>
                        </tr>

                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label22" Text="Husband Last Name" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                            <asp:TextBox AutoComplete="off" runat="server" 
                                ID="NewCensusHusbLastName"
                                ErrorMessage="Required Field"
                                CssClass="error-msg"
                                Display="Dynamic"
                                EnableClientScript="false" />

                            <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="NewCensusHusbLastName"
                            ErrorMessage="Required Field"
                            CssClass="error-msg"
                            Display="Dynamic"
                            EnableClientScript="false" />

                            </td>
                        </tr>

                        <!-- Husband Vital Status -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label18" Text="Husband Vital Status" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="NewCensusHusbVS" runat="server">                                    
                                    <asp:ListItem Value="1">Alive</asp:ListItem> 
                                </asp:DropDownList>
                            </td>
                        </tr>
                         
                         <!-- Met Status -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label13" Text="Woman Met Status" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="NewCensusMS" runat="server">                                    
                                    <asp:ListItem Value="1">Met</asp:ListItem>
                                    <asp:ListItem Value="2">Not Met</asp:ListItem> 
                                </asp:DropDownList>

                                <asp:CustomValidator
                                    ID="CV_MetStatus"
                                    runat="server"
                                    ErrorMessage="Invalid Met Status dependency"
                                    CssClass="error-msg"
                                    Display="Dynamic"
                                    ClientValidationFunction="validateMetStatus"
                                    OnServerValidate="ValidateMetStatus" />

                            </td>
                        </tr>

                         

                        <!-- Consent -->
                        <tr>
                            <td class="label-cell">
                                <asp:Label ID="Label16" Text="Consent to participate" runat="server" CssClass="question-label" />
                            </td>
                            <td>
                                <asp:DropDownList ID="NewCensusConsent" runat="server">                                    
                                    <asp:ListItem Value="">---</asp:ListItem> 
                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                    <asp:ListItem Value="6">Refused</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                          
                    </table>                     
                    
                   <asp:Button 
                        ID="Button1" 
                        runat="server" 
                        CssClass="btn btn-primary"
                        Text="Save Data"
                        CausesValidation="false"
                        OnClick="ButtonCensusSaveData_Click" />

            </asp:Panel>

      <asp:Panel ID="PanelPopulateWomanList" runat="server">     
                 
           <asp:GridView 
            ID="GridWomanList" 
            runat="server"
            AutoGenerateColumns="false"
            CssClass="woman-grid"
            AllowSorting="false"
            AllowPaging="false"
            ShowHeaderWhenEmpty="true"
            EmptyDataText="No record found."
            EmptyDataRowStyle-CssClass="grid-empty-msg"
            DataKeyNames="CensusID,CensusFirstNames,CensusLastName"
            OnRowCommand="GridWomanList_RowCommand">
                
               <Columns>

                   <asp:BoundField 
            DataField="CensusID" 
            HeaderText="ID" Visible="false"
            ItemStyle-CssClass="cell-text" />

                   <asp:TemplateField HeaderText="SN">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>. 
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                </asp:TemplateField>

                   <asp:BoundField 
            DataField="CensusAddress" 
            HeaderText="Address"
            ItemStyle-CssClass="cell-text" />

        <asp:BoundField 
            DataField="CensusFirstNames" 
            HeaderText="First Name"
            ItemStyle-CssClass="cell-text" />


        <asp:BoundField 
            DataField="CensusLastName" 
            HeaderText="Last Name"
            ItemStyle-CssClass="cell-text" />
                    
           <asp:TemplateField HeaderText="Census Status">
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server"
                    Text='<%# Eval("CensusStatus").ToString() == "1" ? "Complete" : "Incomplete" %>'
                    CssClass='<%# Eval("CensusStatus").ToString() == "1" ? "status-complete" : "status-incomplete" %>'>
                </asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                    
        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:LinkButton
                    ID="ButtonAddToCensusOutsideNNIPS"
                    runat="server"
                    Text="Add to census"
                    CommandName="ButtonAddToCensusOutsideNNIPS"
                    CommandArgument='<%# Container.DataItemIndex %>'
                    CssClass="btn-link btn-nnips"
                    CausesValidation="false" />
            </ItemTemplate>
        </asp:TemplateField>
                     

          <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:LinkButton
                    ID="btnDelete"
                    runat="server"
                    Text="Delete"
                    CommandName="DeleteRow"
                    CommandArgument='<%# Eval("CensusID") %>'
                    CssClass="btn-link btn-non-nnips"
                    CausesValidation="false"
                    OnClientClick="return confirm('Are you sure you want to delete this woman?');" />
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView> 

</asp:Panel>
 


 

    </div>
  </main>

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


        /* completed age calculation*/
        function calcAge(dobTextbox) {
            const row = dobTextbox.closest("table");   // parent woman table
            if (!row) return;

            const ageTextbox = row.querySelector("input[id*='NewCensusAge']");
            if (!ageTextbox) return;

            let dob = dobTextbox.value.trim();
            if (dob.length !== 8) {
                ageTextbox.value = "";
                return;
            }

            let dd = parseInt(dob.substring(0, 2));
            let mm = parseInt(dob.substring(2, 4)) - 1;   // JS months are 0-based
            let yy = parseInt(dob.substring(4, 8));

            // Approximate current BS date
            let todayAD = new Date();
            let currentBSYear = todayAD.getFullYear() + 57;
            let currentBSMonth = todayAD.getMonth();   // approximation
            let currentBSDay = todayAD.getDate();      // approximation

            // Start with simple year difference
            let age = currentBSYear - yy;

            // Reduce age by 1 if birthday has NOT occurred yet this year
            if (
                mm > currentBSMonth ||
                (mm === currentBSMonth && dd > currentBSDay)
            ) {
                age = age - 1;
            }

            if (!isNaN(age) && age >= 0) {
                ageTextbox.value = age;   // COMPLETED YEARS ONLY
            }
        }

    function validateWomanNNIPS(sender, args) {
        var chk = document.getElementById('<%= ChkCensusNNIPSnum.ClientID %>').checked;
        var txt = document.getElementById('<%= NewCensusNNIPSnum.ClientID %>').value.trim();

        args.IsValid = chk ? (txt === "") : (txt !== "");
     }



    function validateHusbandNNIPS(sender, args) {
        var chk = document.getElementById('<%= ChkNewHusbandNNIPSNUM.ClientID %>').checked;
        var txt = document.getElementById('<%= NewHusbandNNIPSNUM.ClientID %>').value.trim();

        args.IsValid = chk ? (txt === "") : (txt !== "");
    }



    function validateMetStatus(sender, args) {
        var ms = document.getElementById('<%= NewCensusMS.ClientID %>').value; 
        var cons = document.getElementById('<%= NewCensusConsent.ClientID %>').value;

                if (ms === "1") {
                    args.IsValid = (cons !== "");
        } else if (ms === "2") {
                    args.IsValid = (cons === "");
        } else {
                    args.IsValid = false;
        }
    }
    </script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
  <script src="assets/app.js"></script>
  <script src="assets/dashboard.js"></script>

        </div>
    </form>
</body>
</html>
