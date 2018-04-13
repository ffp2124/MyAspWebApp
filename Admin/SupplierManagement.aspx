<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SupplierManagement.aspx.cs" Inherits="Admin_SupplierManagement" %>
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
            width: 524px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPage" Runat="Server">
<Login:CheckLogin runat="server" ID="loginCheck"/>
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:GridView ID="GridView1" runat="server" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="SupplierID" DataSourceID="AccessDataSource1" 
                    AllowPaging="True" Height="255px" Width="523px" 
                    style="text-align: center; font-family: Arial, Helvetica, sans-serif;">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="SupplierID" />
                        <asp:BoundField DataField="Supplier_Name" HeaderText="Supplier_Name" 
                            SortExpression="Supplier_Name" />
                        <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" 
                            SortExpression="Phone_Number" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    
                    SelectCommand="SELECT [SupplierID], [Supplier_Name], [Phone_Number] FROM [Supplier] ORDER BY [SupplierID]">
                </asp:AccessDataSource>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView1" EnableViewState="False" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="SupplierID" DataSourceID="AccessDataSource2" Height="290px" 
                    Width="273px" onitemdeleted="DetailsView1_ItemDeleted" 
                    oniteminserted="DetailsView1_ItemInserted" 
                    onitemupdated="DetailsView1_ItemUpdated" AllowPaging="True" 
                    style="text-align: center; font-family: Arial, Helvetica, sans-serif;">
                    <Fields>
                        <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="SupplierID" />
                        <asp:TemplateField HeaderText="Supplier_Name" SortExpression="Supplier_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Supplier_Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Supplier_Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Supplier_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone_Number" SortExpression="Phone_Number">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address" SortExpression="Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Email" 
                            SortExpression="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <br />
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    DeleteCommand="DELETE FROM [Supplier] WHERE [SupplierID] = ?" 
                    InsertCommand="INSERT INTO [Supplier] ([Supplier_Name], [Phone_Number], [Address], [Email]) VALUES ( ?, ?, ?, ?)" 
                    SelectCommand="SELECT * FROM [Supplier] WHERE ([SupplierID] = ?) ORDER BY [SupplierID]" 
                    
                    
                    UpdateCommand="UPDATE [Supplier] SET [Supplier_Name] = ?, [Phone_Number] = ?, [Address] = ?, [Email] = ? WHERE [SupplierID] = ?">
                    <SelectParameters>
              <asp:ControlParameter ControlID="GridView1" Name="SupplierID" PropertyName="SelectedValue"
                Type="Int32" />
            </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="SupplierID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Supplier_Name" Type="String" />
                        <asp:Parameter Name="Phone_Number" Type="Int32" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Supplier_Name" Type="String" />
                        <asp:Parameter Name="Phone_Number" Type="Int32" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="SupplierID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

