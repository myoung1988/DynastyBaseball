CREATE TABLE [LeagueConfig].[Scoring_System]
(
	[FantasyLeagueID] INT NOT NULL PRIMARY KEY, 
    [ScoringType] VARCHAR(4) NOT NULL DEFAULT 'H2H', -- H2H = Head to head, ROTO = Rotassaire
    [WinDetermination] VARCHAR(4) NULL, -- ECAT = Each Category, MCAT = Most Category, MP = Most Points
    [TieBreaker] NCHAR(10) NULL, -- NULL = Leave as Ties, HW = Home Team Wins, TWBR = Team with Better Reserves, TBC = Tie Breaker Category
    [TieBreakerCategoryID] INT NULL, 
    [UseCategoryWeights] BIT NULL DEFAULT 0, 
)
