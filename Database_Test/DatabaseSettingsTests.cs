using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dynasty;
using Dynasty.Database;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Dynasty.Tests
{
    [TestClass()]
    public class DatabaseSettingsTests
    {
        private readonly string _exampleFiles = AppDomain.CurrentDomain.BaseDirectory + "\\Example_Files\\SettingsTests\\";

        [TestMethod()]
        public void LoadDatabaseConfigTest()
        {
            IDatabaseSettings oSettings = new XMLDatabaseSettings();
            oSettings.LoadDatabaseConfiguration(_exampleFiles + "DB_Config.xml");

            Assert.AreEqual("ODS_production", oSettings.Database);
            Assert.AreEqual("MAINODS001", oSettings.DataSource);
            Assert.AreEqual("sqloledb", oSettings.Provider);
            Assert.AreEqual("datatel", oSettings.Username);
        }

        [TestMethod()]
        public void Create_ConfigTest()
        {
            IDatabaseSettings oSettings = new XMLDatabaseSettings();
            oSettings.Database = "local";
            oSettings.DataSource = "localhost";
            oSettings.Password = "Budman%88";
            oSettings.Provider = "sqloledb";
            oSettings.Username = "sdt\\myoung";

            oSettings.CreateConfigurationFile(_exampleFiles + "DB_Config_Test.xml");
            Assert.IsTrue(oSettings.ConfigurationFileExists());

            Assert.AreEqual(oSettings.ConfigurationLocation, _exampleFiles + "DB_Config_Test.xml");
            Assert.AreEqual(oSettings.Database, "local");
            Assert.AreEqual(oSettings.DataSource, "localhost");
            Assert.AreEqual(oSettings.Password, "Budman%88");
            Assert.AreEqual(oSettings.Provider, "sqloledb");
            Assert.AreEqual(oSettings.Username, "sdt\\myoung");

            System.IO.File.Delete(_exampleFiles + "DB_Config_Test.xml");
        }

    }
}
