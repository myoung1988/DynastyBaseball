CREATE TABLE [LeagueConfig].[Transaction_Policies]
(
	[FantasyLeagueID] INT NOT NULL PRIMARY KEY, 
    [ChangeLineUpPolicy] BIT NOT NULL DEFAULT 1,
    [LineUpEffectiveDate] VARCHAR NOT NULL DEFAULT 'D', -- D = Daily, W = Weekly, P = Period
    [LineUpDeadline] VARCHAR(5) NOT NULL DEFAULT 'GFEP', -- GFEP - Gametime for each player, FWG = First Weeks Game, FGOD = First Game of the Day
    [RestrictDL] BIT NOT NULL DEFAULT 1, 
    [RestrictMinors] BIT NOT NULL DEFAULT 1, 
    [EnforceLineUpPolicy] BIT NOT NULL DEFAULT 0, 
    [AddDropPolicy] VARCHAR(5) NOT NULL DEFAULT 'ABC', -- ABC = Approved by Commish, PI = Process Immediately, W = Waivers, FAAB = Automated Auction, FAABC = Automated auction with commish approval, R = Restrict
    [MaxTransactionsPerPeriod] INT NULL, 
    [TradePolicy] VARCHAR(5) NOT NULL DEFAULT 'VP', -- VP = Voting Process, PI = Process Immediately, ABC = Approve By Commish, R = Restrict
    [VotingPeriod] INT NULL, 
    [AllowableObjections] INT NULL, 
    [TradeDeadline] DATE NULL, 
    [AllowOffseasonTrades] BIT NOT NULL DEFAULT 1, 
    [AllowDraftPickTrading] BIT NOT NULL DEFAULT 1,
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50)
)
