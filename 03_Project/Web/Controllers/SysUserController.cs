using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entity.SysManage;
using IService.Sys;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Web.Controllers
{
    public class SysUserController : Controller
    {
        private readonly ILogger<SysUserController> _logger;
        private readonly ISysUserService _sysUserService;
        public SysUserController(ILogger<SysUserController> logger, ISysUserService sysUserService)
        {
            _logger = logger;
            _sysUserService = sysUserService;
        }

        // GET: SysUser
        public async Task<IActionResult> Index(int deptId)
        {
            ViewBag.Title = $"User Index of {deptId}";
            var users = await _sysUserService.Query(o => o.DeptId == deptId && o.IsDelete == false, p => p.RealName);
            return View(users);
        }

        // GET: SysUser/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: SysUser/Add
        public IActionResult Add(int deptId)
        {
            ViewBag.Title = "Add User";
            return View(new SysUser
            {
                DeptId = deptId
            });
        }

        // POST: SysUser/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Add(SysUser user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    await _sysUserService.Add(user);
                }

                return RedirectToAction(nameof(Index), new { deptId = user.DeptId });//nameof利于Index重命名，匿名类deptId跟Index参数一样
            }
            catch
            {
                return View();
            }
        }

        // GET: SysUser/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: SysUser/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: SysUser/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SysUser/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}