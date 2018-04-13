<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 690px;
        }
        .style4
        {
        width: 167px;
    }
        .style5
        {
        text-align: right;
        width: 529px;
        font-family: Arial, Helvetica, sans-serif;
    }
    .style6
    {
        width: 529px;
    }
    .style7
    {
        font-family: Arial, Helvetica, sans-serif;
    }
    .style8
    {
        font-family: Arial, Helvetica, sans-serif;
        font-weight: bold;
    }
        .style9
        {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPage" Runat="Server">
    <span class="style9">If you have any questions, please call 
    09-45678912 or use the message board below to contact us!</span>
    <div style = "font-family:@Arial Unicode MS">
<fieldset style = "width:inherit">
    <legend style="font-weight: 700; font-family: Arial, Helvetica, sans-serif; font-size: x-large">Contact us</legend>
    <table>
        <tr>
            <td class="style5">
                <span class="style8">Name:</span><span class="style7"> </span>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" Text="*" ControlToValidate = "txtName" ForeColor = "Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <span class="style8">Email:</span><span class="style7"> </span>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display = "Dynamic" ErrorMessage="Email is required" Text="*" ControlToValidate = "txtEmail" ForeColor = "Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                     ErrorMessage="Please enter a valid email"  ControlToValidate="txtEmail" 
                    ForeColor="Red">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <span class="style8">Subject:</span><span class="style7"> </span>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtSubject" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Subject is required" Text="*" ControlToValidate = "txtSubject" ForeColor = "Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style ="vertical-align:top" class="style5">
                <span class="style8">Comments:</span><span class="style7"> </span>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtComments" runat="server" Rows="5" TextMode="MultiLine" 
                    Width="200px"></asp:TextBox>
            </td>
            <td style ="vertical-align:top" class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Comments is required" Text="*" ControlToValidate = "txtComments" ForeColor = "Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
        <td class="style6"></td>
            <td colspan = "2">
                <asp:ValidationSummary  ForeColor = "Red" HeaderText = "Please fix the following errors" ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style6"></td>
            <td colspan = "2">
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6"></td>
            <td colspan = "2">
                <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
            </td>
        </tr>
    </table>
</fieldset>
</div>
</asp:Content>

