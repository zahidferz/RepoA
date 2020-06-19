
IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_JournalEntryChanges_CompanyNumber') BEGIN
	DROP INDEX [ix_JournalEntryChanges_CompanyNumber] ON [dbo].[JournalEntryChanges]
END
GO

CREATE INDEX [ix_JournalEntryChanges_CompanyNumber] ON [dbo].[JournalEntryChanges] ( [CompanyNumber]) WITH (ONLINE=ON, SORT_IN_TEMPDB=ON);
GO


IF EXISTS (SELECT * FROM sys.indexes WHERE name='ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear') BEGIN
	DROP INDEX [ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear] ON [dbo].[ReportPrecalculatedStatus]
END
GO

CREATE INDEX [ix_ReportPrecalculatedStatus_CompanyNumber_ReportId_MonthYear] ON [dbo].[ReportPrecalculatedStatus] ( [CompanyNumber], [ReportId], [MonthYear]) WITH (ONLINE=ON, SORT_IN_TEMPDB=ON);
GO