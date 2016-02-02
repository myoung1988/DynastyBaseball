CREATE PROCEDURE [fantasy].[spCreateSchedule]
	@FantasyLeagueID INT,
	@SeasonID INT, 
	@Debug INT = 0
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
			@DateIncrement INT,
			@LeagueSeeasonStartDate DATE

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
			@SeasonEndDate = Season.EndDate,
			@LeagueSeeasonStartDate = SeasonStartDate
	FROM LeagueConfig.League_Schedule_Settings, SystemConfig.Season
	WHERE Season.SeasonID = @SeasonID
	  AND League_Schedule_Settings.FantasyLeagueID = @FantasyLeagueID 
	
	SET @DateIncrement = (@PeriodLength * 7) - 1;
	

	IF DATEDIFF(DAYOFYEAR, @SeasonStartDate, @LeagueSeeasonStartDate) < 2 OR @LeagueSeeasonStartDate < @SeasonStartDate
	BEGIN
		DECLARE @FirstSeasonIncrement INT = 
		CASE 
			WHEN @SeasonStartOffset = 0 AND @PeriodStartDay = 'S' THEN 0
			WHEN @SeasonStartOffset = 0 AND @PeriodStartDay = 'M' THEN 1
			WHEN @SeasonStartOffset = 1 AND @PeriodStartDay = 'S' THEN 2
			WHEN @SeasonStartOffset = 1 AND @PeriodStartDay = 'M' THEN 1
			ELSE 5
		END

		SET @CurrentPeriodStartDate = DATEADD(day, @SeasonStartOffset, @SeasonStartDate)
		SET @CurrentPeriodEndDate = DATEADD(day,  @DateIncrement + @FirstSeasonIncrement, @SeasonStartDate);
	
	END ELSE
	BEGIN 
		SET @CurrentPeriodStartDate = @LeagueSeeasonStartDate;
		SET @CurrentPeriodEndDate = DATEADD(day,  @DateIncrement, @LeagueSeeasonStartDate);
	END

	IF @Debug = 1
	BEGIN 
		SELECT @PeriodLength AS 'PeriodLength',
		    @PeriodStartDay AS 'PeriodStartDay',
			@SeasonStartOffset AS 'SeasonStartOffset',
			@PlayoffStartPeriodID AS 'PlayoffsStartPeriodID',
			@PlayoffLength AS 'PlayoffLength',
			@SeasonStartDate AS 'Season.StartDate',
			@SeasonEndDate  AS 'Season.EndDate',
			@DateIncrement AS 'DateIncrement',
			@FirstSeasonIncrement AS 'FirstIncrement',
			@CurrentPeriodStartDate AS 'CurrentPeriod.StartDate',
			@CurrentPeriodEndDate AS 'CurrentPeriod.EndDate'
	END


	DECLARE @ExitPlayoffs INT = 0
	WHILE (@CurrentPeriodEndDate <= @SeasonEndDate) AND (@ExitPlayoffs = 0)
	BEGIN
		
		IF @CurrentPeriodID >= @PlayoffStartPeriodID
			SET @CurrentPeriodPlayoffs = 1

		IF (SELECT COUNT(*) FROM #TmpSchedule WHERE Playoffs = 1) >= @PlayoffLength
			SET @ExitPlayoffs = 1
		ELSE
		BEGIN
			INSERT INTO #TmpSchedule (PeriodID, StartDate, EndDate, Playoffs) 
				VALUES (@CurrentPeriodID, @CurrentPeriodStartDate, @CurrentPeriodEndDate, @CurrentPeriodPlayoffs)
		
			SET @CurrentPeriodStartDate = DATEADD(day, 1, @CurrentPeriodEndDate);
			SET @CurrentPeriodEndDate = DATEADD(day, @DateIncrement, @CurrentPeriodStartDate);
			SET @CurrentPeriodID = @CurrentPeriodID + 1;
		END

	END

	IF @Debug = 1
	BEGIN
		SELECT 'After: ', * FROM #TmpSchedule
		ROLLBACK
	END ELSE
	BEGIN
		INSERT INTO Fantasy.Schedule
		SELECT @FantasyLeagueID,
				PeriodID,
				@SeasonID,
				StartDate,
				EndDate, 
				Playoffs
		FROM #TmpSchedule

		COMMIT
	END

END TRY
BEGIN CATCH
	ROLLBACK
	SELECT ERROR_NUMBER(), ERROR_MESSAGE()
END CATCH

END

