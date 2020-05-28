using Entity.SysManage;
using IRepository;
using Microsoft.EntityFrameworkCore;

namespace Repository.EF
{
    public class ApiDbContext : DbContext, IDbContext
    {
        public ApiDbContext() { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SysUser>();

            base.OnModelCreating(modelBuilder);
        }
    }
}
