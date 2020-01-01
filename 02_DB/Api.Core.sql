/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2019/12/3 17:23:04                           */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_Area')
            and   type = 'U')
   drop table Sys_Area
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_Attachment')
            and   type = 'U')
   drop table Sys_Attachment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_Authorize')
            and   type = 'U')
   drop table Sys_Authorize
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_DBBackup')
            and   type = 'U')
   drop table Sys_DBBackup
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_Dept')
            and   type = 'U')
   drop table Sys_Dept
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_Dict')
            and   type = 'U')
   drop table Sys_Dict
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_Element')
            and   type = 'U')
   drop table Sys_Element
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_GrpRole')
            and   type = 'U')
   drop table Sys_GrpRole
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_GrpUser')
            and   type = 'U')
   drop table Sys_GrpUser
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_Job')
            and   type = 'U')
   drop table Sys_Job
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_JobHistory')
            and   type = 'U')
   drop table Sys_JobHistory
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_Log')
            and   type = 'U')
   drop table Sys_Log
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_Menu')
            and   type = 'U')
   drop table Sys_Menu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_ModuleForm')
            and   type = 'U')
   drop table Sys_ModuleForm
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_OperateBtn')
            and   type = 'U')
   drop table Sys_OperateBtn
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_Role')
            and   type = 'U')
   drop table Sys_Role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_RoleGrpUser')
            and   type = 'U')
   drop table Sys_RoleGrpUser
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_User')
            and   type = 'U')
   drop table Sys_User
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_UserGrpUser')
            and   type = 'U')
   drop table Sys_UserGrpUser
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Sys_UserRole')
            and   type = 'U')
   drop table Sys_UserRole
go

/*==============================================================*/
/* Table: Sys_Area                                              */
/*==============================================================*/
create table Sys_Area (
   Id                   int                  identity,
   ParentId             int                  null,
   AdministrativeDivision char(9)              null,
   AreaCode             char(6)              not null,
   AreaName             nvarchar(20)         not null,
   SimpleName           nvarchar(20)         null,
   Level                tinyint              not null
      constraint CKC_LEVEL_SYS_AREA check (Level between 0 and 4),
   Sort                 smallint             null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  null default 1
      constraint CKC_ISENABLED_SYS_AREA check (IsEnabled is null or (IsEnabled between 0 and 1)),
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_AREA check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_AREA primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_Area') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_Area' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '地区表', 
   'user', @CurrentUser, 'table', 'Sys_Area'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParentId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'ParentId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级地区Id',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'ParentId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AdministrativeDivision')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'AdministrativeDivision'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '行政区划代码',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'AdministrativeDivision'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AreaCode')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'AreaCode'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮政编码',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'AreaCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AreaName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'AreaName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '地区名称',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'AreaName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SimpleName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'SimpleName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '简称',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'SimpleName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Level')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'Level'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '行政区划级别：0：国家；1：省级；2：地级；3：县级；4：乡级；',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'Level'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'IsEnabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_Area', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_Attachment                                        */
/*==============================================================*/
create table Sys_Attachment (
   Id                   int                  identity,
   AttaType             varchar(10)          null,
   ObjectId             int                  not null,
   FilePath             varchar(100)         not null,
   FileName             nvarchar(30)         not null,
   FileType             varchar(8)           not null,
   FileSize             decimal(7,2)         null,
   Sort                 tinyint              null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_ATTA check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   DeleteTime           datetime             null,
   constraint PK_SYS_ATTACHMENT primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_Attachment') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_Attachment' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '附件表', 
   'user', @CurrentUser, 'table', 'Sys_Attachment'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AttaType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'AttaType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类型',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'AttaType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ObjectId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'ObjectId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '对象Id',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'ObjectId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FilePath')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'FilePath'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件路径',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'FilePath'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FileName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'FileName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件名称',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'FileName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FileType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'FileType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件类型',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'FileType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FileSize')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'FileSize'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件大小：MB',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'FileSize'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_Attachment', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_Authorize                                         */
/*==============================================================*/
create table Sys_Authorize (
   Id                   int                  identity,
   ItemType             tinyint              not null
      constraint CKC_ITEMTYPE_SYS_AUTH check (ItemType between 1 and 5),
   ItemId               int                  not null,
   ObjectType           tinyint              not null
      constraint CKC_OBJECTTYPE_SYS_AUTH check (ObjectType between 1 and 3),
   ObjectId             int                  not null,
   Sort                 smallint             null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   CreateUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   constraint PK_SYS_AUTHORIZE primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_Authorize') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_Authorize' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '授权表', 
   'user', @CurrentUser, 'table', 'Sys_Authorize'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ItemType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'ItemType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目类型：1：菜单 SysMenu；2：页面元素 SysElement；3：操作按钮 SysOperateBtn；4：附件 SysAttachment；5：模块表单 SysModuleForm；',
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'ItemType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ItemId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'ItemId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目外键',
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'ItemId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ObjectType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'ObjectType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '对象类型：1：角色；2：用户；3：用户组；',
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'ObjectType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ObjectId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'ObjectId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '对象外键',
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'ObjectId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_Authorize', 'column', 'CreateTime'
go

/*==============================================================*/
/* Table: Sys_DBBackup                                          */
/*==============================================================*/
create table Sys_DBBackup (
   Id                   int                  identity,
   BackupType           tinyint              not null default 1
      constraint CKC_BACKUPTYPE_SYS_DBBA check (BackupType between 1 and 2),
   DBName               varchar(30)          not null,
   FileName             nvarchar(30)         not null,
   FileSize             decimal(7,2)         null,
   FilePath             varchar(100)         not null,
   Description          nvarchar(300)        null,
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_DBBA check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   DeleteTime           datetime             null,
   constraint PK_SYS_DBBACKUP primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_DBBackup') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_DBBackup' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '数据库备份表', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'BackupType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'BackupType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备份类型：1：完全备份；2：增量备份；',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'BackupType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DBName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'DBName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数据库名称',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'DBName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FileName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'FileName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件名称',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'FileName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FileSize')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'FileSize'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件大小',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'FileSize'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FilePath')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'FilePath'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件路径',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'FilePath'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_DBBackup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_DBBackup', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_Dept                                              */
/*==============================================================*/
create table Sys_Dept (
   Id                   int                  identity,
   ParentId             int                  null,
   DeptCode             varchar(10)          not null,
   DeptName             nvarchar(30)         not null,
   SimpleName           nvarchar(30)         null,
   DeptType             tinyint              not null
      constraint CKC_DEPTTYPE_SYS_DEPT check (DeptType between 1 and 3),
   Level                tinyint              null
      constraint CKC_LEVEL_SYS_DEPT check (Level is null or (Level between 1 and 4)),
   Seq                  tinyint              null,
   AreaId               int                  null,
   LeaderId             int                  null,
   Address              nvarchar(200)        null,
   Telephone            varchar(15)          null,
   Email                varchar(30)          null,
   IsAllowEdit          bit                  null default 1
      constraint CKC_ISALLOWEDIT_SYS_DEPT check (IsAllowEdit is null or (IsAllowEdit between 0 and 1)),
   IsAllowDelete        bit                  null default 0
      constraint CKC_ISALLOWDELETE_SYS_DEPT check (IsAllowDelete is null or (IsAllowDelete between 0 and 1)),
   Sort                 tinyint              null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  null default 1
      constraint CKC_ISENABLED_SYS_DEPT check (IsEnabled is null or (IsEnabled between 0 and 1)),
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_DEPT check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_DEPT primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_Dept') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_Dept' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '部门表', 
   'user', @CurrentUser, 'table', 'Sys_Dept'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParentId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'ParentId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级部门Id',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'ParentId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeptCode')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'DeptCode'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门编码',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'DeptCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeptName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'DeptName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门名称',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'DeptName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SimpleName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'SimpleName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '简称',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'SimpleName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeptType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'DeptType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '机构类型：1：公司；2：部门；3：小组；',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'DeptType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Level')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Level'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '机构等级：1：一级；2：二级；3：三级；4：四级；',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Level'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Seq')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Seq'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '当前层级顺序，升序',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Seq'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AreaId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'AreaId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属地区Id',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'AreaId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'LeaderId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'LeaderId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '负责人Id',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'LeaderId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Address')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Address'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '联系地址',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Address'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Telephone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Telephone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '固定电话',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Telephone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Email')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Email'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮箱',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Email'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsAllowEdit')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'IsAllowEdit'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否允许编辑：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'IsAllowEdit'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsAllowDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'IsAllowDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否允许删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'IsAllowDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'IsEnabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_Dept', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_Dict                                              */
/*==============================================================*/
create table Sys_Dict (
   Id                   int                  identity,
   ParentId             int                  null,
   Name                 nvarchar(30)         not null,
   Value                nvarchar(30)         not null,
   Type                 varchar(10)          null,
   Sort                 smallint             null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  null default 1
      constraint CKC_ISENABLED_SYS_DICT check (IsEnabled is null or (IsEnabled between 0 and 1)),
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_DICT check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_DICT primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_Dict') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_Dict' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '字典表', 
   'user', @CurrentUser, 'table', 'Sys_Dict'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParentId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'ParentId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级Id',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'ParentId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Value')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Value'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '值',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Value'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类型',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'IsEnabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_Dict', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_Element                                           */
/*==============================================================*/
create table Sys_Element (
   Id                   int                  identity,
   MenuId               int                  not null,
   ElemCode             varchar(10)          not null,
   ElemName             nvarchar(30)         not null,
   Location             varchar(50)          null,
   Sort                 tinyint              null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_ELEM check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_ELEMENT primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_Element') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_Element' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '页面元素表', 
   'user', @CurrentUser, 'table', 'Sys_Element'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MenuId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'MenuId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单Id',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'MenuId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ElemCode')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'ElemCode'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '元素编码',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'ElemCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ElemName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'ElemName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '元素名称',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'ElemName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Location')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'Location'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '位置',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'Location'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_Element', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_GrpRole                                           */
/*==============================================================*/
create table Sys_GrpRole (
   Id                   int                  identity,
   GrpRoleName          nvarchar(30)         not null,
   Sort                 tinyint              null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  null default 1
      constraint CKC_ISENABLED_SYS_GRPR check (IsEnabled is null or (IsEnabled between 0 and 1)),
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_GRPR check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_GRPROLE primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_GrpRole') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_GrpRole' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色组', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'GrpRoleName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'GrpRoleName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色组名称',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'GrpRoleName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'IsEnabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_GrpRole', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_GrpUser                                           */
/*==============================================================*/
create table Sys_GrpUser (
   Id                   int                  identity,
   ParentId             int                  null,
   GrpUserName          nvarchar(30)         not null,
   Sort                 tinyint              null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  null default 1
      constraint CKC_ISENABLED_SYS_GRPU check (IsEnabled is null or (IsEnabled between 0 and 1)),
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_GRPU check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_GRPUSER primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_GrpUser') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_GrpUser' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户组', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParentId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'ParentId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级Id',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'ParentId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'GrpUserName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'GrpUserName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户组名称',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'GrpUserName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'IsEnabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_GrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_GrpUser', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_Job                                               */
/*==============================================================*/
create table Sys_Job (
   Id                   int                  identity,
   JobName              nvarchar(30)         not null,
   Nickname             nvarchar(30)         null,
   DeptId               int                  not null,
   MinSalary            decimal(10,2)        null,
   MaxSalary            decimal(10,2)        null,
   Sort                 tinyint              null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  null default 1
      constraint CKC_ISENABLED_SYS_JOB check (IsEnabled is null or (IsEnabled between 0 and 1)),
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_JOB check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_JOB primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_Job') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_Job' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '岗位表', 
   'user', @CurrentUser, 'table', 'Sys_Job'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'JobName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'JobName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '岗位名称',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'JobName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Nickname')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'Nickname'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '昵称',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'Nickname'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeptId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'DeptId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门Id',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'DeptId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MinSalary')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'MinSalary'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最低薪资',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'MinSalary'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MaxSalary')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'MaxSalary'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最高薪资',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'MaxSalary'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'IsEnabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_Job', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_JobHistory                                        */
/*==============================================================*/
create table Sys_JobHistory (
   Id                   int                  identity,
   UserId               int                  not null,
   JobId                int                  not null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_JOBH check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   DeleteTime           datetime             null,
   constraint PK_SYS_JOBHISTORY primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_JobHistory') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_JobHistory' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '任职表', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_JobHistory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_JobHistory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'UserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户Id',
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'UserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_JobHistory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'JobId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'JobId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '岗位Id',
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'JobId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_JobHistory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_JobHistory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_JobHistory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_JobHistory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_JobHistory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_JobHistory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_JobHistory')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_JobHistory', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_Log                                               */
/*==============================================================*/
create table Sys_Log (
   Id                   int                  identity,
   LogType              tinyint              not null
      constraint CKC_LOGTYPE_SYS_LOG check (LogType between 1 and 5),
   IP                   varchar(20)          null,
   ModuleId             int                  not null,
   ModuleName           nvarchar(30)         null,
   RequestURL           varchar(100)         not null,
   Method               varchar(30)          null,
   Params               text                 null,
   IsSuccess            bit                  null
      constraint CKC_ISSUCCESS_SYS_LOG check (IsSuccess is null or (IsSuccess between 0 and 1)),
   Exception            text                 null,
   Description          nvarchar(300)        null,
   CreateUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   constraint PK_SYS_LOG primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_Log') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_Log' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '日志表', 
   'user', @CurrentUser, 'table', 'Sys_Log'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'LogType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'LogType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志类型：1：FATAL；2：ERROR；3：WARN；4：INFO；5：DEBUG；',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'LogType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IP')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'IP'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作IP',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'IP'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModuleId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'ModuleId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系统模块Id',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'ModuleId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModuleName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'ModuleName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系统模块名称',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'ModuleName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RequestURL')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'RequestURL'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '请求地址',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'RequestURL'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Method')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'Method'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作方式',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'Method'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Params')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'Params'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作提交数据',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'Params'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsSuccess')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'IsSuccess'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否成功：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'IsSuccess'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Exception')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'Exception'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '异常信息',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'Exception'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_Log', 'column', 'CreateTime'
go

/*==============================================================*/
/* Table: Sys_Menu                                              */
/*==============================================================*/
create table Sys_Menu (
   Id                   int                  identity,
   ParentId             int                  null,
   MenuCode             varchar(10)          not null,
   MenuName             nvarchar(30)         not null,
   Level                tinyint              null,
   Url                  varchar(100)         null,
   Target               varchar(20)          null,
   Icon                 varchar(100)         null,
   IsMenu               bit                  null
      constraint CKC_ISMENU_SYS_MENU check (IsMenu is null or (IsMenu between 0 and 1)),
   IsExpand             bit                  null default 1
      constraint CKC_ISEXPAND_SYS_MENU check (IsExpand is null or (IsExpand between 0 and 1)),
   Sort                 tinyint              null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  null default 1
      constraint CKC_ISENABLED_SYS_MENU check (IsEnabled is null or (IsEnabled between 0 and 1)),
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_MENU check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_MENU primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_Menu') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_Menu' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '菜单表', 
   'user', @CurrentUser, 'table', 'Sys_Menu'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ParentId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'ParentId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级菜单Id',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'ParentId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MenuCode')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'MenuCode'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单编码',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'MenuCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MenuName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'MenuName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单名称',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'MenuName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Level')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Level'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单层次',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Level'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Url')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Url'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '链接',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Url'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Target')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Target'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '目标',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Target'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Icon')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Icon'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图标',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Icon'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsMenu')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'IsMenu'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否菜单：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'IsMenu'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsExpand')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'IsExpand'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否展开：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'IsExpand'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'IsEnabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_Menu', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_ModuleForm                                        */
/*==============================================================*/
create table Sys_ModuleForm (
   Id                   int                  identity,
   MenuId               int                  not null,
   ModuleFormCode       varchar(10)          not null,
   ModuleFormName       nvarchar(30)         not null,
   Sort                 tinyint              null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_MODU check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_MODULEFORM primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_ModuleForm') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_ModuleForm' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '模块表单', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MenuId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'MenuId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单Id',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'MenuId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModuleFormCode')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'ModuleFormCode'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '模块表单编码',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'ModuleFormCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModuleFormName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'ModuleFormName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '模块表单名称',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'ModuleFormName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_ModuleForm')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_ModuleForm', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_OperateBtn                                        */
/*==============================================================*/
create table Sys_OperateBtn (
   Id                   int                  identity,
   MenuId               int                  not null,
   OperBtnCode          varchar(10)          not null,
   OperBtnName          nvarchar(30)         not null,
   Event                varchar(30)          null,
   Url                  varchar(100)         null,
   Icon                 varchar(100)         null,
   Sort                 tinyint              null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_OPER check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_OPERATEBTN primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_OperateBtn') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_OperateBtn' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '操作按钮表', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MenuId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'MenuId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单Id',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'MenuId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'OperBtnCode')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'OperBtnCode'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作按钮编码',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'OperBtnCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'OperBtnName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'OperBtnName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作按钮名称',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'OperBtnName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Event')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Event'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '事件',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Event'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Url')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Url'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '链接',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Url'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Icon')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Icon'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图标',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Icon'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_OperateBtn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_OperateBtn', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_Role                                              */
/*==============================================================*/
create table Sys_Role (
   Id                   int                  identity,
   RoleCode             varchar(10)          not null,
   RoleName             nvarchar(30)         not null,
   RoleType             tinyint              not null
      constraint CKC_ROLETYPE_SYS_ROLE check (RoleType between 0 and 3),
   DataScope            tinyint              null
      constraint CKC_DATASCOPE_SYS_ROLE check (DataScope is null or (DataScope between 0 and 9)),
   DeptId               int                  null,
   GrpRoleId            int                  null,
   IsAllowEdit          bit                  null default 1
      constraint CKC_ISALLOWEDIT_SYS_ROLE check (IsAllowEdit is null or (IsAllowEdit between 0 and 1)),
   IsAllowDelete        bit                  null default 0
      constraint CKC_ISALLOWDELETE_SYS_ROLE check (IsAllowDelete is null or (IsAllowDelete between 0 and 1)),
   Sort                 tinyint              null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsEnabled            bit                  null default 1
      constraint CKC_ISENABLED_SYS_ROLE check (IsEnabled is null or (IsEnabled between 0 and 1)),
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_ROLE check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_ROLE primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_Role') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_Role' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色表', 
   'user', @CurrentUser, 'table', 'Sys_Role'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RoleCode')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'RoleCode'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色编码',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'RoleCode'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RoleName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'RoleName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色名称',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'RoleName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RoleType')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'RoleType'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色类型：0：管理用户；1：员工；2：VIP类型；3：普通用户；',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'RoleType'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DataScope')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'DataScope'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数据范围：0：所有数据；1：所在公司及以下数据；2：所在公司数据；3：所在部门及以下数据；4：所在部门数据；8：仅本人数据；9：按明细设置；',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'DataScope'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeptId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'DeptId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属机构Id',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'DeptId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'GrpRoleId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'GrpRoleId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色组Id',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'GrpRoleId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsAllowEdit')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'IsAllowEdit'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否允许编辑：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'IsAllowEdit'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsAllowDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'IsAllowDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否允许删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'IsAllowDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'IsEnabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_Role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_Role', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_RoleGrpUser                                       */
/*==============================================================*/
create table Sys_RoleGrpUser (
   Id                   int                  identity,
   RoleId               int                  not null,
   GrpUserId            int                  not null,
   Remark               nvarchar(500)        null,
   CreateUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   constraint PK_SYS_ROLEGRPUSER primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_RoleGrpUser') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色与用户组关联表', 
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_RoleGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_RoleGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RoleId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'RoleId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色Id',
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'RoleId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_RoleGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'GrpUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'GrpUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户组Id',
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'GrpUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_RoleGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_RoleGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_RoleGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_RoleGrpUser', 'column', 'CreateTime'
go

/*==============================================================*/
/* Table: Sys_User                                              */
/*==============================================================*/
create table Sys_User (
   Id                   int                  identity,
   Account              varchar(50)          not null,
   Password             varchar(100)         not null,
   SecretKey            varchar(30)          not null,
   No                   varchar(10)          null,
   RealName             nvarchar(30)         null,
   Nickname             nvarchar(30)         null,
   Sex                  tinyint              null default 0
      constraint CKC_SEX_SYS_USER check (Sex is null or (Sex between 0 and 2)),
   Age                  tinyint              null
      constraint CKC_AGE_SYS_USER check (Age is null or (Age between 1 and 200)),
   Birthday             datetime             null,
   Telephone            varchar(15)          null,
   Cellphone            char(11)             not null,
   Email                varchar(30)          not null,
   WeChat               varchar(30)          null,
   Education            tinyint              null
      constraint CKC_EDUCATION_SYS_USER check (Education is null or (Education between 0 and 8)),
   Icon                 varchar(100)         null,
   Address              nvarchar(200)        null,
   EntryTime            datetime             null default getdate(),
   Salary               decimal(10,2)        null,
   Theme                varchar(30)          null,
   Status               tinyint              not null default 0
      constraint CKC_STATUS_SYS_USER check (Status between 0 and 4),
   DeptId               int                  null,
   JobId                int                  null,
   ManagerId            int                  null,
   SecurityLevel        tinyint              null,
   LastLoginIP          varchar(20)          null,
   LastLoginTime        datetime             null,
   Sort                 smallint             null,
   Description          nvarchar(300)        null,
   Remark               nvarchar(500)        null,
   IsAdministrator      bit                  null default 0
      constraint CKC_ISADMINISTRATOR_SYS_USER check (IsAdministrator is null or (IsAdministrator between 0 and 1)),
   IsEnabled            bit                  null default 1
      constraint CKC_ISENABLED_SYS_USER check (IsEnabled is null or (IsEnabled between 0 and 1)),
   IsDelete             bit                  null default 0
      constraint CKC_ISDELETE_SYS_USER check (IsDelete is null or (IsDelete between 0 and 1)),
   CreateUserId         int                  null,
   ModifyUserId         int                  null,
   DeleteUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   ModifyTime           datetime             null,
   DeleteTime           datetime             null,
   constraint PK_SYS_USER primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_User') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_User' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户表', 
   'user', @CurrentUser, 'table', 'Sys_User'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Account')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Account'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '帐号',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Account'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Password')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Password'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '密码',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Password'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SecretKey')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'SecretKey'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户密钥',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'SecretKey'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'No')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'No'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工号',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'No'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RealName')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'RealName'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '真实姓名',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'RealName'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Nickname')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Nickname'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '昵称',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Nickname'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sex')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Sex'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '性别：0：保密；1：男；2：女；',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Sex'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Age')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Age'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年龄',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Age'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Birthday')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Birthday'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '生日',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Birthday'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Telephone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Telephone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '固定电话',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Telephone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Cellphone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Cellphone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '手机号码',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Cellphone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Email')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Email'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮箱',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Email'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'WeChat')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'WeChat'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '微信',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'WeChat'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Education')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Education'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '学历：0：无；1：小学；2：初中；3：高中；4：大专；5：本科；6：研究生；7：博士生；8：博士后；',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Education'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Icon')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Icon'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '头像',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Icon'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Address')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Address'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '地址',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Address'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'EntryTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'EntryTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '入职时间',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'EntryTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Salary')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Salary'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '薪资',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Salary'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Theme')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Theme'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系统样式',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Theme'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '状态：0：锁定；1：正常；2：未通过邮件验证；3：未通过管理员验证；4：删除；',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Status'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeptId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'DeptId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门Id',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'DeptId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'JobId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'JobId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '岗位Id',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'JobId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ManagerId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'ManagerId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主管Id',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'ManagerId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SecurityLevel')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'SecurityLevel'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '安全级别',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'SecurityLevel'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'LastLoginIP')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'LastLoginIP'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上次登录IP',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'LastLoginIP'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'LastLoginTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'LastLoginTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上次登录时间',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'LastLoginTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsAdministrator')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'IsAdministrator'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否管理员：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'IsAdministrator'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsEnabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'IsEnabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'IsEnabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IsDelete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'IsDelete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0：否；1：是；',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'IsDelete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'ModifyUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'ModifyUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'DeleteUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'DeleteUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'CreateTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ModifyTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'ModifyTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'ModifyTime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_User')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DeleteTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'DeleteTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'Sys_User', 'column', 'DeleteTime'
go

/*==============================================================*/
/* Table: Sys_UserGrpUser                                       */
/*==============================================================*/
create table Sys_UserGrpUser (
   Id                   int                  identity,
   UserId               int                  not null,
   GrpUserId            int                  not null,
   Remark               nvarchar(500)        null,
   CreateUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   constraint PK_SYS_USERGRPUSER primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_UserGrpUser') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户与用户组关联表', 
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'UserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户Id',
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'UserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'GrpUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'GrpUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户组Id',
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'GrpUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserGrpUser')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_UserGrpUser', 'column', 'CreateTime'
go

/*==============================================================*/
/* Table: Sys_UserRole                                          */
/*==============================================================*/
create table Sys_UserRole (
   Id                   int                  identity,
   UserId               int                  not null,
   RoleId               int                  not null,
   Remark               nvarchar(500)        null,
   CreateUserId         int                  null,
   CreateTime           datetime             null default getdate(),
   constraint PK_SYS_USERROLE primary key (Id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Sys_UserRole') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Sys_UserRole' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户角色表', 
   'user', @CurrentUser, 'table', 'Sys_UserRole'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'Id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'Id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'UserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'UserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户Id',
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'UserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RoleId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'RoleId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色Id',
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'RoleId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'Remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'Remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateUserId')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'CreateUserId'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'CreateUserId'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Sys_UserRole')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CreateTime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'CreateTime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'Sys_UserRole', 'column', 'CreateTime'
go

