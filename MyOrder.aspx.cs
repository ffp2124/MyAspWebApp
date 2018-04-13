using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Text;

public partial class MyOrder : System.Web.UI.Page
{
    string queryString;
    OleDbConnection myConnection;
    OleDbCommand myCmd;
    OleDbDataReader datareader;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User == null || !HttpContext.Current.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Login.aspx");
        }
        if (IsPostBack)
        {
            
        }
        else {
            loadData();
        }
        
    }

    protected void loadData()
    {
        if (Session["UserName"] != null)
        {
            OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
            sb.Provider = "Microsoft.ACE.OLEDB.12.0";
            sb.DataSource = Server.MapPath("~/App_Data/Customer.accdb");
            using (myConnection = new OleDbConnection(sb.ConnectionString))
            {
                queryString = "";
                int custid = 0;

                myConnection.Open();
                StringBuilder stringBuilder = new StringBuilder("Select * from Customer where User_Name = @User_Name");
                queryString = stringBuilder.ToString();
                myCmd = new OleDbCommand(queryString, myConnection);
                myCmd.Parameters.AddWithValue("@User_Name", Session["UserName"].ToString());
                datareader = myCmd.ExecuteReader();
                DetailsView1.DataSource = datareader;
                DetailsView1.DataBind();

                //string query = "Select CustomerID from Customer where UserName = " + Session["UserName"].ToString();
                //myCmd = new OleDbCommand(query, myConnection);
                //datareader = myCmd.ExecuteReader();
                if (datareader.Read())
                {
                    custid = (int)datareader["CustomerID"];
                }

                StringBuilder dltString = new StringBuilder("Select [OrderID] from [Order] where CustomerID = @CustomerID");
                myCmd = new OleDbCommand(dltString.ToString(), myConnection);
                myCmd.Parameters.AddWithValue("@CustomerID", custid);
                DropDownList1.DataSource = myCmd.ExecuteReader();
                DropDownList1.DataBind();
            }
        }
    }
}