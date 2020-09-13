using Autofac;
using Autofac.Extensions.DependencyInjection;
using Autofac.Extras.DynamicProxy;
using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;

namespace Common
{
    public class AutofacService : Autofac.Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            //var basePath = Microsoft.DotNet.PlatformAbstractions.ApplicationEnvironment.ApplicationBasePath;
            var basePath = AppContext.BaseDirectory;

            #region Autofac
            //注册要通过反射创建的组件
            //builder.RegisterType<MemoryCacheAOP>();
            //builder.RegisterType<RedisCacheAOP>();
            //builder.RegisterType<LogAOP>();//注入拦截器

            #region 带有接口层的服务注入
            //实现类的dll文件
            try
            {
                //注册要通过反射创建的组件
                //方法一：builder.RegisterType<SysUserService>().As<ISysUserService>();
                //方法二：var assemblyService = Assembly.Load("Service.dll");
                var serviceDllFile = Path.Combine(basePath, "Service.dll");//获取注入项目绝对路径
                var repositoryDllFile = Path.Combine(basePath, "Repository.dll");
                if (!File.Exists(serviceDllFile) || !File.Exists(repositoryDllFile))
                {
                    throw new Exception("Service.dll 或 Repository.dll 不存在");
                }

                // AOP 开关，如果想要打开指定的功能，只需要在 appsettigns.json 对应对应 true 就行。
                var cacheType = new List<Type>();
                //if (AppSettingsHelper.GetElement(new string[] { "AppSettings", "RedisCacheAOP", "Enabled" }).ObjectToBool())
                //{
                //    builder.RegisterType<RedisCacheAOP>();
                //    cacheType.Add(typeof(RedisCacheAOP));
                //}
                //if (AppSettingsHelper.GetElement(new string[] { "AppSettings", "MemoryCacheAOP", "Enabled" }).ObjectToBool())
                //{
                //    builder.RegisterType<MemoryCacheAOP>();
                //    cacheType.Add(typeof(MemoryCacheAOP));
                //}
                //if (AppSettingsHelper.GetElement(new string[] { "AppSettings", "LogAOP", "Enabled" }).ObjectToBool())
                //{
                //    builder.RegisterType<LogAOP>();
                //    cacheType.Add(typeof(LogAOP));
                //}

                //var assemblyService = Assembly.LoadFile(serviceDllFile);//加载指定文件，不会加载引用的其它dll
                var assemblyService = Assembly.LoadFrom(serviceDllFile);//加载指定文件，会加载引用的其它dll

                //builder.RegisterAssemblyTypes(assemblyService).AsImplementedInterfaces();//指定已扫描程序集中的类型注册为提供所有其实现的接口
                builder.RegisterAssemblyTypes(assemblyService)
                    .AsImplementedInterfaces()
                    .InstancePerDependency()
                    .EnableInterfaceInterceptors()
                    .InterceptedBy(cacheType.ToArray());
                //允许将拦截器服务的列表分配给注册，即：将拦截器添加到要注入容器的接口或类上
                //EnableInterfaceInterceptors：对目标类型启用接口拦截。拦截器将被确定，通过在类或接口上截取属性或添加InterceptedBy
                //引用"Autofac.Extras.DynamicProxy"
                //如果注入两个，InterceptedBy(typeof(MemoryCacheAOP), typeof(LogAOP))；如果使用Redis缓存，必须开启Redis服务，否则用memory缓存MemoryCacheAOP

                var assemblyRepository = Assembly.LoadFrom(repositoryDllFile);
                builder.RegisterAssemblyTypes(assemblyRepository)
                    .AsImplementedInterfaces()
                    .InstancePerDependency();

            }
            catch (Exception ex)
            {
                //throw new Exception("缺少dll");
            }
            #endregion 带有接口层的服务注入

            #region 没有接口层的服务层注入
            //若想使用AOP拦截，须设置虚方法
            //var assemblyServiceNoInterface = Assembly.Load("Service.Sys");
            //builder.RegisterAssemblyTypes(assemblyServiceNoInterface);
            #endregion 没有接口层的服务层注入

            #region 没有接口的单独类 class 注入，只能注入该类中的虚方法
            //builder.RegisterAssemblyTypes(Assembly.GetAssembly(typeof(类)))
            //    .EnableClassInterceptors()
            //    .InterceptedBy(typeof(LogAOP));
            #endregion 没有接口的单独类 class 注入，只能注入该类中的虚方法

            //将IServiceCollection services填充到Autofac容器生成器中
            //builder.Populate(services);
            //var ApplicationContainer = builder.Build();//使用已进行的组件登记创建新容器
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
    }
}
