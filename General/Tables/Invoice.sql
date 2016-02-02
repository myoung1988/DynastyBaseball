CREATE TABLE [dbo].[Invoice]
(
	[InvoiceID] INT NOT NULL PRIMARY KEY, 
    [UserID] INT NOT NULL,
	[Receipt_Date] DATE NOT NULL,
    [Amount] DECIMAL (18, 2) NOT NULL,
    [Record_Status] VARCHAR(1) NOT NULL DEFAULT 'A',
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id] VARCHAR(50)
)
