
IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_Precalculated_LedgerAccountId_MonthYear') BEGIN
	DROP INDEX [ix_Precalculated_LedgerAccountId_MonthYear] ON [dbo].[Precalculated]
END
GO

IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_Precalculated_LedgerAccountId_MonthYear_includes') BEGIN
	DROP INDEX [ix_Precalculated_LedgerAccountId_MonthYear_includes] ON [dbo].[Precalculated]
END
GO

CREATE INDEX [ix_Precalculated_LedgerAccountId_MonthYear_includes] ON [dbo].[Precalculated] ([LedgerAccountId], [MonthYear]) INCLUDE ([Credit], [Debit]) WITH (ONLINE=ON, SORT_IN_TEMPDB=ON);
GO

IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_Precalculated_MonthYear_includes') BEGIN
	DROP INDEX [ix_Precalculated_MonthYear_includes] ON [dbo].[Precalculated]
END
GO

CREATE INDEX [ix_Precalculated_MonthYear_includes] ON [dbo].[Precalculated] ([MonthYear]) INCLUDE ([LedgerAccountId], [Credit], [Debit]) WITH (ONLINE=ON, SORT_IN_TEMPDB=ON);
GO





IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear') BEGIN
	DROP INDEX [ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear] ON [dbo].[ReportPrecalculatedStatus]
END
GO


IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear_includes') BEGIN
	DROP INDEX [ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear_includes] ON [dbo].[ReportPrecalculatedStatus] 
END
GO

CREATE INDEX [ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear_includes] ON [dbo].[ReportPrecalculatedStatus] ([CompanyNumber], [ReportId], [MonthYear]) INCLUDE ([LedgerAccountsPendingChanges], [JournalEntriesPendingChanges], [UrlFile]) WITH (ONLINE=ON, SORT_IN_TEMPDB=ON);
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

	IF EXISTS (SELECT 1 FROM [ReportPrecalculatedStatus] WITH (NOLOCK)  WHERE [CompanyNumber] = @CompanyNumber AND [ReportId] = @ReportId AND [MonthYear] = @MonthYear)
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