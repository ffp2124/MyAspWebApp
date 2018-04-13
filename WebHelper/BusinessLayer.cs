using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PracticalDataLayer;
using System.Text;
using System.Data.OleDb;
using System.Web;

namespace BusLayer
{
    public class BusinessLayer
    {
        #region Fields
        private DataLayer _data;
        #endregion

        #region Constructors

        public BusinessLayer()
        {
            OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
            sb.Provider = "Microsoft.ACE.OLEDB.12.0";
            sb.DataSource = HttpContext.Current.Server.MapPath("~/App_Data/Customer.accdb");

            _data = new DataLayer(sb.ConnectionString);
        }

        #endregion

        #region Open methods

        //public void SaveLog(string logLine)
        //{
        //    StreamWriter streamWriter =
        //        System.IO.File.AppendText(HttpContext.Current.Server.MapPath("~/Log/Log.txt"));
        //    streamWriter.WriteLine(DateTime.Now.ToString() + " : " + logLine);
        //    streamWriter.Close();
        //}

        public bool CheckDatabase(string userName, string password)
        {
            bool result = false;
            OleDbDataReader reader;
            //Open connection
            _data.OpenConnection();
            reader = _data.GetUsers(userName);
            if (reader.HasRows)
            {
                reader.Close();
                //check for password
                reader = _data.GetPasswords(userName, password);
                if (reader.HasRows) // Found correspondance
                {
                    HttpContext.Current.Session["UserName"] = userName;
                    HttpContext.Current.Session["Password"] = password;
                    result = true;
                }
                else // no correspondance
                {
                    HttpContext.Current.Session.Abandon();
                }
            }
            else
            {
                HttpContext.Current.Session.Abandon();
            }

            reader.Close();

            //Close connection
            _data.CloseConnection();
            return result;
        }

        #endregion

    }
}
