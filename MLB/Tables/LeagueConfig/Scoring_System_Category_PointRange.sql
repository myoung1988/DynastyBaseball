CREATE TABLE [LeagueConfig].[Scoring_System_Category_PointRange]
(
	[FantasyLeagueID] INT NOT NULL , 
    [CategoryID] INT NOT NULL, 
    [FromValue] DECIMAL(18, 2) NOT NULL, 
    [ToValue] DECIMAL(18, 2) NOT NULL,
	[PointsForRange] DECIMAL(18, 2) NOT NULL, 
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50)
)
