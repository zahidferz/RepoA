IF EXISTS (SELECT * FROM sysobjects WHERE name='GetReportPrecalculatedStatusByCompany')
	DROP PROCEDURE [dbo].[GetReportPrecalculatedStatusByCompany]
GO

CREATE PROCEDURE [dbo].[GetReportPrecalculatedStatusByCompany]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewReportPrecalculatedStatus]
	WHERE [CompanyNumber] = @CompanyNumber

END
GO