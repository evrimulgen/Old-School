BACKUP DATABASE [DB-SRV1\TESTLAB].UGTU TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Backup\Ugtu_testlab_backup' WITH NOFORMAT, NOINIT,  NAME = N'UGTU-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

exec [DB-SRV1\TESTLAB].master.dbo.sp_executesql 'BACKUP DATABASE UGTU to disk=''\\Server\Backup\User\UGTU_LinkedTest.bak'''
