﻿using Entity;
using IRepository;
using System.Collections.Generic;
using System.Linq;

namespace Common
{
    public class NormalAuthStrategy : IAuthStrategy
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IBaseRepository<SysUser> _baseRepository;
        private readonly IRedisCacheManage _redisCache;

        public NormalAuthStrategy(IUnitOfWork unitOfWork, IBaseRepository<SysUser> baseRepository, IRedisCacheManage redisCache)
        {
            _unitOfWork = unitOfWork;
            _baseRepository = baseRepository;
            _redisCache = redisCache;
        }

        public SysUser User { get; set; }

        public List<SysRole> Roles
        {
            get
            {
                List<SysRole> roles = _redisCache.GetAsync<List<SysRole>>($"user:{User.id}:roles").Result;
                if (roles == null || roles.Count <= 0)
                {
                    var roleIds = _unitOfWork.Find<SysUserRole>(p => p.user_id == User.id && p.is_delete == 0)
                                    .Select(p => p.role_id)
                                    .ToList();
                    roles = _unitOfWork.Find<SysRole>(p => roleIds.Contains(p.id) && p.is_delete == 0 && p.is_enabled == 1)
                                .ToList();
                    _redisCache.SetAsync($"user:{User.id}:roles", roles);
                }

                return roles;
            }
        }
    }
}