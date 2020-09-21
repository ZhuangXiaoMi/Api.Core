using DTO;
using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;

namespace Service
{
    public class SysAreaService : BaseService<SysArea>, ISysAreaService
    {
        private readonly ILogger<SysAreaService> _logger;

        public SysAreaService(IUnitOfWork unitOfWork, ISysAreaRepository sysAreaRepository, LoginInfo loginInfo, ILogger<SysAreaService> logger)
            : base(unitOfWork, sysAreaRepository, loginInfo)
        {
            _logger = logger;
        }

        public ResultResDto<int> Init()
        {
            var result = new ResultResDto<int>();
            try
            {
                #region 实体

                #endregion 实体

                var entities = new List<SysUser>();
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