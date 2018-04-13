using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;
using System.Text;

public partial class Registration : System.Web.UI.Page
{
    string queryString ;
    OleDbConnection myConnection;
    OleDbCommand myCmd;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
        sb.Provider = "Microsoft.ACE.OLEDB.12.0";
        sb.DataSource = Server.MapPath("~/App_Data/Customer.accdb");
        myConnection = new OleDbConnection(sb.ConnectionString);
        queryString = "";
        myCmd = new OleDbCommand(queryString, myConnection);
        myConnection.Open();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        int i = Convert.ToInt32(txtPhone.Text);
        StringBuilder queryStringBuilder = new StringBuilder("Insert into Customer([User_Name], [Phone_Number], [Password], [Email], [Address], [First_Name], [Last_Name]) values ('" + txtUserName.Text + "','" + i + "','" + txtPassword.Text + "','" + txtEmail.Text +  "','" + txtAddress.Text + "','" + txtFirstName.Text + "','" + txtLastName.Text + "')");
        queryString = queryStringBuilder.ToString();
        //Response.Write(_strQuery);
        myCmd.CommandText = queryString;

        myCmd.ExecuteNonQuery();

        myConnection.Close();
        SendEmail.SendToCustomer(txtEmail.Text, txtUserName.Text, txtPassword.Text);
        Label2.Visible = false;
        Label1.Visible = true;
        Label1.Text = "Register successfully!";
        txtUserName.Text = "";
        txtPassword.Text = "";
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtPhone.Text = "";
        txtEmail.Text = "";
        txtAddress.Text = "";
        Response.Redirect("~/Login.aspx");
        
    }
    protected void txtUserName_TextChanged(object sender, EventArgs e)
    {
        StringBuilder stringBuilder = new StringBuilder("Select * from Customer where User_Name = @User_Name");
        queryString = stringBuilder.ToString();
        myCmd = new OleDbCommand(queryString, myConnection);
        myCmd.Parameters.AddWithValue("@User_Name", txtUserName.Text);
        OleDbDataReader dr = myCmd.ExecuteReader();
        if (dr.HasRows) 
        {
            
            Label2.Text = "This username already exists!";
            Label2.ForeColor = System.Drawing.Color.Red;
        }
        else{
            
            Label2.Text = "This username is available";
            Label2.ForeColor = System.Drawing.Color.Green;
        }
    }
}