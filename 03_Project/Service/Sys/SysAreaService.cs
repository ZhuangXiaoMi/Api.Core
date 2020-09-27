using Common;
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
                _unitOfWork.BeginTransaction();
                //var dd = HttpHelper.HttpGet("https://jquerywidget.com/jquery-citys/")





                _unitOfWork.CommitTransaction();
            }
            catch (Exception ex)
            {
                _unitOfWork.RollbackTransaction();
                _logger.LogInformation(ex.ToString());
                result.code = DEFINE.FAIL;
                result.msg = ex.Message;
            }

            return result;
        }
    }
}