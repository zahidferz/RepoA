
IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_AccountingBeginningBalance_LedgerAccountId') BEGIN
	DROP INDEX [ix_AccountingBeginningBalance_LedgerAccountId] ON [dbo].[AccountingBeginningBalance]
END
GO

CREATE INDEX [ix_AccountingBeginningBalance_LedgerAccountId] ON [dbo].[AccountingBeginningBalance] ([LedgerAccountId]) WITH (ONLINE=ON, SORT_IN_TEMPDB=ON);
GO