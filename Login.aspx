<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 342px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPage" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Login ID="lgnUserLogin" runat="server">
                </asp:Login>
                <br />
                <asp:HyperLink ID="HyperLink13" runat="server" 
                    NavigateUrl="~/Registration.aspx">Click Here to Register</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>

