CREATE TABLE [LeagueConfig].[Team_Roster_Limits]
(
	[FantasyLeagueID] INT NOT NULL , 
    [MinimumStartingPlayers] INT NOT NULL DEFAULT 0, 
    [MaximumStartingPlayers] INT NOT NULL DEFAULT 0, 
    [MinimumReservePlayers] INT NOT NULL DEFAULT 0, 
    [MaximumReservePlayers] INT NOT NULL DEFAULT 0, 
	[MinimumInjuredPlayers] INT NOT NULL DEFAULT 0, 
    [MaximumInjuredPlayers] INT NOT NULL DEFAULT 0, 
	[MinimumMinorLeaguePlayers] INT NOT NULL DEFAULT 0, 
    [MaximumMinorLeaguePlayers] INT NOT NULL DEFAULT 0, 
	[MinimumTotal] INT NOT NULL DEFAULT 0, 
    [MaximumTotal] INT NOT NULL DEFAULT 0, 
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50), 
    CONSTRAINT [PK_Team_Roster_Limits] PRIMARY KEY ([FantasyLeagueID])
)