using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysUserRoleRepository
    /// </summary>
    public class SysUserRoleRepository : BaseRepository<SysUserRole>, ISysUserRoleRepository
    {
        public SysUserRoleRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}