using Entity.SysManage;
using IRepository.Sys;
using IRepository.UnitOfWork;
using Repository.SqlSugar;

namespace Repository.Sys
{
    /// <summary>
    /// SysDictRepository
    /// </summary>
    public class SysDictRepository : BaseRepository<SysDict>, ISysDictRepository
    {
        public SysDictRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}