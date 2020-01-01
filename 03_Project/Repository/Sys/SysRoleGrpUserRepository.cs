using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysRoleGrpUserRepository
    /// </summary>
    public class SysRoleGrpUserRepository : BaseRepository<SysRoleGrpUser>, ISysRoleGrpUserRepository
    {
        public SysRoleGrpUserRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}