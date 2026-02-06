<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="restricted.aspx.cs" Inherits="restricted" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <table>
         
                <th>
        <asp:Label ID="LBLFORM" Text="Code: 403" runat="server" />
        <small> <asp:Label ID="LBLSUBITEM" Text="" runat="server" /></small>                                    
                </th>
            </tr> 
    </table>
 
            <table>                     
               
                <tr>
                    <td>      
                        <asp:Image runat="server" ID="ImgError" Height="30" />
                        <asp:Label ID="ErrorMsg" runat="server" Text="Access Denied" CssClass="erroMsg" />
                    </td>
                                                     
                </tr>
            </table>


</asp:Content>