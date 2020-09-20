using Common;
using Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

namespace Repository.EF
{
    /*
     * 在NuGet程序包管理器控制台输入，生成实体及上下文：
     *      Scaffold-DbContext "Data Source=.;User ID=sa;Password=123456;Initial Catalog=ApiCore;" Microsoft.EntityFrameworkCore.SqlServer
     * Startup.cs：
     *      services.AddDbContext<ApiDbContext>(options => options.UseSqlServer(@"Persist Security Info=True;Data Source=.;User ID=sa;Password=123456;Initial Catalog=ApiCore;"));
     * 官网：https://docs.microsoft.com/zh-cn/ef/core/
     */
    public class ApiDbContext : DbContext
    {
        private readonly IOptions<AppSettingsJson> _appSettings;

        public ApiDbContext(DbContextOptions<ApiDbContext> options, IOptions<AppSettingsJson> appSettings)
            : base(options)
        {
            _appSettings = appSettings;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);

            //也可以在Startup.cs中配置
            optionsBuilder.UseSqlServer(_appSettings.Value.DBM.SqlServer[0].ConnectionString);
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

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
