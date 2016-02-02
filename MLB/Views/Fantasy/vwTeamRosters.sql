CREATE VIEW [fantasy].[vwTeamRosters]
	AS SELECT Roster.FantasyLeagueID, 
		Team.Name,
		Roster.Status,
		Player.FirstName + ' ' + Player.LastName AS 'Player Name',
		RosterPositions.Abbreviation
FROM Fantasy.Roster JOIN Fantasy.Team ON Roster.FantasyTeamID = Team.FantasyTeamID AND Roster.FantasyLeagueID = Team.FantasyLeagueID
	 JOIN MLB.Player ON Roster.PlayerID = Player.PlayerID
	 JOIN MLB.Eligibility ON Player.PlayerID = Eligibility.PlayerID AND Eligibility.PrimaryPos = 1
	 JOIN SystemConfig.RosterPositions  ON  Eligibility.PositionID = RosterPositions.PositionID