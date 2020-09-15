/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2020/9/11 周五 0:22:44                         */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('sys_area')
            and   type = 'U')
   drop table sys_area
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_attachment')
            and   type = 'U')
   drop table sys_attachment
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_authorize')
            and   type = 'U')
   drop table sys_authorize
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_db_backup')
            and   type = 'U')
   drop table sys_db_backup
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_dept')
            and   type = 'U')
   drop table sys_dept
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_dict')
            and   type = 'U')
   drop table sys_dict
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_element')
            and   type = 'U')
   drop table sys_element
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_grp_role')
            and   type = 'U')
   drop table sys_grp_role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_grp_user')
            and   type = 'U')
   drop table sys_grp_user
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_job')
            and   type = 'U')
   drop table sys_job
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_job_history')
            and   type = 'U')
   drop table sys_job_history
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_log')
            and   type = 'U')
   drop table sys_log
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_menu')
            and   type = 'U')
   drop table sys_menu
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_module_form')
            and   type = 'U')
   drop table sys_module_form
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_operate_btn')
            and   type = 'U')
   drop table sys_operate_btn
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_role')
            and   type = 'U')
   drop table sys_role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_role_grp_user')
            and   type = 'U')
   drop table sys_role_grp_user
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_user')
            and   type = 'U')
   drop table sys_user
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_user_grp_user')
            and   type = 'U')
   drop table sys_user_grp_user
go

if exists (select 1
            from  sysobjects
           where  id = object_id('sys_user_role')
            and   type = 'U')
   drop table sys_user_role
go

/*==============================================================*/
/* Table: sys_area                                              */
/*==============================================================*/
create table sys_area (
   id                   bigint               identity,
   parent_id            bigint           not null default '0',
   administrative_division char(9)              not null,
   area_code            char(6)              not null,
   area_name            nvarchar(20)         not null,
   simple_name          nvarchar(20)         not null,
   level                int              not null
      constraint CKC_LEVEL_SYS_AREA check (level between 0 and 5),
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_enabled           int              not null default 1
      constraint CKC_IS_ENABLED_SYS_AREA check (is_enabled between 0 and 1),
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_AREA check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_AREA primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_area') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_area' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '地区表', 
   'user', @CurrentUser, 'table', 'sys_area'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'parent_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'parent_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级地区Id',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'parent_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'administrative_division')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'administrative_division'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '行政区划代码',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'administrative_division'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'area_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'area_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮政编码',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'area_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'area_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'area_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '地区名称',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'area_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'simple_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'simple_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '简称',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'simple_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'level')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'level'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '行政区划级别：0国家 1省级 2地级 3县级 4乡级 5村庄',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'level'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_enabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'is_enabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0否 1是',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'is_enabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_area')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_area', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_attachment                                        */
/*==============================================================*/
create table sys_attachment (
   id                   bigint               identity,
   atta_type            varchar(10)          not null,
   object_id            bigint           not null default '0',
   file_path            varchar(100)         not null,
   file_name            nvarchar(30)         not null,
   file_type            varchar(8)           not null,
   file_size            decimal(7,2)         not null default 0,
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_ATTACHMENT check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_ATTACHMENT primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_attachment') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_attachment' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '附件表', 
   'user', @CurrentUser, 'table', 'sys_attachment'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'atta_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'atta_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类型',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'atta_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'object_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'object_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '对象Id',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'object_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'file_path')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'file_path'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件路径',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'file_path'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'file_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'file_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件名称',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'file_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'file_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'file_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件类型',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'file_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'file_size')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'file_size'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件大小：MB',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'file_size'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_attachment')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_attachment', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_authorize                                         */
/*==============================================================*/
create table sys_authorize (
   id                   bigint               identity,
   item_type            int              not null
      constraint CKC_ITEM_TYPE_SYS_AUTHORIZE check (item_type between 1 and 5),
   item_id              bigint           not null default '0',
   object_type          int              not null
      constraint CKC_OBJECT_TYPE_SYS_AUTHORIZE check (object_type between 1 and 3),
   object_id            bigint           not null default '0',
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_AUTHORIZE check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_AUTHORIZE primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_authorize') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_authorize' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '授权表', 
   'user', @CurrentUser, 'table', 'sys_authorize'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'item_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'item_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目类型：1菜单SysMenu 2页面元素SysElement 3操作按钮SysOperateBtn 4附件SysAttachment 5模块表单SysModuleForm',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'item_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'item_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'item_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目外键',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'item_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'object_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'object_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '对象类型：1角色 2用户 3用户组',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'object_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'object_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'object_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '对象外键',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'object_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_authorize')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_authorize', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_db_backup                                         */
/*==============================================================*/
create table sys_db_backup (
   id                   bigint               identity,
   backup_type          int              not null default 1
      constraint CKC_BACKUP_TYPE_SYS_DB_BACKUP check (backup_type between 1 and 2),
   db_name              varchar(30)          not null,
   file_name            nvarchar(30)         not null,
   file_size            decimal(7,2)         not null default 0,
   file_path            varchar(100)         not null,
   description          nvarchar(300)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_DB_BACKUP check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_DB_BACKUP primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_db_backup') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_db_backup' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '数据库备份表', 
   'user', @CurrentUser, 'table', 'sys_db_backup'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'backup_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'backup_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备份类型：1完全备份 2增量备份',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'backup_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'db_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'db_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数据库名称',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'db_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'file_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'file_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件名称',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'file_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'file_size')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'file_size'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件大小：MB',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'file_size'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'file_path')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'file_path'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '文件路径',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'file_path'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_db_backup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_db_backup', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_dept                                              */
/*==============================================================*/
create table sys_dept (
   id                   bigint               identity(1000,1),
   parent_id            bigint           not null default '0',
   dept_code            varchar(10)          not null,
   dept_name            nvarchar(30)         not null,
   simple_name          nvarchar(30)         not null,
   dept_type            int              not null
      constraint CKC_DEPT_TYPE_SYS_DEPT check (dept_type between 1 and 3),
   level                int              not null default 1
      constraint CKC_LEVEL_SYS_DEPT check (level between 1 and 4),
   seq                  int              not null default 0,
   area_id              bigint           not null default '0',
   leader_id            bigint           not null default '0',
   address              nvarchar(200)        not null,
   telephone            varchar(15)          not null,
   email                varchar(30)          not null,
   is_allow_edit        int              not null default 1
      constraint CKC_IS_ALLOW_EDIT_SYS_DEPT check (is_allow_edit between 0 and 1),
   is_allow_delete      int              not null default 1
      constraint CKC_IS_ALLOW_DELETE_SYS_DEPT check (is_allow_delete between 0 and 1),
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_enabled           int              not null default 1
      constraint CKC_IS_ENABLED_SYS_DEPT check (is_enabled between 0 and 1),
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_DEPT check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_DEPT primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_dept') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_dept' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '部门表', 
   'user', @CurrentUser, 'table', 'sys_dept'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'parent_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'parent_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级部门Id',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'parent_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dept_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'dept_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门编码',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'dept_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dept_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'dept_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门名称',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'dept_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'simple_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'simple_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '简称',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'simple_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dept_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'dept_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '机构类型：1公司 2部门 3小组',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'dept_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'level')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'level'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '机构等级：1一级 2二级 3三级 4四级',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'level'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'seq')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'seq'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '当前层级顺序',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'seq'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'area_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'area_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属地区Id',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'area_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'leader_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'leader_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '负责人Id',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'leader_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'address')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'address'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '联系地址',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'address'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'telephone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'telephone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '固定电话',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'telephone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'email')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'email'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮箱',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'email'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_allow_edit')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'is_allow_edit'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否允许编辑：0否 1是',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'is_allow_edit'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_allow_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'is_allow_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否允许删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'is_allow_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_enabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'is_enabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0否 1是',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'is_enabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dept')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_dept', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_dict                                              */
/*==============================================================*/
create table sys_dict (
   id                   bigint               identity(5000,1),
   parent_id            bigint           not null default '0',
   name                 nvarchar(30)         not null,
   value                nvarchar(30)         not null,
   type                 varchar(10)          not null,
   sort                 int                  not null default 0,
   remark               nvarchar(500)        not null,
   is_enabled           int              not null default 1
      constraint CKC_IS_ENABLED_SYS_DICT check (is_enabled between 0 and 1),
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_DICT check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_DICT primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_dict') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_dict' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '字典表', 
   'user', @CurrentUser, 'table', 'sys_dict'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'parent_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'parent_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级Id',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'parent_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '名称',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'value')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'value'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '值',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'value'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '类型',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_enabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'is_enabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0否 1是',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'is_enabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_dict')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_dict', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_element                                           */
/*==============================================================*/
create table sys_element (
   id                   bigint               identity,
   menu_id              bigint           not null default '0',
   elem_code            varchar(10)          not null,
   elem_name            nvarchar(30)         not null,
   location             varchar(50)          not null,
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_ELEMENT check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_ELEMENT primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_element') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_element' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '页面元素表', 
   'user', @CurrentUser, 'table', 'sys_element'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'menu_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'menu_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单Id',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'menu_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'elem_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'elem_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '元素编码',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'elem_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'elem_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'elem_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '元素名称',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'elem_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'location')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'location'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '位置',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'location'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_element')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_element', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_grp_role                                          */
/*==============================================================*/
create table sys_grp_role (
   id                   bigint               identity(100,1),
   grp_role_name        nvarchar(30)         not null,
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_enabled           int              not null default 1
      constraint CKC_IS_ENABLED_SYS_GRP_ROLE check (is_enabled between 0 and 1),
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_GRP_ROLE check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_GRP_ROLE primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_grp_role') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_grp_role' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色组', 
   'user', @CurrentUser, 'table', 'sys_grp_role'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'grp_role_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'grp_role_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色组名称',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'grp_role_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_enabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'is_enabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0否 1是',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'is_enabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_grp_role', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_grp_user                                          */
/*==============================================================*/
create table sys_grp_user (
   id                   bigint               identity(100,1),
   parent_id            bigint           not null default '0',
   grp_user_name        nvarchar(30)         not null,
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_enabled           int              not null default 1
      constraint CKC_IS_ENABLED_SYS_GRP_USER check (is_enabled between 0 and 1),
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_GRP_USER check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_GRP_USER primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_grp_user') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_grp_user' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户组', 
   'user', @CurrentUser, 'table', 'sys_grp_user'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'parent_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'parent_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级Id',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'parent_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'grp_user_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'grp_user_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户组名称',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'grp_user_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_enabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'is_enabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0否 1是',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'is_enabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_grp_user', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_job                                               */
/*==============================================================*/
create table sys_job (
   id                   bigint               identity(5000,1),
   job_name             nvarchar(30)         not null,
   nickname             nvarchar(30)         not null,
   dept_id              bigint           not null default '0',
   min_salary           decimal(10,2)        not null default 0,
   max_salary           decimal(10,2)        not null default 0,
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_enabled           int              not null default 1
      constraint CKC_IS_ENABLED_SYS_JOB check (is_enabled between 0 and 1),
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_JOB check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_JOB primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_job') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_job' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '岗位表', 
   'user', @CurrentUser, 'table', 'sys_job'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'job_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'job_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '岗位名称',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'job_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'nickname')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'nickname'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '昵称',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'nickname'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dept_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'dept_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门Id',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'dept_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'min_salary')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'min_salary'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最低薪资',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'min_salary'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'max_salary')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'max_salary'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '最高薪资',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'max_salary'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_enabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'is_enabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0否 1是',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'is_enabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_job', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_job_history                                       */
/*==============================================================*/
create table sys_job_history (
   id                   bigint               identity,
   user_id              bigint           not null default '0',
   job_id               bigint           not null default '0',
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_JOB_HISTORY check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_JOB_HISTORY primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_job_history') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_job_history' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '任职表', 
   'user', @CurrentUser, 'table', 'sys_job_history'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户Id',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'job_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'job_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '岗位Id',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'job_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_job_history')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_job_history', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_log                                               */
/*==============================================================*/
create table sys_log (
   id                   bigint               identity,
   log_type             int              not null default 2
      constraint CKC_LOG_TYPE_SYS_LOG check (log_type between 1 and 5),
   ip                   varchar(20)          not null,
   module_id            bigint           not null default '0',
   module_name          nvarchar(30)         not null,
   request_url          varchar(100)         not null,
   method               varchar(30)          not null,
   parameter            text                 not null,
   is_success           int              not null default 0
      constraint CKC_IS_SUCCESS_SYS_LOG check (is_success between 0 and 1),
   exception            text                 not null,
   description          nvarchar(300)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_LOG check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_LOG primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_log') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_log' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '日志表', 
   'user', @CurrentUser, 'table', 'sys_log'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'log_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'log_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '日志类型：1FATAL 2ERROR 3WARN 4INFO 5DEBUG',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'log_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'ip')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'ip'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作IP',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'ip'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'module_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'module_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系统模块Id',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'module_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'module_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'module_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系统模块名称',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'module_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'request_url')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'request_url'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '请求地址',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'request_url'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'method')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'method'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作方式',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'method'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'parameter')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'parameter'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作提交数据',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'parameter'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_success')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'is_success'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否成功：0否 1是',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'is_success'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'exception')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'exception'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '异常信息',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'exception'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_log')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_log', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_menu                                              */
/*==============================================================*/
create table sys_menu (
   id                   bigint               identity,
   parent_id            bigint           not null default '0',
   menu_code            varchar(10)          not null,
   menu_name            nvarchar(30)         not null,
   level                int                  not null default 0,
   url                  varchar(100)         not null,
   target               varchar(20)          not null,
   icon                 varchar(100)         not null,
   is_menu              int              not null default 0
      constraint CKC_IS_MENU_SYS_MENU check (is_menu between 0 and 1),
   is_expand            int              not null default 1
      constraint CKC_IS_EXPAND_SYS_MENU check (is_expand between 0 and 1),
   sort                 int              not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_enabled           int              not null default 1
      constraint CKC_IS_ENABLED_SYS_MENU check (is_enabled between 0 and 1),
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_MENU check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_MENU primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_menu') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_menu' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '菜单表', 
   'user', @CurrentUser, 'table', 'sys_menu'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'parent_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'parent_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上级菜单Id',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'parent_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'menu_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'menu_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单编码',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'menu_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'menu_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'menu_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单名称',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'menu_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'level')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'level'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单层次',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'level'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'url')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'url'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '链接',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'url'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'target')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'target'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '目标',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'target'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'icon')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'icon'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图标',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'icon'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_menu')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'is_menu'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否菜单：0否 1是',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'is_menu'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_expand')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'is_expand'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否展开：0否 1是',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'is_expand'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_enabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'is_enabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0否 1是',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'is_enabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_menu')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_menu', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_module_form                                       */
/*==============================================================*/
create table sys_module_form (
   id                   bigint               identity,
   menu_id              bigint           not null default '0',
   module_form_code     varchar(10)          not null,
   module_form_name     nvarchar(30)         not null,
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_MODULE_FORM check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_MODULE_FORM primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_module_form') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_module_form' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '模块表单', 
   'user', @CurrentUser, 'table', 'sys_module_form'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'menu_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'menu_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单Id',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'menu_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'module_form_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'module_form_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '模块表单编码',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'module_form_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'module_form_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'module_form_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '模块表单名称',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'module_form_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_module_form')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_module_form', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_operate_btn                                       */
/*==============================================================*/
create table sys_operate_btn (
   id                   bigint               identity,
   menu_id              bigint           not null default '0',
   oper_btn_code        varchar(10)          not null,
   oper_btn_name        nvarchar(30)         not null,
   btn_event            varchar(30)          not null,
   url                  varchar(100)         not null,
   icon                 varchar(100)         not null,
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_OPERATE_BTN check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_OPERATE_BTN primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_operate_btn') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_operate_btn' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '操作按钮表', 
   'user', @CurrentUser, 'table', 'sys_operate_btn'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'menu_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'menu_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '菜单Id',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'menu_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'oper_btn_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'oper_btn_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作按钮编码',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'oper_btn_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'oper_btn_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'oper_btn_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '操作按钮名称',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'oper_btn_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'btn_event')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'btn_event'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '事件',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'btn_event'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'url')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'url'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '链接',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'url'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'icon')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'icon'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '图标',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'icon'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_operate_btn')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_operate_btn', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_role                                              */
/*==============================================================*/
create table sys_role (
   id                   bigint               identity(1000,1),
   role_code            varchar(10)          not null,
   role_name            nvarchar(30)         not null,
   role_type            int              not null default 3
      constraint CKC_ROLE_TYPE_SYS_ROLE check (role_type between 0 and 3),
   data_scope           int              not null
      constraint CKC_DATA_SCOPE_SYS_ROLE check (data_scope between 0 and 9),
   dept_id              bigint           not null default '0',
   grp_role_id          bigint           not null default '0',
   is_allow_edit        int              not null default 1
      constraint CKC_IS_ALLOW_EDIT_SYS_ROLE check (is_allow_edit between 0 and 1),
   is_allow_delete      int              not null default 1
      constraint CKC_IS_ALLOW_DELETE_SYS_ROLE check (is_allow_delete between 0 and 1),
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_enabled           int              not null default 1
      constraint CKC_IS_ENABLED_SYS_ROLE check (is_enabled between 0 and 1),
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_ROLE check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_ROLE primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_role') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_role' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色表', 
   'user', @CurrentUser, 'table', 'sys_role'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'role_code')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'role_code'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色编码',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'role_code'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'role_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'role_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色名称',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'role_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'role_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'role_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色类型：0管理用户 1员工 2VIP类型 3普通用户',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'role_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'data_scope')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'data_scope'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '数据范围：0所有数据 1所在公司及以下数据 2所在公司数据 3所在部门及以下数据 4所在部门数据 8仅本人数据 9按明细设置',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'data_scope'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dept_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'dept_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '所属机构Id',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'dept_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'grp_role_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'grp_role_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色组Id',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'grp_role_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_allow_edit')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'is_allow_edit'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否允许编辑：0否 1是',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'is_allow_edit'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_allow_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'is_allow_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否允许删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'is_allow_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_enabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'is_enabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0否 1是',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'is_enabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_role', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_role_grp_user                                     */
/*==============================================================*/
create table sys_role_grp_user (
   id                   bigint               identity,
   role_id              bigint           not null default '0',
   grp_user_id          bigint           not null default '0',
   remark               nvarchar(500)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_ROLE_GRP_USER check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_ROLE_GRP_USER primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_role_grp_user') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_role_grp_user' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色与用户组关联表', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'role_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'role_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色Id',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'role_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'grp_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'grp_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户组Id',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'grp_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_role_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_role_grp_user', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_user                                              */
/*==============================================================*/
create table sys_user (
   id                   bigint               identity(5000,1),
   account              varchar(50)          not null,
   password             varchar(100)         not null,
   secret_key           varchar(30)          not null,
   no                   varchar(10)          not null,
   real_name            nvarchar(30)         not null,
   nickname             nvarchar(30)         not null,
   sex                  int              not null default 0
      constraint CKC_SEX_SYS_USER check (sex between 0 and 2),
   age                  int              not null default 0
      constraint CKC_AGE_SYS_USER check (age between 1 and 200),
   birthday             datetime             not null,
   telephone            varchar(15)          not null,
   cellphone            char(11)             not null,
   email                varchar(30)          not null,
   wechat               varchar(30)          not null,
   education            int              not null default 0
      constraint CKC_EDUCATION_SYS_USER check (education between 0 and 8),
   icon                 varchar(100)         not null,
   address              nvarchar(200)        not null,
   entry_time           datetime             not null default getdate(),
   salary               decimal(10,2)        not null default 0,
   theme                varchar(30)          not null,
   status               int              not null default 0
      constraint CKC_STATUS_SYS_USER check (status between 0 and 4),
   dept_id              bigint           not null default '0',
   job_id               bigint           not null default '0',
   manager_id           bigint           not null default '0',
   security_level       int              not null default 0,
   last_login_ip        varchar(20)          not null,
   last_login_time      datetime             not null default getdate(),
   sort                 int                  not null default 0,
   description          nvarchar(300)        not null,
   remark               nvarchar(500)        not null,
   is_admin             int              not null default 0
      constraint CKC_IS_ADMIN_SYS_USER check (is_admin between 0 and 1),
   is_enabled           int              not null default 1
      constraint CKC_IS_ENABLED_SYS_USER check (is_enabled between 0 and 1),
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_USER check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_USER primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_user') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_user' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户表', 
   'user', @CurrentUser, 'table', 'sys_user'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'account')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'account'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '帐号',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'account'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'password')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'password'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '密码',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'password'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'secret_key')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'secret_key'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户密钥',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'secret_key'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'no')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'no'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工号',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'no'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'real_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'real_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '真实姓名',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'real_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'nickname')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'nickname'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '昵称',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'nickname'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sex')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'sex'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '性别：0保密 1男 2女',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'sex'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'age')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'age'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '年龄',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'age'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'birthday')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'birthday'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '生日',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'birthday'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'telephone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'telephone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '固定电话',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'telephone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'cellphone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'cellphone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '手机号码',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'cellphone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'email')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'email'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '邮箱',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'email'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'wechat')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'wechat'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '微信',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'wechat'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'education')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'education'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '学历：0无 1小学 2初中 3高中 4大专 5本科 6研究生 7博士生 8博士后',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'education'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'icon')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'icon'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '头像',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'icon'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'address')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'address'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '地址',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'address'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'entry_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'entry_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '入职时间',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'entry_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'salary')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'salary'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '薪资',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'salary'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'theme')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'theme'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '系统样式',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'theme'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'status')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'status'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '状态：0锁定 1正常 2未通过邮件验证 3未通过管理员验证 4删除',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'status'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dept_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'dept_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '部门Id',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'dept_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'job_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'job_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '岗位Id',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'job_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'manager_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'manager_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主管Id',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'manager_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'security_level')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'security_level'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '安全级别',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'security_level'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'last_login_ip')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'last_login_ip'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上次登录IP',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'last_login_ip'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'last_login_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'last_login_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '上次登录时间',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'last_login_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'sort')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'sort'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '排序',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'sort'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'description')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'description'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '描述',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'description'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_admin')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'is_admin'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否管理员：0否 1是',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'is_admin'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_enabled')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'is_enabled'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否启用：0否 1是',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'is_enabled'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_user', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_user_grp_user                                     */
/*==============================================================*/
create table sys_user_grp_user (
   id                   bigint               identity,
   user_id              bigint           not null default '0',
   grp_user_id          bigint           not null default '0',
   remark               nvarchar(500)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_USER_GRP_USER check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_USER_GRP_USER primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_user_grp_user') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_user_grp_user' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户与用户组关联表', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户Id',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'grp_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'grp_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户组Id',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'grp_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_grp_user')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_user_grp_user', 'column', 'delete_time'
go

/*==============================================================*/
/* Table: sys_user_role                                         */
/*==============================================================*/
create table sys_user_role (
   id                   bigint               identity,
   user_id              bigint           not null default '0',
   role_id              bigint           not null default '0',
   remark               nvarchar(500)        not null,
   is_delete            int              not null default 0
      constraint CKC_IS_DELETE_SYS_USER_ROLE check (is_delete between 0 and 1),
   create_user_id       bigint           not null default '0',
   modify_user_id       bigint           not null default '0',
   delete_user_id       bigint           not null default '0',
   create_time          datetime             not null default getdate(),
   modify_time          datetime             not null default getdate(),
   delete_time          datetime             not null default getdate(),
   constraint PK_SYS_USER_ROLE primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('sys_user_role') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'sys_user_role' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户角色表', 
   'user', @CurrentUser, 'table', 'sys_user_role'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键Id',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '用户Id',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'role_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'role_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '角色Id',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'role_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'remark')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'remark'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '备注',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'remark'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_delete')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'is_delete'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否删除：0否 1是',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'is_delete'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'create_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建用户Id',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'create_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'modify_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改用户Id',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'modify_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_user_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'delete_user_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除用户Id',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'delete_user_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'create_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'create_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '创建时间',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'create_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'modify_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'modify_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '修改时间',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'modify_time'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('sys_user_role')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delete_time')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'delete_time'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '删除时间',
   'user', @CurrentUser, 'table', 'sys_user_role', 'column', 'delete_time'
go

