using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Common.Hub;
using IService.Test;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Service.Test;

namespace Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            //services.AddControllers();
            //services.AddRazorPages();

            services.AddSingleton<ISignalRService, SignalRService>();
            services.AddSignalR();//客户端Js 客户端库：@aspnet/signalr
            //服务端 NuGet：Microsoft.AspNetCore.SignalR.Protocols.MessagePack
            //客户端Js 客户端库：@aspnet/signalr-protocol-msgpack
            //services.AddSignalR().AddMessagePackProtocol();//支持JSON、MessagePack
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();

            //身份认证必须放在 UseEndpoints 前面，使用MVC前完成身份认证
            app.UseAuthorization();

            //端点 endpoints：Http请求URL结尾部分，被中间件处理
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHub<ChatHub>("/ChatHub");

                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");

                //类似在Controller上加[Route("api/[Controller]")]
                //注意：services.AddControllers(); 和 endpoints.MapControllers(); 成对出现
                //endpoints.MapControllers();

                //注意：services.AddRazorPages(); 和 endpoints.MapRazorPages(); 成对出现
                //endpoints.MapRazorPages();
            });
        }
    }
}
