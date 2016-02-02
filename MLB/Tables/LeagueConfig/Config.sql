CREATE TABLE [LeagueConfig].[Config]
(
	[FantasyLeagueID] INT NOT NULL PRIMARY KEY, 
    [LeagueImage] VARCHAR(500) NULL, 
    [Rules] TEXT NULL, 
    [CommissionerMessage] NCHAR(10) NULL,
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50)
)
