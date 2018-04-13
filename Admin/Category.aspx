<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Admin_Category" %>
<%@ Register TagPrefix="Login" TagName="CheckLogin" Src="~/WebFiles/CheckAdminLogin.ascx"%>
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
            width: 579px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPage" Runat="Server">
<Login:CheckLogin runat="server" ID="loginCheck"/>
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                    DataKeyNames="CategoryID" DataSourceID="AccessDataSource1" Height="294px" 
                    Width="575px" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="CategoryID" />
                        <asp:BoundField DataField="Category" HeaderText="Category" 
                            SortExpression="Category" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    
                    SelectCommand="SELECT [CategoryID], [Category] FROM [Category] ORDER BY [CategoryID]">
                </asp:AccessDataSource>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
                    AutoGenerateRows="False" EnableViewState="False"
                    DataKeyNames="CategoryID" DataSourceID="AccessDataSource2" 
                    Height="305px" Width="205px" onitemdeleted="DetailsView1_ItemDeleted" 
                    oniteminserted="DetailsView1_ItemInserted" 
                    onitemupdated="DetailsView1_ItemUpdated" style="text-align: center">
                    <Fields>
                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="CategoryID" />
                        <asp:BoundField DataField="Category" HeaderText="Category" 
                            SortExpression="Category" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    DeleteCommand="DELETE FROM [Category] WHERE [CategoryID] = ?" 
                    InsertCommand="INSERT INTO [Category] ([Category]) VALUES (?)" 
                    SelectCommand="SELECT * FROM [Category] WHERE ([CategoryID] = ?)" 
                    
                    
                    UpdateCommand="UPDATE [Category] SET [Category] = ? WHERE [CategoryID] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="CategoryID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Category" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="CategoryID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Category" Type="String" />
                        <asp:Parameter Name="CategoryID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                <br />
            </td>
        </tr>
    </table>
 
</asp:Content>

