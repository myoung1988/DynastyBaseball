CREATE TABLE [MLB].[Eligibility]
(
	[PlayerID] INT NOT NULL, 
	[SeasonID] INT NOT NULL ,
    [PositionID] INT NOT NULL, 
	[PrimaryPos] BIT NOT NULL DEFAULT 1,
	[DaysPlayed] INT NOT NULL DEFAULT 0,
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50),
	PRIMARY KEY CLUSTERED ([PlayerID], [SeasonID], [PositionID] ),
    CONSTRAINT [FK_Eligilblity_Posiition] FOREIGN KEY (PositionID) REFERENCES MLB.Position(PositionID) ON DELETE CASCADE
)
