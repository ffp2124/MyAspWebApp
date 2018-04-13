using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;
using System.Data;

namespace PracticalDataLayer
{
    public class DataLayer
    {
        private string _connectionString = "";
        private OleDbConnection _connection;
        private OleDbCommand _sqlCommand;
        private OleDbDataReader _reader;

        public string ConnectionString
        {
            get { return _connectionString; }
            set { _connectionString = value; }
        }

        public OleDbConnection Connection
        {
            get { return _connection; }
        }

        public DataLayer(string connectionString)
        {
            _connectionString = connectionString;
            _connection = new OleDbConnection(_connectionString);
            _sqlCommand = new OleDbCommand("", _connection);
        }

        /// <summary>
        /// Checks whether connection object exists
        /// and open new connection session
        /// </summary>
        public void OpenConnection()
        {
            if (_connection != null)
            {
                _connection.Open();
            }
        }

        /// <summary>
        /// Checks whether conecction object exists and if it exists whether the state is not closed.
        /// If all of the above is true, close the connection session
        /// </summary>
        public void CloseConnection()
        {
            if (_connection != null && _connection.State != ConnectionState.Closed)
            {
                _connection.Close();
            }
        }

        /// <summary>
        /// Checks whether reader object exists and if it exists, checks its state
        /// If state is not closed, then close reader
        /// </summary>
        public void CloseReader()
        {
            if (_reader != null && !_reader.IsClosed)
            {
                _reader.Close();
            }
        }

        /// <summary>
        /// If connection is open then the method executes specific query: "select * from Customer" 
        /// in the connected database.
        /// </summary>
        /// <returns>DataReader with data about employees</returns>
        public OleDbDataReader GetCustomers()
        {
            if (_connection.State == ConnectionState.Open)
            {
                string sqlQuery = "select * from Customer";
                _sqlCommand.CommandText = sqlQuery;
                _reader = _sqlCommand.ExecuteReader();
            }
            return _reader;
        }

        /// <summary>
        /// If connection is open then the method executes query from sqlString parameter 
        /// </summary>
        /// <param name="sqlString">sql query that is to contain update customer command</param>
        public void UpdateCustomer(string sqlString)
        {
            if (_connection.State == ConnectionState.Open)
            {
                _sqlCommand.CommandText = sqlString;
                _sqlCommand.ExecuteNonQuery();
            }
        }

        public OleDbDataReader GetUsers(string userName)
        {
            if (_connection.State == ConnectionState.Open)
            {

                string query = "SELECT * FROM Customer WHERE [User_Name] = @UserName";
                _sqlCommand.CommandText = query;
                _sqlCommand.Parameters.Clear();
                _sqlCommand.Parameters.AddWithValue("@UserName", userName);
                _reader = _sqlCommand.ExecuteReader();
                return _reader;
            }

            return null;
        }

        public OleDbDataReader GetPasswords(string userName, string password)
        {
            if (_connection.State == ConnectionState.Open)
            {
                string query = "SELECT * FROM Customer WHERE [Password] = @Password AND [User_Name] = @UserName";
                _sqlCommand.CommandText = query;
                _sqlCommand.Parameters.Clear();
                _sqlCommand.Parameters.Add(new OleDbParameter("@Password", password));
                _sqlCommand.Parameters.Add(new OleDbParameter("@UserName", userName));
                return _sqlCommand.ExecuteReader();

            }
            return null;
        }
    }
}
