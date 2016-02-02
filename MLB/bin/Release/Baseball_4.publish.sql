﻿/*
Deployment script for Baseball

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Baseball"
:setvar DefaultFilePrefix "Baseball"
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
-- disable referential integrity
EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL' 
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

-- Drop All Tables
sp_msforeachtable 'drop table ?'
GO

GO
PRINT N'Dropping DF__League__Date_Tim__29221CFB...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__29221CFB];


GO
PRINT N'Dropping DF__League__Date_Tim__2A164134...';


GO
ALTER TABLE [Fantasy].[League] DROP CONSTRAINT [DF__League__Date_Tim__2A164134];


GO
PRINT N'Dropping DF__Roster__Date_Tim__2BFE89A6...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__2BFE89A6];


GO
PRINT N'Dropping DF__Roster__Date_Tim__2CF2ADDF...';


GO
ALTER TABLE [Fantasy].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__2CF2ADDF];


GO
PRINT N'Dropping DF__Team__Date_Time___2DE6D218...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___2DE6D218];


GO
PRINT N'Dropping DF__Team__Date_Time___2EDAF651...';


GO
ALTER TABLE [Fantasy].[Team] DROP CONSTRAINT [DF__Team__Date_Time___2EDAF651];


GO
PRINT N'Dropping DF__Config__Date_Tim__2FCF1A8A...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__2FCF1A8A];


GO
PRINT N'Dropping DF__Config__Date_Tim__30C33EC3...';


GO
ALTER TABLE [LeagueConfig].[Config] DROP CONSTRAINT [DF__Config__Date_Tim__30C33EC3];


GO
PRINT N'Dropping DF__Scoring_S__Date___3587F3E0...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___3587F3E0];


GO
PRINT N'Dropping DF__Scoring_S__Date___367C1819...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category] DROP CONSTRAINT [DF__Scoring_S__Date___367C1819];


GO
PRINT N'Dropping DF__Scoring_S__Date___37703C52...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___37703C52];


GO
PRINT N'Dropping DF__Scoring_S__Date___3864608B...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses] DROP CONSTRAINT [DF__Scoring_S__Date___3864608B];


GO
PRINT N'Dropping DF__Scoring_S__Date___395884C4...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___395884C4];


GO
PRINT N'Dropping DF__Scoring_S__Date___3A4CA8FD...';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange] DROP CONSTRAINT [DF__Scoring_S__Date___3A4CA8FD];


GO
PRINT N'Dropping DF__Transacti__Date___44CA3770...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___44CA3770];


GO
PRINT N'Dropping DF__Transacti__Date___45BE5BA9...';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies] DROP CONSTRAINT [DF__Transacti__Date___45BE5BA9];


GO
PRINT N'Dropping DF__Eligibili__Date___498EEC8D...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___498EEC8D];


GO
PRINT N'Dropping DF__Eligibili__Date___4A8310C6...';


GO
ALTER TABLE [MLB].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___4A8310C6];


GO
PRINT N'Dropping DF__Player__Date_Tim__4C6B5938...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__4C6B5938];


GO
PRINT N'Dropping DF__Player__Date_Tim__4D5F7D71...';


GO
ALTER TABLE [MLB].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__4D5F7D71];


GO
PRINT N'Dropping DF__Position__Date_T__4E53A1AA...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__4E53A1AA];


GO
PRINT N'Dropping DF__Position__Date_T__4F47C5E3...';


GO
ALTER TABLE [MLB].[Position] DROP CONSTRAINT [DF__Position__Date_T__4F47C5E3];


GO
PRINT N'Dropping DF__Stats_Dai__Date___51300E55...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___51300E55];


GO
PRINT N'Dropping DF__Stats_Dai__Date___5224328E...';


GO
ALTER TABLE [MLB].[Stats_Daily] DROP CONSTRAINT [DF__Stats_Dai__Date___5224328E];


GO
PRINT N'Dropping DF__Stats_Pro__Date___540C7B00...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___540C7B00];


GO
PRINT N'Dropping DF__Stats_Pro__Date___55009F39...';


GO
ALTER TABLE [MLB].[Stats_Projection] DROP CONSTRAINT [DF__Stats_Pro__Date___55009F39];


GO
PRINT N'Dropping DF__Stats_Sea__Date___56E8E7AB...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___56E8E7AB];


GO
PRINT N'Dropping DF__Stats_Sea__Date___57DD0BE4...';


GO
ALTER TABLE [MLB].[Stats_Season] DROP CONSTRAINT [DF__Stats_Sea__Date___57DD0BE4];


GO
PRINT N'Dropping DF__Team__Date_Time___5AB9788F...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___5AB9788F];


GO
PRINT N'Dropping DF__Team__Date_Time___5BAD9CC8...';


GO
ALTER TABLE [MLB].[Team] DROP CONSTRAINT [DF__Team__Date_Time___5BAD9CC8];


GO
PRINT N'Creating Default Constraint on [Fantasy].[League]....';


GO
ALTER TABLE [Fantasy].[League]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [Fantasy].[League]....';


GO
ALTER TABLE [Fantasy].[League]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Roster]....';


GO
ALTER TABLE [Fantasy].[Roster]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Roster]....';


GO
ALTER TABLE [Fantasy].[Roster]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Team]....';


GO
ALTER TABLE [Fantasy].[Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [Fantasy].[Team]....';


GO
ALTER TABLE [Fantasy].[Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Config]....';


GO
ALTER TABLE [LeagueConfig].[Config]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Config]....';


GO
ALTER TABLE [LeagueConfig].[Config]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category_PointBonuses]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category_PointBonuses]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointBonuses]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category_PointRange]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Scoring_System_Category_PointRange]....';


GO
ALTER TABLE [LeagueConfig].[Scoring_System_Category_PointRange]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Transaction_Policies]....';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [LeagueConfig].[Transaction_Policies]....';


GO
ALTER TABLE [LeagueConfig].[Transaction_Policies]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Eligibility]....';


GO
ALTER TABLE [MLB].[Eligibility]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Eligibility]....';


GO
ALTER TABLE [MLB].[Eligibility]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Player]....';


GO
ALTER TABLE [MLB].[Player]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Player]....';


GO
ALTER TABLE [MLB].[Player]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Position]....';


GO
ALTER TABLE [MLB].[Position]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Position]....';


GO
ALTER TABLE [MLB].[Position]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Daily]....';


GO
ALTER TABLE [MLB].[Stats_Daily]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Daily]....';


GO
ALTER TABLE [MLB].[Stats_Daily]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Projection]....';


GO
ALTER TABLE [MLB].[Stats_Projection]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Projection]....';


GO
ALTER TABLE [MLB].[Stats_Projection]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Season]....';


GO
ALTER TABLE [MLB].[Stats_Season]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Stats_Season]....';


GO
ALTER TABLE [MLB].[Stats_Season]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [MLB].[Team]....';


GO
ALTER TABLE [MLB].[Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [MLB].[Team]....';


GO
ALTER TABLE [MLB].[Team]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO


EXEC sp_MSForEachTable 'DELETE FROM ?' 
GO

-- Teams
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (1, 'ARI', 'Diamondbacks')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (2, 'ATL', 'Braves')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (3, 'BAL', 'Orioles')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (4, 'BOS', 'Red Sox')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (5, 'CHC', 'Cubs')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (6, 'CHW', 'White Sox')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (7, 'CIN', 'Reds')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (8, 'CLE', 'Indians')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (9, 'COL', 'Rockies')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (10, 'DET', 'Tigers')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (11, 'HOU', 'Astros')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (12, 'KC', 'Royals')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (13, 'LAA', 'Angels')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (14, 'LAD', 'Dodgers')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (15, 'MIA', 'Marlins')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (16, 'MIL', 'Brewers')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (17, 'MIN', 'Twins')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (18, 'NYM', 'Mets')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (19, 'NYY', 'Yankees')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (20, 'OAK', 'As')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (21, 'PHI', 'Phillies')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (22, 'PIT', 'Pirates')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (23, 'SD', 'Padres')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (24, 'SEA', 'Mariners')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (25, 'SF', 'Giants')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (26, 'STL', 'Cardinals')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (27, 'TB', 'Rays')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (28, 'TEX', 'Rangers')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (29, 'TOR', 'Blue Jays')
INSERT INTO MLB.Team (TeamID, Abbreviation, Name) VALUES (30, 'WAS', 'Nationals')

-- Positions
INSERT INTO MLB.Position (PositionID, Name) VALUES (1, 'C')
INSERT INTO MLB.Position (PositionID, Name) VALUES (2, '1B')
INSERT INTO MLB.Position (PositionID, Name) VALUES (3, '2B')
INSERT INTO MLB.Position (PositionID, Name) VALUES (4, '3B')
INSERT INTO MLB.Position (PositionID, Name) VALUES (5, 'SS')
INSERT INTO MLB.Position (PositionID, Name) VALUES (6, 'OF')
INSERT INTO MLB.Position (PositionID, Name) VALUES (7, 'SP')
INSERT INTO MLB.Position (PositionID, Name) VALUES (8, 'RP')

-- Players
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (1, 'Buster', 'Posey', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (2, 'Freddie', 'Freeman', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (3, 'Kolten', 'Wong', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (4, 'Josh', 'Donaldson', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (5, 'Corey', 'Seager', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (6, 'Mookie', 'Betts', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (7, 'George', 'Springer', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (8, 'Justin', 'Upton', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (9, 'Adrian', 'Gonzalez', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (10, 'Anthony', 'Rendon', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (11, 'Kyle', 'Seager', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (12, 'Addison', 'Russell', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (13, 'Corey', 'Dickerson', 'R', 'R', '1', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (14, 'Jurickson', 'Profar', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (15, 'Jorge', 'Alfaro', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (16, 'Franklin', 'Barreto', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (17, 'Trevor', 'Story', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (18, 'Lewis', 'Brinson', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (19, 'Byron', 'Buxton', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (20, 'Alex', 'Jackson', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (21, 'Carlos', 'Carrasco', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (22, 'Tyson', 'Ross', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (23, 'Danny', 'Salazar', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (24, 'Luis', 'Severino', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (25, 'Jordan', 'Zimmermann', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (26, 'Jacob', 'deGrom', 'R', 'R', '2', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (27, 'Zach', 'Britton', 'R', 'R', '3', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (28, 'Jeurys', 'Familia', 'R', 'R', '3', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (29, 'Huston', 'Street', 'R', 'R', '3', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (30, 'Yu', 'Darvish', 'R', 'R', '3', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (31, 'Nathan', 'Karns', 'R', 'R', '3', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (32, 'Carlos', 'Rodon', 'R', 'R', '3', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (33, 'Hector', 'Santiago', 'R', 'R', '3', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (34, 'Yordano', 'Ventura', 'R', 'R', '3', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (35, 'Homer', 'Bailey', 'R', 'R', '3', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (36, 'Michael', 'Fulmer', 'R', 'R', '3', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (37, 'Robert', 'Stephenson', 'R', 'R', '4', GETDATE())
INSERT INTO MLB.Player (PlayerID, FirstName, LastName, Bats, Throws, TeamID, Birthdate) VALUES (38, 'Jose', 'De Leon', 'R', 'R', '4', GETDATE())

-- MLB.Eligibility 
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (1, 1)
INSERT INTO MLB.Eligibility (PlayerID, PositionID, PrimaryPos, DaysPlayed) VALUES (1, 2, 0, 25)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (2, 2)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (3, 3)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (4, 4)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (5, 5)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (6, 6)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (7, 6)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (8, 6)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (9, 2)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (10, 4)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (11, 4)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (12, 5)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (13, 6)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (14, 3)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (15, 1)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (16, 5)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (17, 5)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (18, 6)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (19, 6)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (20, 6)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (21, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (22, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (23, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (24, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (25, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (26, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (27, 8)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (28, 8)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (29, 8)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (30, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (31, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (32, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (33, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (34, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (35, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (36, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (37, 7)
INSERT INTO MLB.Eligibility (PlayerID, PositionID) VALUES (38, 7)

-- Fantasy Leagues
INSERT INTO Fantasy.League (FantasyLeagueID, Name, OwnerID) VALUES (1, 'The Fall Classic', 1)
INSERT INTO Fantasy.League (FantasyLeagueID, Name, OwnerID) VALUES (2, 'Chicagos Best', 2)

-- Fantasy Teams
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 1, 'Busten in her Posey', 'BUS')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 2, 'Polish Powerhouse', 'POL')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 3, 'Crazy Crackers', 'CRA')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 4, 'Hannibal Lester', 'HAN')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 5, 'Rachet Hoes', 'RAC')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 6, 'Dutch Oven', 'DUT')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 7, 'Head First', 'HEA')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 8, 'Sports Machine', 'SPO')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 9, 'Sons of Pitches', 'SON')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (1, 10, 'TasteMyBabyGravy', 'TAS')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 1, 'Trouts R Us', 'TRO')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 2, 'The Dutch Oven', 'THE')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 3, 'Ball Bangerz! Win or Die', 'BAL')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 4, 'Tanaka Time', 'TAN')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 5, 'Lost Productivity', 'LOS')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 6, 'Fo Shizzo my Rizzo', 'FO ')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 7, 'Joliet Oles', 'JOL')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 8, 'La Flama Blanca', 'LA ')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 9, 'Alcides Nuts', 'ALC')
INSERT INTO Fantasy.Team (FantasyLeagueID, FantasyTeamID, Name, Abbreviation) VALUES (2, 10, 'Team Boner', 'TEA')

-- Fantasy Rosters
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 1)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 2)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 3)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 4)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 5)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 6)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 7)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 8)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 9)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 10)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 11)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 12)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 13)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 14)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 15)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 16)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 17)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 18)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 19)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 20)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 21)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 22)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 23)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 24)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 25)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 26)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 27)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 28)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 29)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 30)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 31)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 32)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 33)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 34)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 35)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 36)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 37)
INSERT INTO Fantasy.Roster (FantasyLeagueID, FantasyTeamID, PlayerID) VALUES (1, 1, 38)


-- enable referential integrity again 
EXEC sp_MSForEachTable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL' 
GO

GO
PRINT N'Update complete.';


GO