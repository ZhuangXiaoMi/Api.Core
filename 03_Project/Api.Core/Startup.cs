using Autofac;
using Autofac.Extensions.DependencyInjection;
using Autofac.Extras.DynamicProxy;
using Common;
using IRepository;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Service;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using Tasks;
using Tasks.JobScheduler;

namespace Api.Core
{
    public class Startup
    {
        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            Configuration = configuration;
            Env = env;
        }

        public IConfiguration Configuration { get; }
        public IWebHostEnvironment Env { get; }
        private IServiceCollection _services;
        private readonly IOptions<AppSettingsJson> _appSettings;

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();//XML .AddXmlSerializerFormatters();

            services.AddSingleton<IRedisCacheManage, RedisCacheManage>();
            services.Configure<AppSettingsJson>(Configuration);//services.AddSingleton(new AppSettingsHelper(Env.ContentRootPath));
            services.AddSingleton(new AppSettingsHelper(Configuration));
            services.AddSingleton(new LogLockService(Env.ContentRootPath));
            services.AddSingleton(new LoginInfo());

            //services.AddHostedService<JobHostService>();
            //services.AddHostedService<JobBackService>();
            //services.AddScoped<IScopedProcessingService, ScopedProcessingService>();

            services.AddMemoryCacheService();
            //services.AddSqlSugarService();
            services.AddDbContext<Repository.EF.ApiDbContext>(p =>//AddDbContextPool
            {
                p.UseSqlServer(AppSettingsHelper.GetElement(new string[] { "DBM", "SqlServer", "0", "ConnectionString" }), p => p.CommandTimeout(10));
                    //.AddInterceptors(new EFDbCommandAOP(_logger));
            });
            //services.AddDbService();
            services.AddAutoMapperService();
            services.AddCorsService();
            services.AddMiniProfilerService();//MemoryCache后
            services.AddSwaggerService();
            services.AddAuthorizationService();
            services.AddSignalR().AddNewtonsoftJsonProtocol();

            #region Startup.cs读取appsettings.json
            /*
            // 1.按节点访问，Startup类在构造函数已经注入Configuration(访问appsettings.json)，其它地方需要自己注入
            var AllowedHosts = Configuration["AllowedHosts"];
            var SqlServerConnection = Configuration.GetSection("DBM").GetSection("SqlServer").GetSection("0")["ConnectionString"];
            var OracleConnection = Configuration["DBM:Oracle:0:ConnectionString"];
            var OracleConnection1 = AppSettingsHelper.GetElement(new string[] { "DBM", "Oracle", "0", "ConnectionString" });
            var OracleConnection2 = AppSettingsHelper.GetElement("DBM", "Oracle", "0", "ConnectionString");

            // 2.按对象访问
            var rootPath = Env.ContentRootPath;//D:\MySource\Api.Core\Api.Core
            //添加指定json文件，对应\Controllers\ValuesController.cs，Get()
            var builder = new ConfigurationBuilder()
               .SetBasePath(rootPath)
               .AddJsonFile("mysettings.json", optional: true, reloadOnChange: true)
               .AddEnvironmentVariables();
            var MyConfiguration = builder.Build();

            services.AddOptions();//注入IOptions<T>
            //services.Configure<AppSettingsConfig>(MyConfiguration.GetSection("AppSettings"));//指定节点
            services.Configure<AppSettingsJson>(MyConfiguration);//整个文件
            */
            #endregion Startup.cs读取appsettings.json

            _services = services;
        }

        // Program.cs -> CreateHostBuilder：添加 Autofac 服务工厂
        public void ConfigureContainer(ContainerBuilder builder)
        {
            //builder.RegisterModule(new AutofacService());
            builder.RegisterModule<AutofacService>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseSignalRConfigure();//SignalR

            // 注意顺序，放在处理异常中间件后，便于捕获异常
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
            }

            app.UseSwaggerConfigure(() => GetType().GetTypeInfo().Assembly.GetManifestResourceStream("Api.Core.index.html"));
            app.UseMiniProfiler();
            app.UseCors("LimitRequests");//先进行跨域，再进行HTTP请求，否则无效

            // 跳转https
            //app.UseHttpsRedirection();
            // 使用静态文件，这样客户端才能访问html、js、css
            app.UseStaticFiles();
            // 使用cookie
            app.UseCookiePolicy();
            // 把错误码返回前台，如：404
            app.UseStatusCodePages();

            //方法一：弃用-开启自定义认证中间件，用官方验证方法。如想传User全局变量，还可以继续使用中间件
            //[Authorize]无策略的授权报错，且无法验证过期时间
            //app.UseJwtTokenAuth(); //或：app.UseMiddleware<JwtTokenAuth>();
            //方法二：官方认证，在ConfigureService配置认证服务(.AddAuthentication 和 .AddJwtBearer 二者缺一不可)
            //且Token传递时，必须带上"Bearer "特定字符串
            app.UseAuthentication();

            //HTTP管道有先后顺序，一定要写在 app.UseMvc(); 前，否则不起作用
            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                // 在控制器中使用[Route("api/[controller]")]
                endpoints.MapControllers();
                //或
                //endpoints.MapControllerRoute(
                //    name: "default",
                //    pattern: "{controller=Home}/{action=Index}/{id?}");

                endpoints.MapHub<ChatHub>("/api/ChatHub");
            });
        }
    }
}
