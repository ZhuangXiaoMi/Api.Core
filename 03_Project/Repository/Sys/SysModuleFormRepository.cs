using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysModuleFormRepository
    /// </summary>
    public class SysModuleFormRepository : BaseRepository<SysModuleForm>, ISysModuleFormRepository
    {
        public SysModuleFormRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}