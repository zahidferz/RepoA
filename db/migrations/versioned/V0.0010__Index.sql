IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_Precalculated_LedgerAccountId_MonthYear') BEGIN
	DROP INDEX [ix_Precalculated_LedgerAccountId_MonthYear] ON [dbo].[Precalculated]
END
GO

CREATE INDEX [ix_Precalculated_LedgerAccountId_MonthYear] ON [dbo].[Precalculated] ( [LedgerAccountId], [MonthYear]) WITH (ONLINE=ON, SORT_IN_TEMPDB=ON);
GO

IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_ClosedPeriodBalance_LedgerAccountId_MonthYear') BEGIN
	DROP INDEX [ix_ClosedPeriodBalance_LedgerAccountId_MonthYear] ON [dbo].[ClosedPeriodBalance]
END
GO

CREATE INDEX [ix_ClosedPeriodBalance_LedgerAccountId_MonthYear] ON [dbo].[ClosedPeriodBalance] ( [LedgerAccountId], [MonthYear]) WITH (ONLINE=ON, SORT_IN_TEMPDB=ON);
GO

IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear') BEGIN
	DROP INDEX [ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear] ON [dbo].[ReportPrecalculatedStatus]
END
GO

CREATE INDEX [ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear] ON [dbo].[ReportPrecalculatedStatus] ( [CompanyNumber], [ReportId], [MonthYear]) WITH (ONLINE=ON, SORT_IN_TEMPDB=ON);
GO

/****** Object:  Table [dbo].[ReportEnum]    Script Date: 05/02/2020 02:34:00 p. m. ******/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_ReportPrecalculatedStatus_ReportEnum')
	ALTER TABLE [dbo].[ReportPrecalculatedStatus] DROP CONSTRAINT [FK_ReportPrecalculatedStatus_ReportEnum]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='ReportEnum')
	DROP TABLE [dbo].[ReportEnum]
GO

CREATE TABLE [dbo].[ReportEnum](
	[ReportId] [int] NOT NULL,
	[Description] [varchar](30) NOT NULL,
 CONSTRAINT [PK_ReportEnum] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (1, N'generalLegder')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (2, N'generalLegderExcel')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (3, N'generalLegderPdf')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (4, N'journal')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (5, N'trialBalance')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (6, N'trialBalanceExcel')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (7, N'trialBalancePdf')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (8, N'balanceSheet')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (9, N'balanceSheetExcel')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (10, N'balanceSheetPdf')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (11, N'incomeStatement')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (12, N'incomeStatementExcel')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (13, N'incomeStatementPdf')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (14, N'subLedger')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (15, N'subLedgerExcel')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (16, N'subLedgerPdf')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (17, N'statementOfCashflows')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (18, N'statementOfCashflowsExcel')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (19, N'statementOfCashflowsPdf')
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='ReportPrecalculatedStatus')
	DROP TABLE [dbo].[ReportPrecalculatedStatus]
GO

/****** Object:  Table [dbo].[ReportPrecalculatedStatus]    Script Date: 05/02/2020 02:41:42 p. m. ******/
CREATE TABLE [dbo].[ReportPrecalculatedStatus](
	[CompanyNumber] [bigint] NOT NULL,
	[ReportId] [int] NOT NULL,
	[MonthYear] [int] NOT NULL,
	[LedgerAccountsPendingChanges] [bit] NOT NULL,
	[JournalEntriesPendingChanges] [bit] NOT NULL,
	[UrlFile] VARCHAR(200) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ReportPrecalculatedStatus]  WITH CHECK ADD  CONSTRAINT [FK_ReportPrecalculatedStatus_ReportEnum] FOREIGN KEY([ReportId])
REFERENCES [dbo].[ReportEnum] ([ReportId])
GO

/****** Object:  StoredProcedure [dbo].[InsertReportPrecalculatedStatus]    Script Date: 05/02/2020 03:18:31 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertReportPrecalculatedStatus')
	DROP PROCEDURE [dbo].[InsertReportPrecalculatedStatus]
GO

CREATE PROCEDURE [dbo].[InsertReportPrecalculatedStatus]
	@CompanyNumber bigint, 
	@ReportId int, 
	@MonthYear int, 
	@LedgerAccountsPendingChanges bit, 
	@JournalEntriesPendingChanges bit,
	@UrlFile VARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [ReportPrecalculatedStatus] ([CompanyNumber],[ReportId],[MonthYear],[LedgerAccountsPendingChanges],[JournalEntriesPendingChanges],[UrlFile])
	VALUES (@CompanyNumber, @ReportId, @MonthYear, @LedgerAccountsPendingChanges, @JournalEntriesPendingChanges, @UrlFile)

END
GO

/****** Object:  View [dbo].[ViewReportPrecalculatedStatus]    Script Date: 05/02/2020 03:23:11 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewReportPrecalculatedStatus')
	DROP VIEW [dbo].[ViewReportPrecalculatedStatus]
GO

CREATE VIEW [dbo].[ViewReportPrecalculatedStatus]
AS
	SELECT	[RPS].[CompanyNumber], [RPS].[ReportId], [RPS].[MonthYear], [RPS].[LedgerAccountsPendingChanges], [RPS].[JournalEntriesPendingChanges], [RPS].[UrlFile],
			[RE].[Description] AS [Report]
	FROM	[dbo].[ReportPrecalculatedStatus] [RPS] WITH(NOLOCK) JOIN
			[dbo].[ReportEnum] [RE] WITH(NOLOCK) ON [RPS].[ReportId] = [RE].[ReportId]
GO

/****** Object:  StoredProcedure [dbo].[InsertReportPrecalculatedStatus]    Script Date: 05/02/2020 03:18:31 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='SaveReportPrecalculatedStatus')
	DROP PROCEDURE [dbo].[SaveReportPrecalculatedStatus]
GO

CREATE PROCEDURE [dbo].[SaveReportPrecalculatedStatus]
	@CompanyNumber bigint, 
	@ReportId int, 
	@MonthYear int, 
	@LedgerAccountsPendingChanges bit, 
	@JournalEntriesPendingChanges bit,
	@UrlFile VARCHAR(200)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM [ReportPrecalculatedStatus] WHERE [CompanyNumber] = @CompanyNumber AND [ReportId] = @ReportId AND [MonthYear] = @MonthYear)
		UPDATE [ReportPrecalculatedStatus]
		SET [LedgerAccountsPendingChanges] = @LedgerAccountsPendingChanges,
			[JournalEntriesPendingChanges] = @JournalEntriesPendingChanges,
			[UrlFile] = @UrlFile
		WHERE [CompanyNumber] = @CompanyNumber AND [ReportId] = @ReportId AND [MonthYear] = @MonthYear
	ELSE
		INSERT INTO [ReportPrecalculatedStatus] ([CompanyNumber],[ReportId],[MonthYear],[LedgerAccountsPendingChanges],[JournalEntriesPendingChanges],[UrlFile])
		VALUES (@CompanyNumber, @ReportId, @MonthYear, @LedgerAccountsPendingChanges, @JournalEntriesPendingChanges, @UrlFile)

END
GO

/****** Object:  StoredProcedure [dbo].[GetLedgerAccountPendingChanges]    Script Date: 05/02/2020 06:38:53 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetLedgerAccountPendingChanges')
	DROP PROCEDURE [dbo].[GetLedgerAccountPendingChanges]
GO

CREATE PROCEDURE [dbo].[GetLedgerAccountPendingChanges]
	@CompanyNumber bigint, 
	@ReportId int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @LedgerAccountsPendingChanges bit
	SET @LedgerAccountsPendingChanges = (SELECT LedgerAccountsPendingChanges FROM [dbo].[ViewReportPrecalculatedStatus] WHERE [CompanyNumber] = @CompanyNumber AND ReportId = @ReportId)

	SELECT ISNULL(@LedgerAccountsPendingChanges, 1)
END
GO

/****** Object:  StoredProcedure [dbo].[GetReportPrecalculatedStatusPendingChanges]    Script Date: 05/02/2020 06:40:01 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetReportPrecalculatedStatusPendingChanges')
	DROP PROCEDURE [dbo].[GetReportPrecalculatedStatusPendingChanges]
GO

CREATE PROCEDURE [dbo].[GetReportPrecalculatedStatusPendingChanges]
	@CompanyNumber bigint, 
	@ReportId int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @JournalEntriesPendingChanges bit
	SET @JournalEntriesPendingChanges = (SELECT JournalEntriesPendingChanges FROM [dbo].[ViewReportPrecalculatedStatus] WHERE [CompanyNumber] = @CompanyNumber AND ReportId = @ReportId)

	SELECT ISNULL(@JournalEntriesPendingChanges, 1)
END
GO