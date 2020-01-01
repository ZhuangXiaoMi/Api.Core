using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysLogRepository
    /// </summary>
    public class SysLogRepository : BaseRepository<SysLog>, ISysLogRepository
    {
        public SysLogRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}