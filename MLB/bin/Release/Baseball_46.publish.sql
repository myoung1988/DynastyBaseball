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
PRINT N'Dropping DF__League__Date_Tim__18777F3D...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__18777F3D];


GO
PRINT N'Dropping DF__League__Date_Tim__196BA376...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__196BA376];


GO
PRINT N'Dropping DF__Roster__Date_Tim__1A5FC7AF...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__1A5FC7AF];


GO
PRINT N'Dropping DF__Roster__Date_Tim__1B53EBE8...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__1B53EBE8];


GO
PRINT N'Dropping DF__Team__Date_Time___1C481021...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___1C481021];


GO
PRINT N'Dropping DF__Team__Date_Time___1D3C345A...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___1D3C345A];


GO
PRINT N'Dropping DF__Transacti__Trans__1E305893...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Trans__1E305893];


GO
PRINT N'Dropping DF__Transacti__Date___1F247CCC...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Date___1F247CCC];


GO
PRINT N'Dropping DF__Transacti__Date___2018A105...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Date___2018A105];


GO
PRINT N'Dropping DF__Config__Date_Tim__210CC53E...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__210CC53E];


GO
PRINT N'Dropping DF__Config__Date_Tim__2200E977...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__2200E977];


GO
PRINT N'Dropping DF__League_Sc__Date___22F50DB0...';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings] DROP CONSTRAINT [DF__League_Sc__Date___22F50DB0];


GO
PRINT N'Dropping DF__League_Sc__Date___23E931E9...';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings] DROP CONSTRAINT [DF__League_Sc__Date___23E931E9];


GO
PRINT N'Dropping DF__Scoring_S__Date___24DD5622...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___24DD5622];


GO
PRINT N'Dropping DF__Scoring_S__Date___25D17A5B...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___25D17A5B];


GO
PRINT N'Dropping DF__Scoring_S__Date___26C59E94...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___26C59E94];


GO
PRINT N'Dropping DF__Scoring_S__Date___27B9C2CD...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___27B9C2CD];


GO
PRINT N'Dropping DF__Scoring_S__Date___28ADE706...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___28ADE706];


GO
PRINT N'Dropping DF__Scoring_S__Date___29A20B3F...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___29A20B3F];


GO
PRINT N'Dropping DF__Team_Rost__Date___2A962F78...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits] DROP CONSTRAINT [DF__Team_Rost__Date___2A962F78];


GO
PRINT N'Dropping DF__Team_Rost__Date___2B8A53B1...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits] DROP CONSTRAINT [DF__Team_Rost__Date___2B8A53B1];


GO
PRINT N'Dropping DF__Team_Rost__Date___2C7E77EA...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions] DROP CONSTRAINT [DF__Team_Rost__Date___2C7E77EA];


GO
PRINT N'Dropping DF__Team_Rost__Date___2D729C23...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions] DROP CONSTRAINT [DF__Team_Rost__Date___2D729C23];


GO
PRINT N'Dropping DF__Transacti__Date___2E66C05C...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___2E66C05C];


GO
PRINT N'Dropping DF__Transacti__Date___2F5AE495...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___2F5AE495];


GO
PRINT N'Dropping DF__Eligibili__Date___304F08CE...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___304F08CE];


GO
PRINT N'Dropping DF__Eligibili__Date___31432D07...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___31432D07];


GO
PRINT N'Dropping DF__Player__Date_Tim__32375140...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__32375140];


GO
PRINT N'Dropping DF__Player__Date_Tim__332B7579...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__332B7579];


GO
PRINT N'Dropping DF__Position__Date_T__341F99B2...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__341F99B2];


GO
PRINT N'Dropping DF__Position__Date_T__3513BDEB...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__3513BDEB];


GO
PRINT N'Dropping DF__Stats_Dai__Date___3607E224...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___3607E224];


GO
PRINT N'Dropping DF__Stats_Dai__Date___36FC065D...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___36FC065D];


GO
PRINT N'Dropping DF__Stats_Pro__Date___37F02A96...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___37F02A96];


GO
PRINT N'Dropping DF__Stats_Pro__Date___38E44ECF...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___38E44ECF];


GO
PRINT N'Dropping DF__Stats_Sea__Date___39D87308...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___39D87308];


GO
PRINT N'Dropping DF__Stats_Sea__Date___3ACC9741...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___3ACC9741];


GO
PRINT N'Dropping DF__Team__Date_Time___3BC0BB7A...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___3BC0BB7A];


GO
PRINT N'Dropping DF__Team__Date_Time___3CB4DFB3...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___3CB4DFB3];


GO
PRINT N'Dropping DF__RosterPos__Date___3DA903EC...';


GO
ALTER TABLE [SystemConfig].[RosterPositions] DROP CONSTRAINT [DF__RosterPos__Date___3DA903EC];


GO
PRINT N'Dropping DF__RosterPos__Date___3E9D2825...';


GO
ALTER TABLE [SystemConfig].[RosterPositions] DROP CONSTRAINT [DF__RosterPos__Date___3E9D2825];


GO
PRINT N'Dropping DF__ScoringCa__Date___3F914C5E...';


GO
ALTER TABLE [SystemConfig].[ScoringCategories] DROP CONSTRAINT [DF__ScoringCa__Date___3F914C5E];


GO
PRINT N'Dropping DF__ScoringCa__Date___40857097...';


GO
ALTER TABLE [SystemConfig].[ScoringCategories] DROP CONSTRAINT [DF__ScoringCa__Date___40857097];


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
PRINT N'Creating [fantasy].[spCreateSchedule]...';


GO
CREATE PROCEDURE [fantasy].[spCreateSchedule]
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

	
	SET @DateIncrement = @PeriodLength * 7;
	SET @CurrentPeriodStartDate = DATEADD(day, @SeasonStartOffset, @SeasonStartDate);

	IF @SeasonStartOffset = 0
		SET @CurrentPeriodEndDate = DATEADD(day, @DateIncrement + 1, @SeasonStartDate);
	ELSE 
		SET @CurrentPeriodEndDate = DATEADD(day, @DateIncrement, @SeasonStartDate);

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
