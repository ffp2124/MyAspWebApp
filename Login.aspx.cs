using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusLayer;
using System.Web.Security;
using System.Text;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lgnUserLogin.Authenticate += new AuthenticateEventHandler(lgnUserLogin_Authenticate);
    }
    protected void lgnUserLogin_Authenticate(object sender, AuthenticateEventArgs e)
    {
        BusinessLayer business = new BusinessLayer();
        if (business.CheckDatabase(lgnUserLogin.UserName.Trim(), lgnUserLogin.Password))
        {
            FormsAuthentication.RedirectFromLoginPage(lgnUserLogin.UserName, false);
            Response.Redirect("~/MyOrder.aspx");
        }
        
    }
}