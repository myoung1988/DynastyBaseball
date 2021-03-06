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
PRINT N'Dropping DF__League__Date_Tim__2082B559...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__2082B559];


GO
PRINT N'Dropping DF__League__Date_Tim__2176D992...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__2176D992];


GO
PRINT N'Dropping DF__Roster__Date_Tim__226AFDCB...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__226AFDCB];


GO
PRINT N'Dropping DF__Roster__Date_Tim__235F2204...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__235F2204];


GO
PRINT N'Dropping DF__Team__Date_Time___2453463D...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___2453463D];


GO
PRINT N'Dropping DF__Team__Date_Time___25476A76...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___25476A76];


GO
PRINT N'Dropping DF__Transacti__Trans__263B8EAF...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Trans__263B8EAF];


GO
PRINT N'Dropping DF__Transacti__Date___272FB2E8...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Date___272FB2E8];


GO
PRINT N'Dropping DF__Transacti__Date___2823D721...';


GO
ALTER TABLE [Fantasy].[Transaction] DROP CONSTRAINT [DF__Transacti__Date___2823D721];


GO
PRINT N'Dropping DF__Config__Date_Tim__2917FB5A...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__2917FB5A];


GO
PRINT N'Dropping DF__Config__Date_Tim__2A0C1F93...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__2A0C1F93];


GO
PRINT N'Dropping DF__League_Sc__Date___2B0043CC...';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings] DROP CONSTRAINT [DF__League_Sc__Date___2B0043CC];


GO
PRINT N'Dropping DF__League_Sc__Date___2BF46805...';


GO
ALTER TABLE [LeagueConfig].[League_Schedule_Settings] DROP CONSTRAINT [DF__League_Sc__Date___2BF46805];


GO
PRINT N'Dropping DF__Scoring_S__Date___2CE88C3E...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___2CE88C3E];


GO
PRINT N'Dropping DF__Scoring_S__Date___2DDCB077...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___2DDCB077];


GO
PRINT N'Dropping DF__Scoring_S__Date___2ED0D4B0...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___2ED0D4B0];


GO
PRINT N'Dropping DF__Scoring_S__Date___2FC4F8E9...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___2FC4F8E9];


GO
PRINT N'Dropping DF__Scoring_S__Date___30B91D22...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___30B91D22];


GO
PRINT N'Dropping DF__Scoring_S__Date___31AD415B...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___31AD415B];


GO
PRINT N'Dropping DF__Team_Rost__Date___32A16594...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits] DROP CONSTRAINT [DF__Team_Rost__Date___32A16594];


GO
PRINT N'Dropping DF__Team_Rost__Date___339589CD...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Limits] DROP CONSTRAINT [DF__Team_Rost__Date___339589CD];


GO
PRINT N'Dropping DF__Team_Rost__Date___3489AE06...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions] DROP CONSTRAINT [DF__Team_Rost__Date___3489AE06];


GO
PRINT N'Dropping DF__Team_Rost__Date___357DD23F...';


GO
ALTER TABLE [LeagueConfig].[Team_Roster_Positions] DROP CONSTRAINT [DF__Team_Rost__Date___357DD23F];


GO
PRINT N'Dropping DF__Transacti__Date___3671F678...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___3671F678];


GO
PRINT N'Dropping DF__Transacti__Date___37661AB1...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___37661AB1];


GO
PRINT N'Dropping DF__Eligibili__Date___385A3EEA...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___385A3EEA];


GO
PRINT N'Dropping DF__Eligibili__Date___394E6323...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___394E6323];


GO
PRINT N'Dropping DF__Player__Date_Tim__3A42875C...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__3A42875C];


GO
PRINT N'Dropping DF__Player__Date_Tim__3B36AB95...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__3B36AB95];


GO
PRINT N'Dropping DF__Position__Date_T__3C2ACFCE...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__3C2ACFCE];


GO
PRINT N'Dropping DF__Position__Date_T__3D1EF407...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__3D1EF407];


GO
PRINT N'Dropping DF__Stats_Dai__Date___3E131840...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___3E131840];


GO
PRINT N'Dropping DF__Stats_Dai__Date___3F073C79...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___3F073C79];


GO
PRINT N'Dropping DF__Stats_Pro__Date___3FFB60B2...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___3FFB60B2];


GO
PRINT N'Dropping DF__Stats_Pro__Date___40EF84EB...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___40EF84EB];


GO
PRINT N'Dropping DF__Stats_Sea__Date___41E3A924...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___41E3A924];


GO
PRINT N'Dropping DF__Stats_Sea__Date___42D7CD5D...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___42D7CD5D];


GO
PRINT N'Dropping DF__Team__Date_Time___43CBF196...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___43CBF196];


GO
PRINT N'Dropping DF__Team__Date_Time___44C015CF...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___44C015CF];


GO
PRINT N'Dropping DF__RosterPos__Date___45B43A08...';


GO
ALTER TABLE [SystemConfig].[RosterPositions] DROP CONSTRAINT [DF__RosterPos__Date___45B43A08];


GO
PRINT N'Dropping DF__RosterPos__Date___46A85E41...';


GO
ALTER TABLE [SystemConfig].[RosterPositions] DROP CONSTRAINT [DF__RosterPos__Date___46A85E41];


GO
PRINT N'Dropping DF__ScoringCa__Date___479C827A...';


GO
ALTER TABLE [SystemConfig].[ScoringCategories] DROP CONSTRAINT [DF__ScoringCa__Date___479C827A];


GO
PRINT N'Dropping DF__ScoringCa__Date___4890A6B3...';


GO
ALTER TABLE [SystemConfig].[ScoringCategories] DROP CONSTRAINT [DF__ScoringCa__Date___4890A6B3];


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
