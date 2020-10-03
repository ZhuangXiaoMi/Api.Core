using Common;
using DTO;
using IService;
using Microsoft.AspNetCore.Mvc;

namespace Api.Core.Controllers
{
    /// <summary>
    /// 地区表
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    [ApiGroup(GroupNameEnum.System)]
    public class SysAreaController : BaseController
    {
        private readonly ISysAreaService _sysAreaService;

        public SysAreaController(ISysAreaService sysAreaService)
        {
            _sysAreaService = sysAreaService;
        }

        ///// <summary>
        ///// 初始化
        ///// </summary>
        ///// <returns></returns>
        //[HttpGet]
        //[Route("/api/sys_area/init")]
        //public ResultResDto<int> Init()
        //    => _sysAreaService.Init();
    }
}