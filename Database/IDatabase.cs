using System;
using System.Data;
using System.Data.OleDb;

namespace Dynasty.Database
{
    public interface IDatabase
    {
        #region Properties
        OleDbConnection Connection { get; }
        string DataSource { get; }
        string DatabaseName { get; set; }
        string Provider { get; }
        int ConnectionTimeout { get; }
        string ConnectionString { get; set; }
        ConnectionState State { get; }
        bool ConnectionStatus { get; }
        Exception Error { get; }
        #endregion

        #region Methods
        void SetConnectionString(IDatabaseSettings settings);
        void OpenConnection();
        void CloseConnection();
        bool TestConnectionString(string sConnection);

        Results Select(Query oQuery);
        Results Insert(Query oQuery);
        Results Delete(Query oQuery);
        Results Update(Query oQuery);
        Results Create(Query oQuery);
        Results Alter(Query oQuery);
        Results Procedure(Query oQuery);
        string Function(Query oQuery);
        Results RunScript(string sPath);

        string ConnectionStringBuilder(string sDataSource, string sUserID = "", string sPassword = "", string sProvider = "", string sDB = "");
        #endregion
    }
}
