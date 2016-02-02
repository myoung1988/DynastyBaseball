CREATE TABLE [dbo].[Address]
(
	[AddressId] INT NOT NULL PRIMARY KEY, 
	[UserID] INT NOT NULL, 
	[Type] VARCHAR(4) NOT NULL,
    [Line1] VARCHAR(100) NOT NULL, 
    [Line2] VARCHAR(100) NULL, 
    [Line3] VARCHAR(100) NULL, 
    [ApartmentNumber] VARCHAR(50) NULL, 
    [City] VARCHAR(100) NOT NULL, 
    [State] VARCHAR(100) NOT NULL, 
    [ZipCode] VARCHAR(100) NOT NULL, 
    [Country] VARCHAR(100) NULL,
	[Date_Time_Created] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    [User_Id_Created] VARCHAR(50),
    [Date_Time_Modified] DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	[User_Id_Modified] VARCHAR(50),
    [Form_Id] VARCHAR(50)
)
