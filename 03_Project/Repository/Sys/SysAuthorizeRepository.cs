using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysAuthorizeRepository
    /// </summary>
    public class SysAuthorizeRepository : BaseRepository<SysAuthorize>, ISysAuthorizeRepository
    {
        public SysAuthorizeRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}