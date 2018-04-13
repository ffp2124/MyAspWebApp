using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using System.Data.OleDb;
using System.Data;

public partial class ShoppingCart : System.Web.UI.Page
{
    //List<OrderItem> order = null;
    //OleDbConnectionStringBuilder sb;
    //OleDbConnection conn;
    private DataSet _myDs = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Session["Order"] != null)
        {

            _myDs = (DataSet)this.Session["Order"];
            GridView1.DataSource = _myDs;
            GridView1.DataBind();
        }
        
        btnCheckOut.Visible = true;
        btnClear.Visible = true;
        if (this.Session["Order"] == null)
        {
            btnClear.Visible = false;
            btnCheckOut.Visible = false;
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        _myDs = this.Session["Order"] as DataSet;
        _myDs.Clear();
        this.Session["Order"] = _myDs;
        GridView1.DataSource = _myDs;
        GridView1.DataBind();
        //Response.Redirect("~/Order.aspx");
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current.User == null || !HttpContext.Current.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Login.aspx");
        }
        
    //    if (order != null && order.Count != 0)
    //    {
    //        sb = new OleDbConnectionStringBuilder();
    //        sb.Provider = "Microsoft.ACE.OLEDB.12.0";
    //        sb.DataSource = Server.MapPath("~/App_Data/Customer.accdb");
    //        conn = new OleDbConnection(sb.ConnectionString);
    //        conn.Open();
    //        string username = Session["UserName"].ToString();
    //        string query = "Select [CustomerID] From Customer Where [User_Name] = " + username + "And [Password] = " + (int)Session["Password"];
    //        OleDbCommand cmd = new OleDbCommand(query, conn);
    //        int customerID = Convert.ToInt32(cmd.ExecuteScalar().ToString());
    //        query = "INSERT INTO [Order] ([Status], [OrderDate]) VALUES ('" + customerID + "','"+"Waiting" +"','"+DateTime.Now.ToShortDateString()+"'); SELECT SCOPE_IDENTITY();";

    //        int orderId = Convert.ToInt32(cmd.ExecuteScalar().ToString());
    //        foreach (OrderItem item in order)
    //        {
    //            query = "INSERT INTO [OrderItem] ([OrderID], [ShoeID], [Quantity], [Price], [Color], [Size]) VALUES('" + orderId + "','" + item.shoeId + "', '" + item.qty + "','"+ item.price+"','" + item.color +"','" + item.size +"')";
    //            cmd = new OleDbCommand(query, conn);
    //            cmd.ExecuteNonQuery();
    //        }
    //        conn.Close();
    //        Session["cart"] = null;
    //        order = null;
    //    }
    }
}