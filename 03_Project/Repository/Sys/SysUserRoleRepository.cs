using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysUserRoleRepository
    /// </summary>
    public class SysUserRoleRepository : BaseRepository<SysUserRole>, ISysUserRoleRepository
    {
        public SysUserRoleRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}