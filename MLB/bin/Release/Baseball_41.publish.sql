﻿/*
Deployment script for Baseball

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Baseball"
:setvar DefaultFilePrefix "Baseball"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping DF__League__Date_Tim__4984CAEC...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__4984CAEC];


GO
PRINT N'Dropping DF__League__Date_Tim__4A78EF25...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__4A78EF25];


GO
PRINT N'Dropping DF__Roster__Date_Tim__4B6D135E...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__4B6D135E];


GO
PRINT N'Dropping DF__Roster__Date_Tim__4C613797...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__4C613797];


GO
PRINT N'Dropping DF__Team__Date_Time___4D555BD0...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___4D555BD0];


GO
PRINT N'Dropping DF__Team__Date_Time___4E498009...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___4E498009];


GO
PRINT N'Dropping DF__Transacti__Trans__4F3DA442...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Trans__4F3DA442];


GO
PRINT N'Dropping DF__Transacti__Date___5031C87B...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Date___5031C87B];


GO
PRINT N'Dropping DF__Transacti__Date___5125ECB4...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Date___5125ECB4];


GO
PRINT N'Dropping DF__Config__Date_Tim__521A10ED...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__521A10ED];


GO
PRINT N'Dropping DF__Config__Date_Tim__530E3526...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__530E3526];


GO
PRINT N'Dropping DF__League_Sc__Date___5402595F...';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings] DROP CONSTRAINT [DF__League_Sc__Date___5402595F];


GO
PRINT N'Dropping DF__League_Sc__Date___54F67D98...';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings] DROP CONSTRAINT [DF__League_Sc__Date___54F67D98];


GO
PRINT N'Dropping DF__Scoring_S__Date___55EAA1D1...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___55EAA1D1];


GO
PRINT N'Dropping DF__Scoring_S__Date___56DEC60A...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___56DEC60A];


GO
PRINT N'Dropping DF__Scoring_S__Date___57D2EA43...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___57D2EA43];


GO
PRINT N'Dropping DF__Scoring_S__Date___58C70E7C...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___58C70E7C];


GO
PRINT N'Dropping DF__Scoring_S__Date___59BB32B5...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___59BB32B5];


GO
PRINT N'Dropping DF__Scoring_S__Date___5AAF56EE...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___5AAF56EE];


GO
PRINT N'Dropping DF__Team_Rost__Date___5BA37B27...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits] DROP CONSTRAINT [DF__Team_Rost__Date___5BA37B27];


GO
PRINT N'Dropping DF__Team_Rost__Date___5C979F60...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits] DROP CONSTRAINT [DF__Team_Rost__Date___5C979F60];


GO
PRINT N'Dropping DF__Team_Rost__Date___5D8BC399...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions] DROP CONSTRAINT [DF__Team_Rost__Date___5D8BC399];


GO
PRINT N'Dropping DF__Team_Rost__Date___5E7FE7D2...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions] DROP CONSTRAINT [DF__Team_Rost__Date___5E7FE7D2];


GO
PRINT N'Dropping DF__Transacti__Date___5F740C0B...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___5F740C0B];


GO
PRINT N'Dropping DF__Transacti__Date___60683044...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___60683044];


GO
PRINT N'Dropping DF__Eligibili__Date___615C547D...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___615C547D];


GO
PRINT N'Dropping DF__Eligibili__Date___625078B6...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___625078B6];


GO
PRINT N'Dropping DF__Player__Date_Tim__63449CEF...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__63449CEF];


GO
PRINT N'Dropping DF__Player__Date_Tim__6438C128...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__6438C128];


GO
PRINT N'Dropping DF__Position__Date_T__652CE561...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__652CE561];


GO
PRINT N'Dropping DF__Position__Date_T__6621099A...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__6621099A];


GO
PRINT N'Dropping DF__Stats_Dai__Date___67152DD3...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___67152DD3];


GO
PRINT N'Dropping DF__Stats_Dai__Date___6809520C...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___6809520C];


GO
PRINT N'Dropping DF__Stats_Pro__Date___68FD7645...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___68FD7645];


GO
PRINT N'Dropping DF__Stats_Pro__Date___69F19A7E...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___69F19A7E];


GO
PRINT N'Dropping DF__Stats_Sea__Date___6AE5BEB7...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___6AE5BEB7];


GO
PRINT N'Dropping DF__Stats_Sea__Date___6BD9E2F0...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___6BD9E2F0];


GO
PRINT N'Dropping DF__Team__Date_Time___6CCE0729...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___6CCE0729];


GO
PRINT N'Dropping DF__Team__Date_Time___6DC22B62...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___6DC22B62];


GO
PRINT N'Dropping DF__RosterPos__Date___6EB64F9B...';


GO
ALTER TABLE [SystemConfig].[RosterPositions] DROP CONSTRAINT [DF__RosterPos__Date___6EB64F9B];


GO
PRINT N'Dropping DF__RosterPos__Date___6FAA73D4...';


GO
ALTER TABLE [SystemConfig].[RosterPositions] DROP CONSTRAINT [DF__RosterPos__Date___6FAA73D4];


GO
PRINT N'Dropping DF__ScoringCa__Date___709E980D...';


GO
ALTER TABLE [SystemConfig].[ScoringCategories] DROP CONSTRAINT [DF__ScoringCa__Date___709E980D];


GO
PRINT N'Dropping DF__ScoringCa__Date___7192BC46...';


GO
ALTER TABLE [SystemConfig].[ScoringCategories] DROP CONSTRAINT [DF__ScoringCa__Date___7192BC46];


GO
PRINT N'Creating Default Constraint on [Fantasy].[League]....';


GO
ALTER TABLE [Fantasy].[League]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [Fantasy].[League]....';


GO
ALTER TABLE [Fantasy].[League]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Roster]....';


GO
ALTER TABLE [Fantasy].[Roster]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Roster]....';


GO
ALTER TABLE [Fantasy].[Roster]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Team]....';


GO
ALTER TABLE [Fantasy].[Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Team]....';


GO
ALTER TABLE [Fantasy].[Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Transaction]....';


GO
ALTER TABLE [Fantasy].[Transaction]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [TransactionDate];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Transaction]....';


GO
ALTER TABLE [Fantasy].[Transaction]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Transaction]....';


GO
ALTER TABLE [Fantasy].[Transaction]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Config]....';


GO
ALTER TABLE [LeagueConfig].[Config]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Config]....';


GO
ALTER TABLE [LeagueConfig].[Config]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[League_Schedule_Settings]....';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[League_Schedule_Settings]....';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category_PointBonuses]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category_PointBonuses]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category_PointRange]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category_PointRange]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Team_Roster_Limits]....';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Team_Roster_Limits]....';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Team_Roster_Positions]....';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Team_Roster_Positions]....';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Transaction_Policies]....';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Transaction_Policies]....';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Eligibility]....';


GO
ALTER TABLE [MLB].[Eligibility]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Eligibility]....';


GO
ALTER TABLE [MLB].[Eligibility]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Player]....';


GO
ALTER TABLE [MLB].[Player]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Player]....';


GO
ALTER TABLE [MLB].[Player]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Position]....';


GO
ALTER TABLE [MLB].[Position]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Position]....';


GO
ALTER TABLE [MLB].[Position]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Daily]....';


GO
ALTER TABLE [MLB].[Stats_Daily]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Daily]....';


GO
ALTER TABLE [MLB].[Stats_Daily]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Projection]....';


GO
ALTER TABLE [MLB].[Stats_Projection]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Projection]....';


GO
ALTER TABLE [MLB].[Stats_Projection]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Season]....';


GO
ALTER TABLE [MLB].[Stats_Season]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Season]....';


GO
ALTER TABLE [MLB].[Stats_Season]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Team]....';


GO
ALTER TABLE [MLB].[Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Team]....';


GO
ALTER TABLE [MLB].[Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [SystemConfig].[RosterPositions]....';


GO
ALTER TABLE [SystemConfig].[RosterPositions]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [SystemConfig].[RosterPositions]....';


GO
ALTER TABLE [SystemConfig].[RosterPositions]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [SystemConfig].[ScoringCategories]....';


GO
ALTER TABLE [SystemConfig].[ScoringCategories]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [SystemConfig].[ScoringCategories]....';


GO
ALTER TABLE [SystemConfig].[ScoringCategories]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating [dbo].[spCreateSchedule]...';


GO
CREATE PROCEDURE [dbo].[spCreateSchedule]
	@FantasyLeagueID INT,
	@SeasonID INT
AS
BEGIN
	
	DECLARE @PeriodLength INT,
			@PeriodStartDay VARCHAR(2),
			@SeasonStartOffset INT,
			@PlayoffStartPeriodID INT,
			@PlayoffLength INT,
			@SeasonStartDate DATE,
			@SeasonEndDate DATE,
			@NumberOfPeriods INT,
			@CurrentPeriodStartDate DATE,
			@CurrentPeriodEndDate DATE,
			@CurrentPeriodID INT = 1,
			@CurrentPeriodPlayoffs BIT = 0

	CREATE TABLE #TmpSchedule 
	(
			PeriodID INT,
			StartDate DATE,
			EndDate DATE,
			Playoffs BIT
	);

	IF EXISTS(SELECT 1 FROM Fantasy.Schedule WHERE FantasyLeagueID = @FantasyLeagueID AND SeasonID = @SeasonID)
		RAISERROR ('Schedule already exists.', 0, 1);

	SELECT  @PeriodLength = PeriodLength,
		    @PeriodStartDay = PeriodStartDay,
			@SeasonStartOffset = SeasonStartOffset,
			@PlayoffStartPeriodID = PlayoffsStartPeriodID,
			@PlayoffLength = PlayoffLength,
			@SeasonStartDate = Season.StartDate,
			@SeasonEndDate = Season.EndDate
	FROM LeagueConfig.League_Schedule_Settings, SystemConfig.Season
	WHERE Season.SeasonID = @SeasonID
	  AND League_Schedule_Settings.FantasyLeagueID = @FantasyLeagueID 

	SET @CurrentPeriodStartDate = @SeasonStartDate --+ @SeasonStartOffset;
	SET @CurrentPeriodEndDate = @SeasonStartDate;

	WHILE @CurrentPeriodEndDate < @SeasonEndDate
	BEGIN
		SET @CurrentPeriodEndDate = @CurrentPeriodStartDate + 7;

		INSERT INTO #TmpSchedule (PeriodID, StartDate, EndDate, Playoffs) 
			VALUES (@CurrentPeriodID, @CurrentPeriodStartDate, @CurrentPeriodEndDate, @CurrentPeriodPlayoffs)
		


	END

END
GO
PRINT N'Update complete.';


GO
