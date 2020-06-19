/****** Object:  StoredProcedure [dbo].[GetCompanyLedgerAccount]    Script Date: 07/01/2020 04:08:26 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetCompanyLedgerAccount')
	DROP PROCEDURE [dbo].[GetCompanyLedgerAccount]
GO

CREATE PROCEDURE [dbo].[GetCompanyLedgerAccount]
	@CompanyNumber bigint,
	@LedgerAccountId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewCompanyLedgerAccount]
	WHERE [CompanyNumber] = @CompanyNumber AND [LedgerAccountId] = @LedgerAccountId

END
GO

/****** Object:  Table [dbo].[JournalEntryChanges]    Script Date: 24/12/2019 10:05:04 a. m. ******/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_AccountingBeginningBalance_CompanyLedgerAccount')
	ALTER TABLE [dbo].[AccountingBeginningBalance] DROP CONSTRAINT [FK_AccountingBeginningBalance_CompanyLedgerAccount]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='AccountingBeginningBalance')
	DROP TABLE [dbo].[AccountingBeginningBalance]
GO

/****** Object:  Table [dbo].[AccountingBeginningBalance]    Script Date: 07/01/2020 06:10:45 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AccountingBeginningBalance](
	[LedgerAccountId] [uniqueidentifier] NOT NULL,
	[BeginningBalance] [decimal](24, 6) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AccountingBeginningBalance]  WITH CHECK ADD  CONSTRAINT [FK_AccountingBeginningBalance_CompanyLedgerAccount] FOREIGN KEY([LedgerAccountId])
REFERENCES [dbo].[CompanyLedgerAccount] ([LedgerAccountId])
GO

ALTER TABLE [dbo].[AccountingBeginningBalance] CHECK CONSTRAINT [FK_AccountingBeginningBalance_CompanyLedgerAccount]
GO

/****** Object:  StoredProcedure [dbo].[DeleteAccountingBeginningBalance]    Script Date: 07/01/2020 06:13:41 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteAccountingBeginningBalance')
	DROP PROCEDURE [dbo].[DeleteAccountingBeginningBalance]
GO

CREATE PROCEDURE [dbo].[DeleteAccountingBeginningBalance]
	@LedgerAccountId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [AccountingBeginningBalance]
	WHERE [LedgerAccountId] = @LedgerAccountId

END
GO

/****** Object:  StoredProcedure [dbo].[InsertAccountingBeginningBalance]    Script Date: 07/01/2020 06:13:59 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertAccountingBeginningBalance')
	DROP PROCEDURE [dbo].[InsertAccountingBeginningBalance]
GO

CREATE PROCEDURE [dbo].[InsertAccountingBeginningBalance]
	@LedgerAccountId uniqueidentifier, 
	@BeginningBalance decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [AccountingBeginningBalance] ([LedgerAccountId],[BeginningBalance])
	VALUES (@LedgerAccountId, @BeginningBalance)

END
GO

/****** Object:  StoredProcedure [dbo].[UpdateAccountingBeginningBalance]    Script Date: 07/01/2020 06:14:05 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateAccountingBeginningBalance')
	DROP PROCEDURE [dbo].[UpdateAccountingBeginningBalance]
GO

CREATE PROCEDURE [dbo].[UpdateAccountingBeginningBalance]
	@LedgerAccountId uniqueidentifier, 
	@BeginningBalance decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [AccountingBeginningBalance]
	SET [BeginningBalance] = @BeginningBalance
	WHERE [LedgerAccountId] = @LedgerAccountId
END
GO

/****** Object:  View [dbo].[ViewAccountingBeginningBalance]    Script Date: 07/01/2020 06:17:26 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewAccountingBeginningBalance')
	DROP VIEW [dbo].[ViewAccountingBeginningBalance]
GO

CREATE VIEW [dbo].[ViewAccountingBeginningBalance]
AS
	SELECT	 [ABB].[LedgerAccountId], [ABB].[BeginningBalance]
	FROM	[dbo].[AccountingBeginningBalance] [ABB] WITH(NOLOCK)

GO

/****** Object:  StoredProcedure [dbo].[GetAccountingBeginningBalanceByLegderAccountId]    Script Date: 07/01/2020 06:13:52 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetAccountingBeginningBalanceByLegderAccountId')
	DROP PROCEDURE [dbo].[GetAccountingBeginningBalanceByLegderAccountId]
GO

CREATE PROCEDURE [dbo].[GetAccountingBeginningBalanceByLegderAccountId]
	@LedgerAccountId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewAccountingBeginningBalance]
	WHERE [LedgerAccountId] = @LedgerAccountId
END
GO

/****** Object:  Table [dbo].[ClosedPeriodBalance]    Script Date: 07/01/2020 06:20:04 p. m. ******/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_ClosedPeriodBalance_CompanyLedgerAccount')
	ALTER TABLE [dbo].[ClosedPeriodBalance] DROP CONSTRAINT [FK_ClosedPeriodBalance_CompanyLedgerAccount]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='ClosedPeriodBalance')
	DROP TABLE [dbo].[ClosedPeriodBalance]
GO

CREATE TABLE [dbo].[ClosedPeriodBalance](
	[LedgerAccountId] [uniqueidentifier] NOT NULL,
	[MonthYear] [int] NOT NULL,
	[FinalBalance] [decimal](24, 6) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ClosedPeriodBalance]  WITH CHECK ADD  CONSTRAINT [FK_ClosedPeriodBalance_CompanyLedgerAccount] FOREIGN KEY([LedgerAccountId])
REFERENCES [dbo].[CompanyLedgerAccount] ([LedgerAccountId])
GO

ALTER TABLE [dbo].[ClosedPeriodBalance] CHECK CONSTRAINT [FK_ClosedPeriodBalance_CompanyLedgerAccount]
GO

/****** Object:  StoredProcedure [dbo].[InsertClosedPeriodBalance]    Script Date: 07/01/2020 06:22:04 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertClosedPeriodBalance')
	DROP PROCEDURE [dbo].[InsertClosedPeriodBalance]
GO

CREATE PROCEDURE [dbo].[InsertClosedPeriodBalance]
	@LedgerAccountId uniqueidentifier, 
	@MonthYear int, 
	@FinalBalance decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [ClosedPeriodBalance] ([LedgerAccountId],[MonthYear],[FinalBalance])
	VALUES (@LedgerAccountId, @MonthYear, @FinalBalance)

END

GO

/****** Object:  StoredProcedure [dbo].[UpdateClosedPeriodBalance]    Script Date: 07/01/2020 06:22:13 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdateClosedPeriodBalance')
	DROP PROCEDURE [dbo].[UpdateClosedPeriodBalance]
GO

CREATE PROCEDURE [dbo].[UpdateClosedPeriodBalance]
	@LedgerAccountId uniqueidentifier, 
	@MonthYear int, 
	@FinalBalance decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [ClosedPeriodBalance]
	SET [FinalBalance] = @FinalBalance
	WHERE [LedgerAccountId] = @LedgerAccountId AND [MonthYear] = @MonthYear

END

GO

/****** Object:  StoredProcedure [dbo].[DeleteClosedPeriodBalance]    Script Date: 07/01/2020 06:22:21 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteClosedPeriodBalance')
	DROP PROCEDURE [dbo].[DeleteClosedPeriodBalance]
GO

CREATE PROCEDURE [dbo].[DeleteClosedPeriodBalance]
	@LedgerAccountId uniqueidentifier, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [ClosedPeriodBalance]
	WHERE [LedgerAccountId] = @LedgerAccountId AND [MonthYear] = @MonthYear

END

GO

/****** Object:  View [dbo].[ViewClosedPeriodBalance]    Script Date: 07/01/2020 06:24:17 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewClosedPeriodBalance')
	DROP VIEW [dbo].[ViewClosedPeriodBalance]
GO

CREATE VIEW [dbo].[ViewClosedPeriodBalance]
AS
	SELECT	 [CPB].[LedgerAccountId], [CPB].[MonthYear], [CPB].[FinalBalance]
	FROM	[dbo].[ClosedPeriodBalance] [CPB] WITH(NOLOCK)

GO

/****** Object:  StoredProcedure [dbo].[GetClosedPeriodBalance]    Script Date: 07/01/2020 06:22:28 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetClosedPeriodBalance')
	DROP PROCEDURE [dbo].[GetClosedPeriodBalance]
GO

CREATE PROCEDURE [dbo].[GetClosedPeriodBalance]
	@LedgerAccountId uniqueidentifier, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewClosedPeriodBalance]
	WHERE [LedgerAccountId] = @LedgerAccountId AND [MonthYear] = @MonthYear

END
GO

/****** Object:  StoredProcedure [dbo].[GetAccountingBeginningBalanceByLegderAccountId]    Script Date: 07/01/2020 06:26:17 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetAccountingBeginningBalanceByLegderAccountId')
	DROP PROCEDURE [dbo].[GetAccountingBeginningBalanceByLegderAccountId]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='GetAccountingBeginningBalanceByLedgerAccountId')
	DROP PROCEDURE [dbo].[GetAccountingBeginningBalanceByLedgerAccountId]
GO

CREATE PROCEDURE [dbo].[GetAccountingBeginningBalanceByLedgerAccountId]
	@LedgerAccountId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewAccountingBeginningBalance]
	WHERE [LedgerAccountId] = @LedgerAccountId
END
GO


/****** Object:  Table [dbo].[Precalculated]    Script Date: 07/01/2020 06:27:54 p. m. ******/
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name='FK_Precalculated_CompanyLedgerAccount')
	ALTER TABLE [dbo].[Precalculated] DROP CONSTRAINT [FK_Precalculated_CompanyLedgerAccount]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='Precalculated')
	DROP TABLE [dbo].[Precalculated]
GO


CREATE TABLE [dbo].[Precalculated](
	[LedgerAccountId] [uniqueidentifier] NOT NULL,
	[MonthYear] [int] NOT NULL,
	[Credit] [decimal](24, 6) NOT NULL,
	[Debit] [decimal](24, 6) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Precalculated]  WITH CHECK ADD  CONSTRAINT [FK_Precalculated_CompanyLedgerAccount] FOREIGN KEY([LedgerAccountId])
REFERENCES [dbo].[CompanyLedgerAccount] ([LedgerAccountId])
GO

ALTER TABLE [dbo].[Precalculated] CHECK CONSTRAINT [FK_Precalculated_CompanyLedgerAccount]
GO

/****** Object:  StoredProcedure [dbo].[InsertPrecalculated]    Script Date: 07/01/2020 06:30:23 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertPrecalculated')
	DROP PROCEDURE [dbo].[InsertPrecalculated]
GO

CREATE PROCEDURE [dbo].[InsertPrecalculated]
	@LedgerAccountId uniqueidentifier, 
	@MonthYear int, 
	@Credit decimal(24,6), 
	@Debit decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Precalculated] ([LedgerAccountId],[MonthYear],[Credit],[Debit])
	VALUES (@LedgerAccountId, @MonthYear, @Credit, @Debit)

END
GO

/****** Object:  StoredProcedure [dbo].[UpdatePrecalculated]    Script Date: 07/01/2020 06:30:45 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdatePrecalculated')
	DROP PROCEDURE [dbo].[UpdatePrecalculated]
GO

CREATE PROCEDURE [dbo].[UpdatePrecalculated]
	@LedgerAccountId uniqueidentifier, 
	@MonthYear int, 
	@Credit decimal(24,6), 
	@Debit decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [Precalculated]
	SET [Credit] = @Credit,
		[Debit] = @Debit
	WHERE [LedgerAccountId] = @LedgerAccountId AND [MonthYear] = @MonthYear

END
GO

/****** Object:  StoredProcedure [dbo].[DeletePrecalculated]    Script Date: 07/01/2020 06:30:56 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='DeletePrecalculated')
	DROP PROCEDURE [dbo].[DeletePrecalculated]
GO
CREATE PROCEDURE [dbo].[DeletePrecalculated]
	@LedgerAccountId uniqueidentifier, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [Precalculated]
	WHERE [LedgerAccountId] = @LedgerAccountId AND [MonthYear] = @MonthYear

END
GO

/****** Object:  View [dbo].[ViewPrecalculated]    Script Date: 07/01/2020 06:32:30 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewPrecalculated')
	DROP VIEW [dbo].[ViewPrecalculated]
GO

CREATE VIEW [dbo].[ViewPrecalculated]
AS
	SELECT	 [P].[LedgerAccountId], [P].[MonthYear], [P].[Credit], [P].[Debit]
	FROM	[dbo].[Precalculated] [P] WITH(NOLOCK)

GO

/****** Object:  StoredProcedure [dbo].[GetPrecalculated]    Script Date: 07/01/2020 06:31:03 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetPrecalculated')
	DROP PROCEDURE [dbo].[GetPrecalculated]
GO

CREATE PROCEDURE [dbo].[GetPrecalculated]
	@LedgerAccountId uniqueidentifier, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewPrecalculated]
	WHERE [LedgerAccountId] = @LedgerAccountId AND [MonthYear] = @MonthYear

END
GO
