﻿using Entity;
using IRepository;
using Repository.EF;

namespace Repository
{
    /// <summary>
    /// SysDBBackupRepository
    /// </summary>
    public class SysDBBackupRepository : BaseRepository<SysDBBackup>, ISysDBBackupRepository
    {
        public SysDBBackupRepository(ApiDbContext dbContext) : base(dbContext)
        {
        }
    }
}