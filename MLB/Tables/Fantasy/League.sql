CREATE TABLE [Fantasy].[League]
(
	[FantasyLeagueID] INT NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(50) NOT NULL, 
    [OwnerID] INT NULL, 
    [LeagueEntryFee] MONEY NULL, 
    [LeagueType] VARCHAR NULL DEFAULT 'R', 
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50),
    CONSTRAINT [CK_Fantasy_League_LeagueType] CHECK (LeagueType = 'R' OR LeagueType = 'K' OR LeagueType = 'D')

)
