CREATE TABLE [LeagueConfig].[Scoring_System_Category]
(
	[FantasyLeagueID] INT NOT NULL , 
    [CategoryID] INT NOT NULL, 
    [HeadToHeadWeight] DECIMAL(3, 1) NULL, 
    [PointValuePer] DECIMAL(18, 2) NULL, 
    [UseScoringRanges] BIT NULL DEFAULT 0, 
    [UseScoringBonuses] BIT NULL DEFAULT 0, 
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50),
    CONSTRAINT [PK_Scoring_System_Categories] PRIMARY KEY ([FantasyLeagueID], [CategoryID]) 
)
