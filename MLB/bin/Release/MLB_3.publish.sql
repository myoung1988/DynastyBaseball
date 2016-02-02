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
PRINT N'Dropping DF__Eligibili__Date___300424B4...';


GO
ALTER TABLE [dbo].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___300424B4];


GO
PRINT N'Dropping DF__Eligibili__Date___30F848ED...';


GO
ALTER TABLE [dbo].[Eligibility] DROP CONSTRAINT [DF__Eligibili__Date___30F848ED];


GO
PRINT N'Dropping DF__Player__Date_Tim__31EC6D26...';


GO
ALTER TABLE [dbo].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__31EC6D26];


GO
PRINT N'Dropping DF__Player__Date_Tim__32E0915F...';


GO
ALTER TABLE [dbo].[Player] DROP CONSTRAINT [DF__Player__Date_Tim__32E0915F];


GO
PRINT N'Dropping DF__Position__Date_T__33D4B598...';


GO
ALTER TABLE [dbo].[Position] DROP CONSTRAINT [DF__Position__Date_T__33D4B598];


GO
PRINT N'Dropping DF__Position__Date_T__34C8D9D1...';


GO
ALTER TABLE [dbo].[Position] DROP CONSTRAINT [DF__Position__Date_T__34C8D9D1];


GO
PRINT N'Dropping DF__Roster__Date_Tim__35BCFE0A...';


GO
ALTER TABLE [dbo].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__35BCFE0A];


GO
PRINT N'Dropping DF__Roster__Date_Tim__36B12243...';


GO
ALTER TABLE [dbo].[Roster] DROP CONSTRAINT [DF__Roster__Date_Tim__36B12243];


GO
PRINT N'Starting rebuilding table [dbo].[Eligibility]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Eligibility] (
    [PlayerID]           INT          NOT NULL,
    [PositionID]         INT          NOT NULL,
    [Primary]            BIT          DEFAULT 1 NOT NULL,
    [DaysPlayed]         INT          DEFAULT 0 NOT NULL,
    [Season]             DATE         DEFAULT GETDATE() NOT NULL,
    [Date_Time_Created]  DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    [User_Id_Created]    VARCHAR (50) NULL,
    [Date_Time_Modified] DATETIME     DEFAULT CURRENT_TIMESTAMP NOT NULL,
    [User_Id_Modified]   VARCHAR (50) NULL,
    [Form_Id]            VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([PlayerID] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Eligibility])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Eligibility] ([PlayerID], [PositionID], [Date_Time_Created], [User_Id_Created], [Date_Time_Modified], [User_Id_Modified], [Form_Id])
        SELECT   [PlayerID],
                 [PositionID],
                 [Date_Time_Created],
                 [User_Id_Created],
                 [Date_Time_Modified],
                 [User_Id_Modified],
                 [Form_Id]
        FROM     [dbo].[Eligibility]
        ORDER BY [PlayerID] ASC;
    END

DROP TABLE [dbo].[Eligibility];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Eligibility]', N'Eligibility';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


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
PRINT N'Creating Default Constraint on [dbo].[Roster]....';


GO
ALTER TABLE [dbo].[Roster]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Roster]....';


GO
ALTER TABLE [dbo].[Roster]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating FK_Eligilblity_Posiition...';


GO
ALTER TABLE [dbo].[Eligibility] WITH NOCHECK
    ADD CONSTRAINT [FK_Eligilblity_Posiition] FOREIGN KEY ([PositionID]) REFERENCES [dbo].[Position] ([PositionID]);


GO
DELETE FROM Position
DELETE FROM Player
DELETE FROM Eligibility
DELETE FROM Roster

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
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (1, 'Buster', 'Posey', 'R', 'R', 'SF', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (2, 'Freddie', 'Freeman', 'R', 'R', 'ATL', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (3, 'Kolten', 'Wong', 'R', 'R', 'STL', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (4, 'Josh', 'Donaldson', 'R', 'R', 'TOR', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (5, 'Corey', 'Seager', 'R', 'R', 'LAD', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (6, 'Mookie', 'Betts', 'R', 'R', 'BOS', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (7, 'George', 'Springer', 'R', 'R', 'HOU', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (8, 'Justin', 'Upton', 'R', 'R', 'SD', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (9, 'Adrian', 'Gonzalez', 'R', 'R', 'LAD', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (10, 'Anthony', 'Rendon', 'R', 'R', 'WAS', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (11, 'Kyle', 'Seager', 'R', 'R', 'SEA', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (12, 'Addison', 'Russell', 'R', 'R', 'CHC', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (13, 'Corey', 'Dickerson', 'R', 'R', 'COL', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (14, 'Jurickson', 'Profar', 'R', 'R', 'TEX', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (15, 'Jorge', 'Alfaro', 'R', 'R', 'PHI', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (16, 'Franklin', 'Barreto', 'R', 'R', 'OAK', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (17, 'Trevor', 'Story', 'R', 'R', 'COL', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (18, 'Lewis', 'Brinson', 'R', 'R', 'TEX', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (19, 'Byron', 'Buxton', 'R', 'R', 'MIN', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (20, 'Alex', 'Jackson', 'R', 'R', 'SEA', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (21, 'Carlos', 'Carrasco', 'R', 'R', 'CLE', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (22, 'Tyson', 'Ross', 'R', 'R', 'SD', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (23, 'Danny', 'Salazar', 'R', 'R', 'CLE', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (24, 'Luis', 'Severino', 'R', 'R', 'NYY', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (25, 'Jordan', 'Zimmermann', 'R', 'R', 'DET', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (26, 'Jacob', 'deGrom', 'R', 'R', 'NYM', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (27, 'Zach', 'Britton', 'R', 'R', 'BAL', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (28, 'Jeurys', 'Familia', 'R', 'R', 'NYM', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (29, 'Huston', 'Street', 'R', 'R', 'LAA', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (30, 'Yu', 'Darvish', 'R', 'R', 'TEX', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (31, 'Nathan', 'Karns', 'R', 'R', 'SEA', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (32, 'Carlos', 'Rodon', 'R', 'R', 'CHW', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (33, 'Hector', 'Santiago', 'R', 'R', 'LAA', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (34, 'Yordano', 'Ventura', 'R', 'R', 'KC', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (35, 'Homer', 'Bailey', 'R', 'R', 'CIN', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (36, 'Michael', 'Fulmer', 'R', 'R', 'DET', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (37, 'Robert', 'Stephenson', 'R', 'R', 'CIN', GETDATE())
INSERT INTO Player (PlayerID, FirstName, LastName, Bats, Throws, Team, Birthdate) VALUES (38, 'Jose', 'De Leon', 'R', 'R', 'LAD', GETDATE())

-- Eligibility 
INSERT INTO Eligibility (PlayerID, PositionID) VALUES (1, 1)
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
GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Eligibility] WITH CHECK CHECK CONSTRAINT [FK_Eligilblity_Posiition];


GO
PRINT N'Update complete.';


GO
