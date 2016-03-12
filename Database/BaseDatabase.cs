using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;
using System.Data;

namespace Dynasty.Database
{
    public abstract class BaseDatabase : IDatabase
    {
        #region Properties
        public System.Data.OleDb.OleDbConnection Connection { get; set; }
        public string DataSource { get { return Connection.DataSource; } }
        public string DatabaseName { get { return Connection.Database.ToString(); } set { Connection.ChangeDatabase(value.ToString()); } }
        public string Provider { get { return Connection.Provider.ToString(); } }
        public int ConnectionTimeout { get { return Connection.ConnectionTimeout; } }
        public IDatabaseSettings Settings;
        public Exception Error { get; set; }
        public bool ErrorOccurred
        { get { if (Error != null) { return true; } else { return false; } } }

        public string ConnectionString 
        {
            get { return Connection.ConnectionString; } 
            set 
            { 
                Connection.ConnectionString = value;
            } 
        }

        public System.Data.ConnectionState State { get { return Connection.State; } }
        public bool ConnectionStatus 
        { 
            get 
            {
                if (State == System.Data.ConnectionState.Open)
                    return true;
                else
                    return false;
            } 
        }
        #endregion

        #region Constructors
        /// <summary>
        /// Default constructor
        /// </summary>
        public BaseDatabase()
        {
            Connection = new System.Data.OleDb.OleDbConnection();
        }

        /// <summary>
        /// Loads the Connection String using the Settings Obj
        /// </summary>
        /// <param name="settings"></param>
        public BaseDatabase(IDatabaseSettings settings)
        {
            Connection = new System.Data.OleDb.OleDbConnection();
            SetConnectionString(settings);
        }

        /// <summary>
        /// Sets a custom connection string.
        /// </summary>
        /// <param name="customConnectionString"></param>
        public BaseDatabase(string customConnectionString)
        {
            Connection = new System.Data.OleDb.OleDbConnection();
            ConnectionString = customConnectionString;
        }
        #endregion

        #region Methods
        /// <summary>
        /// Resets the Error flag
        /// </summary>
        private void ResetError()
        { Error = null; }

        /// <summary>
        /// Sets the connection string for the database object
        /// </summary>
        /// <param name="settings"></param>
        public void SetConnectionString(IDatabaseSettings settings)
        {
            ResetError();

            if (settings != null)
            { ConnectionString = ConnectionStringBuilder(settings.DataSource, settings.Username, settings.Password, settings.Provider, settings.Database); }
            else
            {
                Error = new MissingFieldException();
                throw new MissingFieldException(); 
            }
            
        }

        public void SetConnectionString(string settings)
        {
            ResetError();

            if (Settings != null)
            { ConnectionString = settings; }
            else
            {
                Error = new MissingFieldException();
                throw new MissingFieldException();
            }

        }

        /// <summary>
        /// Creates a connection string based off the fed parameters.
        /// </summary>
        /// <param name="dataSource"></param>
        /// <param name="userID"></param>
        /// <param name="password"></param>
        /// <param name="provider"></param>
        /// <param name="db"></param>
        /// <returns></returns>
        public abstract string ConnectionStringBuilder(string dataSource, string userID = "", string password = "", string provider = "", string db = "");

        /// <summary>
        /// Opens the connection to the database
        /// </summary>
        public void OpenConnection()
        {
            ResetError();

            try
            {
                if (Connection != null && State == System.Data.ConnectionState.Closed)
                { Connection.Open(); }
            }
            catch (Exception ex)
            {
                Error = ex;
            }
        }
        
        /// <summary>
        /// Closes the connection to the database
        /// </summary>
        public void CloseConnection()
        {
            ResetError();

            try
            {
                if (Connection != null && State == System.Data.ConnectionState.Open)
                { Connection.Close(); }
            }
            catch (Exception ex)
            {
                Error = ex;
            }
        }

        /// <summary>
        /// Tests the connection using the passed in connection string
        /// </summary>
        /// <param name="connection"></param>
        /// <returns></returns>
        public bool TestConnectionString(string connection)
        {
            ResetError();
            bool fStatus = false;

            try
            {
                using (OleDbConnection oDB_Test = new OleDbConnection(connection))
                {
                    oDB_Test.Open();

                    if (oDB_Test.State == System.Data.ConnectionState.Open)
                    { fStatus = true; }

                    oDB_Test.Close();
                }
            }
            catch (Exception ex)
            {
                Error = ex;
                fStatus = false; 
            }

            return fStatus;
        }

        /// <summary>
        /// Selects data based on the passed in query.
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        public Results Select(Query query) 
        {
            ResetError();

            DataTable dTable = new DataTable();
            Results oResults = new Results();

            OpenConnection();

            string sSql = query.Sql;
            oResults.SqlString = sSql;

            // Adds the passed in parameters to the query.
            try
            {
                using (OleDbCommand oCmd = new OleDbCommand(sSql, Connection))
                {
                    if (query.ParameterList != null)
                    {
                        for (int iCount = 0; iCount < query.ParameterList.Count; iCount++)
                        { oCmd.Parameters.AddWithValue(query.ParameterList[iCount].Name, query.ParameterList[iCount].Value); }
                    }

                    dTable.Load(oCmd.ExecuteReader());
                }

                CloseConnection();

                // Sets the results obj
                oResults.Table = dTable;
                oResults.Rows_Affected = dTable.Rows.Count;
            }
            catch (Exception ex)
            {
                CloseConnection();
                oResults.SqlException = ex;
                Error = ex;
            }

            return oResults;
        }

        public Results Insert(Query oQuery) { return Run_DML(oQuery); }
        public Results Delete(Query oQuery) { return Run_DML(oQuery); }
        public Results Update(Query oQuery) { return Run_DML(oQuery); }
        public Results Create(Query oQuery) { return Run_DML(oQuery); }
        public Results Alter(Query oQuery) { return Run_DML(oQuery); }
        public Results Procedure(Query oQuery) { return Run_SP(oQuery); }

        /// <summary>
        /// Returns a single valued function. 
        /// </summary>
        /// <param name="oQuery"></param>
        /// <returns></returns>
        public string Function(Query oQuery)
        {
            ResetError();
            try
            {
                Results oTable = Select(oQuery);
                DataRow oRow = oTable.Table.Rows[0];

                return oRow[0].ToString();
            }
            catch (Exception ex)
            {
                Error = ex;
                return ""; 
            }
        }

        /// <summary>
        /// Process a script from a file
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public Results RunScript(string path)
        {
            ResetError();
            Query oQuery = new Query();
            Results oResults = new Results();

            try
            {
                if (!System.IO.File.Exists(path))
                {
                    Results oNoResults = new Results();
                    Exception oFileNotFound = new System.IO.FileNotFoundException("File not found", path);
                    oNoResults.SqlException = oFileNotFound;

                    return oNoResults;
                }

                oQuery.Sql = System.IO.File.ReadAllText(path);

                oResults = Process_SQL(oQuery, CommandType.Text);
            }
            catch (Exception ex)
            {
                oResults.SqlException = ex;
                Error = ex;
            }

            return oResults;
        }

        /// <summary>
        /// Executes the Query and retrieves any errors and number of rows affected
        /// </summary>
        /// <param name="oQuery">Query Object that contains the Sql String and any parameters</param>
        /// <returns>Results object</returns>
        private Results Run_DML(Query query) { return Process_SQL(query, CommandType.Text); }

        /// <summary>
        /// Executes the Query and retrieves any errors and number of rows affected
        /// </summary>
        /// <param name="oQuery">Query Object that contains the Sql String and any parameters</param>
        /// <returns>Results object</returns>
        private Results Run_SP(Query query) { return Process_SQL(query, CommandType.StoredProcedure); }

        /// <summary>
        /// Processes the passed in query. The Type of request is also passed in
        /// </summary>
        /// <param name="query">Query Object that contains the Sql String and any parameters</param>
        /// <param name="oType">Query Type</param>
        /// <returns>Results object</returns>
        private Results Process_SQL(Query query, CommandType oType)
        {
            ResetError();
            OpenConnection();

            Results oResult = new Results();
            string sSql = query.Sql;

            try
            {
                using (OleDbCommand oCmd = new OleDbCommand(sSql, Connection))
                {
                    oCmd.CommandType = oType;

                    if (query.ParameterList != null)
                    {
                        for (int iCount = 0; iCount < query.ParameterList.Count; iCount++)
                        {
                            oCmd.Parameters.Add(query.ParameterList[iCount].Name, query.ParameterList[iCount].Type).Value = query.ParameterList[iCount].Value;
                        }
                    }

                    oResult.Rows_Affected = oCmd.ExecuteNonQuery();
                }

                CloseConnection();
                return oResult;
            }
            catch (Exception ex)
            {
                CloseConnection();
                oResult.SqlException = ex;
                Error = ex;

                return oResult;
            }
        }
        #endregion
    }


}
