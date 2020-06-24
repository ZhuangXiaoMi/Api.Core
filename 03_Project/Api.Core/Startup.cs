using Autofac;
using Autofac.Extensions.DependencyInjection;
using Autofac.Extras.DynamicProxy;
using Common;
using DTO;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;

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

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();//XML .AddXmlSerializerFormatters();

            services.AddSingleton<IRedisCacheManage, RedisCacheManage>();
            //services.AddSingleton(new AppSettingsHelper(Env.ContentRootPath));
            services.AddSingleton(new AppSettingsHelper(Configuration));

            services.AddMemoryCacheService();
            //services.AddSqlSugarService();
            services.AddDbContext<Repository.EF.ApiDbContext>();//services.AddDbService();
            services.AddAutoMapperService();
            services.AddCorsService();//CORS配置要在Autofac前，否则autofacBuilder.Populate(services);后再配置会无效
            services.AddMiniProfilerService();
            services.AddSwaggerService();
            services.AddAuthenticationService();
            services.AddSignalR();

            #region Startup.cs读取appsettings.json
            /*
            // 1.按节点访问，Startup类在构造函数已经注入Configuration(访问appsettings.json)，其它地方需要自己注入
            var AllowedHosts = Configuration["AllowedHosts"];
            var SqlServerConnection = Configuration.GetSection("AppSettings").GetSection("SqlServer")["ConnectionString"];
            var OracleConnection = Configuration["AppSettings:Oracle:ConnectionString"];
            var OracleConnection1 = AppSettingsHelper.GetElement(new string[] { "AppSettings", "Oracle", "ConnectionString" });
            var OracleConnection2 = AppSettingsHelper.GetElement("AppSettings", "Oracle", "ConnectionString");

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

            #region Autofac
            var autofacBuilder = new ContainerBuilder();
            var basePath = Microsoft.DotNet.PlatformAbstractions.ApplicationEnvironment.ApplicationBasePath;

            //注册要通过反射创建的组件
            autofacBuilder.RegisterType<MemoryCacheAOP>();
            autofacBuilder.RegisterType<RedisCacheAOP>();
            autofacBuilder.RegisterType<LogAOP>();//注入拦截器

            #region 带有接口层的服务注入
            //实现类的dll文件
            try
            {
                //注册要通过反射创建的组件
                //方法一：autofacBuilder.RegisterType<SysUserService>().As<ISysUserService>();
                //方法二：var assemblyService = Assembly.Load("Service.dll");
                var serviceDllFile = Path.Combine(basePath, "Service.dll");//获取注入项目绝对路径
                //var assemblyService = Assembly.LoadFile(serviceDllFile);//加载指定文件，不会加载引用的其它dll
                var assemblyService = Assembly.LoadFrom(serviceDllFile);//加载指定文件，会加载引用的其它dll

                // AOP 开关，如果想要打开指定的功能，只需要在 appsettigns.json 对应对应 true 就行。
                var cacheType = new List<Type>();
                if (AppSettingsHelper.GetElement(new string[] { "AppSettings", "RedisCacheAOP", "Enabled" }).ObjectToBool())
                {
                    cacheType.Add(typeof(RedisCacheAOP));
                }
                if (AppSettingsHelper.GetElement(new string[] { "AppSettings", "MemoryCacheAOP", "Enabled" }).ObjectToBool())
                {
                    cacheType.Add(typeof(MemoryCacheAOP));
                }
                if (AppSettingsHelper.GetElement(new string[] { "AppSettings", "LogAOP", "Enabled" }).ObjectToBool())
                {
                    cacheType.Add(typeof(LogAOP));
                }

                //autofacBuilder.RegisterAssemblyTypes(assemblyService).AsImplementedInterfaces();//指定已扫描程序集中的类型注册为提供所有其实现的接口
                autofacBuilder.RegisterAssemblyTypes(assemblyService)
                    .AsImplementedInterfaces()
                    .InstancePerLifetimeScope()
                    .EnableInterfaceInterceptors()
                    .InterceptedBy(cacheType.ToArray());
                //允许将拦截器服务的列表分配给注册，即：将拦截器添加到要注入容器的接口或类上
                //EnableInterfaceInterceptors：对目标类型启用接口拦截。拦截器将被确定，通过在类或接口上截取属性或添加InterceptedBy
                //引用"Autofac.Extras.DynamicProxy"
                //如果注入两个，InterceptedBy(typeof(MemoryCacheAOP), typeof(LogAOP))；如果使用Redis缓存，必须开启Redis服务，否则用memory缓存MemoryCacheAOP

                var repositoryDllFile = Path.Combine(basePath, "Repository.dll");
                var assemblyRepository = Assembly.LoadFrom(repositoryDllFile);
                autofacBuilder.RegisterAssemblyTypes(assemblyRepository).AsImplementedInterfaces();

            }
            catch (Exception ex)
            {
                //throw new Exception("缺少dll");
            }
            #endregion 带有接口层的服务注入

            #region 没有接口层的服务层注入
            //若想使用AOP拦截，须设置虚方法
            //var assemblyServiceNoInterface = Assembly.Load("Service.Sys");
            //autofacBuilder.RegisterAssemblyTypes(assemblyServiceNoInterface);
            #endregion 没有接口层的服务层注入

            #region 没有接口的单独类 class 注入，只能注入该类中的虚方法
            //autofacBuilder.RegisterAssemblyTypes(Assembly.GetAssembly(typeof(类)))
            //    .EnableClassInterceptors()
            //    .InterceptedBy(typeof(LogAOP));
            #endregion 没有接口的单独类 class 注入，只能注入该类中的虚方法

            //将IServiceCollection services填充到Autofac容器生成器中
            autofacBuilder.Populate(services);
            var ApplicationContainer = autofacBuilder.Build();//使用已进行的组件登记创建新容器
            //return new AutofacServiceProvider(ApplicationContainer);//第三方IOC接管ConfigureServices函数，返回类型改成 IServiceProvider

            //---------- 测试 ----------
            //var sysUserService = ApplicationContainer.Resolve<IService.Sys.ISysUserService>();
            //string test = sysUserService.XXX();
            //int count = ApplicationContainer.ComponentRegistry.Registrations.Count();
            //string test = sysUserService.Print();
            #endregion Autofac

            #region Core自带IOC容器
            //services.AddScoped<ISysUserRepository, SysUserRepository>();
            //services.AddScoped<ISysUserService, SysUserService>();
            #endregion Core自带IOC容器

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

            #region Swagger(NuGet："Swashbuckle.AspNetCore")
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint($"/swagger/v1/swagger.json", $"{ AppSettingsHelper.GetElement(new string[] { "Startup", "ApiName" }) } v1");
                c.IndexStream = () => GetType().GetTypeInfo().Assembly.GetManifestResourceStream("Api.Core.index.html");
                //路径配置，设置为空，表示直接在根域名（localhost:8001）访问该文件，注意localhost:8001/swagger是访问不到的
                //launchSettings.json中把"launchUrl": "api/values"去掉，直接访问localhost:8001/index.html
                //PS：launchSettings.json中profiles对应调试方式，IIS调试/项目自带的Kestrel Web应用调式
                c.RoutePrefix = "";
            });
            #endregion Swagger(NuGet："Swashbuckle.AspNetCore")

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
            });
        }
    }
}
