using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Dynasty.Database.ErrorHandle;
using System.Diagnostics;

namespace Database_Test
{
    [TestClass]
    public class Error_Handling_Test
    {

        [TestInitialize()]
        public void TestInitialize()
        {
            ClearLogs();
        }

        [TestMethod]
        public void WriteToError()
        {
            ClearLogs();

            try
            {
                int i = 3;
                int i2 = 0;

                i = i / i2;
            }
            catch (Exception ex)
            {
                ErrorHandle.WriteToErrorLog("TestLog", ex.Message, ex.StackTrace, "WriteToError", "WriteToError");
            }

            Assert.AreEqual(1, NumberofLogs());

            ClearLogs();
        }

        [TestMethod]
        public void WriteToEvent()
        {
            ClearLogs();
            ErrorHandle.WriteToEventLog("This is a test entry:Information", System.Diagnostics.EventLogEntryType.Information);
            ErrorHandle.WriteToEventLog("This is a test entry:Warning", System.Diagnostics.EventLogEntryType.Warning);
            Assert.AreEqual(2, NumberofLogs());
            ClearLogs();
        }

        private int NumberofLogs()
        {
            EventLog oEventLog = new EventLog();
            oEventLog.Source = "Database";
            return oEventLog.Entries.Count;
        }

        private void ClearLogs()
        {
            EventLog oEventLog = new EventLog();
            oEventLog.Source = "Database";
            oEventLog.Clear();
        }
    }
}
