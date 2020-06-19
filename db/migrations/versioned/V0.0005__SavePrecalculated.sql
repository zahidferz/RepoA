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