<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OH_CREATEHH.aspx.cs" Inherits="pages_OH_CREATEHH" %>
<%@ MasterType VirtualPath="../site.master" %>  
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Literal ID="LitCurWeek" runat="server" Visible="false" />
    <div class="page-card">         
        <asp:Literal ID="LitAddress" runat="server" Visible="false" />

        <asp:Panel ID="PanelError" runat="server" CssClass="error-card" Visible="false">
                <div class="error-card-header">
                    <div class="error-card-icon">!</div>
                    <div class="error-card-title">Error</div>
                </div>

                <div class="error-card-body">
                    <asp:Literal ID="LitErrors" runat="server" />
                </div>
            </asp:Panel>

        <asp:Panel ID="PanelSuccess" runat="server" Visible="false">
            <div class="success-card">
                <div class="success-card-header">
                    <div class="success-card-icon">✓</div>
                    <div class="success-card-title">Household successfully created.</div>
                </div> 
                <div class="success-card-body">
                    <asp:Label ID="lblsucessmsg" runat="server" />  
                </div>  
            </div>
            </asp:Panel>

        <asp:ValidationSummary 
    runat="server"
    CssClass="error-msg"
    HeaderText="Please fix:"
    ShowMessageBox="true"
    ShowSummary="false" />

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


        <asp:Panel ID="PanelHeader" runat="server" DefaultButton="ButtonCreateHH">
            <table class="table">
            <tr>
                <td>
                    <asp:Label ID="LblWeek" Text="Week" runat="server" CssClass="question-label" />
                </td>
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
                        ErrorMessage="Week must be between 0870 and 1050."
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>
                </tr>

                <tr> 
                <td>
                    <asp:Label ID="LblDay" Text="Day" runat="server" CssClass="question-label" />
                </td>
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
                </tr>

                <tr> 
                    
                <td>
                    <asp:Label ID="LblMonth" Text="Mon" runat="server" CssClass="question-label" />
                </td>
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
                </tr>

                <tr> 
                <td>
                    <asp:Label ID="LblYear" Text="Year" runat="server" CssClass="question-label" />
                </td>
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
                </tr>

                <tr> 
                <td>
                    <asp:Label ID="LblWorkerID" Text="Worker" runat="server" CssClass="question-label" />
                </td>
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
          
         
                <tr> 
                        <td>
                            <button type="button" onclick="getLocation()" 
                                class="btn btn-primary">
                                  Get GPS
                            </button>                                
                        </td>
                       <td> ....</td>
                    </tr>

                <tr>
                        <td> 
                            <asp:Label ID="LabelLat" Text="Latitude" runat="server" CssClass="question-label" />
                        </td>
                     
                        <td>
                            <asp:TextBox runat="server" ID="LAT" Width="210" ReadOnly="true" />                             
                            <asp:RegularExpressionValidator 
                                ID="RegExLat" 
                                runat="server"  
                                ControlToValidate="LAT"
                                ValidationExpression="^([2][6-9]|30)\.[0-9]{1,6}$"
                                ErrorMessage="Enter valid latitude (26.000000 - 30.999999)." 
                                CssClass="error-msg"
                                Display="Dynamic" />

                            <asp:HiddenField ID="hfLat" runat="server" />                            
                             
                        </td>
                    </tr>

                    <tr>
                        <td> 
                            <asp:Label ID="Label3" Text="Longitude" runat="server" CssClass="question-label" />
                        </td>
                     
                        <td>
                            <asp:TextBox runat="server" ID="LONG" Width="210"  ReadOnly="true" />
                            
                            <asp:RegularExpressionValidator 
                                ID="RegExLong" 
                                runat="server"
                                ControlToValidate="LONG"
                                ValidationExpression="^(8[0-8])\.[0-9]{1,6}$"
                                ErrorMessage="Enter valid longitude (80.000000 - 88.999999)." 
                                CssClass="error-msg"
                                Display="Dynamic" />   
                                
                              <asp:HiddenField ID="hfLong" runat="server" />
                             
                        </td>
                    </tr>

        <tr>
                <td>
                    <asp:Label ID="LblNGP" Text="Muni ID" runat="server" CssClass="question-label" />
                </td>
            <td>
                    <asp:TextBox AutoComplete="off" runat="server" ID="MuniId" MaxLength="2" Width="60" />
                    <asp:RequiredFieldValidator 
                        ID="ReqMuniID" 
                        runat="server" 
                        ControlToValidate="MuniId"
                        ErrorMessage="Muni ID is required."
                        CssClass="error-msg" TextMode="Number"
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator 
                        ID="RegExMuniID" 
                        runat="server" 
                        ControlToValidate="MuniId"
                        ValidationExpression="^(19|22|70|75)$"
                        ErrorMessage="Enter valid Muni ID (19, 22, 70, 75)."
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>
         </tr> 
                

            <tr>
                <td>
                    <asp:Label ID="LblWard" Text="Ward" runat="server" CssClass="question-label" />

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
                        ValidationExpression="^(0[1-9]|1[0-2])$"
                        ErrorMessage="Enter valid ward (01–12)." 
                        CssClass="error-msg"
                        Display="Dynamic" />

                </td>
            </tr>
                 
           <tr>
                <td>
                    <asp:Label ID="Label1" Text="Map Unit" runat="server" CssClass="question-label" />

                </td>            
                <td>
                    M <asp:TextBox AutoComplete="off" runat="server" ID="MapUnit" MaxLength="3" Width="90" />
                    <asp:RequiredFieldValidator
                            runat="server"
                            ControlToValidate="MapUnit"
                            ErrorMessage="Map unit is required."
                            CssClass="error-msg"
                            Display="Dynamic"
                            EnableClientScript="false" />
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1" 
                        runat="server" 
                        ControlToValidate="MapUnit"
                        ValidationExpression="^\d{3}$"
                        ErrorMessage="Map unit must be 3 digits."
                        CssClass="error-msg"
                        Display="Dynamic" />
                </td>
            </tr>

                <tr>
                    <td colspan="2">
                        <asp:CustomValidator 
                        ID="cvHHLogic"
                        runat="server"
                        ErrorMessage="Household validation failed."
                        CssClass="error-msg"
                        Display="Dynamic"
                        OnServerValidate="cvHHLogic_ServerValidate" />

                    <asp:ValidationSummary
                        runat="server"
                        CssClass="error-msg"
                        ShowMessageBox="true"
                        ShowSummary="false" />

                    </td>
                </tr>

                <tr>
                        <td> 
                            <asp:Label ID="lbl1" Text="Does this household have an eligible woman (15–35 years old and married)?" runat="server" CssClass="question-label" />
                        </td>
                    
                        <td>
                            <asp:DropDownList ID="HasElgWoman" runat="server" onchange="onHasElgChange();">
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

                <tr>
                        <td>
                            <asp:Label ID="Label4" Text="First Names of head of household" runat="server" CssClass="question-label" />
                        </td>
                     
                        <td>
                            <asp:TextBox AutoComplete="off" runat="server" ID="HOHFNames" Width="210" />                           
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label5" Text="Last Name of head of household" runat="server" CssClass="question-label" />
                        </td>                    
                        <td>
                            <asp:TextBox AutoComplete="off" runat="server" ID="HOHLName" Width="210" />
                           
                        </td>
                    </tr>

                     
                    <!-- RESPONDENT -->
                    <tr>
                        <td>
                            <asp:Label ID="Label7" Text="First Names of Respondent" runat="server" CssClass="question-label" />
                        </td>
                        <td>
                            <asp:TextBox AutoComplete="off" runat="server" ID="ResFNames" Width="210" ValidationGroup="vgHeader" />
                            
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="Label6" Text="Last Name of Respondent" runat="server" CssClass="question-label" />
                        </td>
                        <td>
                            <asp:TextBox AutoComplete="off" runat="server" ID="ResLName" Width="210" ValidationGroup="vgHeader" />
                           

                        </td>
                    </tr>
                     
                    <!-- HH CONSENT -->
                    <tr>
                        <td>
                            <asp:Label ID="Label8" Text="Household consent" runat="server" CssClass="question-label" />
                        </td>
                        <td>
                            <asp:DropDownList ID="HHCons" runat="server" CssClass="dd-input">
                                <asp:ListItem Value="">-----</asp:ListItem>
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="6">Refused</asp:ListItem>
                            </asp:DropDownList>
                      
                        </td>
                    </tr> 

                    <!-- FAMILY COUNT -->
                    <tr>
                        <td>
                            <asp:Label ID="Label9" Text="Family count" runat="server" CssClass="question-label" />
                        </td>
                        <td>
                            <asp:TextBox AutoComplete="off" runat="server" ID="PerCount" Width="210" MaxLength="2" ValidationGroup="vgHeader"/>
                            <asp:RegularExpressionValidator 
                            ID="RegularExpressionValidator2" 
                            runat="server" 
                            ControlToValidate="PerCount"
                            ValidationExpression="^\d{2}$"
                            ErrorMessage="Numerical value only"
                            CssClass="error-msg"
                            Display="Dynamic" />
                             
                        </td>
                    </tr>
                     
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="ButtonCreateHH" runat="server" CssClass="btn btn-primary"                             
                             OnClick="ButtonCreateHH_Click" Text="Create New HH" CausesValidation="true" />
                        </td>
                    </tr>
                </table>
            </asp:Panel> 
     
     </div> 

    <!-- =================== CLIENT-SIDE SCRIPTS =================== -->
    <script type="text/javascript">
          
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

</asp:Content>
