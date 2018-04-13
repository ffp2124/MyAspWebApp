<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="OrderManagement.aspx.cs" Inherits="Admin_OrderManagement" %>
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
                    AutoGenerateColumns="False" DataKeyNames="OrderID" 
                    DataSourceID="AccessDataSource1" Height="354px" Width="549px" 
                    style="font-family: Arial, Helvetica, sans-serif">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                            SortExpression="CustomerID" />
                        <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                            SortExpression="OrderDate" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    
                    SelectCommand="SELECT [OrderID], [Status], [CustomerID], [OrderDate] FROM [Order]">
                </asp:AccessDataSource>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView1" EnableViewState="false" runat="server" AutoGenerateRows="False" DataKeyNames="OrderID" 
                    DataSourceID="AccessDataSource2" Height="330px" 
                    onitemdeleted="DetailsView1_ItemDeleted" 
                    oniteminserted="DetailsView1_ItemInserted" 
                    onitemupdated="DetailsView1_ItemUpdated" Width="328px" 
                    style="text-align: center; font-family: Arial, Helvetica, sans-serif;" 
                    AllowPaging="True">
                    <Fields>
                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="TextBox9" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="TextBox7" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OrderDate" SortExpression="OrderDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox6" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("OrderDate") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("OrderDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CustomerID" SortExpression="CustomerID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="TextBox10" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="TextBox8" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subtotal" SortExpression="Subtotal">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Subtotal") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Subtotal") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox4" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Subtotal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="GST" SortExpression="GST">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("GST") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator" 
                                    ForeColor="Red">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("GST") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox5" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("GST") %>'></asp:Label>
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
                    DeleteCommand="DELETE FROM [Order] WHERE [OrderID] = ?" 
                    InsertCommand="INSERT INTO [Order] ([Status], [OrderDate], [CustomerID], [Subtotal], [GST]) VALUES (?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT * FROM [Order] WHERE ([OrderID] = ?)" 
                    
                    
                    UpdateCommand="UPDATE [Order] SET [Status] = ?, [OrderDate] = ?, [CustomerID] = ?, [Subtotal] = ?, [GST] = ? WHERE [OrderID] = ?">
                    <SelectParameters>
              <asp:ControlParameter ControlID="GridView1" Name="OrderID" PropertyName="SelectedValue"
                Type="Int32" />
            </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="OrderID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="OrderDate" Type="String" />
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="Subtotal" Type="Int32" />
                        <asp:Parameter Name="GST" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="OrderDate" Type="String" />
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="Subtotal" Type="Int32" />
                        <asp:Parameter Name="GST" Type="Int32" />
                        <asp:Parameter Name="OrderID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
    <br />
        
</asp:Content>

