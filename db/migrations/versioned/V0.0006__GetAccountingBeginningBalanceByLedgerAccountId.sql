IF EXISTS (SELECT * FROM sysobjects WHERE name='GetAccountingBeginningBalanceByLedgerAccountId') BEGIN
	DROP PROCEDURE GetAccountingBeginningBalanceByLedgerAccountId
END
GO
CREATE PROCEDURE [dbo].[GetAccountingBeginningBalanceByLedgerAccountId]
@CompanyNumber BIGINT,
@LedgerAccountId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	*
	FROM	[dbo].[ViewAccountingBeginningBalance]
	WHERE [LedgerAccountId] = @LedgerAccountId
	AND [CompanyNumber] = @CompanyNumber
END
GO