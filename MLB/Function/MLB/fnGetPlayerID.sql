CREATE FUNCTION [MLB].[fnGetPlayerID]
(
	@PlayersLastName VARCHAR(50),
	@Team VARCHAR(3) = NULL
)
RETURNS INT
BEGIN
	IF (@Team IS NOT NULL) AND (@Team != '')
	BEGIN
		IF ((SELECT COUNT(*) FROM MLB.Player JOIN MLB.Team ON Player.TeamID = Team.TeamID
				WHERE LastName LIKE '%' + @PlayersLastName + '%'
			      AND Team.Abbreviation = @Team) > 1) 
		BEGIN
			RETURN NULL
		END
		ELSE 
			RETURN (SELECT Player.PlayerID FROM MLB.Player JOIN MLB.Team ON Player.TeamID = Team.TeamID 
						WHERE LastName LIKE '%' + @PlayersLastName + '%' AND Team.Abbreviation = @Team)
		END 
	ELSE
	BEGIN
		IF ((SELECT COUNT(*) FROM MLB.Player
				WHERE LastName LIKE '%' + @PlayersLastName + '%') > 1) 
		BEGIN
			RETURN NULL
		END
		ELSE 
			RETURN (SELECT Player.PlayerID FROM MLB.Player WHERE LastName LIKE '%' + @PlayersLastName + '%')
	END

	RETURN NULL
END;