using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Data.OleDb;
using System.Data;
using System.Diagnostics;

namespace Dynasty.Database.ErrorHandle
{
    public class ErrorHandle
    {

        private static string _path = AppDomain.CurrentDomain.BaseDirectory + "\\Errors\\";
        private static string _logFile = "ErrorLog.txt";

        public static string LogFile
        {
            get { return _logFile; }
            set { _logFile = value; }
        }

        public static string Path
        {
            get { return _path; }
            set { _path = value; }
        }

        /// <summary>Open or create an error log and submit error message
        /// </summary>
        /// <param name="message">message to be written to error file</param>
        /// <param name="stackTrace">stack trace from error message</param>
        /// <param name="title">title of the error file entry</param>
        /// <param name="sourceMethod"></param>
        /// <param name="details">SQL string to be written to error file</param>
        /// <remarks></remarks>
        public static void WriteToErrorLog(string message, string stackTrace, string title, string sourceMethod, string details)
        {
            string source = sourceMethod == "" ? title : sourceMethod;

            StringBuilder eventBuilder = new StringBuilder();

            eventBuilder.AppendLine("Title: " + title + System.Environment.NewLine);
            eventBuilder.AppendLine("Message: " + message + System.Environment.NewLine);
            eventBuilder.AppendLine("StackTrace: " + stackTrace + System.Environment.NewLine);
            eventBuilder.AppendLine("Date/Time: " + DateTime.Now.ToString() + System.Environment.NewLine);

            if (details != "")
            { eventBuilder.AppendLine("Details: " + details + System.Environment.NewLine); }

            WriteToEventLog(eventBuilder.ToString(), EventLogEntryType.Error);
            
        }

        /// <summary>
        /// Creates a new entry in the event log.
        /// </summary>
        /// <param name="entry"></param>
        /// <param name="eventType"></param>
        /// <returns></returns>
        public static bool WriteToEventLog(string entry, EventLogEntryType eventType)
        {
            string sAppName = System.Reflection.Assembly.GetExecutingAssembly().GetName().Name;

            EventLog objEventLog = new EventLog();
            try
            {

                if (!(EventLog.SourceExists(sAppName)))
                {
                    EventLog.CreateEventSource(sAppName, "Application");
                }

                objEventLog.Source = sAppName;
                objEventLog.WriteEntry(entry, eventType);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


    }
}
