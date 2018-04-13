<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CustomerManagement.aspx.cs" Inherits="Admin_CustomerManagement2" %>
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
            width: 441px;
            text-align: center;
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
                    AutoGenerateColumns="False" DataKeyNames="CustomerID" 
                    DataSourceID="AccessDataSource1" Height="354px" Width="549px" 
                    style="font-family: Arial, Helvetica, sans-serif">
                    <Columns>
                        <asp:CommandField 
                            ShowSelectButton="True" />
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                        <asp:BoundField DataField="User_Name" HeaderText="User_Name" 
                            SortExpression="User_Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    DeleteCommand="DELETE FROM [Customer] WHERE [CustomerID] = ?" 
                    InsertCommand="INSERT INTO [Customer] ([CustomerID], [User_Name], [Email]) VALUES (?, ?, ?)" 
                    SelectCommand="SELECT [CustomerID], [User_Name], [Email] FROM [Customer]" 
                    UpdateCommand="UPDATE [Customer] SET [User_Name] = ?, [Email] = ? WHERE [CustomerID] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                        <asp:Parameter Name="User_Name" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="User_Name" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="CustomerID" 
                    DataSourceID="AccessDataSource2" Height="330px" 
                    onitemdeleted="DetailsView1_ItemDeleted" 
                    oniteminserted="DetailsView1_ItemInserted" 
                    onitemupdated="DetailsView1_ItemUpdated" Width="328px" 
                    style="text-align: center; font-family: Arial, Helvetica, sans-serif;">
                    <Fields>
                        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                            InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                        <asp:TemplateField HeaderText="User_Name" SortExpression="User_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("User_Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ErrorMessage="UserName is Required" ForeColor="Red" 
                                    ControlToValidate="txtName">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("User_Name") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ErrorMessage="UserName is Required" ForeColor="Red" 
                                    ControlToValidate="TextBox1">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("User_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone_Number" SortExpression="Phone_Number">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ErrorMessage="Phone Number is Required" ForeColor="Red" 
                                    ControlToValidate="txtPhone">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="Phone Number is required" ForeColor="Red" 
                                    ControlToValidate="TextBox2">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Phone_Number") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ErrorMessage="Email is Required" ForeColor="Red" 
                                    ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="Email is required" ForeColor="Red" 
                                    ControlToValidate="TextBox3">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password" SortExpression="Password">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPwd" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ErrorMessage="Password is Required" ForeColor="Red" 
                                    ControlToValidate="txtPwd">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ErrorMessage="Password is required" ForeColor="Red" 
                                    ControlToValidate="TextBox4">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address" SortExpression="Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ErrorMessage="Address is Required" ForeColor="Red" 
                                    ControlToValidate="txtAddress">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ErrorMessage="Address is required" ForeColor="Red" 
                                    ControlToValidate="TextBox5">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First_Name" SortExpression="First_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("First_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("First_Name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("First_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last_Name" SortExpression="Last_Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Last_Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Last_Name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Last_Name") %>'></asp:Label>
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
                    DeleteCommand="DELETE FROM [Customer] WHERE [CustomerID] = ?" 
                    InsertCommand="INSERT INTO [Customer] ([User_Name], [Phone_Number], [Email], [Password], [Address], [First_Name], [Last_Name]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT * FROM [Customer] WHERE ([CustomerID] = ?)" 
                    
                    UpdateCommand="UPDATE [Customer] SET [User_Name] = ?, [Phone_Number] = ?, [Email] = ?, [Password] = ?, [Address] = ?, [First_Name] = ?, [Last_Name] = ? WHERE [CustomerID] = ?">
                    <SelectParameters>
              <asp:ControlParameter ControlID="GridView1" Name="CustomerID" PropertyName="SelectedValue"
                Type="Int32" />
            </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="User_Name" Type="String" />
                        <asp:Parameter Name="Phone_Number" Type="Int32" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="First_Name" Type="String" />
                        <asp:Parameter Name="Last_Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="User_Name" Type="String" />
                        <asp:Parameter Name="Phone_Number" Type="Int32" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="First_Name" Type="String" />
                        <asp:Parameter Name="Last_Name" Type="String" />
                        <asp:Parameter Name="CustomerID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
    <br />
        
</asp:Content>

