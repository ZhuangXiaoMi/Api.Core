using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysRoleGrpUserRepository
    /// </summary>
    public class SysRoleGrpUserRepository : BaseRepository<SysRoleGrpUser>, ISysRoleGrpUserRepository
    {
        public SysRoleGrpUserRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}