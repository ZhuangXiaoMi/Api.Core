using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Common;
using Entity;
using IService;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Core.Controllers
{
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

        [HttpGet]
        [Route("/api/sys_area/get")]
        public ActionResult<int> GetList()
        {
            var result = _sysAreaService.Find().ToList();

            return result.Count;
        }

    }
}