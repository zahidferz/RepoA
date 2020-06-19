IF EXISTS (SELECT * FROM sysobjects WHERE name='DeleteClosedPeriodBalanceByLedgerAccountId')
	DROP PROCEDURE [dbo].[DeleteClosedPeriodBalanceByLedgerAccountId]
GO
CREATE PROCEDURE [dbo].[DeleteClosedPeriodBalanceByLedgerAccountId]
	@LedgerAccountId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [ClosedPeriodBalance]
	WHERE [LedgerAccountId] = @LedgerAccountId

END
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='DeletePrecalculatedByLedgerAccount')
	DROP PROCEDURE [dbo].[DeletePrecalculatedByLedgerAccount]
GO
CREATE PROCEDURE [dbo].[DeletePrecalculatedByLedgerAccount]
	@LedgerAccountId uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON;

	DELETE [Precalculated]
	WHERE [LedgerAccountId] = @LedgerAccountId

END

GO

IF EXISTS (SELECT * FROM sysobjects WHERE name='GetLedgerAccountsValidateExistsByCompany')
	DROP PROCEDURE [dbo].[GetLedgerAccountsValidateExistsByCompany]
GO

CREATE PROCEDURE [dbo].[GetLedgerAccountsValidateExistsByCompany]
	@CompanyNumber bigint
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT *	FROM [dbo].[ViewCompanyLedgerAccount] WHERE [CompanyNumber] = @CompanyNumber) BEGIN
		SELECT 1
	END ELSE BEGIN
		SELECT 0
	END
END