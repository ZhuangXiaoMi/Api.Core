using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysUserGrpUserRepository
    /// </summary>
    public class SysUserGrpUserRepository : BaseRepository<SysUserGrpUser>, ISysUserGrpUserRepository
    {
        public SysUserGrpUserRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}