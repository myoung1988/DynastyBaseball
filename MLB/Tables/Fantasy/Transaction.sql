CREATE TABLE [Fantasy].[Transaction]
(
	[FantasyLeagueID] INT NOT NULL , 
    [TransactionID] INT NOT NULL, 
    [TeamID] INT NOT NULL, 
    [PlayerID] INT,
	[DraftPickID] INT, 
	[OpposingTeamID] INT,
	[TransactionDate] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    [CommissionerPerformed] BIT NOT NULL DEFAULT 0,
	[Action] VARCHAR(50) NOT NULL,
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50)
)
