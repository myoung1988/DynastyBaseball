CREATE TABLE [dbo].[User]
(
	[UserID] INT NOT NULL PRIMARY KEY, 
    [UserName] VARCHAR(MAX) NOT NULL, 
    [FirstName] VARCHAR(MAX) NOT NULL, 
    [LastName] VARCHAR(MAX) NOT NULL, 
    [EmailAddress] VARCHAR(MAX) NOT NULL, 
    [ReceiveNewsletter] BIT NULL DEFAULT 0,
	[Record_Status] BIT NOT NULL DEFAULT 1,
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id] VARCHAR(50)
)
