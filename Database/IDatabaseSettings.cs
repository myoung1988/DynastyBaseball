namespace Dynasty.Database
{
    public interface IDatabaseSettings
    {
        #region Properties
        string Database { get; set; }
        string Username { get; set; }
        string Password { get; set; }
        string DataSource { get; set; }
        string ConfigurationLocation { get; set; }
        string Provider { get; set; }
        #endregion

        #region Methods
        void LoadDatabaseConfiguration(string sCustomPath = null);
        bool ConfigurationFileExists();
        void CreateConfigurationFile(string sDatabase, string sUsername, string sPassword, string sDataSource,
                                     string sProvider, string sCustomPath = null);
        void CreateConfigurationFile(string sCustomPath = null);
        void UpdateConfigurationFile(string sCustomPath = null);
        #endregion
    }
}
