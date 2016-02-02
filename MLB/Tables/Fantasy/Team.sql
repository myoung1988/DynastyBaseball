CREATE TABLE [Fantasy].[Team]
(
	[FantasyTeamID] INT NOT NULL,
	[FantasyLeagueID] INT NOT NULL,
	[Name] VARCHAR(100) NOT NULL,
	[Abbreviation] VARCHAR(3) NOT NULL ,
	[Logo] VARCHAR(MAX) NULL,
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50), 
    CONSTRAINT [PK_Fantasy_Team] PRIMARY KEY ([FantasyTeamID], [FantasyLeagueID])
)
