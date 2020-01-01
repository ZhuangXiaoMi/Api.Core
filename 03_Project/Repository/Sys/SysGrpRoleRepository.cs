using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysGrpRoleRepository
    /// </summary>
    public class SysGrpRoleRepository : BaseRepository<SysGrpRole>, ISysGrpRoleRepository
    {
        public SysGrpRoleRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}