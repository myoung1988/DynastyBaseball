using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Dynasty;
using Dynasty.Database;

namespace Database_Test
{
    [TestClass]
    public class SQLServerTest
    {
        [TestMethod]
        public void OpenConnectionTest()
        {
            IDatabaseSettings oSettings = new XMLDatabaseSettings();
            oSettings.LoadDatabaseConfiguration();

            IDatabase oDB = new SQLServer(oSettings);
            
            oDB.OpenConnection();
            Assert.IsTrue(oDB.ConnectionStatus);
            oDB.CloseConnection();
            Assert.IsFalse(oDB.ConnectionStatus);
        }
    }
}
