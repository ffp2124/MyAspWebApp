<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyOrder.aspx.cs" Inherits="MyOrder" %>

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
            font-family: "Courier New", Courier, monospace;
        text-align: left;
    }
    .style4
    {
        font-family: "Courier New", Courier, monospace;
        text-align: center;
        width: 234px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPage" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" Height="172px" Width="324px">
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
                My Orders:<asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="OrderID" DataSourceID="AccessDataSource1">
                    <Columns>
                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="OrderID" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                        <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" 
                            SortExpression="OrderDate" />
                        <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" 
                            SortExpression="Subtotal" />
                        <asp:BoundField DataField="GST" HeaderText="GST" SortExpression="GST" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" 
                    SelectCommand="SELECT [OrderID], [Status], [OrderDate], [Subtotal], [GST] FROM [Order] WHERE ([OrderID] = ?)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="OrderID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

