<%@ Page 
    Language="C#" 
    AutoEventWireup="true"
    MasterPageFile="~/Site.master"
    CodeFile="OH_WOMENROSTER.aspx.cs"
    Inherits="pages_OH_WOMENROSTER" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   

    <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="page-card">        
        <h4 class="page-title"> 
                <asp:Label ID="LblAddress" runat="server" CssClass="success-msg" />
                
            </h4>
            <br />
              
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
             

            <div class="card-title">
                <b>Add Women to Household Roster: </b>
                Please add married women aged 15–35 years who are living with their husbands in this household.
            </div>

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
            EmptyDataRowStyle-CssClass="grid-empty-msg">
             
                 
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
            DataField="CensusFirstNames" 
            HeaderText="First Name"
            ItemStyle-CssClass="cell-text" />


        <asp:BoundField 
            DataField="CensusLastName" 
            HeaderText="Last Name"
            ItemStyle-CssClass="cell-text" />
         

        <asp:TemplateField HeaderText="Action">
        <ItemTemplate>
            <asp:LinkButton
                ID="ButtonAddtoCensus"
                runat="server"
                Text="Add to census"
                PostBackUrl='<%# GetDynamicUrl(Eval("CensusNNIPSNUM"), Eval("CensusID")) %>'
                CssClass="btn-link btn-nnips"
                CausesValidation="false" />
        </ItemTemplate>
    </asp:TemplateField>
                     
    </Columns>
</asp:GridView>  
</asp:Panel>

        <asp:Panel ID="PanelNewWomenRoster" runat="server">     
       <table class="table">
            
           <tr> 
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMFNAMES1" MaxLength="30" Width="210" />
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator3" 
                        runat="server" 
                        ControlToValidate="WOMFNAMES1"
                        ErrorMessage="Required Field"
                        CssClass="error-msg" 
                        Display="Dynamic" 
                        SetFocusOnError="true" />
               </td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMLNAME1" MaxLength="30" Width="210" />
                    <asp:RequiredFieldValidator 
                        ID="RequiredFieldValidator4" 
                        runat="server" 
                        ControlToValidate="WOMLNAME1"
                        ErrorMessage="Required Field"
                        CssClass="error-msg" 
                        Display="Dynamic" 
                        SetFocusOnError="true" /></td>
           </tr>

           <tr> 
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMFNAMES2" MaxLength="30" Width="210" />
                    
               </td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMLNAME2" MaxLength="30" Width="210" />
              <asp:CustomValidator 
                    ID="CV_Row2"
                    runat="server"
                    ErrorMessage="First name and last name must be entered together"
                    CssClass="error-msg"
                    Display="Dynamic"
                    ClientValidationFunction="validateNamePair_Row2"
                    OnServerValidate="ValidateNamePair_Row2" />

                   </td>
           </tr>

           <tr> 
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMFNAMES3" MaxLength="30" Width="210" />
                     
               </td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMLNAME3" MaxLength="30" Width="210" />
                <asp:CustomValidator 
                ID="CV_Row3"
                runat="server"
                ErrorMessage="First name and last name must be entered together"
                CssClass="error-msg"
                Display="Dynamic"
                ClientValidationFunction="validateNamePair_Row3"
                OnServerValidate="ValidateNamePair_Row3" />

             </td>
           </tr>

           <tr> 
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMFNAMES4" MaxLength="30" Width="210" />
                   
               </td>
               <td><asp:TextBox AutoComplete="off" runat="server" ID="WOMLNAME4" MaxLength="30" Width="210" />
               <asp:CustomValidator 
                ID="CV_Row4"
                runat="server"
                ErrorMessage="First name and last name must be entered together"
                CssClass="error-msg"
                Display="Dynamic"
                ClientValidationFunction="validateNamePair_Row4"
                OnServerValidate="ValidateNamePair_Row4" />
             </td>
           </tr>

           <tr>
               <td colspan="2">
                   <asp:Button 
                ID="ButtonCreateNewWoman" 
                runat="server"
                CssClass="btn btn-primary"
                Text="Add Woman" 
                OnClick="ButtonCreateNewWoman_Click"
                CausesValidation="true"  />
               </td>
           </tr>
       </table>
          </asp:Panel>
             

         </div> 
</asp:Content>