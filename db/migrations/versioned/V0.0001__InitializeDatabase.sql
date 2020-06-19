/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatusByCompanyMonthYear]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateReportPrecalculatedStatusByCompanyMonthYear')
	DROP PROCEDURE [dbo].[UpdateReportPrecalculatedStatusByCompanyMonthYear]
GO
/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatusByCompany]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateReportPrecalculatedStatusByCompany')
	DROP PROCEDURE [dbo].[UpdateReportPrecalculatedStatusByCompany]
GO
/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateReportPrecalculatedStatus')
	DROP PROCEDURE [dbo].[UpdateReportPrecalculatedStatus]
GO
/****** Object:  StoredProcedure [dbo].[UpdatePrecalculated]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdatePrecalculated')
	DROP PROCEDURE [dbo].[UpdatePrecalculated]
GO
/****** Object:  StoredProcedure [dbo].[UpdateClosedPeriodBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateClosedPeriodBalance')
	DROP PROCEDURE [dbo].[UpdateClosedPeriodBalance]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAccountingBeginningBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateAccountingBeginningBalance')
	DROP PROCEDURE [dbo].[UpdateAccountingBeginningBalance]
GO
/****** Object:  StoredProcedure [dbo].[InsertReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertReportPrecalculatedStatus')
	DROP PROCEDURE [dbo].[InsertReportPrecalculatedStatus]
GO
/****** Object:  StoredProcedure [dbo].[InsertPrecalculated]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertPrecalculated')
	DROP PROCEDURE [dbo].[InsertPrecalculated]
GO
/****** Object:  StoredProcedure [dbo].[InsertCompanyLedgerAccount]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertCompanyLedgerAccount')
	DROP PROCEDURE [dbo].[InsertCompanyLedgerAccount]
GO
/****** Object:  StoredProcedure [dbo].[InsertCompany]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertCompany')
	DROP PROCEDURE [dbo].[InsertCompany]
GO
/****** Object:  StoredProcedure [dbo].[InsertClosedPeriodBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertClosedPeriodBalance')
	DROP PROCEDURE [dbo].[InsertClosedPeriodBalance]
GO
/****** Object:  StoredProcedure [dbo].[InsertAccountingBeginningBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertAccountingBeginningBalance')
	DROP PROCEDURE [dbo].[InsertAccountingBeginningBalance]
GO
/****** Object:  StoredProcedure [dbo].[GetReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetReportPrecalculatedStatus')
	DROP PROCEDURE [dbo].[GetReportPrecalculatedStatus]
GO
/****** Object:  StoredProcedure [dbo].[GetPrecalculated]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetPrecalculated')
	DROP PROCEDURE [dbo].[GetPrecalculated]
GO
/****** Object:  StoredProcedure [dbo].[GetCompanyLedgerAccount]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetCompanyLedgerAccount')
	DROP PROCEDURE [dbo].[GetCompanyLedgerAccount]
GO
/****** Object:  StoredProcedure [dbo].[GetCompany]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetCompany')
	DROP PROCEDURE [dbo].[GetCompany]
GO
/****** Object:  StoredProcedure [dbo].[GetClosedPeriodBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetClosedPeriodBalance')
	DROP PROCEDURE [dbo].[GetClosedPeriodBalance]
GO
/****** Object:  StoredProcedure [dbo].[GetAccountingBeginningBalanceByLegderAccountId]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetAccountingBeginningBalanceByLegderAccountId')
	DROP PROCEDURE [dbo].[GetAccountingBeginningBalanceByLegderAccountId]
GO
/****** Object:  StoredProcedure [dbo].[DeleteReportPrecalculatedStatusByCompany]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteReportPrecalculatedStatusByCompany')
	DROP PROCEDURE [dbo].[DeleteReportPrecalculatedStatusByCompany]
GO
/****** Object:  StoredProcedure [dbo].[DeleteReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteReportPrecalculatedStatus')
	DROP PROCEDURE [dbo].[DeleteReportPrecalculatedStatus]
GO
/****** Object:  StoredProcedure [dbo].[DeletePrecalculated]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeletePrecalculated')
	DROP PROCEDURE [dbo].[DeletePrecalculated]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompanyLedgerAccountByCompany]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteCompanyLedgerAccountByCompany')
	DROP PROCEDURE [dbo].[DeleteCompanyLedgerAccountByCompany]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompanyLedgerAccount]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteCompanyLedgerAccount')
	DROP PROCEDURE [dbo].[DeleteCompanyLedgerAccount]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompany]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteCompany')
	DROP PROCEDURE [dbo].[DeleteCompany]
GO
/****** Object:  StoredProcedure [dbo].[DeleteClosedPeriodBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteClosedPeriodBalance')
	DROP PROCEDURE [dbo].[DeleteClosedPeriodBalance]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAccountingBeginningBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteAccountingBeginningBalance')
	DROP PROCEDURE [dbo].[DeleteAccountingBeginningBalance]
GO

IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_ReportPrecalculatedStatus_ReportEnum')
	ALTER TABLE [dbo].[ReportPrecalculatedStatus] DROP CONSTRAINT [FK_ReportPrecalculatedStatus_ReportEnum]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_Precalculated_CompanyLedgerAccount')
	ALTER TABLE [dbo].[Precalculated] DROP CONSTRAINT [FK_Precalculated_CompanyLedgerAccount]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_CompanyLedgerAccount_Company')
	ALTER TABLE [dbo].[CompanyLedgerAccount] DROP CONSTRAINT [FK_CompanyLedgerAccount_Company]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_ClosedPeriodBalance_CompanyLedgerAccount')
	ALTER TABLE [dbo].[ClosedPeriodBalance] DROP CONSTRAINT [FK_ClosedPeriodBalance_CompanyLedgerAccount]
GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_AccountingBeginningBalance_CompanyLedgerAccount')
	ALTER TABLE [dbo].[AccountingBeginningBalance] DROP CONSTRAINT [FK_AccountingBeginningBalance_CompanyLedgerAccount]
GO

/****** Object:  View [dbo].[ViewReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewReportPrecalculatedStatus')
	DROP VIEW [dbo].[ViewReportPrecalculatedStatus]
GO
/****** Object:  Table [dbo].[ReportEnum]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ReportEnum')
	DROP TABLE [dbo].[ReportEnum]
GO
/****** Object:  Table [dbo].[ReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ReportPrecalculatedStatus')
	DROP TABLE [dbo].[ReportPrecalculatedStatus]
GO
/****** Object:  View [dbo].[ViewPrecalculated]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewPrecalculated')
	DROP VIEW [dbo].[ViewPrecalculated]
GO
/****** Object:  Table [dbo].[Precalculated]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='Precalculated')
	DROP TABLE [dbo].[Precalculated]
GO
/****** Object:  View [dbo].[ViewCompanyLedgerAccount]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewCompanyLedgerAccount')
	DROP VIEW [dbo].[ViewCompanyLedgerAccount]
GO
/****** Object:  Table [dbo].[CompanyLedgerAccount]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='CompanyLedgerAccount')
	DROP TABLE [dbo].[CompanyLedgerAccount]
GO
/****** Object:  View [dbo].[ViewCompany]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewCompany')
	DROP VIEW [dbo].[ViewCompany]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='Company')
	DROP TABLE [dbo].[Company]
GO
/****** Object:  View [dbo].[ViewClosedPeriodBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewClosedPeriodBalance')
	DROP VIEW [dbo].[ViewClosedPeriodBalance]
GO
/****** Object:  Table [dbo].[ClosedPeriodBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ClosedPeriodBalance')
	DROP TABLE [dbo].[ClosedPeriodBalance]
GO
/****** Object:  View [dbo].[ViewAccountingBeginningBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewAccountingBeginningBalance')
	DROP VIEW [dbo].[ViewAccountingBeginningBalance]
GO
/****** Object:  Table [dbo].[AccountingBeginningBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='AccountingBeginningBalance')
	DROP TABLE [dbo].[AccountingBeginningBalance]
GO
/****** Object:  Table [dbo].[AccountingBeginningBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountingBeginningBalance](
	[LegderAccountId] [uniqueidentifier] NOT NULL,
	[BeginningBalance] [decimal](24, 6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewAccountingBeginningBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAccountingBeginningBalance]
AS
	SELECT	 [ABB].[LegderAccountId], [ABB].[BeginningBalance]
	FROM	[dbo].[AccountingBeginningBalance] [ABB] WITH(NOLOCK)
GO
/****** Object:  Table [dbo].[ClosedPeriodBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClosedPeriodBalance](
	[LegderAccountId] [uniqueidentifier] NOT NULL,
	[MonthYear] [int] NOT NULL,
	[FinalBalance] [decimal](24, 6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewClosedPeriodBalance]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewClosedPeriodBalance]
AS
	SELECT	 [CPB].[LegderAccountId], [CPB].[MonthYear], [CPB].[FinalBalance]
	FROM	[dbo].[ClosedPeriodBalance] [CPB] WITH(NOLOCK)
GO
/****** Object:  Table [dbo].[Company]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyNumber] [bigint] NOT NULL,
	[BeginningPeriod] [int] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewCompany]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCompany]
AS
	SELECT	 [C].[CompanyNumber], [C].[BeginningPeriod]
	FROM	[dbo].[Company] [C] WITH(NOLOCK)
GO
/****** Object:  Table [dbo].[CompanyLedgerAccount]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyLedgerAccount](
	[CompanyNumber] [bigint] NOT NULL,
	[LedgerAccountId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CompanyLedgerAccount] PRIMARY KEY CLUSTERED 
(
	[LedgerAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewCompanyLedgerAccount]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCompanyLedgerAccount]
AS
	SELECT	 [CLA].[CompanyNumber], [CLA].[LedgerAccountId]
	FROM	[dbo].[CompanyLedgerAccount] [CLA] WITH(NOLOCK)
GO
/****** Object:  Table [dbo].[Precalculated]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precalculated](
	[LegderAccountId] [uniqueidentifier] NOT NULL,
	[MonthYear] [int] NOT NULL,
	[Credit] [decimal](24, 6) NOT NULL,
	[Debit] [decimal](24, 6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPrecalculated]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewPrecalculated]
AS
	SELECT	 [P].[LegderAccountId], [P].[MonthYear], [P].[Credit], [P].[Debit]
	FROM	[dbo].[Precalculated] [P] WITH(NOLOCK)
GO
/****** Object:  Table [dbo].[ReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:04 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportPrecalculatedStatus](
	[CompanyNumber] [bigint] NOT NULL,
	[ReportId] [int] NOT NULL,
	[MonthYear] [int] NOT NULL,
	[Precalculated] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportEnum]    Script Date: 24/12/2019 10:05:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportEnum](
	[ReportId] [int] NOT NULL,
	[Description] [varchar](30) NOT NULL,
 CONSTRAINT [PK_ReportEnum] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewReportPrecalculatedStatus]
AS
	SELECT	[RPS].[CompanyNumber], [RPS].[ReportId], [RPS].[MonthYear], [RPS].[Precalculated], 
			[RE].[Description] AS [Report]
	FROM	[dbo].[ReportPrecalculatedStatus] [RPS] WITH(NOLOCK) JOIN
			[dbo].[ReportEnum] [RE] WITH(NOLOCK) ON [RPS].[ReportId] = [RE].[ReportId]
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (1, N'generalLegder')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (2, N'journal')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (3, N'trialBalance')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (4, N'balanceSheet')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (5, N'incomeStatement')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (6, N'subLedger')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (7, N'statementOfCashflows')
GO
INSERT [dbo].[ReportEnum] ([ReportId], [Description]) VALUES (8, N'statementOfStockholdersEquity')
GO
ALTER TABLE [dbo].[AccountingBeginningBalance]  WITH CHECK ADD  CONSTRAINT [FK_AccountingBeginningBalance_CompanyLedgerAccount] FOREIGN KEY([LegderAccountId])
REFERENCES [dbo].[CompanyLedgerAccount] ([LedgerAccountId])
GO
ALTER TABLE [dbo].[AccountingBeginningBalance] CHECK CONSTRAINT [FK_AccountingBeginningBalance_CompanyLedgerAccount]
GO
ALTER TABLE [dbo].[ClosedPeriodBalance]  WITH CHECK ADD  CONSTRAINT [FK_ClosedPeriodBalance_CompanyLedgerAccount] FOREIGN KEY([LegderAccountId])
REFERENCES [dbo].[CompanyLedgerAccount] ([LedgerAccountId])
GO
ALTER TABLE [dbo].[ClosedPeriodBalance] CHECK CONSTRAINT [FK_ClosedPeriodBalance_CompanyLedgerAccount]
GO
ALTER TABLE [dbo].[CompanyLedgerAccount]  WITH CHECK ADD  CONSTRAINT [FK_CompanyLedgerAccount_Company] FOREIGN KEY([CompanyNumber])
REFERENCES [dbo].[Company] ([CompanyNumber])
GO
ALTER TABLE [dbo].[CompanyLedgerAccount] CHECK CONSTRAINT [FK_CompanyLedgerAccount_Company]
GO
ALTER TABLE [dbo].[Precalculated]  WITH CHECK ADD  CONSTRAINT [FK_Precalculated_CompanyLedgerAccount] FOREIGN KEY([LegderAccountId])
REFERENCES [dbo].[CompanyLedgerAccount] ([LedgerAccountId])
GO
ALTER TABLE [dbo].[Precalculated] CHECK CONSTRAINT [FK_Precalculated_CompanyLedgerAccount]
GO
ALTER TABLE [dbo].[ReportPrecalculatedStatus]  WITH CHECK ADD  CONSTRAINT [FK_ReportPrecalculatedStatus_ReportEnum] FOREIGN KEY([CompanyNumber])
REFERENCES [dbo].[Company] ([CompanyNumber])
GO
ALTER TABLE [dbo].[ReportPrecalculatedStatus] CHECK CONSTRAINT [FK_ReportPrecalculatedStatus_ReportEnum]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAccountingBeginningBalance]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAccountingBeginningBalance]
	@LegderAccountId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [AccountingBeginningBalance]
	WHERE [LegderAccountId] = @LegderAccountId

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClosedPeriodBalance]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteClosedPeriodBalance]
	@LegderAccountId uniqueidentifier, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [ClosedPeriodBalance]
	WHERE [LegderAccountId] = @LegderAccountId AND [MonthYear] = @MonthYear

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompany]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCompany]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [Company]
	WHERE [CompanyNumber] = @CompanyNumber

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompanyLedgerAccount]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCompanyLedgerAccount]
	@CompanyNumber bigint, 
	@LedgerAccountId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [CompanyLedgerAccount]
	WHERE [CompanyNumber] = @CompanyNumber AND [LedgerAccountId] = @LedgerAccountId

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCompanyLedgerAccountByCompany]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCompanyLedgerAccountByCompany]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [CompanyLedgerAccount]
	WHERE [CompanyNumber] = @CompanyNumber

END
GO
/****** Object:  StoredProcedure [dbo].[DeletePrecalculated]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePrecalculated]
	@LegderAccountId uniqueidentifier, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [Precalculated]
	WHERE [LegderAccountId] = @LegderAccountId AND [MonthYear] = @MonthYear

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[DeleteReportPrecalculatedStatusByCompany]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[GetAccountingBeginningBalanceByLegderAccountId]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAccountingBeginningBalanceByLegderAccountId]
	@LegderAccountId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewAccountingBeginningBalance]
	WHERE [LegderAccountId] = @LegderAccountId
END
GO
/****** Object:  StoredProcedure [dbo].[GetClosedPeriodBalance]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClosedPeriodBalance]
	@LegderAccountId uniqueidentifier, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewClosedPeriodBalance]
	WHERE [LegderAccountId] = @LegderAccountId AND [MonthYear] = @MonthYear

END
GO
/****** Object:  StoredProcedure [dbo].[GetCompany]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompany]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewCompany]
	WHERE [CompanyNumber] = @CompanyNumber

END
GO
/****** Object:  StoredProcedure [dbo].[GetCompanyLedgerAccount]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompanyLedgerAccount]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewCompanyLedgerAccount]
	WHERE [CompanyNumber] = @CompanyNumber

END
GO
/****** Object:  StoredProcedure [dbo].[GetPrecalculated]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPrecalculated]
	@LegderAccountId uniqueidentifier, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewPrecalculated]
	WHERE [LegderAccountId] = @LegderAccountId AND [MonthYear] = @MonthYear

END
GO
/****** Object:  StoredProcedure [dbo].[GetReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[InsertAccountingBeginningBalance]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAccountingBeginningBalance]
	@LegderAccountId uniqueidentifier, 
	@BeginningBalance decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [AccountingBeginningBalance] ([LegderAccountId],[BeginningBalance])
	VALUES (@LegderAccountId, @BeginningBalance)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertClosedPeriodBalance]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertClosedPeriodBalance]
	@LegderAccountId uniqueidentifier, 
	@MonthYear int, 
	@FinalBalance decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [ClosedPeriodBalance] ([LegderAccountId],[MonthYear],[FinalBalance])
	VALUES (@LegderAccountId, @MonthYear, @FinalBalance)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertCompany]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCompany]
	@CompanyNumber bigint, 
	@BeginningPeriod int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Company] ([CompanyNumber],[BeginningPeriod])
	VALUES (@CompanyNumber, @BeginningPeriod)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertCompanyLedgerAccount]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCompanyLedgerAccount]
	@CompanyNumber bigint, 
	@LedgerAccountId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [CompanyLedgerAccount] ([CompanyNumber],[LedgerAccountId])
	VALUES (@CompanyNumber, @LedgerAccountId)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertPrecalculated]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPrecalculated]
	@LegderAccountId uniqueidentifier, 
	@MonthYear int, 
	@Credit decimal(24,6), 
	@Debit decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Precalculated] ([LegderAccountId],[MonthYear],[Credit],[Debit])
	VALUES (@LegderAccountId, @MonthYear, @Credit, @Debit)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertReportPrecalculatedStatus]
	@CompanyNumber bigint, 
	@ReportId int, 
	@MonthYear int, 
	@Precalculated bit
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [ReportPrecalculatedStatus] ([CompanyNumber],[ReportId],[MonthYear],[Precalculated])
	VALUES (@CompanyNumber, @ReportId, @MonthYear, @Precalculated)

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAccountingBeginningBalance]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAccountingBeginningBalance]
	@LegderAccountId uniqueidentifier, 
	@BeginningBalance decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [AccountingBeginningBalance]
	SET [BeginningBalance] = @BeginningBalance
	WHERE [LegderAccountId] = @LegderAccountId
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateClosedPeriodBalance]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateClosedPeriodBalance]
	@LegderAccountId uniqueidentifier, 
	@MonthYear int, 
	@FinalBalance decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [ClosedPeriodBalance]
	SET [FinalBalance] = @FinalBalance
	WHERE [LegderAccountId] = @LegderAccountId AND [MonthYear] = @MonthYear

END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePrecalculated]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePrecalculated]
	@LegderAccountId uniqueidentifier, 
	@MonthYear int, 
	@Credit decimal(24,6), 
	@Debit decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Precalculated]
	SET [Credit] = @Credit,
		[Debit] = @Debit
	WHERE [LegderAccountId] = @LegderAccountId AND [MonthYear] = @MonthYear

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatus]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReportPrecalculatedStatus]
	@CompanyNumber bigint, 
	@ReportId int, 
	@MonthYear int, 
	@Precalculated bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [ReportPrecalculatedStatus]
	SET [Precalculated] = @Precalculated
	WHERE [CompanyNumber] = @CompanyNumber AND [ReportId] = @ReportId AND [MonthYear] = @MonthYear

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatusByCompany]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReportPrecalculatedStatusByCompany]
	@CompanyNumber bigint,
	@Precalculated bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [ReportPrecalculatedStatus]
	SET [Precalculated] = @Precalculated
	WHERE [CompanyNumber] = @CompanyNumber

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateReportPrecalculatedStatusByCompanyMonthYear]    Script Date: 24/12/2019 10:05:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateReportPrecalculatedStatusByCompanyMonthYear]
	@CompanyNumber bigint,
	@MonthYear int,
	@Precalculated bit
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [ReportPrecalculatedStatus]
	SET [Precalculated] = @Precalculated
	WHERE [CompanyNumber] = @CompanyNumber AND [MonthYear] = @MonthYear

END
GO
