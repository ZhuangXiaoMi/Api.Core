using Entity.SysManage;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysUserGrpUserRepository
    /// </summary>
    public class SysUserGrpUserRepository : BaseRepository<SysUserGrpUser>, ISysUserGrpUserRepository
    {
        public SysUserGrpUserRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}