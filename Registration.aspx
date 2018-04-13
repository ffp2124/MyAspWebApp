<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 64%;
        }
        .style3
        {
            width: 143px;
        text-align: right;
    }
        .style4
        {
            width: 143px;
            height: 16px;
            text-align: right;
        font-family: Arial, Helvetica, sans-serif;
    }
        .style5
        {
            height: 16px;
        width: 181px;
    }
        .style6
        {
        width: 143px;
        text-align: right;
        font-family: Arial, Helvetica, sans-serif;
    }
    .style7
    {
        width: 208px;
    }
    .style8
    {
        height: 16px;
        width: 208px;
    }
    .style9
    {
        width: 181px;
    }
        .style10
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPage" Runat="Server">
    
    <h3 class="style10">
        Registration</h3>
    <table align="center" class="style2">
        <tr>
            <td class="style6">
                User Name:</td>
            <td class="style7">
                <asp:TextBox ID="txtUserName" runat="server" Width="200px" AutoPostBack="True" 
                    ontextchanged="txtUserName_TextChanged"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtUserName" ErrorMessage="User Name is required" 
                    ForeColor="Red" Width="200px"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Password:</td>
            <td class="style7">
                <asp:TextBox ID="txtPassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Password is required" 
                    ForeColor="Red" Width="200px"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Confirm Password:</td>
            <td class="style7">
                <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" 
                    Width="200px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtConfirmPass" ErrorMessage="You need to confirm password" 
                    ForeColor="Red" Width="200px"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass" 
                    ErrorMessage="Password must be matched" ForeColor="Red" Width="200px"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                First Name:</td>
            <td class="style8">
                <asp:TextBox ID="txtFirstName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Last Name:</td>
            <td class="style7">
                <asp:TextBox ID="txtLastName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Email:</td>
            <td class="style7">
                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" 
                    Width="200px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Please input a valid email address" 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Address:</td>
            <td class="style7">
                <asp:TextBox ID="txtAddress" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                Phone Number:</td>
            <td class="style7">
                <asp:TextBox ID="txtPhone" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style7">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="100px" 
                    onclick="btnSubmit_Click" />
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label1" runat="server" ForeColor="#CC0000" Visible="False"></asp:Label>
            </td>
            <td class="style7">
                &nbsp;</td>
            <td class="style9">
                &nbsp;</td>
        </tr>
    </table>
   
</asp:Content>

