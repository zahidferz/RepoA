IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_JournalEntryChanges_Company')
	ALTER TABLE [dbo].[JournalEntryChanges] DROP CONSTRAINT [FK_JournalEntryChanges_Company]
GO

/****** Object:  Table [dbo].[JournalEntryChanges]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='JournalEntryChanges')
	DROP TABLE [dbo].[JournalEntryChanges]
GO

/****** Object:  Table [dbo].[JournalEntryChanges]    Script Date: 03/01/2020 02:13:44 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[JournalEntryChanges](
	[CompanyNumber] [bigint] NULL,
	[RequestDate] [datetime] NULL,
	[ChangesUntil] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[JournalEntryChanges]  WITH CHECK ADD  CONSTRAINT [FK_JournalEntryChanges_Company] FOREIGN KEY([CompanyNumber])
REFERENCES [dbo].[Company] ([CompanyNumber])
GO

ALTER TABLE [dbo].[JournalEntryChanges] CHECK CONSTRAINT [FK_JournalEntryChanges_Company]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertJournalEntryChanges')
	DROP PROCEDURE [dbo].[InsertJournalEntryChanges]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertJournalEntryChanges]
	@CompanyNumber bigint, 
	@RequestDate datetime, 
	@ChangesUntil datetime2
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [JournalEntryChanges] ([CompanyNumber],[RequestDate],[ChangesUntil])
	VALUES (@CompanyNumber, @RequestDate, @ChangesUntil)

END
GO



IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateJournalEntryChanges')
	DROP PROCEDURE [dbo].[UpdateJournalEntryChanges]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateJournalEntryChanges]
	@CompanyNumber bigint, 
	@RequestDate datetime, 
	@ChangesUntil datetime2
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [JournalEntryChanges]
	SET [RequestDate] = @RequestDate,
	[ChangesUntil] = @ChangesUntil
	WHERE [CompanyNumber] = @CompanyNumber

END
GO



IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteJournalEntryChanges')
	DROP PROCEDURE [dbo].[DeleteJournalEntryChanges]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteJournalEntryChanges]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [JournalEntryChanges]
	WHERE [CompanyNumber] = @CompanyNumber

END
GO



IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewJournalEntryChanges')
	DROP VIEW [dbo].[ViewJournalEntryChanges]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewJournalEntryChanges]
AS
	SELECT	[JEC].[CompanyNumber], [JEC].[RequestDate], [JEC].[ChangesUntil]
	FROM	[dbo].[JournalEntryChanges] [JEC] WITH(NOLOCK)
GO



IF EXISTS (SELECT * FROM sysobjects WHERE name='GetJournalEntryChanges')
	DROP PROCEDURE [dbo].[GetJournalEntryChanges]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetJournalEntryChanges]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewJournalEntryChanges]
	WHERE [CompanyNumber] = @CompanyNumber

END
GO


IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_ReportPrecalculatedStatus_ReportEnum')
	ALTER TABLE [dbo].[ReportPrecalculatedStatus] DROP CONSTRAINT [FK_ReportPrecalculatedStatus_ReportEnum]
GO

/****** Object:  Table [dbo].[ReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ReportPrecalculatedStatus')
	DROP TABLE [dbo].[ReportPrecalculatedStatus]
GO

/****** Object:  Table [dbo].[ReportPrecalculatedStatus]    Script Date: 03/01/2020 02:40:31 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ReportPrecalculatedStatus](
	[CompanyNumber] [bigint] NOT NULL,
	[ReportId] [int] NOT NULL,
	[MonthYear] [int] NOT NULL,
	[LedgerAccountsPendingChanges] [bit] NOT NULL,
	[JournalEntriesPendingChanges] [bit] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ReportPrecalculatedStatus]  WITH CHECK ADD  CONSTRAINT [FK_ReportPrecalculatedStatus_ReportEnum] FOREIGN KEY([CompanyNumber])
REFERENCES [dbo].[Company] ([CompanyNumber])
GO

ALTER TABLE [dbo].[ReportPrecalculatedStatus] CHECK CONSTRAINT [FK_ReportPrecalculatedStatus_ReportEnum]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertReportPrecalculatedStatus')
	DROP PROCEDURE [dbo].[InsertReportPrecalculatedStatus]
GO

CREATE PROCEDURE [dbo].[InsertReportPrecalculatedStatus]
	@CompanyNumber bigint, 
	@ReportId int, 
	@MonthYear int, 
	@LedgerAccountsPendingChanges bit, 
	@JournalEntriesPendingChanges bit
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [ReportPrecalculatedStatus] ([CompanyNumber],[ReportId],[MonthYear],[LedgerAccountsPendingChanges],[JournalEntriesPendingChanges])
	VALUES (@CompanyNumber, @ReportId, @MonthYear, @LedgerAccountsPendingChanges, @JournalEntriesPendingChanges)

END
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateReportPrecalculatedStatusByCompany')
	DROP PROCEDURE [dbo].[UpdateReportPrecalculatedStatusByCompany]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateReportPrecalculatedStatusByCompanyMonthYear')
	DROP PROCEDURE [dbo].[UpdateReportPrecalculatedStatusByCompanyMonthYear]
GO

/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatusLedgerAccounts]    ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateReportPrecalculatedStatus')
	DROP PROCEDURE [dbo].[UpdateReportPrecalculatedStatus]
GO

CREATE PROCEDURE [dbo].[UpdateReportPrecalculatedStatus]
	@CompanyNumber bigint, 
	@ReportId int, 
	@MonthYear int, 
	@LedgerAccountsPendingChanges bit, 
	@JournalEntriesPendingChanges bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [ReportPrecalculatedStatus]
	SET [LedgerAccountsPendingChanges] = @LedgerAccountsPendingChanges,
	[JournalEntriesPendingChanges] = @JournalEntriesPendingChanges
	WHERE [CompanyNumber] = @CompanyNumber AND [ReportId] = @ReportId AND [MonthYear] = @MonthYear

END
GO


/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatusLedgerAccounts]    ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateReportPrecalculatedStatusLedgerAccounts')
	DROP PROCEDURE [dbo].[UpdateReportPrecalculatedStatusLedgerAccounts]
GO

CREATE PROCEDURE [dbo].[UpdateReportPrecalculatedStatusLedgerAccounts]
	@CompanyNumber bigint, 
	@MonthYear int, 
	@LedgerAccountsPendingChanges bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [ReportPrecalculatedStatus]
	SET [LedgerAccountsPendingChanges] = @LedgerAccountsPendingChanges
	WHERE [CompanyNumber] = @CompanyNumber AND [MonthYear] = @MonthYear

END
GO

/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatusLedgerAccountsByCompany]    ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateReportPrecalculatedStatusLedgerAccountsByCompany')
	DROP PROCEDURE [dbo].[UpdateReportPrecalculatedStatusLedgerAccountsByCompany]
GO

CREATE PROCEDURE [dbo].[UpdateReportPrecalculatedStatusLedgerAccountsByCompany]
	@CompanyNumber bigint, 
	@LedgerAccountsPendingChanges bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [ReportPrecalculatedStatus]
	SET [LedgerAccountsPendingChanges] = @LedgerAccountsPendingChanges
	WHERE [CompanyNumber] = @CompanyNumber

END
GO

/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatusJournalEntries]    ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateReportPrecalculatedStatusJournalEntries')
	DROP PROCEDURE [dbo].[UpdateReportPrecalculatedStatusJournalEntries]
GO

CREATE PROCEDURE [dbo].[UpdateReportPrecalculatedStatusJournalEntries]
	@CompanyNumber bigint, 
	@MonthYear int, 
	@JournalEntriesPendingChanges bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [ReportPrecalculatedStatus]
	SET [JournalEntriesPendingChanges] = @JournalEntriesPendingChanges
	WHERE [CompanyNumber] = @CompanyNumber AND [MonthYear] = @MonthYear

END
GO

/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatusJournalEntriesByCompany]    ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateReportPrecalculatedStatusJournalEntriesByCompany')
	DROP PROCEDURE [dbo].[UpdateReportPrecalculatedStatusJournalEntriesByCompany]
GO

CREATE PROCEDURE [dbo].[UpdateReportPrecalculatedStatusJournalEntriesByCompany]
	@CompanyNumber bigint, 
	@JournalEntriesPendingChanges bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [ReportPrecalculatedStatus]
	SET [JournalEntriesPendingChanges] = @JournalEntriesPendingChanges
	WHERE [CompanyNumber] = @CompanyNumber

END
GO

/****** Object:  StoredProcedure [dbo].[DeleteReportPrecalculatedStatus]    ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteReportPrecalculatedStatus')
	DROP PROCEDURE [dbo].[DeleteReportPrecalculatedStatus]
GO

CREATE PROCEDURE [dbo].[DeleteReportPrecalculatedStatus]
	@CompanyNumber bigint, 
	@ReportId int, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [ReportPrecalculatedStatus]
	WHERE [CompanyNumber] = @CompanyNumber AND [ReportId] = @ReportId AND [MonthYear] = @MonthYear

END
GO

/****** Object:  StoredProcedure [dbo].[DeleteReportPrecalculatedStatusByCompany]    ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteReportPrecalculatedStatusByCompany')
	DROP PROCEDURE [dbo].[DeleteReportPrecalculatedStatusByCompany]
GO

CREATE PROCEDURE [dbo].[DeleteReportPrecalculatedStatusByCompany]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [ReportPrecalculatedStatus]
	WHERE [CompanyNumber] = @CompanyNumber

END
GO

/****** Object:  StoredProcedure [dbo].[ViewReportPrecalculatedStatus]    ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewReportPrecalculatedStatus')
	DROP VIEW [dbo].[ViewReportPrecalculatedStatus]
GO


CREATE VIEW [dbo].[ViewReportPrecalculatedStatus]
AS
	SELECT	[RPS].[CompanyNumber], [RPS].[ReportId], [RPS].[MonthYear], [RPS].[LedgerAccountsPendingChanges], [RPS].[JournalEntriesPendingChanges], 
			[RE].[Description] AS [Report]
	FROM	[dbo].[ReportPrecalculatedStatus] [RPS] WITH(NOLOCK) JOIN
			[dbo].[ReportEnum] [RE] WITH(NOLOCK) ON [RPS].[ReportId] = [RE].[ReportId]
GO

/****** Object:  StoredProcedure [dbo].[GetReportPrecalculatedStatus]    ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetReportPrecalculatedStatus')
	DROP PROCEDURE [dbo].[GetReportPrecalculatedStatus]
GO

CREATE PROCEDURE [dbo].[GetReportPrecalculatedStatus]
	@CompanyNumber bigint, 
	@ReportId int, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewReportPrecalculatedStatus]
	WHERE [CompanyNumber] = @CompanyNumber AND [ReportId] = @ReportId AND [MonthYear] = @MonthYear

END
GO