using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysAreaRepository
    /// </summary>
    public class SysAreaRepository : BaseRepository<SysArea>, ISysAreaRepository
    {
        public SysAreaRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}