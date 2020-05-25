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
            services.AddSignalR();//�ͻ���Js �ͻ��˿⣺@aspnet/signalr
            //����� NuGet��Microsoft.AspNetCore.SignalR.Protocols.MessagePack
            //�ͻ���Js �ͻ��˿⣺@aspnet/signalr-protocol-msgpack
            //services.AddSignalR().AddMessagePackProtocol();//֧��JSON��MessagePack
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

            //�����֤������� UseEndpoints ǰ�棬ʹ��MVCǰ��������֤
            app.UseAuthorization();

            //�˵� endpoints��Http����URL��β���֣����м������
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHub<ChatHub>("/ChatHub");

                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");

                //������Controller�ϼ�[Route("api/[Controller]")]
                //ע�⣺services.AddControllers(); �� endpoints.MapControllers(); �ɶԳ���
                //endpoints.MapControllers();

                //ע�⣺services.AddRazorPages(); �� endpoints.MapRazorPages(); �ɶԳ���
                //endpoints.MapRazorPages();
            });
        }
    }
}
