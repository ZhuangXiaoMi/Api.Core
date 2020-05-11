using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Entity.SysManage;
using IService.Sys;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Web.Models;

namespace Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ISysUserService _sysUserService;

        public HomeController(ILogger<HomeController> logger, ISysUserService sysUserService)
        {
            _logger = logger;
            _sysUserService = sysUserService;
        }

        public async Task<IActionResult> Index(int deptId)
        {
            ViewBag.Title = $"User Index of {deptId}";
            var users = await _sysUserService.Query(o => o.DeptId == deptId && o.IsDelete == false, p => p.RealName);
            return View(users);
        }

        public IActionResult Add(int deptId)
        {
            ViewBag.Title = "Add User";
            return View(new SysUser
            {
                DeptId = deptId
            });
        }

        [HttpPost]
        public async Task<IActionResult> Add(SysUser user)
        {
            if (ModelState.IsValid)
            {
                await _sysUserService.Add(user);
            }
            return RedirectToAction(nameof(Index), new { deptId = user.DeptId });//nameof利于Index重命名，匿名类deptId跟Index参数一样
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
