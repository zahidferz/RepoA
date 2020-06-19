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
	SET @LedgerAccountsPendingChanges = (SELECT TOP 1 LedgerAccountsPendingChanges FROM [dbo].[ViewReportPrecalculatedStatus] WHERE [CompanyNumber] = @CompanyNumber AND ReportId = @ReportId ORDER BY LedgerAccountsPendingChanges DESC)

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
	SET @JournalEntriesPendingChanges = (SELECT TOP 1 JournalEntriesPendingChanges FROM [dbo].[ViewReportPrecalculatedStatus] WHERE [CompanyNumber] = @CompanyNumber AND ReportId = @ReportId ORDER BY JournalEntriesPendingChanges DESC)

	SELECT ISNULL(@JournalEntriesPendingChanges, 1)
END
GO