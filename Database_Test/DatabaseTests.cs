using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dynasty;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data.OleDb;
using System.Data;

namespace Dynasty.Tests
{
    // TODO: Will need to add other database tests

    [TestClass()]
    public class DatabaseTests
    {
//        private const string csServer = "MAINDB02";
//        private const string csDatabase = "TestDatabase";

//        private string sConnectionString = "Provider=sqloledb;Data Source=" + csServer + ";Initial Catalog=" + csDatabase + ";Integrated Security=SSPI;";
//        private string sExample_Path = Database_Settings.Default_Config_Path + "\\Example_Files\\";
//        private string sExample_File = "DB_Config.xml";

//        [TestInitialize()]
//        public void TestInitialize()
//        {
//            OleDbConnection oDatabase = new OleDbConnection(sConnectionString);

//            try
//            {
//                oDatabase.Open();
//                using (OleDbCommand oCmd = new OleDbCommand("CREATE TABLE Persons (PersonID int,LastName varchar(255),FirstName varchar(255),Address varchar(255),City varchar(255))", oDatabase))
//                {
//                    oCmd.ExecuteNonQuery();

//                    oCmd.CommandText = "INSERT INTO Persons (PersonID, FirstName, LastName, Address, City) VALUES (1, 'Mike', 'Young', '301 Muehl Dr', 'Lockport');";
//                    oCmd.ExecuteNonQuery();

//                    oCmd.CommandText = "INSERT INTO Persons (PersonID, FirstName, LastName, Address, City) VALUES (2, 'Willie', 'Ricther', '3010 Western Springs', 'Orgegon');";
//                    oCmd.ExecuteNonQuery();

//                    oCmd.CommandText = "INSERT INTO Persons (PersonID, FirstName, LastName, Address, City) VALUES (3, 'Jess', 'Meyers', '341 Houbolt Rd', 'Cowsville');";
//                    oCmd.ExecuteNonQuery();

//                    oCmd.CommandText = "INSERT INTO Persons (PersonID, FirstName, LastName, Address, City) VALUES (4, 'Kyle', 'Brady', '12345 Jefferson rd', 'Gainsville');";
//                    oCmd.ExecuteNonQuery();

//                    oCmd.CommandText = "INSERT INTO Persons (PersonID, FirstName, LastName, Address, City) VALUES (5, 'Lauren', 'Noel', '123 State', 'Bartlett');";
//                    oCmd.ExecuteNonQuery();
//                }

//                oDatabase.Close();
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine(ex.Message);
//            }



//        }

//        [TestMethod()]
//        public void set_ConnectionTest()
//        {
//            Database_Settings oDBSettings = new Database_Settings("sqloledb", "ODS_prod", "datatel", "bumgoy5", "MAINODS", DatabaseType.MSSQL, "tbl_Excel_Upload_Error");
//            Database oDatabase = new Database(oDBSettings);

//            Assert.AreNotEqual(oDatabase.Connection, null);
//            Assert.AreNotEqual(oDatabase.ConnectionString, string.Empty);
//            Assert.AreEqual(oDatabase.ConnectionString, "Provider=sqloledb;Data Source=MAINODS;Initial Catalog=ODS_prod;User ID=datatel;Password=bumgoy5;");

//            Database_Settings oDBSettings2 = new Database_Settings();
//            Database oDatabase2 = new Database(oDBSettings2);

//            Assert.AreNotEqual(oDatabase2.Connection, null);
//            Assert.AreNotEqual(oDatabase2.ConnectionString, string.Empty);
//            Assert.AreEqual(oDatabase2.ConnectionString, "Provider=sqloledb;Data Source=MAINODS001;Initial Catalog=ODS_production;User ID=datatel;Password=bumgoy5;");

//        }

//        [TestMethod()]
//        public void set_Default_ConnectionTest()
//        {
//            Database oDatabase = new Database();
//            oDatabase.set_Default_Connection();

//            Assert.AreNotEqual(oDatabase.Connection, null);
//            Assert.AreNotEqual(oDatabase.ConnectionString, string.Empty);
//            Assert.AreEqual(oDatabase.ConnectionString, "Provider=sqloledb;Data Source=MAINODS001;Initial Catalog=ODS_production;User ID=datatel;Password=bumgoy5;");
//        }

//        [TestMethod()]
//        public void set_CustomConnectionTest()
//        {
//            Database_Settings oDBSettings = new Database_Settings("sqloledb", "ODS_prod", "myoung", "datatel9", "MainDroaApps1", DatabaseType.MSSQL, "tbl_Error");
//            Database oDatabase = new Database();
//            oDatabase.set_Custom_Connection(oDBSettings);

//            Assert.AreNotEqual(oDatabase.Connection, null);
//            Assert.AreNotEqual(oDatabase.ConnectionString, string.Empty);
//            Assert.AreEqual(oDatabase.ConnectionString, "Provider=sqloledb;Data Source=MainDroaApps1;Initial Catalog=ODS_prod;User ID=myoung;Password=datatel9;");

//            oDBSettings.Create_Config(sExample_Path + "DB_Config_Test.xml");
//            oDatabase.set_Custom_Connection(sExample_Path + "DB_Config_Test.xml");

//            Assert.AreNotEqual(oDatabase.Connection, null);
//            Assert.AreNotEqual(oDatabase.ConnectionString, string.Empty);
//            Assert.AreEqual(oDatabase.ConnectionString, "Provider=sqloledb;Data Source=MainDroaApps1;Initial Catalog=ODS_prod;User ID=myoung;Password=datatel9;");

//            System.IO.File.Delete(sExample_Path + sExample_File);

//        }

//        [TestMethod()]
//        public void ConnectionString_BuilderTest()
//        {
//            Assert.AreEqual(Database.ConnectionString_Builder(DatabaseType.MSSQL, "MainDroaApps1", "myoung", "datatel9", "sqloledb", "ODS_prod"), 
//                            "Provider=sqloledb;Data Source=MainDroaApps1;Initial Catalog=ODS_prod;User ID=myoung;Password=datatel9;");

//            Assert.AreEqual(Database.ConnectionString_Builder(DatabaseType.MSSQL, "MainDroaApps1", "myoung", "datatel9", "", "ODS_prod"),
//                "Provider=sqloledb;Data Source=MainDroaApps1;Initial Catalog=ODS_prod;User ID=myoung;Password=datatel9;");
//        }

//        [TestMethod()]
//        public void Open_ConnectionTest()
//        {
//            Database oDatabase = new Database(DatabaseType.MSSQL, sConnectionString);

//            oDatabase.Open_Connection();
//            Assert.IsTrue(oDatabase.Connection_Status());
//        }

//        [TestMethod()]
//        public void Close_ConnectionTest()
//        {
//            Database oDatabase = new Database(DatabaseType.MSSQL, sConnectionString);

//            oDatabase.Open_Connection();
//            oDatabase.Close_Connection();
//            Assert.IsFalse(oDatabase.Connection_Status());
//        }

//        [TestMethod()]
//        public void SelectTest()
//        {
//            Database oDatabase = new Database(DatabaseType.MSSQL, sConnectionString);
//            Query oQuery = new Query("SELECT FirstName FROM Persons WHERE PersonID = ?");

//            oQuery.Add_Parameter("PersonID", "1", OleDbType.Integer);
//            DataTable oTable = oDatabase.Select(oQuery).Table;
//            DataRow oRow = oTable.Rows[0];

//            Assert.AreEqual("Mike", oRow[0].ToString());
//        }

//        [TestMethod()]
//        public void InsertTest()
//        {
//            Database oDatabase = new Database(DatabaseType.MSSQL, sConnectionString);
//            Query oQuery = new Query("INSERT INTO Persons (PersonID, FirstName, LastName, Address, City) VALUES (6, 'Mike', 'Young', ?, 'Lockport');");

//            oQuery.Add_Parameter("Address", "12345 Test Rd", OleDbType.VarChar);
//            oDatabase.Insert(oQuery);

//            oQuery.Sql.Default = "SELECT Address FROM Persons WHERE PersonID = 6";
//            DataTable oTable = oDatabase.Select(oQuery).Table;
//            DataRow oRow = oTable.Rows[0];

//            Assert.AreEqual("12345 Test Rd", oRow[0].ToString());
//        }

//        [TestMethod()]
//        public void DeleteTest()
//        {
//            Database oDatabase = new Database(DatabaseType.MSSQL, sConnectionString);
//            Query oQuery = new Query("DELETE FROM Persons WHERE PersonID = ?");

//            oQuery.Add_Parameter("PersonID", "2", OleDbType.VarChar);
//            oDatabase.Insert(oQuery);

//            oQuery.Sql.Default = "SELECT Count(PersonID) FROM Persons WHERE PersonID = 2";
//            DataTable oTable = oDatabase.Select(oQuery).Table;
//            DataRow oRow = oTable.Rows[0];

//            Assert.AreEqual("0", oRow[0].ToString());
//        }

//        [TestMethod()]
//        public void UpdateTest()
//        {
//            Database oDatabase = new Database(DatabaseType.MSSQL, sConnectionString);
//            Query oQuery = new Query("UPDATE Persons SET Address = ? WHERE PersonID = 3");

//            oQuery.Add_Parameter("Address", "12345 Test Rd", OleDbType.VarChar);
//            oDatabase.Insert(oQuery);

//            oQuery.Sql.Default = "SELECT Address FROM Persons WHERE PersonID = 3";
//            DataTable oTable = oDatabase.Select(oQuery).Table;
//            DataRow oRow = oTable.Rows[0];

//            Assert.AreEqual("12345 Test Rd", oRow[0].ToString());
//        }

//        [TestMethod()]
//        public void ProcedureTest()
//        {
//            //procUpdateAddress
//            Database oDatabase = new Database(DatabaseType.MSSQL, sConnectionString);
//            Query oQuery = new Query("dbo.procUpdateAddress");

//            oQuery.Add_Parameter("@ID", "4", OleDbType.VarChar);
//            oQuery.Add_Parameter("@ADDRESS", "456 Address", OleDbType.VarChar);
//            oDatabase.Procedure(oQuery);

//            oQuery.Sql.Default = "SELECT Address FROM Persons WHERE PersonID = 4";
//            DataTable oTable = oDatabase.Select(oQuery).Table;
//            DataRow oRow = oTable.Rows[0];

//            Assert.AreEqual("456 Address", oRow[0].ToString());
//        }

//        [TestMethod()]
//        public void FunctionTest()
//        {
//            //func_GetAddress
//            Database oDatabase = new Database(DatabaseType.MSSQL, sConnectionString);
//            Query oQuery = new Query("SELECT dbo.func_GetAddress(?)");

//            oQuery.Add_Parameter("@ID", "5", OleDbType.VarChar);
//            Assert.AreEqual("123 State", oDatabase.Function(oQuery));
//        }

//        [TestMethod()]
//        public void Run_ScriptTest()
//        {
//            Database oDatabase = new Database(DatabaseType.MSSQL, sConnectionString);
//            Results oResults = oDatabase.Run_Script(sExample_Path + "Example.sql");

//            Query oQuery = new Query("SELECT FirstName FROM Persons WHERE PersonID = ?");

//            oQuery.Add_Parameter("PersonID", "13", OleDbType.Integer);
//            DataTable oTable = oDatabase.Select(oQuery).Table;
//            DataRow oRow = oTable.Rows[0];

//            Assert.AreEqual("Success", oRow[0].ToString());

//        }

//        [TestCleanup()]
//        public void TestCleanUp()
//        {

//            OleDbConnection oDatabase = new OleDbConnection(sConnectionString);

//            try
//            {
//                oDatabase.Open();
//                using (OleDbCommand oCmd = new OleDbCommand("DROP TABLE Persons", oDatabase))
//                {
//                    oCmd.ExecuteNonQuery();

//                    oCmd.CommandText = "DROP TABLE Error_Table";
//                    oCmd.ExecuteNonQuery();
//                }

//                oDatabase.Close();
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine(ex.Message);
//            }
//        }

    }
}
