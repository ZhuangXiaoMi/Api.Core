using Entity;
using IService.Sys;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Web.ViewComponents
{
    public class MenuViewComponent : ViewComponent
    {
        // 支持构造函数依赖注入
        private readonly ISysUserService _sysUserService;

        public MenuViewComponent(ISysUserService sysUserService)
        {
            _sysUserService = sysUserService;
        }

        public async Task<IViewComponentResult> InvokeAsync(string id)
        {
            //var id = RouteData.Values["id"] as string;//获取当前请求的路由参数
            id = id ?? RouteData.Values["id"] as string;//调用时传入参数
            ViewBag.id = id;

            Regex weatherRegex = new Regex(@"<img id=cur-weather class=mtt title="".+?"" src=""//(.+?.png)"" width=80 height=80>");
            using (var client = new HttpClient())
            {
                var response = await client.GetAsync($"https://www.timeanddate.com/weather/china/xiamen");
                var content = await response.Content.ReadAsStringAsync();
                var match = weatherRegex.Match(content);
                var imageUrl = match.Groups[1].Value;
                return View("Default", new SysUser
                {
                    icon = imageUrl
                });
            }
        }

        //public string Invoke(string target) => "";
    }
}
