using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;

namespace Dynasty.Database
{
    public class SQLServer : BaseDatabase, IDatabase
    {
        #region Constructors
        public SQLServer(IDatabaseSettings pSettings) : base(pSettings)
        { }

        public SQLServer() : base()
        { }

        public SQLServer(string pCustomConnectionString) : base(pCustomConnectionString)
        { }
        #endregion

        #region Methods

        /// <summary>
        /// Creates a SQL connection string
        /// </summary>
        /// <param name="sDataSource"></param>
        /// <param name="sUserID"></param>
        /// <param name="sPassword"></param>
        /// <param name="sProvider"></param>
        /// <param name="sDB"></param>
        /// <returns></returns>
        public override string ConnectionStringBuilder(string sDataSource, string sUserID = "", string sPassword = "", string sProvider = "", string sDB = "")
        {
            string sTemp = string.Empty;
            string sSecurity = string.Empty;

            if (sProvider == "") { sProvider = "sqloledb"; }
            if (sUserID == "") { sSecurity = "Trusted_Connection=True;"; }
            else { sSecurity = "User ID=" + sUserID + ";Password=" + sPassword + ";"; }

            sTemp = "Provider=" + sProvider + ";";
            sTemp = sTemp + "Data Source=" + sDataSource + ";";
            sTemp = sTemp + "Initial Catalog=" + sDB + ";";
            sTemp = sTemp + sSecurity;

            return sTemp;
        }
        #endregion

    }
}
