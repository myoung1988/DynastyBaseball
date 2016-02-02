CREATE TABLE [SystemConfig].[Season]
(
	[SeasonID] INT NOT NULL PRIMARY KEY, 
    [Year] VARCHAR(4) NOT NULL, 
    [StartDate] DATE NOT NULL DEFAULT GETDATE(), 
    [EndDate] DATE NOT NULL DEFAULT GETDATE(), 
    [CurrentSeason] BIT NOT NULL DEFAULT 0 
)
