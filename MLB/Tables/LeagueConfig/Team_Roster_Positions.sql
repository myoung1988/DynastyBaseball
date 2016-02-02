CREATE TABLE [LeagueConfig].[Team_Roster_Positions]
(
	[FantasyLeagueID] INT NOT NULL , 
    [PositionID] INT NOT NULL, 
    [MinimumStarters] INT NULL , 
    [MaximumStarters] INT NULL, 
    [MinimumRoster] INT NULL , 
    [MaximumRoster] INT NULL , 
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50),
    CONSTRAINT [PK_Team_Roster_Positions] PRIMARY KEY ([FantasyLeagueID], [PositionID]) 
)