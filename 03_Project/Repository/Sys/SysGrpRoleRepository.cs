using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysGrpRoleRepository
    /// </summary>
    public class SysGrpRoleRepository : BaseRepository<SysGrpRole>, ISysGrpRoleRepository
    {
        public SysGrpRoleRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}