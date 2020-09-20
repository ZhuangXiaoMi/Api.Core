using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
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