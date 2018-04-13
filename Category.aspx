<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

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
            width: 624px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPage" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:DataList ID="dlstDataList" runat="server" Width="470px" 
                    RepeatDirection="Horizontal" RepeatColumns="4" 
                    DataSourceID="AccessDataSource1" DataKeyField="shoeID">
                    <ItemTemplate>
<div align="left" style="padding:15;font-size:8pt;font-family:Verdana; text-align: center;">
      <asp:ImageButton ID="image" runat="server" border="1" 
        height="131px" 
        width="151px" ImageUrl='<%# Eval("Image") %>' />
	<br/>
	<asp:Label ID="PName" runat="server" Text='<%# Eval("[Shoe_Name]") %>'></asp:Label>
	<br/>
	<b>Description: </b>
	<asp:Label ID="lblDescription"  runat="server" Text='<%# Eval("Description") %>'></asp:Label>
	<br/>
	<b>Price: </b>
	<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
	  <br />
      Size:
      <asp:DropDownList ID="DropDownList1" runat="server" 
          DataSourceID="XmlDataSource1" DataTextField="Number" DataValueField="Number">
      </asp:DropDownList>
      <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XML/Size.xml">
      </asp:XmlDataSource>
      <br />
      Color:
      <asp:DropDownList ID="DropDownList2" runat="server" 
          DataSourceID="XmlDataSource2" DataTextField="Value" DataValueField="Value">
      </asp:DropDownList>
      <asp:XmlDataSource ID="XmlDataSource2" runat="server" 
          DataFile="~/XML/Color.xml"></asp:XmlDataSource>
      <br />
      <asp:Button ID="ProductPic" runat="server" Text="Add to Cart" CommandName="Add" />
	<br/>
	<br/>
	</div>
	</ItemTemplate>
                </asp:DataList>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/Customer.accdb" SelectCommand="SELECT * FROM [Shoe]">
                </asp:AccessDataSource>
            </td>
            <td>
                <asp:GridView ID="gvItems" runat="server" Height="320px" 
                    Width="287px" BorderStyle="Solid" style="text-align: center">
                </asp:GridView>
                <asp:Button ID="Clear" runat="server" Text="Clear" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Save" runat="server" Text="Save" />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

