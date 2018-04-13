<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Admin_AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        font-size: xx-large;
        font-family: Arial, Helvetica, sans-serif;
        text-align: center;
    }
    .style2
    {
        width: 100%;
    }
    .style3
    {
        text-align: right;
        width: 397px;
        height: 45px;
        font-family: Arial, Helvetica, sans-serif;
    }
    .style4
    {
        width: 397px;
        height: 41px;
    }
    .style5
    {
        width: 222px;
        height: 41px;
            text-align: left;
        }
    .style6
    {
        text-align: right;
        width: 397px;
        height: 57px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: medium;
    }
    .style7
    {
        width: 222px;
        height: 57px;
    }
    .style8
    {
        height: 57px;
        text-align: left;
    }
    .style9
    {
        width: 222px;
        height: 45px;
    }
    .style10
    {
        height: 45px;
        text-align: left;
    }
    .style11
    {
        height: 41px;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPage" Runat="Server">
    <p class="style1">
    <strong>Admin login</strong></p>
<table class="style2">
    <tr>
        <td class="style3">
            <strong>Username</strong></td>
        <td class="style9">
            <asp:TextBox ID="txtLogin" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td class="style10">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtLogin" ErrorMessage="Please enter a user name " 
                ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style6">
            <strong>Password</strong></td>
        <td class="style7">
            <asp:TextBox ID="pswPassword" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
        </td>
        <td class="style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="pswPassword" ErrorMessage="Please enter password" 
                ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style4">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMsg" runat="server" style="text-align: right" Text="Label"></asp:Label>
        </td>
        <td class="style5">
&nbsp;<asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" 
                Text="Login" style="text-align: left" />
            
        </td>
        <td class="style11">
        </td>
    </tr>
</table>
</asp:Content>

