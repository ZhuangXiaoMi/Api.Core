using Common;
using DTO;
using Entity;
using IRepository;
using IService;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace Service
{
    public class SysAreaService : BaseService<SysArea>, ISysAreaService
    {
        private readonly ILogger<SysAreaService> _logger;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public SysAreaService(IUnitOfWork unitOfWork, ISysAreaRepository sysAreaRepository, LoginInfo loginInfo, ILogger<SysAreaService> logger, IWebHostEnvironment webHostEnvironment)
            : base(unitOfWork, sysAreaRepository, loginInfo)
        {
            _logger = logger;
            _webHostEnvironment = webHostEnvironment;
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
                    //港澳台
                    if(item.Value.StartsWith("810")|| item.Value.StartsWith("820") || item.Value.StartsWith("83"))
                    {
                        /*
INSERT INTO sys_area (level,administrative_division,area_name,parent_division,simple_division,category,sub,parent_id,parent_ids,area_code,simple_name,sort,description,remark,is_enabled,is_delete,create_user_id,modify_user_id,delete_user_id,create_time,modify_time,delete_time) VALUES (1, '110000000000', '北京市', '', '11', '', 1,0,'','','',0,'','',1,0,1,0,0,getdate(),getdate(),getdate());
INSERT INTO sys_area (level,administrative_division,area_name,parent_division,simple_division,category,sub,parent_id,parent_ids,area_code,simple_name,sort,description,remark,is_enabled,is_delete,create_user_id,modify_user_id,delete_user_id,create_time,modify_time,delete_time) VALUES (2, '110100000000', '市辖区', '110000000000', '1101', '', 16,0,'','','',0,'','',1,0,1,0,0,getdate(),getdate(),getdate());
INSERT INTO sys_area (level,administrative_division,area_name,parent_division,simple_division,category,sub,parent_id,parent_ids,area_code,simple_name,sort,description,remark,is_enabled,is_delete,create_user_id,modify_user_id,delete_user_id,create_time,modify_time,delete_time) VALUES (3, '110101000000', '东城区', '110100000000', '110101', '', 17,0,'','','',0,'','',1,0,1,0,0,getdate(),getdate(),getdate());
INSERT INTO sys_area (level,administrative_division,area_name,parent_division,simple_division,category,sub,parent_id,parent_ids,area_code,simple_name,sort,description,remark,is_enabled,is_delete,create_user_id,modify_user_id,delete_user_id,create_time,modify_time,delete_time) VALUES (4, '110101001000', '东华门街道', '110101000000', '110101001', '', 12,0,'','','',0,'','',1,0,1,0,0,getdate(),getdate(),getdate());
INSERT INTO sys_area (level,administrative_division,area_name,parent_division,simple_division,category,sub,parent_id,parent_ids,area_code,simple_name,sort,description,remark,is_enabled,is_delete,create_user_id,modify_user_id,delete_user_id,create_time,modify_time,delete_time) VALUES (5, '110101001001', '多福巷社区居委会', '110101001000', '110101001001', '111', 0,0,'','','',0,'','',1,0,1,0,0,getdate(),getdate(),getdate());
                        
2020-09-28 22:25:28,261 [4] INFO  Service.SysAreaService.? [(null)] [?] - 无：830000：台湾省
2020-09-28 22:25:28,284 [4] INFO  Service.SysAreaService.? [(null)] [?] - 无：830100：台北市
2020-09-28 22:25:28,306 [4] INFO  Service.SysAreaService.? [(null)] [?] - 无：830101：中正区
2020-09-28 22:25:28,327 [4] INFO  Service.SysAreaService.? [(null)] [?] - 无：830102：大同区
                        特殊 8390开头  只属于台湾省
                         */

                        //string webRootPath = _webHostEnvironment.WebRootPath;//E:\00_MySource\Api.Core\03_Project\Api.Core\wwwroot
                        string contentRootPath = _webHostEnvironment.ContentRootPath;//E:\00_MySource\Api.Core\03_Project\Api.Core
                        var sqlPath = Path.Combine(contentRootPath, "SQL/Init/sys_area港澳台.sql");
                        string sql = $"";

                    }
                    else
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