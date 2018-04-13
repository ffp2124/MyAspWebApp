using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class Category : System.Web.UI.Page
{
    private OleDbDataAdapter _myAdapter;
    private DataSet _myDs = new DataSet();
    private string _orderItemsName = "OrderItem";
    private string _orderName = "Order";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Define connection
        OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
        sb.Provider = "Microsoft.ACE.OLEDB.12.0";
        sb.DataSource = Server.MapPath("~/App_Data/Customer.accdb");

        OleDbConnection conn = new OleDbConnection(sb.ConnectionString);
        string sqlQuery = "SELECT [ShoeID],[Price], [Quantity] FROM [OrderItem]";
        _myAdapter = new OleDbDataAdapter(sqlQuery, conn);

        //Event handlers
        dlstDataList.ItemCommand += new DataListCommandEventHandler(dlstDataList_ItemCommand);
        Save.Click += new EventHandler(Save_Click);
        Clear.Click += new EventHandler(Clear_Click);

        if (!this.IsPostBack)
        {

            //Load table
            //No need to open and close connection. DataAdapter does it.
            _myAdapter.Fill(_myDs, _orderItemsName);
            _myDs.Clear();
            this.Session[_orderName] = _myDs;
        }
    }

    protected void dlstDataList_ItemCommand(object sender, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        _myDs = this.Session[_orderName] as DataSet;

        DataRow newRow;
        Label price = e.Item.FindControl("lblPrice") as Label;
        int rowNum = _myDs.Tables[_orderItemsName].Rows.Count;
        bool test = false;

        for (int i = 0; i < rowNum; i++)
        {
            if (Convert.ToInt32(_myDs.Tables[_orderItemsName].Rows[i]["shoeID"]) == Convert.ToInt32(dlstDataList.DataKeys[e.Item.ItemIndex]))
            {
                _myDs.Tables[_orderItemsName].Rows[i]["quantity"] =
                    Convert.ToInt32(_myDs.Tables[_orderItemsName].Rows[i]["quantity"]) + 1;
                test = true;
                break;

            }
        }

        if (!test)
        {
            //first time click
            newRow = _myDs.Tables[_orderItemsName].NewRow();
            newRow["ShoeID"] = dlstDataList.DataKeys[e.Item.ItemIndex];
            newRow["Price"] = Convert.ToDouble(price.Text);
            newRow["Quantity"] = 1;
            _myDs.Tables[_orderItemsName].Rows.Add(newRow);
        }

        this.Session[_orderName] = _myDs;
        gvItems.DataSource = _myDs;
        gvItems.DataBind();

    }

    public void Save_Click(object sender, EventArgs e)
    {
        //Create a command builder to generate the SQL statements
        OleDbCommandBuilder myCb = new OleDbCommandBuilder(_myAdapter);

        myCb.QuotePrefix = "[";
        myCb.QuoteSuffix = "]";
        _myDs = this.Session[_orderName] as DataSet;

        //Update database
        _myAdapter.Update(_myDs, _orderItemsName);

        _myDs.Clear();
        this.Session[_orderName] = _myDs;
        gvItems.DataSource = _myDs;
        gvItems.DataBind();
    }

    protected void Clear_Click(object sender, EventArgs e)
    {
        _myDs = this.Session[_orderName] as DataSet;
        _myDs.Clear();
        this.Session[_orderName] = _myDs;
        gvItems.DataSource = _myDs;
        gvItems.DataBind();

    }
}