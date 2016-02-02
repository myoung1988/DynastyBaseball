CREATE TABLE [LeagueConfig].[League_Schedule_Settings]
(
	[FantasyLeagueID] INT NOT NULL PRIMARY KEY,
	[PeriodLength] INT NOT NULL DEFAULT 1, 
	[PeriodStartDay] VARCHAR(2) NOT NULL DEFAULT 'M',
	[SeasonStartDate] DATE NOT NULL DEFAULT GETDATE(),
	[SeasonStartOffset] INT NOT NULL DEFAULT 1,
	[MatchupsPerPeriod] INT NOT NULL DEFAULT 1,
	[PlayoffsStartPeriodID] INT NOT NULL DEFAULT 23,
	[PlayoffLength] INT NOT NULL DEFAULT 3,
	[TeamsAccruePointsThroughPlayoffs] BIT NOT NULL DEFAULT 0,
	[PlayoffTieBreaker] VARCHAR(5) NOT NULL DEFAULT 'TWBCW',
	[PlayoffTieBreakerCategoryID] INT,
	[StandingsDetermination] VARCHAR(5) NOT NULL DEFAULT 'WP',
	[OverallTieBreakerCategory] VARCHAR(5) NOT NULL DEFAULT 'H2HR',
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50)
)
