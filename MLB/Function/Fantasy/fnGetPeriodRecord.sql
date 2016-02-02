CREATE FUNCTION [Fantasy].[fnGetPeriodRecord]
(
	@FantasyLeagueID int,
	@PeriodID int,
	@SeasonID int,
	@HomeTeamID int,
	@AwayTeamID int	
)
RETURNS @returntable TABLE
(
	c1 int,
	c2 char(5)
)
AS
BEGIN
	INSERT @returntable
	SELECT @FantasyLeagueID, @PeriodID
	RETURN
END
