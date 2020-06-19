IF EXISTS (SELECT * FROM sysobjects WHERE name='InsertPrecalculated')
	DROP PROCEDURE [dbo].[InsertPrecalculated]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='UpdatePrecalculated')
	DROP PROCEDURE [dbo].[UpdatePrecalculated]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='SavePrecalculated')
	DROP PROCEDURE [dbo].[SavePrecalculated]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SavePrecalculated]
	@LedgerAccountId uniqueidentifier, 
	@MonthYear int, 
	@Credit decimal(24,6), 
	@Debit decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM [Precalculated] WHERE LedgerAccountId = @LedgerAccountId AND MonthYear = @MonthYear)
		UPDATE [Precalculated]
		SET [Credit] = [Credit] + @Credit,
			[Debit] = [Debit] + @Debit
		WHERE [LedgerAccountId] = @LedgerAccountId AND [MonthYear] = @MonthYear
	ELSE
		INSERT INTO [Precalculated] ([LedgerAccountId],[MonthYear],[Credit],[Debit])
		VALUES (@LedgerAccountId, @MonthYear, @Credit, @Debit)

END
GO

/****** Object:  View [dbo].[ViewAccountingBeginningBalance]    Script Date: 15/01/2020 12:13:32 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewAccountingBeginningBalance')
	DROP VIEW [dbo].[ViewAccountingBeginningBalance]
GO

CREATE VIEW [dbo].[ViewAccountingBeginningBalance]
AS
	SELECT	[CLA].[CompanyNumber], [ABB].[LedgerAccountId], [ABB].[BeginningBalance]
	FROM	[dbo].[AccountingBeginningBalance] [ABB] WITH(NOLOCK) JOIN
			[dbo].[CompanyLedgerAccount] [CLA] WITH(NOLOCK) ON [ABB].LedgerAccountId = [CLA].LedgerAccountId

GO

/****** Object:  StoredProcedure [dbo].[GetAccountingBeginningBalanceByCompany]    Script Date: 15/01/2020 12:12:14 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetAccountingBeginningBalanceByCompany')
	DROP PROCEDURE [dbo].[GetAccountingBeginningBalanceByCompany]
GO

CREATE PROCEDURE [dbo].[GetAccountingBeginningBalanceByCompany]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewAccountingBeginningBalance]
	WHERE	[CompanyNumber] = @CompanyNumber
END
GO

/****** Object:  View [dbo].[ViewClosedPeriodBalance]    Script Date: 15/01/2020 12:47:21 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewClosedPeriodBalance')
	DROP VIEW [dbo].[ViewClosedPeriodBalance]
GO

CREATE VIEW [dbo].[ViewClosedPeriodBalance]
AS
	SELECT	[CLA].[CompanyNumber], [CPB].[LedgerAccountId], [CPB].[MonthYear], [CPB].[FinalBalance]
	FROM	[dbo].[ClosedPeriodBalance] [CPB] WITH(NOLOCK)JOIN
			[dbo].[CompanyLedgerAccount] [CLA] WITH(NOLOCK) ON [CPB].LedgerAccountId = [CLA].LedgerAccountId
GO

/****** Object:  StoredProcedure [dbo].[GetClosedPeriodBalance]    Script Date: 15/01/2020 12:46:13 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetClosedPeriodBalance')
	DROP PROCEDURE [dbo].[GetClosedPeriodBalance]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='GetClosedPeriodBalanceByCompany')
	DROP PROCEDURE [dbo].[GetClosedPeriodBalanceByCompany]
GO

CREATE PROCEDURE [dbo].[GetClosedPeriodBalanceByCompany]
	@CompanyNumber bigint,
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewClosedPeriodBalance]
	WHERE	[CompanyNumber] = @CompanyNumber AND [MonthYear] = @MonthYear

END
GO

/****** Object:  View [dbo].[ViewPrecalculated]    Script Date: 15/01/2020 03:50:23 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='ViewPrecalculated')
	DROP VIEW [dbo].[ViewPrecalculated]
GO

CREATE VIEW [dbo].[ViewPrecalculated]
AS
	SELECT	[CLA].[CompanyNumber], [P].[LedgerAccountId], [P].[MonthYear], [P].[Credit], [P].[Debit]
	FROM	[dbo].[Precalculated] [P] WITH(NOLOCK) JOIN
			[dbo].[CompanyLedgerAccount] [CLA] WITH(NOLOCK) ON [P].LedgerAccountId = [CLA].LedgerAccountId
GO

/****** Object:  StoredProcedure [dbo].[GetPrecalculatedByCompany    Script Date: 15/01/2020 03:47:51 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='GetPrecalculatedByCompany')
	DROP PROCEDURE [dbo].[GetPrecalculatedByCompany]
GO

CREATE PROCEDURE [dbo].[GetPrecalculatedByCompany]
	@CompanyNumber bigint, 
	@MonthYear int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewPrecalculated]
	WHERE	[CompanyNumber] = @CompanyNumber AND [MonthYear] = @MonthYear

END
GO


