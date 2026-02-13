<%@ Page Title="Participant Profile Summary"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeFile="OH_SEARCH.aspx.cs"
    Inherits="pages_OH_SEARCH" %>
<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Literal ID="LitCurWeek" runat="server" Visible="false" />
    
    <div class="page-card">
        <asp:Panel ID="PanelError" runat="server" CssClass="error-card" Visible="false">
        <div class="error-card-body">
            <asp:Literal ID="LitErrors" runat="server" /> 
 
        </div>
    </asp:Panel>
         
        <asp:Panel ID="PanelData" runat="server">
        <h2 class="page-title">👩‍⚕️ Participant Profile Summary</h2>
        <%--<div class="subnote">Participant Dashboard</div>--%>        
        <table class="table">
            <tr><td>Pregnancy Status:</td><td><asp:Label ID="LblPregnancyStatus" runat="server" /></td></tr>
            <tr><td>NNIPSNum:</td><td><asp:Label ID="LblNNIPSNum" runat="server" /></td></tr>
            <tr><th>Woman Name:</th><th><asp:Label ID="LblName" runat="server" /></th></tr>
            <tr><td>Husband NNIPSNum:</td><td><asp:Label ID="LblHusbNNIPSNum" runat="server" /></td></tr>
            <tr><td>Husband Name:</td><td><asp:Label ID="LblHusbName" runat="server" /></td></tr>
            <tr><td>Date of Birth:</td><td><asp:Label ID="LblDOB" runat="server" /></td></tr>            
            <tr><td>Age at Enrollment:</td><td><asp:Label ID="LblAgeAtEnroll" runat="server" /></td></tr>
            <tr><td>Enrollment Date:</td><td><asp:Label ID="LblEnrollDate" runat="server" /></td></tr>
            <tr><td>Address:</td><td><asp:Label ID="LblAddress" runat="server" /></td></tr>
            <tr><td>Map Unit:</td><td><asp:Label ID="LblMapUnit" runat="server" /></td></tr>
            <tr><td>Tole/Landmark:</td><td><asp:Label ID="Label4" runat="server" /></td></tr>
            <tr><td>Household Allocation:</td><td><asp:Label ID="LblHHAllocation" runat="server" /></td></tr>
            <tr><td>WV Name:</td><td><asp:Label ID="LblWVName" runat="server" /></td></tr>
            <tr><td>WV Number:</td><td><asp:Label ID="Label3" runat="server" /></td></tr>
            <tr><td>Woman Mobile:</td><td><asp:Label ID="Label1" runat="server" /></td></tr>
            <tr><td>Family Mobile:</td><td><asp:Label ID="Label2" runat="server" /></td></tr>
            <tr><td>Randomization Code:</td><td><asp:Label ID="Label75" runat="server" /></td></tr>
        </table>

        <%--<h2 class="page-title">🗓️ Upcoming Visits / Tasks</h2>
        <div class="subnote">Show pending forms due this week</div>--%>

        <h2 class="page-title">📄 Forms & Data Logs</h2>
        <table class="table">
            <tr>
                <th>Form</th><th>Scheduled Week</th><th>Completed Week</th>
                <th>Status</th><th>Action</th>
            </tr>

            <tr>
                <td><b>101 Census-A</b><br />Mapping and Census Form (Existing Woman)</td>
                <td><asp:Label ID="Label76" runat="server" /></td>
                <td><asp:Label ID="Label77" runat="server" /></td>                
                <td><asp:Label ID="Label79" runat="server" /></td>
                <td><asp:Button ID="ButtonCensusASave" runat="server" CssClass="btn btn-primary"
                    Text="Add New" CausesValidation="true" OnClick="ButtonCensusASave_Click" />
                </td>
            </tr>

            <tr>
                <td><b>101 Census-B</b><br />Mapping and Census Form (New HH)</td>
                <td><asp:Label ID="Label81" runat="server" /></td>
                <td><asp:Label ID="Label82" runat="server" /></td>                
                <td><asp:Label ID="Label84" runat="server" /></td>
                <td><asp:Button ID="ButtonCensusBSave" runat="server" CssClass="btn btn-primary"
                    Text="Add New" CausesValidation="true" OnClick="ButtonCensusBSave_Click" />
                </td>
            </tr>

            <tr>
                <td><b>102 PSF</b><br />Pregnancy Surveillance Form</td>
                <td><asp:Label ID="Label80" runat="server" /></td>
                <td><asp:Label ID="Label91" runat="server" /></td>                
                <td><asp:Label ID="Label93" runat="server" /></td>
                <td><asp:Label ID="Label94" runat="server" /></td>
            </tr>

            <tr>
                <td><b>103 MNWF</b><br />Married New Woman Form</td>
                <td><asp:Label ID="Label86" runat="server" /></td>
                <td><asp:Label ID="Label87" runat="server" /></td>
                <td><asp:Label ID="Label88" runat="server" /></td>
                <td><asp:Label ID="Label89" runat="server" /></td>                
            </tr>

            <tr>
                <td><b>104 PRF</b><br />Pregnancy Report Form</td>
                <td><asp:Label ID="Label50" runat="server" /></td>
                <td><asp:Label ID="Label51" runat="server" /></td>
                <td><asp:Label ID="Label52" runat="server" /></td>                
                <td><asp:Label ID="Label54" runat="server" /></td>
            </tr>

            <tr>
                <td><b>105 PEF</b><br />Pregnancy Enrollment Form</td>
                <td><asp:Label ID="Label5" runat="server" /></td>
                <td><asp:Label ID="Label6" runat="server" /></td>                
                <td>⏳ Pending<asp:Label ID="Label8" runat="server" /></td>
                <td><asp:Label ID="Label9" runat="server" /></td>
            </tr>

            <tr>
                <td><b>106 SESF</b><br />Socioeconomic Status Form</td>
                <td><asp:Label ID="Label10" runat="server" /></td>                
                <td><asp:Label ID="Label12" runat="server" /></td>
                <td>✅ Completed<asp:Label ID="Label13" runat="server" /></td>
                <td><asp:Label ID="Label14" runat="server" /></td>
            </tr>

            <tr>
                <td><b>107 UGAAF</b><br />Ultrasound Gestational Age Assessment Form</td>
                <td><asp:Label ID="Label15" runat="server" /></td>
                <td><asp:Label ID="Label16" runat="server" /></td>                
                <td><asp:Label ID="Label18" runat="server" /></td>
                <td><asp:Label ID="Label19" runat="server" /></td>
            </tr>

            <tr>
                <td><b>109a PAF</b><br />Periodontal Assessment Form - Intervention group</td>
                <td><asp:Label ID="Label40" runat="server" /></td>
                <td><asp:Label ID="Label41" runat="server" /></td>
                <td><asp:Label ID="Label42" runat="server" /></td>                
                <td><asp:Label ID="Label44" runat="server" /></td>
            </tr>

            <tr>
                <td><b>109b OHQ</b><br />Oral Health Questionnaire - all group</td>
                <td><asp:Label ID="Label45" runat="server" /></td>                
                <td><asp:Label ID="Label47" runat="server" /></td>
                <td><asp:Label ID="Label48" runat="server" /></td>
                <td><asp:Label ID="Label49" runat="server" /></td>
            </tr>

            <tr>
                <td><b>110 ORQ</b><br />Oral Rinse Questionnaire</td>
                <td><asp:Label ID="Label55" runat="server" /></td>
                <td><asp:Label ID="Label56" runat="server" /></td>                
                <td><asp:Label ID="Label58" runat="server" /></td>
                <td><asp:Label ID="Label59" runat="server" /></td>
            </tr>

            <tr>
                <td><b>111 MVF</b><br />Monthly Visit Form</td>
                <td><asp:Label ID="Label60" runat="server" /></td>
                <td><asp:Label ID="Label61" runat="server" /></td>                
                <td><asp:Label ID="Label63" runat="server" /></td>
                <td><asp:Label ID="Label64" runat="server" /></td>
            </tr> 
            
            
            <tr>
                <td><b>112 LPVF</b><br />Late Pregnancy Visit Form</td>
                <td><asp:Label ID="Label20" runat="server" /></td>
                <td><asp:Label ID="Label21" runat="server" /></td>                
                <td><asp:Label ID="Label23" runat="server" /></td>
                <td><asp:Label ID="Label24" runat="server" /></td>
            </tr>
             

            <tr>
                <td><b>114 MBAF</b><br />Maternal Birth Assessment Form</td>
                <td><asp:Label ID="Label25" runat="server" /></td>                
                <td><asp:Label ID="Label27" runat="server" /></td>
                <td><asp:Label ID="Label28" runat="server" Text="✅ Completed" /></td>
                <td><asp:Label ID="Label29" runat="server" /></td>
            </tr>

            <tr>
                <td><b>115 IBAF</b><br />Infant Birth Assessment Form</td>
                <td><asp:Label ID="Label30" runat="server" /></td>                
                <td><asp:Label ID="Label32" runat="server" /></td>
                <td><asp:Label ID="Label33" runat="server" Text="⏳ Pending" /></td>
                <td><asp:Label ID="Label34" runat="server" /></td>
            </tr>

            <tr>
                <td><b>116 AERF</b><br />Adverse Event Report Form</td>
                <td><asp:Label ID="Label35" runat="server" /></td>                
                <td><asp:Label ID="Label37" runat="server" /></td>
                <td><asp:Label ID="Label38" runat="server" Text="⏳ Pending" /></td>
                <td><asp:Label ID="Label39" runat="server" /></td>
            </tr>

            <tr>
                <td><b>117 IVAF</b><br />Infant Verbal Autopsy Form</td>
                <td><asp:Label ID="Label65" runat="server" /></td>                
                <td><asp:Label ID="Label67" runat="server" /></td>
                <td>
                    <asp:Label ID="Label68" runat="server" Text="⏳ Pending" />
                    
                </td>
                <td><asp:Label ID="Label69" runat="server" /></td>
            </tr>

            <tr>
                <td><b>118 MVAF</b><br />Maternal Verbal Autopsy Form</td>
                <td><asp:Label ID="Label70" runat="server" /></td>                
                <td><asp:Label ID="Label72" runat="server" /></td>
                <td><asp:Label ID="Label73" runat="server" Text="⏳ Pending" /></td>
                <td><asp:Label ID="Label74" runat="server" /></td>
            </tr>
        </table>
        </asp:Panel>
    </div>
</asp:Content>
