using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebFiles_CheckAdminLogin : System.Web.UI.UserControl
{
    private const string _login = "login";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[_login] != null && Session[_login].ToString() != "")
        {
            lblCheck.Text = "Welcome! " + Session[_login];
        }
        else
        {
            lblCheck.Text = "Access denied you must login first!";
            Response.Redirect("AdminLogin.aspx");
        }
    }
}