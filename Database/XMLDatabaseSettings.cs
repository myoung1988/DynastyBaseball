using System;
using System.Linq;
using System.IO;
using System.Xml.Linq;
using Dynasty.Database.Security;

namespace Dynasty.Database
{
    public class XMLDatabaseSettings : IDatabaseSettings
    {
        // Creates a Cryptography object to encrypt/decrypt the database password.
        private static Security.Cryptography oCrypt = new Cryptography();

        #region Properties
        public string Database { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string DataSource { get; set; }
        public string ConfigurationLocation { get; set; }
        public string Provider { get; set; }
        public bool IsConfigurationExists
        {
            get
            {
                return System.IO.File.Exists(ConfigurationLocation);
            }
        }
        #endregion

        #region Constructors

        /// <summary>
        /// Sets the constructor
        /// </summary>
        public XMLDatabaseSettings()
        {
            ConfigurationLocation = AppDomain.CurrentDomain.BaseDirectory + "\\DB_Config.xml";
        }

        public XMLDatabaseSettings(string configPath)
        {
            ConfigurationLocation = configPath;
        }
        #endregion

        #region Methods

        /// <summary>
        /// Loads the default database settings or from a custom path
        /// </summary>
        /// <param name="sCustomPath"></param>
        public void LoadDatabaseConfiguration(string sCustomPath = null)
        {
            if (sCustomPath != null) { ConfigurationLocation = sCustomPath; }

            try
            {
                DataSource = (from oDBvar in XDocument.Load(ConfigurationLocation).Descendants("Database")
                              select oDBvar.Element("DataSource").Value).Single();

                Username = (from oDBvar in XDocument.Load(ConfigurationLocation).Descendants("Database")
                            select oDBvar.Element("UserID").Value).Single();

                Password = oCrypt.Decrypt((from oDBvar in XDocument.Load(ConfigurationLocation).Descendants("Database")
                                             select oDBvar.Element("Password").Value).Single());

                Provider = (from oDBvar in XDocument.Load(ConfigurationLocation).Descendants("Database")
                            select oDBvar.Element("Provider").Value).Single();

                Database = (from oDBvar in XDocument.Load(ConfigurationLocation).Descendants("Database")
                            select oDBvar.Element("InitialCatalog").Value).Single();

            }
            catch (Exception ex)
            { 
                ErrorHandle.ErrorHandle.WriteToErrorLog(System.Reflection.Assembly.GetExecutingAssembly().GetName().Name, ex.Message, ex.StackTrace, "Loading Database Data", "LoadDatabaseConfig()"); 
            }

        }

        /// <summary>
        /// Checks to see if the file exists (could convert this into a property down the line).
        /// </summary>
        /// <returns></returns>
        public bool ConfigurationFileExists()
        { return File.Exists(ConfigurationLocation); }

        /// <summary>
        /// Creates the config file based on the passed in parameters.
        /// </summary>
        /// <param name="sDatabase"></param>
        /// <param name="sUsername"></param>
        /// <param name="sPassword"></param>
        /// <param name="sDataSource"></param>
        /// <param name="sProvider"></param>
        /// <param name="sCustomPath"></param>
        public void CreateConfigurationFile(string sDatabase, string sUsername, string sPassword, string sDataSource,
                                            string sProvider, string sCustomPath = null)
        {
            this.Database = sDatabase;
            this.Username = sUsername;
            this.Password = sPassword;
            this.DataSource = sDataSource;
            this.Provider = sProvider;

            CreateConfigurationFile(sCustomPath);
        }

        /// <summary>
        /// Creates the database configuration file. 
        /// </summary>
        /// <param name="sCustomPath"></param>
        public void CreateConfigurationFile(string sCustomPath = null)
        {
            if (sCustomPath != null) { ConfigurationLocation = sCustomPath; }

            try
            {

                XDocument oXMLDoc = new XDocument(new XComment("If the Provider is unknown, the default will load"),
                                                  new XElement("Database",
                                                  new XElement("DataSource", DataSource),
                                                  new XElement("UserID", Username),
                                                  new XElement("Password", oCrypt.Encrypt(Password)),
                                                  new XElement("Provider", Provider),
                                                  new XElement("InitialCatalog", Database)));

                oXMLDoc.Save(ConfigurationLocation);
            }
            catch (Exception ex)
            { ErrorHandle.ErrorHandle.WriteToErrorLog(System.Reflection.Assembly.GetExecutingAssembly().GetName().Name, ex.Message, ex.StackTrace, "Writing Database Data", "Create_Config()"); }

        }

        /// <summary>
        /// Updates the custom configuration file and overwrites the existing file. 
        /// </summary>
        /// <param name="sCustomPath"></param>
        public void UpdateConfigurationFile(string sCustomPath = null)
        {
            if (sCustomPath != null) { ConfigurationLocation = sCustomPath; }
            CreateConfigurationFile();
        }

        

        #endregion
    }
}
