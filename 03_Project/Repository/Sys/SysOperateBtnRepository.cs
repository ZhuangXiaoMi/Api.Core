using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysOperateBtnRepository
    /// </summary>
    public class SysOperateBtnRepository : BaseRepository<SysOperateBtn>, ISysOperateBtnRepository
    {
        public SysOperateBtnRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}