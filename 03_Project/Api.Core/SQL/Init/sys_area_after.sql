USE [apicore]
GO

-- 添加索引
CREATE NONCLUSTERED INDEX [idx_area] ON [dbo].[sys_area]
(
	[administrative_division] ASC,
	[area_code] ASC,
	[level] ASC,
	[is_enabled] ASC,
	[is_delete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- 为parent_id、parent_ids赋值上一级id【执行后[level]=1数值正确】
DECLARE @commit TINYINT;
SELECT @commit = 0;-- 0:事务回滚,1:事务提交;测试设置0,要提交设置1;
BEGIN TRAN
	PRINT '事务开始'
	/* 开始执行 */
	DECLARE @id bigint;
	DECLARE @pid bigint;
	DECLARE @pids nvarchar(150);
	DECLARE @pdivision nvarchar(12);

	-- 定义游标
	DECLARE mycursor CURSOR FOR (SELECT id,parent_division FROM sys_area)-- 集合放到游标中
	OPEN mycursor;-- 打开游标
	FETCH NEXT FROM mycursor INTO @id,@pdivision;-- 变量数量必须与游标结果列数相同
	WHILE @@FETCH_STATUS = 0-- 开始循环
	BEGIN
		-- PRINT CONVERT(varchar,@id)+'_'+CONVERT(varchar,@pid);-- 打印
		-- SELECT 1
		IF EXISTS(SELECT id FROM sys_area WHERE administrative_division=@pdivision)
		BEGIN
			SELECT @pid = id FROM sys_area WHERE administrative_division=@pdivision;
			SELECT @pids = '_' + CONVERT(nvarchar, @pid) + '_';
		END
		ELSE
		BEGIN
			SELECT @pid = 0;
			SELECT @pids = '_0_';
		END
		UPDATE sys_area SET parent_id=@pid,parent_ids=@pids WHERE id=@id;
	FETCH NEXT FROM mycursor INTO @id,@pdivision;-- 下一行数据
	END
	CLOSE mycursor-- 关闭游标
	DEALLOCATE mycursor-- 释放游标
	
	-- select * from sys_area where administrative_division LIKE '35%'

/* 执行功能结束 */
IF(@commit = 1)
BEGIN
	PRINT '事务提交'
	COMMIT TRAN
END
ELSE
BEGIN
	PRINT '事务回滚'
	ROLLBACK TRAN
END
GO

-- 调整parent_ids【[level]=2】
UPDATE sys_area SET parent_ids = '_0' + parent_ids WHERE [level]=2;
GO

-- 调整parent_ids【[level]=3】
DECLARE @commit TINYINT;
SELECT @commit = 0;-- 0:事务回滚,1:事务提交;测试设置0,要提交设置1;
BEGIN TRAN
	PRINT '事务开始'
	/* 开始执行 */
	DECLARE @id bigint;
	DECLARE @pid bigint;
	DECLARE @pids nvarchar(150);

	-- 定义游标
	DECLARE mycursor CURSOR FOR (SELECT id,parent_id FROM sys_area WHERE [level]=3)-- 集合放到游标中
	OPEN mycursor;-- 打开游标
	FETCH NEXT FROM mycursor INTO @id,@pid;-- 变量数量必须与游标结果列数相同
	WHILE @@FETCH_STATUS = 0-- 开始循环
	BEGIN
		-- PRINT CONVERT(varchar,@id)+'_'+CONVERT(varchar,@pid);-- 打印
		-- SELECT 1
		SELECT @pids = parent_ids FROM sys_area WHERE id=@pid;
		-- PRINT @pids
		UPDATE sys_area SET parent_ids=@pids+SUBSTRING(parent_ids,2,LEN(parent_ids)) WHERE id=@id;
	FETCH NEXT FROM mycursor INTO @id,@pid;-- 下一行数据
	END
	CLOSE mycursor-- 关闭游标
	DEALLOCATE mycursor-- 释放游标
	
	-- select * from sys_area where id=3

/* 执行功能结束 */
IF(@commit = 1)
BEGIN
	PRINT '事务提交'
	COMMIT TRAN
END
ELSE
BEGIN
	PRINT '事务回滚'
	ROLLBACK TRAN
END
GO

-- 调整parent_ids【[level]=4】
DECLARE @commit TINYINT;
SELECT @commit = 0;-- 0:事务回滚,1:事务提交;测试设置0,要提交设置1;
BEGIN TRAN
	PRINT '事务开始'
	/* 开始执行 */
	DECLARE @id bigint;
	DECLARE @pid bigint;
	DECLARE @pids nvarchar(150);

	-- 定义游标
	DECLARE mycursor CURSOR FOR (SELECT id,parent_id FROM sys_area WHERE [level]=4)-- 集合放到游标中
	OPEN mycursor;-- 打开游标
	FETCH NEXT FROM mycursor INTO @id,@pid;-- 变量数量必须与游标结果列数相同
	WHILE @@FETCH_STATUS = 0-- 开始循环
	BEGIN
		-- PRINT CONVERT(varchar,@id)+'_'+CONVERT(varchar,@pid);-- 打印
		-- SELECT 1
		SELECT @pids = parent_ids FROM sys_area WHERE id=@pid;
		-- PRINT @pids
		UPDATE sys_area SET parent_ids=@pids+SUBSTRING(parent_ids,2,LEN(parent_ids)) WHERE id=@id;
	FETCH NEXT FROM mycursor INTO @id,@pid;-- 下一行数据
	END
	CLOSE mycursor-- 关闭游标
	DEALLOCATE mycursor-- 释放游标
	
	-- select * from sys_area where id=3

/* 执行功能结束 */
IF(@commit = 1)
BEGIN
	PRINT '事务提交'
	COMMIT TRAN
END
ELSE
BEGIN
	PRINT '事务回滚'
	ROLLBACK TRAN
END
GO

-- 调整parent_ids【[level]=5】
DECLARE @commit TINYINT;
SELECT @commit = 0;-- 0:事务回滚,1:事务提交;测试设置0,要提交设置1;
BEGIN TRAN
	PRINT '事务开始'
	/* 开始执行 */
	DECLARE @id bigint;
	DECLARE @pid bigint;
	DECLARE @pids nvarchar(150);

	-- 定义游标
	DECLARE mycursor CURSOR FOR (SELECT id,parent_id FROM sys_area WHERE [level]=5)-- 集合放到游标中
	OPEN mycursor;-- 打开游标
	FETCH NEXT FROM mycursor INTO @id,@pid;-- 变量数量必须与游标结果列数相同
	WHILE @@FETCH_STATUS = 0-- 开始循环
	BEGIN
		-- PRINT CONVERT(varchar,@id)+'_'+CONVERT(varchar,@pid);-- 打印
		-- SELECT 1
		SELECT @pids = parent_ids FROM sys_area WHERE id=@pid;
		-- PRINT @pids
		UPDATE sys_area SET parent_ids=@pids+SUBSTRING(parent_ids,2,LEN(parent_ids)) WHERE id=@id;
	FETCH NEXT FROM mycursor INTO @id,@pid;-- 下一行数据
	END
	CLOSE mycursor-- 关闭游标
	DEALLOCATE mycursor-- 释放游标
	
	-- select * from sys_area where id=3

/* 执行功能结束 */
IF(@commit = 1)
BEGIN
	PRINT '事务提交'
	COMMIT TRAN
END
ELSE
BEGIN
	PRINT '事务回滚'
	ROLLBACK TRAN
END
GO
