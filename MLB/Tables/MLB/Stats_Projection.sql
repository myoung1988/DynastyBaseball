﻿CREATE TABLE [MLB].[Stats_Projection]
(
	[PlayerID] INT NOT NULL, 
	[SeasonID] INT NOT NULL  , 
	AB INT,
	R INT,
	H INT, 
	[1B] INT,
	[2B] INT,
	[3B] INT,
	HR INT,
	RBI INT,
	BB INT,
	KO INT,
	SB INT,
	CS INT, 
	BA DECIMAL (4, 3),
	OBP DECIMAL (4, 3),
	SLG DECIMAL (4, 3),
	INN  DECIMAL (4, 1),
	GS INT,
	QS INT, 
	CG INT, 
	W INT,
	L INT,
	S INT,
	BS INT,
	K INT,
	BBI INT,
	HA INT,
	ERA DECIMAL (6, 3),
	WHIP DECIMAL (4, 3),
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50),
    PRIMARY KEY ([SeasonID], [PlayerID])
)
