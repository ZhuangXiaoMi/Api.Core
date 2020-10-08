using Common;
using DTO;
using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

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

        public async Task<ResultResDto<int>> InitAsync()
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

                result.data = await _unitOfWork.BatchAddAsync(entities);
            }
            catch (Exception ex)
            {
                _logger.LogInformation(ex.ToString());
                result.code = DEFINE.FAIL;
                result.msg = ex.Message;
            }

            return result;
        }

        public ResultResDto<UserModel> CheckLogin(LoginReqDto req)
        {
            var result = new ResultResDto<UserModel>();
            try
            {
                var entity = _baseRepository.FindSingle(p => p.account == req.account);
                if (entity != null)
                {
                    if (entity.status == ObjectExt.ParseToInt(AccountStatusEnum.DELETE))
                    {
                        result.code = DEFINE.ERROR_NOT_FOUND;
                        result.msg = "账号已禁用";
                    }
                    else if (entity.status == ObjectExt.ParseToInt(AccountStatusEnum.LOCK))
                    {
                        result.code = DEFINE.ERROR_NOT_FOUND;
                        result.msg = "账号锁定";
                    }
                    else if (entity.status == ObjectExt.ParseToInt(AccountStatusEnum.NO_MAIL_VERIFY))
                    {
                        result.code = DEFINE.ERROR_NOT_FOUND;
                        result.msg = "账号未通过邮件验证";
                    }
                    else if (entity.status == ObjectExt.ParseToInt(AccountStatusEnum.NO_ADMIN_VERIFY))
                    {
                        result.code = DEFINE.ERROR_NOT_FOUND;
                        result.msg = "账号未通过管理员验证";
                    }
                    else if (entity.status == ObjectExt.ParseToInt(AccountStatusEnum.NORMAL))
                    {
                        if (EncryptHelper.MD5Encrypt32(req.password) == entity.password)
                        {
                            LoginInfo info = new LoginInfo();
                            info.CurrentUser = new UserModel
                            {
                                account = entity.account,
                                secret_key = entity.secret_key,
                                no = entity.no,
                                real_name = entity.real_name,
                                nickname = entity.nickname,
                                sex = entity.sex,
                                age = entity.age,
                                birthday = entity.birthday,
                                telephone = entity.telephone,
                                cellphone = entity.cellphone,
                                email = entity.email,
                                wechat = entity.wechat,
                                education = entity.education,
                                icon = entity.icon,
                                address = entity.address,
                                entry_time = entity.entry_time,
                                salary = entity.salary,
                                theme = entity.theme,
                                status = entity.status,
                                dept_id = entity.dept_id,
                                job_id = entity.job_id,
                                manager_id = entity.manager_id,
                                security_level = entity.security_level,
                                last_login_ip = entity.last_login_ip,
                                last_login_time = entity.last_login_time,
                                sort = entity.sort,
                                description = entity.description,
                                remark = entity.remark,
                                is_admin = entity.is_admin,
                                is_enabled = entity.is_enabled,
                                id = entity.id,
                                is_delete = entity.is_delete,
                                create_user_id = entity.create_user_id,
                                modify_user_id = entity.modify_user_id,
                                delete_user_id = entity.delete_user_id,
                                create_time = entity.create_time,
                                modify_time = entity.modify_time,
                                delete_time = entity.delete_time
                            };
                            result.msg = "登录成功";
                        }
                        else
                        {
                            result.code = DEFINE.ERROR_BAD_REQUEST;
                            result.msg = "密码不正确";
                        }
                    }
                }
                else
                {
                    result.code = DEFINE.ERROR_NOT_FOUND;
                    result.msg = "账号不存在";
                }
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