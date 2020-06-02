using Entity.SysManage;
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
        public SysModuleFormRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}