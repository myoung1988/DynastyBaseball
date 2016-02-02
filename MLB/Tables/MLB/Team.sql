CREATE TABLE [MLB].[Team]
(
	[TeamID] INT           NOT NULL,
    [City]   VARCHAR (100) NULL,
    [State]  VARCHAR (2)   NULL,
	[Abbreviation] VARCHAR(3) NOT NULL,
    [Name]   VARCHAR (100) NOT NULL,
    [Status] BIT           DEFAULT ((1)) NULL,
    [League] VARCHAR (3)   DEFAULT ('MLB') NOT NULL,
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50),
	PRIMARY KEY CLUSTERED ([TeamID] ASC)
)
