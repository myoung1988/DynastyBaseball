CREATE TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses]
(
	[FantasyLeagueID] INT NOT NULL , 
    [CategoryID] INT NOT NULL, 
	[AwardBonusPointsAt] DECIMAL(18, 2) NULL, 
    [BonusPoints] DECIMAL(18, 2) NULL,
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50)
)
