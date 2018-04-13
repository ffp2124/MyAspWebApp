<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <hr/>
			Sorry, an error has occurred. Please contact our system administrator.
			<hr/>
			The following is the error message:
			<%=Request.QueryString["ErrorMessage"] %>
			<hr/> 

    </div>
    </form>
</body>
</html>
