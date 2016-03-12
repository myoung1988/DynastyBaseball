using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using Dynasty.Database;

namespace Dynasty.Database
{
    class DynastyDatabaseConnection : SQLServer
    {
        private SQLServer _database = new SQLServer();

        public SQLServer Database
        {
            get
            {
                IDatabaseSettings settingsDatabase = new XMLDatabaseSettings();
                settingsDatabase.LoadDatabaseConfiguration();
            
                return new SQLServer(settingsDatabase);
            }
        }

        DynastyDatabaseConnection(string connectionString)
        {
            _database.SetConnectionString(connectionString);
        }

        DynastyDatabaseConnection()
        {
            _database = this.Database;
        }

        public ConnectionState Status
        {
            get { return Database.State; }
        }

    }
}
