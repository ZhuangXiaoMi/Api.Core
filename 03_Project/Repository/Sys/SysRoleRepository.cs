using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
	/// <summary>
	/// SysRoleRepository
	/// </summary>
    public class SysRoleRepository : BaseRepository<SysRole>, ISysRoleRepository
    {
        public SysRoleRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}