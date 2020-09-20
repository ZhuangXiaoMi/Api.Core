using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysUserGrpUserRepository
    /// </summary>
    public class SysUserGrpUserRepository : BaseRepository<SysUserGrpUser>, ISysUserGrpUserRepository
    {
        public SysUserGrpUserRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}