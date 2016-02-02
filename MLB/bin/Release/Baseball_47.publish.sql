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
PRINT N'Dropping DF__League__Date_Tim__417994D0...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__417994D0];


GO
PRINT N'Dropping DF__League__Date_Tim__426DB909...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__426DB909];


GO
PRINT N'Dropping DF__Roster__Date_Tim__4361DD42...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__4361DD42];


GO
PRINT N'Dropping DF__Roster__Date_Tim__4456017B...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__4456017B];


GO
PRINT N'Dropping DF__Team__Date_Time___454A25B4...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___454A25B4];


GO
PRINT N'Dropping DF__Team__Date_Time___463E49ED...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___463E49ED];


GO
PRINT N'Dropping DF__Transacti__Trans__47326E26...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Trans__47326E26];


GO
PRINT N'Dropping DF__Transacti__Date___4826925F...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Date___4826925F];


GO
PRINT N'Dropping DF__Transacti__Date___491AB698...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Date___491AB698];


GO
PRINT N'Dropping DF__Config__Date_Tim__4A0EDAD1...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__4A0EDAD1];


GO
PRINT N'Dropping DF__Config__Date_Tim__4B02FF0A...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__4B02FF0A];


GO
PRINT N'Dropping DF__League_Sc__Date___4BF72343...';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings] DROP CONSTRAINT [DF__League_Sc__Date___4BF72343];


GO
PRINT N'Dropping DF__League_Sc__Date___4CEB477C...';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings] DROP CONSTRAINT [DF__League_Sc__Date___4CEB477C];


GO
PRINT N'Dropping DF__Scoring_S__Date___4DDF6BB5...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___4DDF6BB5];


GO
PRINT N'Dropping DF__Scoring_S__Date___4ED38FEE...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___4ED38FEE];


GO
PRINT N'Dropping DF__Scoring_S__Date___4FC7B427...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___4FC7B427];


GO
PRINT N'Dropping DF__Scoring_S__Date___50BBD860...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___50BBD860];


GO
PRINT N'Dropping DF__Scoring_S__Date___51AFFC99...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___51AFFC99];


GO
PRINT N'Dropping DF__Scoring_S__Date___52A420D2...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___52A420D2];


GO
PRINT N'Dropping DF__Team_Rost__Date___5398450B...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits] DROP CONSTRAINT [DF__Team_Rost__Date___5398450B];


GO
PRINT N'Dropping DF__Team_Rost__Date___548C6944...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits] DROP CONSTRAINT [DF__Team_Rost__Date___548C6944];


GO
PRINT N'Dropping DF__Team_Rost__Date___55808D7D...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions] DROP CONSTRAINT [DF__Team_Rost__Date___55808D7D];


GO
PRINT N'Dropping DF__Team_Rost__Date___5674B1B6...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions] DROP CONSTRAINT [DF__Team_Rost__Date___5674B1B6];


GO
PRINT N'Dropping DF__Transacti__Date___5768D5EF...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___5768D5EF];


GO
PRINT N'Dropping DF__Transacti__Date___585CFA28...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___585CFA28];


GO
PRINT N'Dropping DF__Eligibili__Date___59511E61...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___59511E61];


GO
PRINT N'Dropping DF__Eligibili__Date___5A45429A...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___5A45429A];


GO
PRINT N'Dropping DF__Player__Date_Tim__5B3966D3...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__5B3966D3];


GO
PRINT N'Dropping DF__Player__Date_Tim__5C2D8B0C...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__5C2D8B0C];


GO
PRINT N'Dropping DF__Position__Date_T__5D21AF45...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__5D21AF45];


GO
PRINT N'Dropping DF__Position__Date_T__5E15D37E...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__5E15D37E];


GO
PRINT N'Dropping DF__Stats_Dai__Date___5F09F7B7...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___5F09F7B7];


GO
PRINT N'Dropping DF__Stats_Dai__Date___5FFE1BF0...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___5FFE1BF0];


GO
PRINT N'Dropping DF__Stats_Pro__Date___60F24029...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___60F24029];


GO
PRINT N'Dropping DF__Stats_Pro__Date___61E66462...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___61E66462];


GO
PRINT N'Dropping DF__Stats_Sea__Date___62DA889B...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___62DA889B];


GO
PRINT N'Dropping DF__Stats_Sea__Date___63CEACD4...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___63CEACD4];


GO
PRINT N'Dropping DF__Team__Date_Time___64C2D10D...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___64C2D10D];


GO
PRINT N'Dropping DF__Team__Date_Time___65B6F546...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___65B6F546];


GO
PRINT N'Dropping DF__RosterPos__Date___66AB197F...';


GO
ALTER TABLE [SystemConfig].[RosterPositions] DROP CONSTRAINT [DF__RosterPos__Date___66AB197F];


GO
PRINT N'Dropping DF__RosterPos__Date___679F3DB8...';


GO
ALTER TABLE [SystemConfig].[RosterPositions] DROP CONSTRAINT [DF__RosterPos__Date___679F3DB8];


GO
PRINT N'Dropping DF__ScoringCa__Date___689361F1...';


GO
ALTER TABLE [SystemConfig].[ScoringCategories] DROP CONSTRAINT [DF__ScoringCa__Date___689361F1];


GO
PRINT N'Dropping DF__ScoringCa__Date___6987862A...';


GO
ALTER TABLE [SystemConfig].[ScoringCategories] DROP CONSTRAINT [DF__ScoringCa__Date___6987862A];


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

	
	SET @DateIncrement = @PeriodLength * 7;
	SET @CurrentPeriodStartDate = DATEADD(day, @SeasonStartOffset, @SeasonStartDate);

	IF @SeasonStartOffset = 0
		SET @CurrentPeriodEndDate = DATEADD(day, @DateIncrement, @SeasonStartDate);
	ELSE 
		SET @CurrentPeriodEndDate = DATEADD(day, @DateIncrement - @SeasonStartOffset, @SeasonStartDate);

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