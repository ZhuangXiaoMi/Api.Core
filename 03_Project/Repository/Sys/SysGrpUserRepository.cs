using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysGrpUserRepository
    /// </summary>
    public class SysGrpUserRepository : BaseRepository<SysGrpUser>, ISysGrpUserRepository
    {
        public SysGrpUserRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}