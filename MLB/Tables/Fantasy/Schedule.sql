CREATE TABLE [Fantasy].[Schedule]
(
	[FantasyLeagueID] INT NOT NULL , 
    [PeriodID] INT NOT NULL, 
    [SeasonID] INT NOT NULL, 
    [PeriodStartDate] DATE NOT NULL, 
    [PeriodEndDate] DATE NOT NULL, 
    [Playoffs] BIT NOT NULL DEFAULT 0, 
    PRIMARY KEY ([FantasyLeagueID], [PeriodID], [SeasonID])
)
