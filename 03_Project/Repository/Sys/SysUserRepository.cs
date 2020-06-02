﻿using Entity.SysManage;
using IRepository;
using IRepository.Sys;
using Repository.EF;

namespace Repository.Sys
{
    /// <summary>
    /// SysUserRepository
    /// </summary>
    public class SysUserRepository : BaseRepository<SysUser>, ISysUserRepository
    {
        public SysUserRepository(IDbContext dbContext) : base(dbContext)
        {

        }
    }
}