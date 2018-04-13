<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ShoeManagement.aspx.cs" Inherits="Admin_ShoeManagement" %>
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
                    DataKeyNames="ShoeID" DataSourceID="AccessDataSource1" Height="294px" 
                    Width="575px" style="font-family: Arial, Helvetica, sans-serif" >
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="ShoeID" HeaderText="ShoeID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ShoeID" />
                        <asp:BoundField DataField="Shoe_Name" HeaderText="Shoe_Name" 
                            SortExpression="Shoe_Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
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
                    DeleteCommand="DELETE FROM [Shoe] WHERE [ShoeID] = ?" 
                    InsertCommand="INSERT INTO [Shoe] ([ShoeID], [Shoe_Name], [Description]) VALUES (?, ?, ?)" 
                    SelectCommand="SELECT [ShoeID], [Shoe_Name], [Description] FROM [Shoe] ORDER BY [ShoeID]" 
                    UpdateCommand="UPDATE [Shoe] SET [Shoe_Name] = ?, [Description] = ? WHERE [ShoeID] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="ShoeID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ShoeID" Type="Int32" />
                        <asp:Parameter Name="Shoe_Name" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Shoe_Name" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="ShoeID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
                    AutoGenerateRows="False" EnableViewState="False"
                    DataKeyNames="ShoeID" DataSourceID="AccessDataSource2" 
                    Height="305px" Width="205px" onitemdeleted="DetailsView1_ItemDeleted" 
                    oniteminserted="DetailsView1_ItemInserted" 
                    onitemupdated="DetailsView1_ItemUpdated" 
                    style="font-family: Arial, Helvetica, sans-serif; text-align: center">
                    <Fields>
                        <asp:BoundField DataField="ShoeID" HeaderText="ShoeID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="ShoeID" />
                        <asp:BoundField DataField="Shoe_Name" HeaderText="Shoe_Name" 
                            SortExpression="Shoe_Name" />
                        <asp:TemplateField HeaderText="CategoryID" SortExpression="CategoryID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="AccessDataSource3" DataTextField="CategoryID" 
                                    DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                    DataSourceID="AccessDataSource3" DataTextField="CategoryID" 
                                    DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SupplierID" SortExpression="SupplierID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList5" runat="server" 
                                    DataSourceID="AccessDataSource4" DataTextField="SupplierID" 
                                    DataValueField="SupplierID" SelectedValue='<%# Bind("SupplierID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" 
                                    DataSourceID="AccessDataSource4" DataTextField="SupplierID" 
                                    DataValueField="SupplierID" SelectedValue='<%# Bind("SupplierID") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("SupplierID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <br />
                <br />
                <br />
                <br />
                <asp:AccessDataSource ID="AccessDataSource4" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    SelectCommand="SELECT [SupplierID] FROM [Supplier]"></asp:AccessDataSource>
                <br />
                <br />
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    DeleteCommand="DELETE FROM [Shoe] WHERE [ShoeID] = ?" 
                    InsertCommand="INSERT INTO [Shoe] ([Shoe_Name], [CategoryID], [SupplierID], [Price], [Description], [Image]) VALUES (?, ?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT * FROM [Shoe] WHERE ([ShoeID] = ?)" 
                    
                    UpdateCommand="UPDATE [Shoe] SET [Shoe_Name] = ?, [CategoryID] = ?, [SupplierID] = ?, [Price] = ?, [Description] = ?, [Image] = ? WHERE [ShoeID] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="ShoeID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Shoe_Name" Type="String" />
                        <asp:Parameter Name="CategoryID" Type="Int32" />
                        <asp:Parameter Name="SupplierID" Type="Int32" />
                        <asp:Parameter Name="Price" Type="Double" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="ShoeID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Shoe_Name" Type="String" />
                        <asp:Parameter Name="CategoryID" Type="Int32" />
                        <asp:Parameter Name="SupplierID" Type="Int32" />
                        <asp:Parameter Name="Price" Type="Double" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Image" Type="String" />
                        <asp:Parameter Name="ShoeID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                <br />
                <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    SelectCommand="SELECT [CategoryID] FROM [Category]"></asp:AccessDataSource>
            </td>
        </tr>
    </table>
 
</asp:Content>

