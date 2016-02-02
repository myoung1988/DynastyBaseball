CREATE PROCEDURE [dbo].[Testing_SetupLeagueConfig]

AS
BEGIN
-- Transaction_Policies
INSERT INTO LeagueConfig.Transaction_Policies ( FantasyLeagueID, ChangeLineUpPolicy, LineUpEffectiveDate, LineUpDeadline, RestrictDL, RestrictMinors, EnforceLineUpPolicy, AddDropPolicy, MaxTransactionsPerPeriod, TradePolicy, VotingPeriod, AllowableObjections, TradeDeadline, AllowOffseasonTrades, AllowDraftPickTrading ) VALUES ( 1,1,'D','GFEP',1,1,0,'W',5,'VP',5,4,NULL,1,1)

-- Roster Settings
INSERT INTO LeagueConfig.Team_Roster_Positions (FantasyLeagueID, PositionID, MinimumStarters, MaximumStarters, MinimumRoster,MaximumRoster) VALUeS (1, 1, 1, 1, 1, NULL) 
INSERT INTO LeagueConfig.Team_Roster_Positions (FantasyLeagueID, PositionID, MinimumStarters, MaximumStarters, MinimumRoster,MaximumRoster) VALUeS (1, 2, 1, 1, 1, NULL) 
INSERT INTO LeagueConfig.Team_Roster_Positions (FantasyLeagueID, PositionID, MinimumStarters, MaximumStarters, MinimumRoster,MaximumRoster) VALUeS (1, 3, 1, 1, 1, NULL) 
INSERT INTO LeagueConfig.Team_Roster_Positions (FantasyLeagueID, PositionID, MinimumStarters, MaximumStarters, MinimumRoster,MaximumRoster) VALUeS (1, 4, 1, 1, 1, NULL) 
INSERT INTO LeagueConfig.Team_Roster_Positions (FantasyLeagueID, PositionID, MinimumStarters, MaximumStarters, MinimumRoster,MaximumRoster) VALUeS (1, 5, 1, 1, 1, NULL) 
INSERT INTO LeagueConfig.Team_Roster_Positions (FantasyLeagueID, PositionID, MinimumStarters, MaximumStarters, MinimumRoster,MaximumRoster) VALUeS (1, 6, 3, 3, 3, NULL)
INSERT INTO LeagueConfig.Team_Roster_Positions (FantasyLeagueID, PositionID, MinimumStarters, MaximumStarters, MinimumRoster,MaximumRoster) VALUeS (1, 7, 1, 1, 1, NULL)
INSERT INTO LeagueConfig.Team_Roster_Positions (FantasyLeagueID, PositionID, MinimumStarters, MaximumStarters, MinimumRoster,MaximumRoster) VALUeS (1, 8, 0, 10, 6, 11)   
INSERT INTO LeagueConfig.Team_Roster_Positions (FantasyLeagueID, PositionID, MinimumStarters, MaximumStarters, MinimumRoster,MaximumRoster) VALUeS (1, 9, 0, 10, 3, 11)  

-- Roster Limits
INSERT INTO LeagueConfig.Team_Roster_Limits (   FantasyLeagueID,MinimumStartingPlayers,MaximumStartingPlayers,MinimumReservePlayers,MaximumReservePlayers,MinimumInjuredPlayers,MaximumInjuredPlayers,MinimumMinorLeaguePlayers,MaximumMinorLeaguePlayers,MinimumTotal,MaximumTotal ) VALUES ( 1,18,18,0,10,0,4,0, 12, 18, 44 )

-- Scored Categories
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 1 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 2 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 3 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 4 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 5 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 6 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 7 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 8 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 9 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 57 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 58 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 59 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 60 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 61 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 62 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 63 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 64 )
INSERT INTO LeagueConfig.Scoring_System_Category (  FantasyLeagueID, CategoryID ) VALUES (  1, 65 )

-- Scoring System - General
INSERT INTO LeagueConfig.Scoring_System (FantasyLeagueID, ScoringType, WinDetermination) VALUES (1, 'H2H', 'ECAT')

-- League Config
INSERT INTO LeagueConfig.Config (FantasyLeagueID) VALUES (1)

INSERT INTO LeagueConfig.League_Schedule_Settings ( FantasyLeagueID,
													PeriodLength,
													PeriodStartDay,
													SeasonStartOffset,
													MatchupsPerPeriod,
													PlayoffsStartPeriodID,
													PlayoffLength,
													TeamsAccruePointsThroughPlayoffs,
													PlayoffTieBreaker,
													PlayoffTieBreakerCategoryID,
													StandingsDetermination,
													OverallTieBreakerCategory )
										   VALUES ( 1,
													1,
													'M',
													1,
													1,
													23,
													3,
													0,
													'TWBCW',
													NULL,
													'WP',
													'H2HR' )

-- Team Setup
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 1, 'Busten in her Posey', 'BUS')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 3, 'Crazy Crackers', 'CRA')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 6, 'Dutch Oven', 'DUT')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 4, 'Hannibal Lester', 'HAN')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 7, 'Head First', 'HEA')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 2, 'Polish Powerhouse', 'POL')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 5, 'Rachet Hoes', 'RAC')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 9, 'Sons of Pitches', 'SON')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 8, 'Sports Machine', 'SPO')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 10, 'TasteMyBabyGravy', 'TAS')													

-- Setup Schedule
/* INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 1, '4/4/2016', '4/10/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 2, '4/11/2016', '4/17/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 3, '4/18/2016', '4/24/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 4, '4/25/2016', '5/1/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 5, '5/2/2016', '5/8/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 6, '5/9/2016', '5/15/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 7, '5/16/2016', '5/22/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 8, '5/23/2016', '5/29/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 9, '5/30/2016', '6/5/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 10, '6/6/2016', '6/12/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 11, '6/13/2016', '6/19/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 12, '6/20/2016', '6/26/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 13, '6/27/2016', '7/3/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 14, '7/4/2016', '7/10/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 15, '7/11/2016', '7/17/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 16, '7/18/2016', '7/24/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 17, '7/25/2016', '7/31/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 18, '8/1/2016', '8/7/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 19, '8/8/2016', '8/14/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 20, '8/15/2016', '8/21/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 21, '8/22/2016', '8/28/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 22, '8/29/2016', '9/4/2016', 0)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 23, '9/5/2016', '9/11/2016', 1)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 24, '9/12/2016', '9/18/2016', 1)
INSERT INTO Fantasy.Schedule (FantasyLeagueID, SeasonID, PeriodID, PeriodStartDate, PeriodEndDate, Playoffs) VALUES( 1, 2, 25, '9/19/2016', '9/25/2016', 1) */

END