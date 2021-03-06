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
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE,
                DISABLE_BROKER 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key a7ae618a-74c8-4c15-9b9d-adcd6f83d0c6 is skipped, element [dbo].[Roster].[Id] (SqlSimpleColumn) will not be renamed to TeamID';


GO
PRINT N'Rename refactoring operation with key 86ab5768-821d-43be-ac7d-a6700afab758 is skipped, element [dbo].[Roster].[Section] (SqlSimpleColumn) will not be renamed to Status';


GO
PRINT N'Rename refactoring operation with key 5bb34239-a7ad-4682-aac8-6a619fb4f94a is skipped, element [dbo].[Status = ''A'' OR Status = ''R'' OR Status = ''I'' OR Status = ''M''] (SqlCheckConstraint) will not be renamed to [Status_CK]';


GO
PRINT N'Rename refactoring operation with key f52c537a-523e-4eab-9e1f-1e3ece2f2241 is skipped, element [dbo].[Player].[Id] (SqlSimpleColumn) will not be renamed to PlayerID';


GO
PRINT N'Rename refactoring operation with key ba9435f3-197a-4cb6-a4a4-4ea342718180 is skipped, element [dbo].[Eligilblity].[Id] (SqlSimpleColumn) will not be renamed to PlayerID';


GO
PRINT N'Rename refactoring operation with key 96b91596-8f5a-41c6-b191-4ab3cbdfb894 is skipped, element [dbo].[Position].[Id] (SqlSimpleColumn) will not be renamed to PositionID';


GO
PRINT N'Creating [dbo].[Eligilblity]...';


GO
CREATE TABLE [dbo].[Eligilblity] (
    [PlayerID]           INT          NOT NULL,
    [PositionID]         INT          NOT NULL,
    [Date_Time_Created]  DATETIME     NOT NULL,
    [User_Id_Created]    VARCHAR (50) NULL,
    [Date_Time_Modified] DATETIME     NOT NULL,
    [User_Id_Modified]   VARCHAR (50) NULL,
    [Form_Id]            VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([PlayerID] ASC)
);


GO
PRINT N'Creating [dbo].[Player]...';


GO
CREATE TABLE [dbo].[Player] (
    [PlayerID]           INT           NOT NULL,
    [FirstName]          VARCHAR (100) NOT NULL,
    [LastName]           VARCHAR (100) NOT NULL,
    [Bats]               VARCHAR (1)   NOT NULL,
    [Throws]             VARCHAR (1)   NOT NULL,
    [Birthdate]          DATE          NOT NULL,
    [Date_Time_Created]  DATETIME      NOT NULL,
    [User_Id_Created]    VARCHAR (50)  NULL,
    [Date_Time_Modified] DATETIME      NOT NULL,
    [User_Id_Modified]   VARCHAR (50)  NULL,
    [Form_Id]            VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([PlayerID] ASC)
);


GO
PRINT N'Creating [dbo].[Position]...';


GO
CREATE TABLE [dbo].[Position] (
    [PositionID]         INT           NOT NULL,
    [Name]               VARCHAR (100) NOT NULL,
    [Date_Time_Created]  DATETIME      NOT NULL,
    [User_Id_Created]    VARCHAR (50)  NULL,
    [Date_Time_Modified] DATETIME      NOT NULL,
    [User_Id_Modified]   VARCHAR (50)  NULL,
    [Form_Id]            VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([PositionID] ASC)
);


GO
PRINT N'Creating [dbo].[Roster]...';


GO
CREATE TABLE [dbo].[Roster] (
    [TeamID]             INT          NOT NULL,
    [PlayerID]           INT          NOT NULL,
    [Position]           VARCHAR (2)  NOT NULL,
    [Status]             VARCHAR (1)  NOT NULL,
    [Date_Time_Created]  DATETIME     NOT NULL,
    [User_Id_Created]    VARCHAR (50) NULL,
    [Date_Time_Modified] DATETIME     NOT NULL,
    [User_Id_Modified]   VARCHAR (50) NULL,
    [Form_Id]            VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([TeamID] ASC)
);


GO
PRINT N'Creating Default Constraint on [dbo].[Eligilblity]....';


GO
ALTER TABLE [dbo].[Eligilblity]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Eligilblity]....';


GO
ALTER TABLE [dbo].[Eligilblity]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Player]....';


GO
ALTER TABLE [dbo].[Player]
    ADD DEFAULT GETDATE() FOR [Birthdate];


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
ALTER TABLE [dbo].[Eligilblity] WITH NOCHECK
    ADD CONSTRAINT [FK_Eligilblity_Posiition] FOREIGN KEY ([PositionID]) REFERENCES [dbo].[Position] ([PositionID]);


GO
PRINT N'Creating Status_CK...';


GO
ALTER TABLE [dbo].[Roster] WITH NOCHECK
    ADD CONSTRAINT [Status_CK] CHECK (Status = 'A' OR Status = 'R' OR Status = 'I' OR Status = 'M');


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a7ae618a-74c8-4c15-9b9d-adcd6f83d0c6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a7ae618a-74c8-4c15-9b9d-adcd6f83d0c6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '86ab5768-821d-43be-ac7d-a6700afab758')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('86ab5768-821d-43be-ac7d-a6700afab758')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5bb34239-a7ad-4682-aac8-6a619fb4f94a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5bb34239-a7ad-4682-aac8-6a619fb4f94a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f52c537a-523e-4eab-9e1f-1e3ece2f2241')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f52c537a-523e-4eab-9e1f-1e3ece2f2241')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ba9435f3-197a-4cb6-a4a4-4ea342718180')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ba9435f3-197a-4cb6-a4a4-4ea342718180')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '96b91596-8f5a-41c6-b191-4ab3cbdfb894')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('96b91596-8f5a-41c6-b191-4ab3cbdfb894')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Eligilblity] WITH CHECK CHECK CONSTRAINT [FK_Eligilblity_Posiition];

ALTER TABLE [dbo].[Roster] WITH CHECK CHECK CONSTRAINT [Status_CK];


GO
PRINT N'Update complete.';


GO
