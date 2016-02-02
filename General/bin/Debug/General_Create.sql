﻿/*
Deployment script for General

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "General"
:setvar DefaultFilePrefix "General"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)] COLLATE SQL_Latin1_General_CP1_CI_AS
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
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
USE [$(DatabaseName)];


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[Address]...';


GO
CREATE TABLE [dbo].[Address] (
    [AddressId]          INT           NOT NULL,
    [UserID]             INT           NOT NULL,
    [Type]               VARCHAR (4)   NOT NULL,
    [Line1]              VARCHAR (100) NOT NULL,
    [Line2]              VARCHAR (100) NULL,
    [Line3]              VARCHAR (100) NULL,
    [ApartmentNumber]    VARCHAR (50)  NULL,
    [City]               VARCHAR (100) NOT NULL,
    [State]              VARCHAR (100) NOT NULL,
    [ZipCode]            VARCHAR (100) NOT NULL,
    [Country]            VARCHAR (100) NULL,
    [Date_Time_Created]  DATETIME      NOT NULL,
    [User_Id_Created]    VARCHAR (50)  NULL,
    [Date_Time_Modified] DATETIME      NOT NULL,
    [User_Id_Modified]   VARCHAR (50)  NULL,
    [Form_Id]            VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([AddressId] ASC)
);


GO
PRINT N'Creating [dbo].[Cash_Receipt_Transaction]...';


GO
CREATE TABLE [dbo].[Cash_Receipt_Transaction] (
    [CashID]             INT             NOT NULL,
    [InvoiceID]          INT             NOT NULL,
    [UserID]             INT             NOT NULL,
    [Receipt_Date]       DATE            NOT NULL,
    [Amount]             DECIMAL (18, 2) NOT NULL,
    [Deposit_Number]     VARCHAR (100)   NULL,
    [Record_Status]      VARCHAR (1)     NOT NULL,
    [Date_Time_Created]  DATETIME        NOT NULL,
    [User_Id_Created]    VARCHAR (50)    NULL,
    [Date_Time_Modified] DATETIME        NOT NULL,
    [User_Id_Modified]   VARCHAR (50)    NULL,
    [Form_Id]            VARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([CashID] ASC)
);


GO
PRINT N'Creating [dbo].[Invoice]...';


GO
CREATE TABLE [dbo].[Invoice] (
    [InvoiceID]          INT             NOT NULL,
    [UserID]             INT             NOT NULL,
    [Receipt_Date]       DATE            NOT NULL,
    [Amount]             DECIMAL (18, 2) NOT NULL,
    [Record_Status]      VARCHAR (1)     NOT NULL,
    [Date_Time_Created]  DATETIME        NOT NULL,
    [User_Id_Created]    VARCHAR (50)    NULL,
    [Date_Time_Modified] DATETIME        NOT NULL,
    [User_Id_Modified]   VARCHAR (50)    NULL,
    [Form_Id]            VARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([InvoiceID] ASC)
);


GO
PRINT N'Creating [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [UserID]             INT           NOT NULL,
    [UserName]           VARCHAR (MAX) NOT NULL,
    [FirstName]          VARCHAR (MAX) NOT NULL,
    [LastName]           VARCHAR (MAX) NOT NULL,
    [EmailAddress]       VARCHAR (MAX) NOT NULL,
    [ReceiveNewsletter]  BIT           NULL,
    [Record_Status]      BIT           NOT NULL,
    [Date_Time_Created]  DATETIME      NOT NULL,
    [User_Id_Created]    VARCHAR (50)  NULL,
    [Date_Time_Modified] DATETIME      NOT NULL,
    [User_Id_Modified]   VARCHAR (50)  NULL,
    [Form_Id]            VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);


GO
PRINT N'Creating Default Constraint on [dbo].[Address]....';


GO
ALTER TABLE [dbo].[Address]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Address]....';


GO
ALTER TABLE [dbo].[Address]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Cash_Receipt_Transaction]....';


GO
ALTER TABLE [dbo].[Cash_Receipt_Transaction]
    ADD DEFAULT 'A' FOR [Record_Status];


GO
PRINT N'Creating Default Constraint on [dbo].[Cash_Receipt_Transaction]....';


GO
ALTER TABLE [dbo].[Cash_Receipt_Transaction]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Cash_Receipt_Transaction]....';


GO
ALTER TABLE [dbo].[Cash_Receipt_Transaction]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[Invoice]....';


GO
ALTER TABLE [dbo].[Invoice]
    ADD DEFAULT 'A' FOR [Record_Status];


GO
PRINT N'Creating Default Constraint on [dbo].[Invoice]....';


GO
ALTER TABLE [dbo].[Invoice]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[Invoice]....';


GO
ALTER TABLE [dbo].[Invoice]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
PRINT N'Creating Default Constraint on [dbo].[User]....';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT 0 FOR [ReceiveNewsletter];


GO
PRINT N'Creating Default Constraint on [dbo].[User]....';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT 1 FOR [Record_Status];


GO
PRINT N'Creating Default Constraint on [dbo].[User]....';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Created];


GO
PRINT N'Creating Default Constraint on [dbo].[User]....';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [Date_Time_Modified];


GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET MULTI_USER 
    WITH ROLLBACK IMMEDIATE;


GO
PRINT N'Update complete.';


GO
