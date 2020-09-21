using DTO;
using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;

namespace Service
{
    public class SysUserService : BaseService<SysUser>, ISysUserService
    {
        private readonly ILogger<SysUserService> _logger;

        public SysUserService(IUnitOfWork unitOfWork, ISysUserRepository sysUserRepository, LoginInfo loginInfo, ILogger<SysUserService> logger)
            : base(unitOfWork, sysUserRepository, loginInfo)
        {
            _logger = logger;
        }

        public ResultResDto<int> Init()
        {
            var result = new ResultResDto<int>();
            try
            {
                var entities = new List<SysUser>();

                #region 实体
                var admin = new SysUser
                {
                    id = 1,
                    account = "admin",
                    password = "e10adc3949ba59abbe56e057f20f883e",
                    secret_key = string.Empty,
                    no = "admin",
                    real_name = "管理员",
                    nickname = string.Empty,
                    sex = 0,
                    age = 1,
                    birthday = new DateTime(1999, 01, 01),
                    telephone = string.Empty,
                    cellphone = "18888888888",
                    email = "1009123099@qq.com",
                    wechat = string.Empty,
                    education = 0,
                    icon = string.Empty,
                    address = string.Empty,
                    entry_time = new DateTime(1999, 01, 01),
                    salary = 0,
                    theme = string.Empty,
                    status = 1,
                    dept_id = 0,
                    job_id = 0,
                    manager_id = 0,
                    security_level = 1,
                    last_login_ip = "127.0.0.1",
                    last_login_time = new DateTime(1999, 01, 01),
                    sort = 0,
                    description = string.Empty,
                    remark = string.Empty,
                    is_admin = 1,
                    is_enabled = 1,
                };
                var manage = new SysUser
                {
                    id = 2,
                    account = "manage",
                    password = "e10adc3949ba59abbe56e057f20f883e",
                    secret_key = string.Empty,
                    no = "manage",
                    real_name = "维护人员",
                    nickname = string.Empty,
                    sex = 0,
                    age = 1,
                    birthday = new DateTime(1999, 01, 01),
                    telephone = string.Empty,
                    cellphone = "18888888888",
                    email = "1009123099@qq.com",
                    wechat = string.Empty,
                    education = 0,
                    icon = string.Empty,
                    address = string.Empty,
                    entry_time = new DateTime(1999, 01, 01),
                    salary = 0,
                    theme = string.Empty,
                    status = 1,
                    dept_id = 0,
                    job_id = 0,
                    manager_id = 0,
                    security_level = 1,
                    last_login_ip = "127.0.0.1",
                    last_login_time = new DateTime(1999, 01, 01),
                    sort = 0,
                    description = string.Empty,
                    remark = string.Empty,
                    is_admin = 1,
                    is_enabled = 1,
                };
                var test = new SysUser
                {
                    id = 3,
                    account = "test",
                    password = "e10adc3949ba59abbe56e057f20f883e",
                    secret_key = string.Empty,
                    no = "test",
                    real_name = "测试人员",
                    nickname = string.Empty,
                    sex = 0,
                    age = 1,
                    birthday = new DateTime(1999, 01, 01),
                    telephone = string.Empty,
                    cellphone = "18888888888",
                    email = "1009123099@qq.com",
                    wechat = string.Empty,
                    education = 0,
                    icon = string.Empty,
                    address = string.Empty,
                    entry_time = new DateTime(1999, 01, 01),
                    salary = 0,
                    theme = string.Empty,
                    status = 1,
                    dept_id = 0,
                    job_id = 0,
                    manager_id = 0,
                    security_level = 1,
                    last_login_ip = "127.0.0.1",
                    last_login_time = new DateTime(1999, 01, 01),
                    sort = 0,
                    description = string.Empty,
                    remark = string.Empty,
                    is_admin = 1,
                    is_enabled = 1,
                };

                entities.Add(admin);
                entities.Add(manage);
                entities.Add(test);
                #endregion 实体

                result.data = _unitOfWork.BatchAdd(entities);
            }
            catch (Exception ex)
            {
                _logger.LogInformation(ex.ToString());
                result.code = DEFINE.FAIL;
                result.msg = ex.Message;
            }

            return result;
        }
    }
}