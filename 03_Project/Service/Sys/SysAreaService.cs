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
using System.Text;

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
                //string webRootPath = _webHostEnvironment.WebRootPath;//E:\00_MySource\Api.Core\03_Project\Api.Core\wwwroot
                string contentRootPath = _webHostEnvironment.ContentRootPath;//E:\00_MySource\Api.Core\03_Project\Api.Core
                var sqlPath = Path.Combine(contentRootPath, "SQL/Init/sys_area港澳台.sql");

                foreach (var item in areaLst)
                {
                    //港澳台
                    if (item.Key.StartsWith("810") || item.Key.StartsWith("820") || item.Key.StartsWith("83"))
                    {
                        int level = item.Key.TrimEnd('0').Length / 2;
                        string sql = $@"INSERT INTO sys_area (level,administrative_division,area_name,parent_division,simple_division,category,sub,parent_id,parent_ids,area_code,simple_name,sort,description,remark,is_enabled,is_delete,create_user_id,modify_user_id,delete_user_id,create_time,modify_time,delete_time) VALUES ({level}, '{item.Key.PadRight(12, '0')}', '{item.Value}', '', '{item.Key.TrimEnd('0')}', '', 0,0,'','{item.Key}','',0,'','',1,0,1,0,0,getdate(),getdate(),getdate());";
                        using (StreamWriter sw = new StreamWriter(sqlPath, true, Encoding.UTF8))
                        {
                            if (level == 1 || level == 2)
                            {
                                sw.WriteLine("");
                            }
                            sw.WriteLine(sql);
                        }
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