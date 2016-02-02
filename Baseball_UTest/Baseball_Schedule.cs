using System;
using System.Configuration;
using System.Data;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Xml;

namespace Baseball_UTest
{
    [TestClass]
    public class Baseball_Schedule
    {
        private const string DbConnectionString = "Data Source=localhost;Initial Catalog=Baseball;Integrated Security=True;Pooling=False";
        private SqlConnection testDatabaseConn = new SqlConnection(DbConnectionString);
        private string[] SetupStoredProcs = new string[] { "dbo.Testing_Setup", 
                                                           "dbo.Testing_SetupSystemConfig", 
                                                           "dbo.Testing_SetupBaseMLB",
                                                           "dbo.Testing_SetupLeagueConfig",
                                                           "dbo.Testing_SetupPlayer", 
                                                           "dbo.Testing_SetupRoster", 
                                                           "dbo.Testing_SetupSeasonStats", 
                                                           "dbo.Testing_SetupEligibility" };

        private const string InitialLeagueSetup = "INSERT INTO LeagueConfig.League_Schedule_Settings ( FantasyLeagueID, PeriodLength, PeriodStartDay, SeasonStartOffset, MatchupsPerPeriod, PlayoffsStartPeriodID, PlayoffLength, TeamsAccruePointsThroughPlayoffs, PlayoffTieBreaker, PlayoffTieBreakerCategoryID, StandingsDetermination, OverallTieBreakerCategory ) VALUES ( 1, 1, 'M', 1, 1, 23, 3, 0, 'TWBCW', NULL, 'WP', 'H2HR' )";
        
        [TestInitialize]
        public void SetupDatabase()
        {
            try
            {
                testDatabaseConn.Open();

                SqlCommand cmdSQL = new SqlCommand();
                cmdSQL.Connection = testDatabaseConn;

                foreach (string storedProc in SetupStoredProcs)
                {
                    cmdSQL.CommandText = storedProc;
                    cmdSQL.ExecuteNonQuery();
                }        

            }
            catch (Exception)
            {
                testDatabaseConn.Close();    
                throw;
            }
        }

        [TestMethod]
        public void ScheduleCreationDefault()
        {
            try
            {
                SqlCommand cmdSQL = new SqlCommand();
                cmdSQL.Connection = testDatabaseConn;

                cmdSQL.CommandText = "DELETE FROM LeagueConfig.League_Schedule_Settings";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = InitialLeagueSetup;
                cmdSQL.ExecuteNonQuery();
                
                cmdSQL.CommandText = "EXEC fantasy.spCreateSchedule 1, 2, 0";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.Parameters.Clear();
                cmdSQL.CommandText = "SELECT PeriodID, LEFT(CONVERT(VARCHAR, PeriodStartDate, 120), 10) AS PeriodStartDate, LEFT(CONVERT(VARCHAR, PeriodEndDate, 120), 10) AS PeriodEndDate, Playoffs FROM Fantasy.Schedule WHERE FantasyLeagueID = 1 AND SeasonID = 2";
                SqlDataAdapter sqlDataAdpt = new SqlDataAdapter(cmdSQL);

                DataSet ds = new DataSet();
                DataTable dt = new DataTable();

                sqlDataAdpt.Fill(dt);

                int PlayOffs = 0;
                int Periods = 0;
                string Week1StartDate = "2016-04-04";
                string Week1EndDate = "2016-04-10";
                string LastWeekStartDate = "2016-09-19";
                string LastWeekEndDate = "2016-09-25";

                foreach (DataRow row in dt.Rows)
                {
                    if ((bool)row["Playoffs"])
                    { PlayOffs++; }

                    if (row["PeriodID"].ToString() == "1")
                    {
                        Assert.AreEqual(Week1StartDate, row["PeriodStartDate"].ToString());
                        Assert.AreEqual(Week1EndDate, row["PeriodEndDate"].ToString() );
                    }

                    if (row["PeriodID"].ToString() == "25")
                    {
                        Assert.AreEqual(LastWeekStartDate, row["PeriodStartDate"].ToString() );
                        Assert.AreEqual(LastWeekEndDate, row["PeriodEndDate"].ToString());
                    }

                    Periods++;
                }

                Assert.AreEqual(3, PlayOffs);
                Assert.AreEqual(25, Periods);

            }
            catch (Exception ex)
            {
                testDatabaseConn.Close();
                Trace.WriteLine(ex.Message + ex.StackTrace);
                Assert.Fail();
            }
        }

        [TestMethod]
        public void ScheduleCreationOffSet()
        {
            try
            {
                SqlCommand cmdSQL = new SqlCommand();
                cmdSQL.Connection = testDatabaseConn;

                cmdSQL.CommandText = "DELETE FROM LeagueConfig.League_Schedule_Settings";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = InitialLeagueSetup;
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = "DELETE FROM Fantasy.Schedule WHERE FantasyLeagueID = 1";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = "UPDATE LeagueConfig.League_Schedule_Settings SET SeasonStartOffset = 0 WHERE FantasyLeagueID = 1";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = "EXEC fantasy.spCreateSchedule 1, 2, 0";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.Parameters.Clear();
                cmdSQL.CommandText = "SELECT PeriodID, LEFT(CONVERT(VARCHAR, PeriodStartDate, 120), 10) AS PeriodStartDate, LEFT(CONVERT(VARCHAR, PeriodEndDate, 120), 10) AS PeriodEndDate, Playoffs FROM Fantasy.Schedule WHERE FantasyLeagueID = 1 AND SeasonID = 2";
                SqlDataAdapter sqlDataAdpt = new SqlDataAdapter(cmdSQL);

                DataSet ds = new DataSet();
                DataTable dt = new DataTable();

                sqlDataAdpt.Fill(dt);

                int PlayOffs = 0;
                int Periods = 0;
                string Week1StartDate = "2016-04-03";
                string Week1EndDate = "2016-04-10";
                string LastWeekStartDate = "2016-09-19";
                string LastWeekEndDate = "2016-09-25";

                foreach (DataRow row in dt.Rows)
                {
                    if ((bool)row["Playoffs"])
                    { PlayOffs++; }

                    if (row["PeriodID"].ToString() == "1")
                    {
                        Assert.AreEqual(Week1StartDate, row["PeriodStartDate"].ToString());
                        Assert.AreEqual(Week1EndDate, row["PeriodEndDate"].ToString());
                    }

                    if (row["PeriodID"].ToString() == "25")
                    {
                        Assert.AreEqual(LastWeekStartDate, row["PeriodStartDate"].ToString());
                        Assert.AreEqual(LastWeekEndDate, row["PeriodEndDate"].ToString());
                    }

                    Periods++;
                }

                Assert.AreEqual(3, PlayOffs);
                Assert.AreEqual(25, Periods);

            }
            catch (Exception ex)
            {
                testDatabaseConn.Close();
                Trace.WriteLine(ex.Message + ex.StackTrace);
                Assert.Fail();
            }
        }

        [TestMethod]
        public void ScheduleCreationMidSeason()
        {
            try
            {
                SqlCommand cmdSQL = new SqlCommand();
                cmdSQL.Connection = testDatabaseConn;

                cmdSQL.CommandText = "DELETE FROM LeagueConfig.League_Schedule_Settings";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = InitialLeagueSetup;
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = "UPDATE LeagueConfig.League_Schedule_Settings SET SeasonStartDate = '05/09/2016', PlayoffsStartPeriodID = 18 WHERE FantasyLeagueID = 1";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = "EXEC fantasy.spCreateSchedule 1, 2, 0";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.Parameters.Clear();
                cmdSQL.CommandText = "SELECT PeriodID, LEFT(CONVERT(VARCHAR, PeriodStartDate, 120), 10) AS PeriodStartDate, LEFT(CONVERT(VARCHAR, PeriodEndDate, 120), 10) AS PeriodEndDate, Playoffs FROM Fantasy.Schedule WHERE FantasyLeagueID = 1 AND SeasonID = 2";
                SqlDataAdapter sqlDataAdpt = new SqlDataAdapter(cmdSQL);

                DataSet ds = new DataSet();
                DataTable dt = new DataTable();

                sqlDataAdpt.Fill(dt);

                int PlayOffs = 0;
                int Periods = 0;
                string Week1StartDate = "2016-05-09";
                string Week1EndDate = "2016-05-15";
                string LastWeekStartDate = "2016-09-19";
                string LastWeekEndDate = "2016-09-25";

                foreach (DataRow row in dt.Rows)
                {
                    if ((bool)row["Playoffs"])
                    { PlayOffs++; }

                    if (row["PeriodID"].ToString() == "1")
                    {
                        Assert.AreEqual(Week1StartDate, row["PeriodStartDate"].ToString());
                        Assert.AreEqual(Week1EndDate, row["PeriodEndDate"].ToString());
                    }

                    if (row["PeriodID"].ToString() == "25")
                    {
                        Assert.AreEqual(LastWeekStartDate, row["PeriodStartDate"].ToString());
                        Assert.AreEqual(LastWeekEndDate, row["PeriodEndDate"].ToString());
                    }

                    Periods++;
                }

                Assert.AreEqual(3, PlayOffs);
                Assert.AreEqual(20, Periods);

            }
            catch (Exception ex)
            {
                testDatabaseConn.Close();
                Trace.WriteLine(ex.Message + ex.StackTrace);
                Assert.Fail();
            }
        }

        [TestMethod]
        public void ScheduleCreationEndPlayoffsEarly()
        {
            try
            {
                SqlCommand cmdSQL = new SqlCommand();
                cmdSQL.Connection = testDatabaseConn;

                cmdSQL.CommandText = "DELETE FROM LeagueConfig.League_Schedule_Settings";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = InitialLeagueSetup;
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = "UPDATE LeagueConfig.League_Schedule_Settings SET PlayoffsStartPeriodID = 18, PlayoffLength = 2 WHERE FantasyLeagueID = 1";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = "EXEC fantasy.spCreateSchedule 1, 2, 0";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.Parameters.Clear();
                cmdSQL.CommandText = "SELECT PeriodID, LEFT(CONVERT(VARCHAR, PeriodStartDate, 120), 10) AS PeriodStartDate, LEFT(CONVERT(VARCHAR, PeriodEndDate, 120), 10) AS PeriodEndDate, Playoffs FROM Fantasy.Schedule WHERE FantasyLeagueID = 1 AND SeasonID = 2";
                SqlDataAdapter sqlDataAdpt = new SqlDataAdapter(cmdSQL);

                DataSet ds = new DataSet();
                DataTable dt = new DataTable();

                sqlDataAdpt.Fill(dt);

                int PlayOffs = 0;
                int Periods = 0;
                string Week1StartDate = "2016-04-04";
                string Week1EndDate = "2016-04-10";
                string LastWeekStartDate = "2016-08-08";
                string LastWeekEndDate = "2016-08-14";

                foreach (DataRow row in dt.Rows)
                {
                    if ((bool)row["Playoffs"])
                    { PlayOffs++; }

                    if (row["PeriodID"].ToString() == "1")
                    {
                        Assert.AreEqual(Week1StartDate, row["PeriodStartDate"].ToString());
                        Assert.AreEqual(Week1EndDate, row["PeriodEndDate"].ToString());
                    }

                    if (row["PeriodID"].ToString() == "19")
                    {
                        Assert.AreEqual(LastWeekStartDate, row["PeriodStartDate"].ToString());
                        Assert.AreEqual(LastWeekEndDate, row["PeriodEndDate"].ToString());
                    }

                    Periods++;
                }

                Assert.AreEqual(2, PlayOffs);
                Assert.AreEqual(19, Periods);

            }
            catch (Exception ex)
            {
                testDatabaseConn.Close();
                Trace.WriteLine(ex.Message + ex.StackTrace);
                Assert.Fail();
            }
        }

        [TestMethod]
        public void ScheduleCreationStartSunday()
        {
            try
            {
                SqlCommand cmdSQL = new SqlCommand();
                cmdSQL.Connection = testDatabaseConn;

                cmdSQL.CommandText = "DELETE FROM LeagueConfig.League_Schedule_Settings";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = InitialLeagueSetup;
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = "UPDATE LeagueConfig.League_Schedule_Settings SET PeriodStartDay = 'S', SeasonStartOffset = 0 WHERE FantasyLeagueID = 1";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.CommandText = "EXEC fantasy.spCreateSchedule 1, 2, 0";
                cmdSQL.ExecuteNonQuery();

                cmdSQL.Parameters.Clear();
                cmdSQL.CommandText = "SELECT PeriodID, LEFT(CONVERT(VARCHAR, PeriodStartDate, 120), 10) AS PeriodStartDate, LEFT(CONVERT(VARCHAR, PeriodEndDate, 120), 10) AS PeriodEndDate, Playoffs FROM Fantasy.Schedule WHERE FantasyLeagueID = 1 AND SeasonID = 2";
                SqlDataAdapter sqlDataAdpt = new SqlDataAdapter(cmdSQL);

                DataSet ds = new DataSet();
                DataTable dt = new DataTable();

                sqlDataAdpt.Fill(dt);

                int PlayOffs = 0;
                int Periods = 0;
                string Week1StartDate = "2016-04-03";
                string Week1EndDate = "2016-04-09";
                string LastWeekStartDate = "2016-09-18";
                string LastWeekEndDate = "2016-09-24";

                foreach (DataRow row in dt.Rows)
                {
                    if ((bool)row["Playoffs"])
                    { PlayOffs++; }

                    if (row["PeriodID"].ToString() == "1")
                    {
                        Assert.AreEqual(Week1StartDate, row["PeriodStartDate"].ToString());
                        Assert.AreEqual(Week1EndDate, row["PeriodEndDate"].ToString());
                    }

                    if (row["PeriodID"].ToString() == "25")
                    {
                        Assert.AreEqual(LastWeekStartDate, row["PeriodStartDate"].ToString());
                        Assert.AreEqual(LastWeekEndDate, row["PeriodEndDate"].ToString());
                    }

                    Periods++;
                }

                Assert.AreEqual(3, PlayOffs);
                Assert.AreEqual(25, Periods);

            }
            catch (Exception ex)
            {
                testDatabaseConn.Close();
                Trace.WriteLine(ex.Message + ex.StackTrace);
                Assert.Fail();
            }
        }


        [TestCleanup]
        public void TestCleanup()
        {
            testDatabaseConn.Close();
        }
    }
}
