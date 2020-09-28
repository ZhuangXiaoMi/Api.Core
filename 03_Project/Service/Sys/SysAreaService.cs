using Common;
using DTO;
using Entity;
using IRepository;
using IService;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;

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
                var areaStr = HttpHelper.HttpGet("https://passer-by.com/data_location/list.json");
                var areaLst = JsonConvert.DeserializeObject<Dictionary<string, string>>(areaStr);
                foreach (var item in areaLst)
                {
                    var entity = _baseRepository.FindSingle(p => p.area_name == item.Value && item.Key.StartsWith(p.simple_division));
                    if (entity == null)
                    {
                        _logger.LogInformation($"无：{item.Key}：{item.Value}");
                    }
                    else if (string.IsNullOrEmpty(entity.area_code))
                    {
                        //entity.area_code = item.Key;
                        //_unitOfWork.Update(entity);
                    }
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