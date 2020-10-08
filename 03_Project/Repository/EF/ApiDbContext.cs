using Common;
using Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection;

namespace Repository.EF
{
    /*
     * 在NuGet程序包管理器控制台输入，生成实体及上下文：
     *      Scaffold-DbContext "Data Source=.;User ID=sa;Password=123456;Initial Catalog=ApiCore;" Microsoft.EntityFrameworkCore.SqlServer
     * Startup.cs：
     *      services.AddDbContext<ApiDbContext>(options => options.UseSqlServer(@"Persist Security Info=True;Data Source=.;User ID=sa;Password=123456;Initial Catalog=ApiCore;"));
     * 官网：https://docs.microsoft.com/zh-cn/ef/core/
     */
    public class ApiDbContext : DbContext, IDisposable
    {
        private readonly IOptions<AppSettingsJson> _appSettings;
        private readonly ILogger<EFDbCommandAOP> _logger;

        public ApiDbContext(DbContextOptions<ApiDbContext> options, IOptions<AppSettingsJson> appSettings, ILogger<EFDbCommandAOP> logger)
            : base(options)
        {
            _appSettings = appSettings;
            _logger = logger;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);

            //也可以在Startup.cs中配置
            optionsBuilder.UseSqlServer(_appSettings.Value.DBM.SqlServer[0].ConnectionString, p => p.CommandTimeout(10));
            //optionsBuilder.AddInterceptors(new EFDbCommandAOP(_logger));
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            #region 反射 Fulent 配置
            //Assembly entityAssembly = Assembly.Load(new AssemblyName("Entity"));
            //IEnumerable<Type> typesToRegister = entityAssembly.GetTypes()
            //    .Where(p => !string.IsNullOrEmpty(p.Namespace))
            //    .Where(p => !string.IsNullOrEmpty(p.GetCustomAttribute<TableAttribute>()?.Name));
            //foreach (Type type in typesToRegister)
            //{
            //    dynamic configurationInstance = Activator.CreateInstance(type);
            //    modelBuilder.Model.AddEntityType(type);
            //}
            //foreach (var entity in modelBuilder.Model.GetEntityTypes())
            //{
            //    modelBuilder.Entity(entity.Name).HasKey("id");
            //    string currentTableName = modelBuilder.Entity(entity.Name).Metadata.GetTableName();
            //    modelBuilder.Entity(entity.Name).ToTable(currentTableName);

            //    //var properties = entity.GetProperties();
            //    //foreach (var property in properties)
            //    //{
            //    //    modelBuilder.Entity(entity.Name).Property(property.Name).HasColumnName(property.Name);
            //    //}
            //}
            #endregion 反射 Fulent 配置

            #region Fulent 配置
            //modelBuilder.Entity<SysArea>();
            //modelBuilder.Entity<SysAttachment>();
            //modelBuilder.Entity<SysAuthorize>();
            //modelBuilder.Entity<SysDBBackup>();
            //modelBuilder.Entity<SysDept>();
            //modelBuilder.Entity<SysDict>();
            //modelBuilder.Entity<SysElement>();
            //modelBuilder.Entity<SysGrpRole>();
            //modelBuilder.Entity<SysGrpUser>();
            //modelBuilder.Entity<SysJob>();
            //modelBuilder.Entity<SysJobHistory>();
            //modelBuilder.Entity<SysLog>();
            //modelBuilder.Entity<SysMenu>();
            //modelBuilder.Entity<SysModuleForm>();
            //modelBuilder.Entity<SysOperateBtn>();
            //modelBuilder.Entity<SysRole>();
            //modelBuilder.Entity<SysRoleGrpUser>();
            //modelBuilder.Entity<SysUser>();
            //modelBuilder.Entity<SysUserGrpUser>();
            //modelBuilder.Entity<SysUserRole>();
            #endregion Fulent 配置
        }

        #region DbSet
        public virtual DbSet<SysArea> SysAreas { get; set; }
        public virtual DbSet<SysAttachment> SysAttachments { get; set; }
        public virtual DbSet<SysAuthorize> SysAuthorizes { get; set; }
        public virtual DbSet<SysDBBackup> SysDBBackups { get; set; }
        public virtual DbSet<SysDept> SysDepts { get; set; }
        public virtual DbSet<SysDict> SysDicts { get; set; }
        public virtual DbSet<SysElement> SysElements { get; set; }
        public virtual DbSet<SysGrpRole> SysGrpRoles { get; set; }
        public virtual DbSet<SysGrpUser> SysGrpUsers { get; set; }
        public virtual DbSet<SysJob> SysJobs { get; set; }
        public virtual DbSet<SysJobHistory> SysJobHistories { get; set; }
        public virtual DbSet<SysLog> SysLogs { get; set; }
        public virtual DbSet<SysMenu> SysMenus { get; set; }
        public virtual DbSet<SysModuleForm> SysModuleForms { get; set; }
        public virtual DbSet<SysOperateBtn> SysOperateBtns { get; set; }
        public virtual DbSet<SysRole> SysRoles { get; set; }
        public virtual DbSet<SysRoleGrpUser> SysRoleGrpUsers { get; set; }
        public virtual DbSet<SysUser> SysUsers { get; set; }
        public virtual DbSet<SysUserGrpUser> SysUserGrpUsers { get; set; }
        public virtual DbSet<SysUserRole> SysUserRoles { get; set; }
        #endregion DbSet

    }
}
