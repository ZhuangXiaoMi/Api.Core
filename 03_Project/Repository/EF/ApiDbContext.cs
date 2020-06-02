using Entity.BaseManage;
using Entity.SysManage;
using IRepository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Repository.EF
{
    /*
     * 在NuGet程序包管理器控制台输入，生成实体及上下文：
     *      Scaffold-DbContext "Data Source=.;User ID=sa;Password=123456;Initial Catalog=ApiCore;" Microsoft.EntityFrameworkCore.SqlServer
     * Startup.cs：
     *      services.AddDbContext<ApiDbContext>(options => options.UseSqlServer(@"Persist Security Info=True;Data Source=.;User ID=sa;Password=123456;Initial Catalog=ApiCore;"));
     * 官网：https://docs.microsoft.com/zh-cn/ef/core/
     */
    public class ApiDbContext : DbContext, IDbContext
    {
        #region DbSet
        public DbSet<SysArea> SysArea { get; set; }
        public DbSet<SysAttachment> SysAttachment { get; set; }
        public DbSet<SysAuthorize> SysAuthorize { get; set; }
        public DbSet<SysDBBackup> SysDBBackup { get; set; }
        public DbSet<SysDept> SysDept { get; set; }
        public DbSet<SysDict> SysDict { get; set; }
        public DbSet<SysElement> SysElement { get; set; }
        public DbSet<SysGrpRole> SysGrpRole { get; set; }
        public DbSet<SysGrpUser> SysGrpUser { get; set; }
        public DbSet<SysJob> SysJob { get; set; }
        public DbSet<SysJobHistory> SysJobHistory { get; set; }
        public DbSet<SysLog> SysLog { get; set; }
        public DbSet<SysMenu> SysMenu { get; set; }
        public DbSet<SysModuleForm> SysModuleForm { get; set; }
        public DbSet<SysOperateBtn> SysOperateBtn { get; set; }
        public DbSet<SysRole> SysRole { get; set; }
        public DbSet<SysRoleGrpUser> SysRoleGrpUser { get; set; }
        public DbSet<SysUser> SysUser { get; set; }
        public DbSet<SysUserGrpUser> SysUserGrpUser { get; set; }
        public DbSet<SysUserRole> SysUserRole { get; set; }
        #endregion DbSet

        public ApiDbContext(DbContextOptions<ApiDbContext> options) : base(options)
        { }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //也可以在Startup.cs中配置
            //optionsBuilder.UseSqlServer(@"Persist Security Info=True;Data Source=.;User ID=sa;Password=123456;Initial Catalog=ApiCore;");

            base.OnConfiguring(optionsBuilder);
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
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

            base.OnModelCreating(modelBuilder);
        }

        #region 接口
        public async Task<int> SaveChangesEntityAsync()
        {
            return await base.SaveChangesAsync();
        }

        public async Task<TAggregateRoot> AddEntityAsync<TAggregateRoot>(TAggregateRoot entity) where TAggregateRoot : class, IAggregateRoot
        {
            //return base.Set<TAggregateRoot>().Add(entity) as TAggregateRoot;
            return await base.AddAsync<TAggregateRoot>(entity) as TAggregateRoot;
        }

        public async Task<bool> DeleteEntityAsync<TAggregateRoot>(dynamic id) where TAggregateRoot : class, IAggregateRoot
        {
            return await base.Set<TAggregateRoot>().Remove(id);
        }

        public async Task<bool> DeleteEntityAsync<TAggregateRoot>(Expression<Func<TAggregateRoot, bool>> expression) where TAggregateRoot : class, IAggregateRoot
        {
            throw new NotImplementedException();
        }

        public async Task<TAggregateRoot> UpdateEntityAsync<TAggregateRoot>(TAggregateRoot entity) where TAggregateRoot : class, IAggregateRoot
        {
            //base.Entry<TAggregateRoot>(entity).State = EntityState.Modified;
            //return entity;
            return base.Update<TAggregateRoot>(entity) as TAggregateRoot;
        }
        #endregion 接口
    }
}
