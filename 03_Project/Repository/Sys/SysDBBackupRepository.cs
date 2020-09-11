using Entity;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysDBBackupRepository
    /// </summary>
    public class SysDBBackupRepository : BaseRepository<SysDBBackup>, ISysDBBackupRepository
    {
        public SysDBBackupRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}