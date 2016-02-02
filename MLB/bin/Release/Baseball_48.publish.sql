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
PRINT N'Dropping DF__League__Date_Tim__6B6FCE9C...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__6B6FCE9C];


GO
PRINT N'Dropping DF__League__Date_Tim__6C63F2D5...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__6C63F2D5];


GO
PRINT N'Dropping DF__Roster__Date_Tim__6D58170E...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__6D58170E];


GO
PRINT N'Dropping DF__Roster__Date_Tim__6E4C3B47...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__6E4C3B47];


GO
PRINT N'Dropping DF__Team__Date_Time___6F405F80...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___6F405F80];


GO
PRINT N'Dropping DF__Team__Date_Time___703483B9...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___703483B9];


GO
PRINT N'Dropping DF__Transacti__Trans__7128A7F2...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Trans__7128A7F2];


GO
PRINT N'Dropping DF__Transacti__Date___721CCC2B...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Date___721CCC2B];


GO
PRINT N'Dropping DF__Transacti__Date___7310F064...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Date___7310F064];


GO
PRINT N'Dropping DF__Config__Date_Tim__7405149D...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__7405149D];


GO
PRINT N'Dropping DF__Config__Date_Tim__74F938D6...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__74F938D6];


GO
PRINT N'Dropping DF__League_Sc__Date___75ED5D0F...';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings] DROP CONSTRAINT [DF__League_Sc__Date___75ED5D0F];


GO
PRINT N'Dropping DF__League_Sc__Date___76E18148...';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings] DROP CONSTRAINT [DF__League_Sc__Date___76E18148];


GO
PRINT N'Dropping DF__Scoring_S__Date___77D5A581...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___77D5A581];


GO
PRINT N'Dropping DF__Scoring_S__Date___78C9C9BA...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___78C9C9BA];


GO
PRINT N'Dropping DF__Scoring_S__Date___79BDEDF3...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___79BDEDF3];


GO
PRINT N'Dropping DF__Scoring_S__Date___7AB2122C...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___7AB2122C];


GO
PRINT N'Dropping DF__Scoring_S__Date___7BA63665...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___7BA63665];


GO
PRINT N'Dropping DF__Scoring_S__Date___7C9A5A9E...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___7C9A5A9E];


GO
PRINT N'Dropping DF__Team_Rost__Date___7D8E7ED7...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits] DROP CONSTRAINT [DF__Team_Rost__Date___7D8E7ED7];


GO
PRINT N'Dropping DF__Team_Rost__Date___7E82A310...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits] DROP CONSTRAINT [DF__Team_Rost__Date___7E82A310];


GO
PRINT N'Dropping DF__Team_Rost__Date___7F76C749...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions] DROP CONSTRAINT [DF__Team_Rost__Date___7F76C749];


GO
PRINT N'Dropping DF__Team_Rost__Date___006AEB82...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions] DROP CONSTRAINT [DF__Team_Rost__Date___006AEB82];


GO
PRINT N'Dropping DF__Transacti__Date___015F0FBB...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___015F0FBB];


GO
PRINT N'Dropping DF__Transacti__Date___025333F4...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___025333F4];


GO
PRINT N'Dropping DF__Eligibili__Date___0347582D...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___0347582D];


GO
PRINT N'Dropping DF__Eligibili__Date___043B7C66...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___043B7C66];


GO
PRINT N'Dropping DF__Player__Date_Tim__052FA09F...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__052FA09F];


GO
PRINT N'Dropping DF__Player__Date_Tim__0623C4D8...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__0623C4D8];


GO
PRINT N'Dropping DF__Position__Date_T__0717E911...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__0717E911];


GO
PRINT N'Dropping DF__Position__Date_T__080C0D4A...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__080C0D4A];


GO
PRINT N'Dropping DF__Stats_Dai__Date___09003183...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___09003183];


GO
PRINT N'Dropping DF__Stats_Dai__Date___09F455BC...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___09F455BC];


GO
PRINT N'Dropping DF__Stats_Pro__Date___0AE879F5...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___0AE879F5];


GO
PRINT N'Dropping DF__Stats_Pro__Date___0BDC9E2E...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___0BDC9E2E];


GO
PRINT N'Dropping DF__Stats_Sea__Date___0CD0C267...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___0CD0C267];


GO
PRINT N'Dropping DF__Stats_Sea__Date___0DC4E6A0...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___0DC4E6A0];


GO
PRINT N'Dropping DF__Team__Date_Time___0EB90AD9...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___0EB90AD9];


GO
PRINT N'Dropping DF__Team__Date_Time___0FAD2F12...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___0FAD2F12];


GO
PRINT N'Dropping DF__RosterPos__Date___10A1534B...';


GO
ALTER TABLE [SystemConfig].[RosterPositions] DROP CONSTRAINT [DF__RosterPos__Date___10A1534B];


GO
PRINT N'Dropping DF__RosterPos__Date___11957784...';


GO
ALTER TABLE [SystemConfig].[RosterPositions] DROP CONSTRAINT [DF__RosterPos__Date___11957784];


GO
PRINT N'Dropping DF__ScoringCa__Date___12899BBD...';


GO
ALTER TABLE [SystemConfig].[ScoringCategories] DROP CONSTRAINT [DF__ScoringCa__Date___12899BBD];


GO
PRINT N'Dropping DF__ScoringCa__Date___137DBFF6...';


GO
ALTER TABLE [SystemConfig].[ScoringCategories] DROP CONSTRAINT [DF__ScoringCa__Date___137DBFF6];


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
PRINT N'Altering [fantasy].[spCreateSchedule]...';


GO
ALTER PROCEDURE [fantasy].[spCreateSchedule]
	@FantasyLeagueID INT,
	@SeasonID INT
AS
BEGIN
BEGIN TRY
BEGIN TRANSACTION

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
			@CurrentPeriodPlayoffs BIT = 0,
			@DateIncrement INT

	IF OBJECT_ID('tempdb..#TmpSchedule') IS NOT NULL
		DROP TABLE #TmpSchedule

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

	
	SET @DateIncrement = (@PeriodLength * 7) - 1;
	SET @CurrentPeriodStartDate = DATEADD(day, @SeasonStartOffset, @SeasonStartDate);

	DECLARE @FirstSeasonIncrement INT = 
	CASE 
		WHEN @SeasonStartOffset = 0 AND @PeriodStartDay = 'S' THEN 0
		WHEN @SeasonStartOffset = 0 AND @PeriodStartDay = 'M' THEN 1
		WHEN @SeasonStartOffset = 1 AND @PeriodStartDay = 'S' THEN -1
		WHEN @SeasonStartOffset = 1 AND @PeriodStartDay = 'M' THEN 0
		ELSE 5
	END

	SET @CurrentPeriodEndDate = DATEADD(day,  @DateIncrement + @FirstSeasonIncrement, @SeasonStartDate);


	WHILE @CurrentPeriodEndDate <= @SeasonEndDate
	BEGIN
		
		IF @CurrentPeriodID >= @PlayoffStartPeriodID
			SET @CurrentPeriodPlayoffs = 1

		IF (SELECT COUNT(*) FROM #TmpSchedule WHERE Playoffs = 1) > @PlayoffLength
			SET @CurrentPeriodPlayoffs = 0
		ELSE
		BEGIN
			INSERT INTO #TmpSchedule (PeriodID, StartDate, EndDate, Playoffs) 
				VALUES (@CurrentPeriodID, @CurrentPeriodStartDate, @CurrentPeriodEndDate, @CurrentPeriodPlayoffs)
		
			SET @CurrentPeriodStartDate = DATEADD(day, @DateIncrement, @CurrentPeriodStartDate);
			SET @CurrentPeriodEndDate = DATEADD(day, @DateIncrement, @CurrentPeriodEndDate);
			SET @CurrentPeriodID = @CurrentPeriodID + 1;
		END

	END

	INSERT INTO Fantasy.Schedule
	SELECT @FantasyLeagueID,
			PeriodID,
			@SeasonID,
			StartDate,
			EndDate, 
			Playoffs
	FROM #TmpSchedule

	COMMIT

END TRY
BEGIN CATCH
	ROLLBACK
	SELECT ERROR_NUMBER(), ERROR_MESSAGE()
END CATCH

END
GO
PRINT N'Update complete.';


GO
