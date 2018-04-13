using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class Admin_AdminLogin : System.Web.UI.Page
{
    private Dictionary<string, byte[]> _passwords = new Dictionary<string, byte[]>();
    private string _login = "Login";
    protected void Page_Load(object sender, EventArgs e)
    {
        btnLogin.Click += new EventHandler(btnLogin_Click);

        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
        UTF8Encoding encoder = new UTF8Encoding();
       
        //initialise our passwords
        _passwords.Add("john", md5Hasher.ComputeHash(encoder.GetBytes("bilbo")));
        _passwords.Add("samantha", md5Hasher.ComputeHash(encoder.GetBytes("pass")));
        _passwords.Add("steve", md5Hasher.ComputeHash(encoder.GetBytes("mark")));
        _passwords.Add("fuf02", md5Hasher.ComputeHash(encoder.GetBytes("peng")));
        //display username and encrypted password
        if (!Page.IsPostBack)
        {
            lblMsg.Text = "";
            //foreach (string login in _passwords.Keys)
            //{
            //    lblMsg.Text = lblMsg.Text + login + " = " + System.BitConverter.ToString(_passwords[login]) + "<br/>";
            //}
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
        UTF8Encoding encoder = new UTF8Encoding();

        if (txtLogin.Text != "" && pswPassword.Text != "")
        {
            //check if entry exists at all for login name
            txtLogin.Text = txtLogin.Text.Trim();
            if (_passwords.ContainsKey(txtLogin.Text))
            {
                //check if password and item are equal
                if (System.BitConverter.ToString(_passwords[txtLogin.Text])
                    !=
                    System.BitConverter.ToString(md5Hasher.ComputeHash(encoder.GetBytes(pswPassword.Text)))
                    )
                {
                    Session.Abandon();
                    lblMsg.Text = "incorrect password";
                }
                else
                {
                    Session[_login] = txtLogin.Text;
                    lblMsg.Text = "user logged in successfully with password.";
                    Response.Redirect("~/Admin/CustomerManagement.aspx");
                }
            }
            else
            {
                Session.Abandon();
                lblMsg.Text = "incorrect or invalid username";
            }
        }
        else
        {
            Session.Abandon();
        }
    }
}