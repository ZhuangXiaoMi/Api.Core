using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysModuleFormRepository
    /// </summary>
    public class SysModuleFormRepository : BaseRepository<SysModuleForm>, ISysModuleFormRepository
    {
        public SysModuleFormRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}