using Microsoft.Extensions.DependencyInjection;
using StackExchange.Profiling.Storage;
using System;

namespace Api.Core.Extends
{
    /// <summary>
    /// 分析工具 MiniProfiler 服务
    /// </summary>
    public static class MiniProfilerService
    {
        public static void AddMiniProfilerService(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

            services.AddMiniProfiler(options =>
            {
                //"/profiler/results"访问分析报告
                options.RouteBasePath = "/profiler";//默认路径：/mini-profiler-resources
                //(options.Storage as MemoryCacheStorage).CacheDuration = TimeSpan.FromMinutes(10);
                options.PopupRenderPosition = StackExchange.Profiling.RenderPosition.Left;
                options.PopupShowTimeWithChildren = true;

                //可以增加权限
                //options.ResultsAuthorize = request => request.HttpContext.User.IsInRole("Admin");
                //options.UserIdProvider = request => request.HttpContext.User.Identity.Name;
            });
        }
    }
}
