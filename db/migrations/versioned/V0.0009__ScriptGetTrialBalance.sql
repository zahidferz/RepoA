IF EXISTS (SELECT * FROM sysobjects WHERE name='GetLedgerAccountPendingChanges')
	DROP PROCEDURE [dbo].[GetLedgerAccountPendingChanges]
GO

CREATE PROCEDURE [dbo].[GetLedgerAccountPendingChanges]
	@CompanyNumber bigint, 
	@ReportId int
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT	*
		FROM	[dbo].[ViewReportPrecalculatedStatus]
		WHERE [CompanyNumber] = @CompanyNumber AND LedgerAccountsPendingChanges = 1 AND ReportId = @ReportId) BEGIN
		SELECT 1 
	END ELSE BEGIN
		SELECT 0 
	END
END

GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='GetCompanyLedgerAccountByCompany')
	DROP PROCEDURE [dbo].[GetCompanyLedgerAccountByCompany]
GO

CREATE PROCEDURE [dbo].[GetCompanyLedgerAccountByCompany]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewCompanyLedgerAccount]
	WHERE [CompanyNumber] = @CompanyNumber
END

GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='GetReportPrecalculatedStatusPendingChanges')
	DROP PROCEDURE [dbo].[GetReportPrecalculatedStatusPendingChanges]
GO

CREATE PROCEDURE [dbo].[GetReportPrecalculatedStatusPendingChanges]
	@CompanyNumber bigint, 
	@ReportId int
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT	*
		FROM	[dbo].[ViewReportPrecalculatedStatus]
		WHERE [CompanyNumber] = @CompanyNumber 
		AND [ReportId] = @ReportId 
		AND JournalEntriesPendingChanges = 1) 
	BEGIN
		SELECT 1 
	END
	ELSE BEGIN
		SELECT 0
	END
END

GO