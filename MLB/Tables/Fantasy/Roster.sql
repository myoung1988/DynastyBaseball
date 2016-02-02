CREATE TABLE [Fantasy].[Roster]
(
	[FantasyTeamID] INT NOT NULL , 
	[FantasyLeagueID] INT NOT NULL,
	[PlayerID] INT NOT NULL,
    [Status] VARCHAR(1) NOT NULL DEFAULT 'A', 
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50),
    PRIMARY KEY ([FantasyTeamID], [PlayerID], [FantasyLeagueID]), 
    CONSTRAINT [CK_Fantasy_Roster_Status] CHECK (Status = 'A' OR Status = 'R' OR Status = 'I' OR Status = 'M')
)
