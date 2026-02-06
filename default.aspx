<%@ Page Title="Census Search"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeFile="default.aspx.cs"
    Inherits="_default" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Literal ID="LitCurWeek" runat="server" Visible="false" />

    <!-- ONLY INNER CARD NOW  -->
    <div class="container mt-2">

        <asp:Panel ID="PanelSearch" runat="server" DefaultButton="ButtonSearch">

            <div class="d-flex justify-content-center">

                 <table class="table">
                      <tr>
                          <td>
                              <asp:TextBox
                                ID="TBSearch"
                                runat="server"
                                AutoComplete="off"
                                CssClass="form-control"
                                MaxLength="8"                                
                                placeholder="Enter NNIPS Number or Address"
                                 />
                               
                          </td>
                          <td>
                              <asp:Button
                            ID="ButtonSearch"
                            runat="server"
                            Text="Search"
                            CssClass="btn btn-primary w-100"
                            Style="height:48px; font-size:16px; border-radius:30px;"
                            CausesValidation="true"
                            OnClick="ButtonSearch_Click" />
                          </td>
                          <td>

                          </td>
                     </tr>
                </table>
                  
            </div>

        </asp:Panel>

    </div>

</asp:Content>
