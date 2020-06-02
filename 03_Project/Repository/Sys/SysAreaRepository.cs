﻿using Entity.SysManage;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysAreaRepository
    /// </summary>
    public class SysAreaRepository : BaseRepository<SysArea>, ISysAreaRepository
    {
        public SysAreaRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}