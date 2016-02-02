﻿/*
Deployment script for MLB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "MLB"
:setvar DefaultFilePrefix "MLB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

SET NOCOUNT ON
 DECLARE @table TABLE(
RowId INT PRIMARY KEY IDENTITY(1, 1),
ForeignKeyConstraintName NVARCHAR(200),
ForeignKeyConstraintTableSchema NVARCHAR(200),
ForeignKeyConstraintTableName NVARCHAR(200),
ForeignKeyConstraintColumnName NVARCHAR(200),
PrimaryKeyConstraintName NVARCHAR(200),
PrimaryKeyConstraintTableSchema NVARCHAR(200),
PrimaryKeyConstraintTableName NVARCHAR(200),
PrimaryKeyConstraintColumnName NVARCHAR(200)
 )
INSERT INTO @table(ForeignKeyConstraintName, ForeignKeyConstraintTableSchema, ForeignKeyConstraintTableName, ForeignKeyConstraintColumnName)
SELECT
U.CONSTRAINT_NAME,
U.TABLE_SCHEMA,
U.TABLE_NAME,
U.COLUMN_NAME
FROM
INFORMATION_SCHEMA.KEY_COLUMN_USAGE U
INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS C
ON U.CONSTRAINT_NAME = C.CONSTRAINT_NAME
WHERE
C.CONSTRAINT_TYPE = 'FOREIGN KEY'
UPDATE @table SET
PrimaryKeyConstraintName = UNIQUE_CONSTRAINT_NAME
FROM
@table T
INNER JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS R
ON T.ForeignKeyConstraintName = R.CONSTRAINT_NAME
UPDATE @table SET
PrimaryKeyConstraintTableSchema = TABLE_SCHEMA,
PrimaryKeyConstraintTableName = TABLE_NAME
FROM @table T
INNER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS C
ON T.PrimaryKeyConstraintName = C.CONSTRAINT_NAME
UPDATE @table SET
PrimaryKeyConstraintColumnName = COLUMN_NAME
FROM @table T
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE U
ON T.PrimaryKeyConstraintName = U.CONSTRAINT_NAME
--SELECT * FROM @table
 --DROP CONSTRAINT:
SELECT
'
 ALTER TABLE [' + ForeignKeyConstraintTableSchema + '].[' + ForeignKeyConstraintTableName + ']
 DROP CONSTRAINT ' + ForeignKeyConstraintName + '

GO'
FROM
@table
--ADD CONSTRAINT:
SELECT
'
ALTER TABLE [' + ForeignKeyConstraintTableSchema + '].[' + ForeignKeyConstraintTableName + ']
ADD CONSTRAINT ' + ForeignKeyConstraintName + ' FOREIGN KEY(' + ForeignKeyConstraintColumnName + ') REFERENCES [' + PrimaryKeyConstraintTableSchema + '].[' + PrimaryKeyConstraintTableName + '](' + PrimaryKeyConstraintColumnName + ')

GO'
FROM
@table
GO

GO

GO
PRINT N'Rename refactoring operation with key a104cb65-9385-4dc2-b57e-f64232724378 is skipped, element [dbo].[Eligibility].[Primary] (SqlSimpleColumn) will not be renamed to PrimaryPos';


GO
PRINT N'Rename refactoring operation with key 33434006-ebab-4d43-9820-2d7784c34963 is skipped, element [dbo].[Roster].[TeamID] (SqlSimpleColumn) will not be renamed to FantasyTeamID';


GO
PRINT N'Rename refactoring operation with key c1b11c15-f53d-4339-9f12-ccf380974894 is skipped, element [dbo].[Roster].[FatnasyLeagueID] (SqlSimpleColumn) will not be renamed to FantasyLeagueID';


GO
PRINT N'Rename refactoring operation with key 6bc79645-936b-424c-bfc5-36863d03cd30 is skipped, element [dbo].[Player].[Team] (SqlSimpleColumn) will not be renamed to TeamID';


GO
PRINT N'Rename refactoring operation with key 7461fb3d-604b-45e3-8cef-066c8faa296b is skipped, element [dbo].[Fantasy_League].[League_Entry_Fee] (SqlSimpleColumn) will not be renamed to LeagueEntryFee';


GO
PRINT N'Rename refactoring operation with key 5947b25a-cb72-425c-9acb-3bdb452c414d is skipped, element [dbo].[Fantasy_Team].[Id] (SqlSimpleColumn) will not be renamed to FantasyTeamID';


GO
PRINT N'Rename refactoring operation with key de64296c-195f-4ddb-ba0b-d935aa3ef404 is skipped, element [dbo].[Status_CK] (SqlCheckConstraint) will not be renamed to [Fantasy_Roster_Status_CK]';


GO
PRINT N'Rename refactoring operation with key ec8960c5-6719-4e6a-a994-15a668ecdd35 is skipped, element [dbo].[Stats].[Id] (SqlSimpleColumn) will not be renamed to Day';


GO
PRINT N'Dropping DF__Stats_Dai__Date___00DF2177...';


GO
ALTER TABLE [dbo].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___00DF2177];


GO
PRINT N'Dropping DF__Stats_Dai__Date___01D345B0...';


GO
ALTER TABLE [dbo].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___01D345B0];


GO
PRINT N'Creating Default Constraint on [dbo].[Eligibility]....';


GO
ALTER TABLE [dbo].[Eligibility]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Eligibility]....';


GO
ALTER TABLE [dbo].[Eligibility]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Fantasy_League]....';


GO
ALTER TABLE [dbo].[Fantasy_League]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Fantasy_League]....';


GO
ALTER TABLE [dbo].[Fantasy_League]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Fantasy_Roster]....';


GO
ALTER TABLE [dbo].[Fantasy_Roster]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Fantasy_Roster]....';


GO
ALTER TABLE [dbo].[Fantasy_Roster]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Fantasy_Team]....';


GO
ALTER TABLE [dbo].[Fantasy_Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Fantasy_Team]....';


GO
ALTER TABLE [dbo].[Fantasy_Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Player]....';


GO
ALTER TABLE [dbo].[Player]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Player]....';


GO
ALTER TABLE [dbo].[Player]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Position]....';


GO
ALTER TABLE [dbo].[Position]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Position]....';


GO
ALTER TABLE [dbo].[Position]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Stats_Daily]....';


GO
ALTER TABLE [dbo].[Stats_Daily]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Stats_Daily]....';


GO
ALTER TABLE [dbo].[Stats_Daily]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Stats_Projection]....';


GO
ALTER TABLE [dbo].[Stats_Projection]
    ADD DEFAULT GETDATE() FOR [Day];


GO
PRINT N'Creating Default Constraint on [dbo].[Stats_Projection]....';


GO
ALTER TABLE [dbo].[Stats_Projection]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Stats_Projection]....';


GO
ALTER TABLE [dbo].[Stats_Projection]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Stats_Season]....';


GO
ALTER TABLE [dbo].[Stats_Season]
    ADD DEFAULT GETDATE() FOR [Day];


GO
PRINT N'Creating Default Constraint on [dbo].[Stats_Season]....';


GO
ALTER TABLE [dbo].[Stats_Season]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Stats_Season]....';


GO
ALTER TABLE [dbo].[Stats_Season]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Team]....';


GO
ALTER TABLE [dbo].[Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Team]....';


GO
ALTER TABLE [dbo].[Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a104cb65-9385-4dc2-b57e-f64232724378')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a104cb65-9385-4dc2-b57e-f64232724378')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '33434006-ebab-4d43-9820-2d7784c34963')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('33434006-ebab-4d43-9820-2d7784c34963')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c1b11c15-f53d-4339-9f12-ccf380974894')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c1b11c15-f53d-4339-9f12-ccf380974894')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6bc79645-936b-424c-bfc5-36863d03cd30')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6bc79645-936b-424c-bfc5-36863d03cd30')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7461fb3d-604b-45e3-8cef-066c8faa296b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7461fb3d-604b-45e3-8cef-066c8faa296b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5947b25a-cb72-425c-9acb-3bdb452c414d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5947b25a-cb72-425c-9acb-3bdb452c414d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'de64296c-195f-4ddb-ba0b-d935aa3ef404')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('de64296c-195f-4ddb-ba0b-d935aa3ef404')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ec8960c5-6719-4e6a-a994-15a668ecdd35')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ec8960c5-6719-4e6a-a994-15a668ecdd35')

GO

GO
-- disable referential integrity
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL' 
GO

EXEC sp_MSForEachTable 'DELETE FROM ?' 
GO

-- Teams
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (1, 'ARI', 'Diamondbacks')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (2, 'ATL', 'Braves')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (3, 'BAL', 'Orioles')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (4, 'BOS', 'Red Sox')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (5, 'CHC', 'Cubs')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (6, 'CHW', 'White Sox')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (7, 'CIN', 'Reds')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (8, 'CLE', 'Indians')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (9, 'COL', 'Rockies')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (10, 'DET', 'Tigers')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (11, 'HOU', 'Astros')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (12, 'KC', 'Royals')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (13, 'LAA', 'Angels')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (14, 'LAD', 'Dodgers')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (15, 'MIA', 'Marlins')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (16, 'MIL', 'Brewers')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (17, 'MIN', 'Twins')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (18, 'NYM', 'Mets')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (19, 'NYY', 'Yankees')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (20, 'OAK', 'As')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (21, 'PHI', 'Phillies')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (22, 'PIT', 'Pirates')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (23, 'SD', 'Padres')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (24, 'SEA', 'Mariners')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (25, 'SF', 'Giants')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (26, 'STL', 'Cardinals')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (27, 'TB', 'Rays')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (28, 'TEX', 'Rangers')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (29, 'TOR', 'Blue Jays')
INSERT INTO Team (TeamID, Abbreviation, Name) VALUES (30, 'WAS', 'Nationals')

-- Positions
INSERT INTO Position (PositionID, Name) VALUES (1, 'C')
INSERT INTO Position (PositionID, Name) VALUES (2, '1B')
INSERT INTO Position (PositionID, Name) VALUES (3, '2B')
INSERT INTO Position (PositionID, Name) VALUES (4, '3B')
INSERT INTO Position (PositionID, Name) VALUES (5, 'SS')
INSERT INTO Position (PositionID, Name) VALUES (6, 'OF')
INSERT INTO Position (PositionID, Name) VALUES (7, 'SP')
INSERT INTO Position (PositionID, Name) VALUES (8, 'RP')

-- Players
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (1, 'Buster', 'Posey', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (2, 'Freddie', 'Freeman', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (3, 'Kolten', 'Wong', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (4, 'Josh', 'Donaldson', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (5, 'Corey', 'Seager', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (6, 'Mookie', 'Betts', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (7, 'George', 'Springer', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (8, 'Justin', 'Upton', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (9, 'Adrian', 'Gonzalez', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (10, 'Anthony', 'Rendon', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (11, 'Kyle', 'Seager', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (12, 'Addison', 'Russell', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (13, 'Corey', 'Dickerson', 'R', 'R', '1', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (14, 'Jurickson', 'Profar', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (15, 'Jorge', 'Alfaro', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (16, 'Franklin', 'Barreto', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (17, 'Trevor', 'Story', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (18, 'Lewis', 'Brinson', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (19, 'Byron', 'Buxton', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (20, 'Alex', 'Jackson', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (21, 'Carlos', 'Carrasco', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (22, 'Tyson', 'Ross', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (23, 'Danny', 'Salazar', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (24, 'Luis', 'Severino', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (25, 'Jordan', 'Zimmermann', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (26, 'Jacob', 'deGrom', 'R', 'R', '2', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (27, 'Zach', 'Britton', 'R', 'R', '3', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (28, 'Jeurys', 'Familia', 'R', 'R', '3', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (29, 'Huston', 'Street', 'R', 'R', '3', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (30, 'Yu', 'Darvish', 'R', 'R', '3', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (31, 'Nathan', 'Karns', 'R', 'R', '3', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (32, 'Carlos', 'Rodon', 'R', 'R', '3', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (33, 'Hector', 'Santiago', 'R', 'R', '3', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (34, 'Yordano', 'Ventura', 'R', 'R', '3', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (35, 'Homer', 'Bailey', 'R', 'R', '3', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (36, 'Michael', 'Fulmer', 'R', 'R', '3', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (37, 'Robert', 'Stephenson', 'R', 'R', '4', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (38, 'Jose', 'De Leon', 'R', 'R', '4', GETDATE())

-- Eligibility 
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (1, 1)
INSERT INTO Eligibility (PlayerID, PositionID, PrimaryPos, DaysPlayed) VALUES (1, 2, 0, 25)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (2, 2)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (3, 3)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (4, 4)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (5, 5)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (6, 6)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (7, 6)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (8, 6)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (9, 2)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (10, 4)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (11, 4)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (12, 5)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (13, 6)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (14, 3)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (15, 1)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (16, 5)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (17, 5)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (18, 6)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (19, 6)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (20, 6)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (21, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (22, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (23, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (24, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (25, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (26, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (27, 8)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (28, 8)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (29, 8)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (30, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (31, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (32, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (33, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (34, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (35, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (36, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (37, 7)
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (38, 7)

-- Fantasy Leagues
INSERT INTO Fantasy_League (FantasyLeagueID, Name, OwnerID) VALUES (1, 'The Fall Classic', 1)
INSERT INTO Fantasy_League (FantasyLeagueID, Name, OwnerID) VALUES (2, 'Chicagos Best', 2)

-- Fantasy Teams
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 1, 'Busten in her Posey', 'BUS')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 2, 'Polish Powerhouse', 'POL')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 3, 'Crazy Crackers', 'CRA')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 4, 'Hannibal Lester', 'HAN')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 5, 'Rachet Hoes', 'RAC')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 6, 'Dutch Oven', 'DUT')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 7, 'Head First', 'HEA')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 8, 'Sports Machine', 'SPO')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 9, 'Sons of Pitches', 'SON')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 10, 'TasteMyBabyGravy', 'TAS')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 1, 'Trouts R Us', 'TRO')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 2, 'The Dutch Oven', 'THE')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 3, 'Ball Bangerz! Win or Die', 'BAL')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 4, 'Tanaka Time', 'TAN')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 5, 'Lost Productivity', 'LOS')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 6, 'Fo Shizzo my Rizzo', 'FO ')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 7, 'Joliet Oles', 'JOL')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 8, 'La Flama Blanca', 'LA ')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 9, 'Alcides Nuts', 'ALC')
INSERT INTO Fantasy_Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 10, 'Team Boner', 'TEA')

-- Fantasy Rosters
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 1)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 2)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 3)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 4)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 5)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 6)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 7)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 8)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 9)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 10)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 11)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 12)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 13)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 14)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 15)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 16)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 17)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 18)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 19)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 20)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 21)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 22)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 23)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 24)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 25)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 26)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 27)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 28)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 29)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 30)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 31)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 32)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 33)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 34)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 35)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 36)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 37)
INSERT INTO Fantasy_Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 38)


-- enable referential integrity again 
EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL' 
GO

GO
PRINT N'Update complete.';


GO
