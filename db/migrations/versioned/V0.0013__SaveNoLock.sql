
/****** Object:  StoredProcedure [dbo].[SavePrecalculated]    Script Date: 17/02/2020 06:38:02 p. m. ******/
IF EXISTS (SELECT * FROM sysobjects WHERE name='SavePrecalculated')
	DROP PROCEDURE [dbo].[SavePrecalculated]
GO


CREATE PROCEDURE [dbo].[SavePrecalculated]
	@LedgerAccountId uniqueidentifier, 
	@MonthYear int, 
	@Credit decimal(24,6), 
	@Debit decimal(24,6)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM [Precalculated] WITH (NOLOCK) WHERE LedgerAccountId = @LedgerAccountId AND MonthYear = @MonthYear)
		UPDATE [Precalculated]
		SET [Credit] = [Credit] + @Credit,
			[Debit] = [Debit] + @Debit
		WHERE [LedgerAccountId] = @LedgerAccountId AND [MonthYear] = @MonthYear
	ELSE
		INSERT INTO [Precalculated] ([LedgerAccountId],[MonthYear],[Credit],[Debit])
		VALUES (@LedgerAccountId, @MonthYear, @Credit, @Debit)

END
GO


/****** Object:  StoredProcedure [dbo].[SaveReportPrecalculatedStatus]    Script Date: 17/02/2020 06:39:08 p. m. ******/
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