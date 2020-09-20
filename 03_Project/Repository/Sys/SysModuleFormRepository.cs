using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
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