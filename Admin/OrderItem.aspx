<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="OrderItem.aspx.cs" Inherits="Admin_OrderItem" %>
<%@ Register TagPrefix="Login" TagName="CheckLogin" Src="~/WebFiles/CheckAdminLogin.ascx"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
            width: 509px;
            text-align: center;
        }
    </style>
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPage" Runat="Server">
<Login:CheckLogin runat="server" ID="loginCheck"/>
    <table class="style1">
        <tr>
            <td class="style4">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="OrderItemID" 
                    DataSourceID="AccessDataSource1" Height="354px" Width="549px" 
                    style="font-family: Arial, Helvetica, sans-serif">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="OrderItemID" HeaderText="OrderItemID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="OrderItemID" />
                        <asp:BoundField DataField="ShoeID" HeaderText="ShoeID" 
                            SortExpression="ShoeID" />
                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" 
                            SortExpression="OrderID" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                            SortExpression="Quantity" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    
                    
                    SelectCommand="SELECT [OrderItemID], [ShoeID], [OrderID], [Quantity], [Price] FROM [OrderItem] ORDER BY [OrderItemID]">
                </asp:AccessDataSource>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView1" EnableViewState="False" runat="server" 
                    AutoGenerateRows="False" DataKeyNames="OrderItemID" 
                    DataSourceID="AccessDataSource2" Height="330px" 
                    onitemdeleted="DetailsView1_ItemDeleted" 
                    oniteminserted="DetailsView1_ItemInserted" 
                    onitemupdated="DetailsView1_ItemUpdated" Width="328px" 
                    style="text-align: center; font-family: Arial, Helvetica, sans-serif;" 
                    AllowPaging="True">
                    <Fields>
                        <asp:BoundField DataField="OrderItemID" HeaderText="OrderItemID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="OrderItemID" />
                        <asp:TemplateField HeaderText="ShoeID" SortExpression="ShoeID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ShoeID") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ShoeID") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ShoeID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price" SortExpression="Price">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OrderID" SortExpression="OrderID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OrderID") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OrderID") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("OrderID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Color" SortExpression="Color">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Color") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Color") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Color") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Size" SortExpression="Size">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Size") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="TextBox6" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Size") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                    ControlToValidate="TextBox6" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Size") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <br />
                <br />
                <br />
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    DeleteCommand="DELETE FROM [OrderItem] WHERE [OrderItemID] = ?" 
                    InsertCommand="INSERT INTO [OrderItem] ([ShoeID], [Quantity], [Price], [OrderID], [Color], [Size]) VALUES ( ?, ?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT * FROM [OrderItem] WHERE ([OrderItemID] = ?)" 
                    
                    
                    
                    UpdateCommand="UPDATE [OrderItem] SET [ShoeID] = ?, [Quantity] = ?, [Price] = ?, [OrderID] = ?, [Color] = ?, [Size] = ? WHERE [OrderItemID] = ?">
                    <SelectParameters>
              <asp:ControlParameter ControlID="GridView1" Name="OrderItemID" PropertyName="SelectedValue"
                Type="Int32" />
            </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="OrderItemID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ShoeID" Type="Int32" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="Price" Type="Double" />
                        <asp:Parameter Name="OrderID" Type="Int32" />
                        <asp:Parameter Name="Color" Type="String" />
                        <asp:Parameter Name="Size" Type="Double" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ShoeID" Type="Int32" />
                        <asp:Parameter Name="Quantity" Type="Int32" />
                        <asp:Parameter Name="Price" Type="Double" />
                        <asp:Parameter Name="OrderID" Type="Int32" />
                        <asp:Parameter Name="Color" Type="String" />
                        <asp:Parameter Name="Size" Type="Double" />
                        <asp:Parameter Name="OrderItemID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
    <br />
        
</asp:Content>

