CREATE TABLE [MLB].[Player]
(
	[PlayerID] INT NOT NULL PRIMARY KEY,
	[FirstName] VARCHAR(100) NOT NULL,
	[LastName] VARCHAR(100) NOT NULL,
	[Bats] VARCHAR (1) NOT NULL,
	[Throws] VARCHAR (1) NOT NULL,
	[TeamID] INT   NOT NULL ,
	[Birthdate] DATE NOT NULL DEFAULT GETDATE(),
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id_Modified] VARCHAR(50)
)
