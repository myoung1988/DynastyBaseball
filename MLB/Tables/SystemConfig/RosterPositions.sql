CREATE TABLE [SystemConfig].[RosterPositions]
(
	[PositionID] INT NOT NULL PRIMARY KEY, 
    [CategoryType] VARCHAR NOT NULL DEFAULT 'B', 
    [Abbreviation] VARCHAR(10) NOT NULL, 
    [Description] VARCHAR(50) NOT NULL,
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50)
)
