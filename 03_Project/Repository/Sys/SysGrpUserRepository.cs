﻿using Entity.SysManage;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysGrpUserRepository
    /// </summary>
    public class SysGrpUserRepository : BaseRepository<SysGrpUser>, ISysGrpUserRepository
    {
        public SysGrpUserRepository(IDbContext dbContext) : base(dbContext)
        {
        }
    }
}