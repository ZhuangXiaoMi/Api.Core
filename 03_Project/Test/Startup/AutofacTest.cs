using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using Autofac;
using Autofac.Extensions.DependencyInjection;
using Autofac.Extras.DynamicProxy;
using AutoMapper;
using IService.Sys;
using Microsoft.Extensions.DependencyInjection;
using NUnit.Framework;
using Service.Sys;

namespace Test.Startup
{
    public class AutofacTest
    {
        private static string _strConnection = "Persist Security Info=True;Data Source=.;User ID=sa;Password=123456;Initial Catalog=ApiCore;";

        [SetUp]
        public void Setup()
        {

        }

        [Test]
        public void Autofac()
        {
            var basePath = Microsoft.DotNet.PlatformAbstractions.ApplicationEnvironment.ApplicationBasePath;

            IServiceCollection services = new ServiceCollection();
            //services.AddAutoMapper(typeof(Startup));

            services.AddScoped<SqlSugar.ISqlSugarClient>(o =>
            {
                return new SqlSugar.SqlSugarClient(new SqlSugar.ConnectionConfig()
                {
                    ConnectionString = _strConnection,//必填，数据库连接字符串
                    DbType = SqlSugar.DbType.SqlServer,//必填，数据库类型
                    IsAutoCloseConnection = true,//默认false，时候知道关闭数据库连接，设置为true无需使用using或者Close操作
                    IsShardSameThread = true,//共享线程
                    InitKeyType = SqlSugar.InitKeyType.SystemTable//默认SystemTable, 字段信息读取, 如：该属性是不是主键，标识列等等信息
                });
            });

            //services.AddSingleton(new Appsettings(Env));

            //实例化 AutoFac 容器   
            var builder = new ContainerBuilder();
            builder.RegisterType<SysUserService>().As<ISysUserService>();

            //指定已扫描程序集中的类型注册为提供所有其实现的接口。
            //var assemblysServices = Assembly.Load("Service");
            //builder.RegisterAssemblyTypes(assemblysServices).AsImplementedInterfaces();
            //var assemblysRepository = Assembly.Load("Repository");
            //builder.RegisterAssemblyTypes(assemblysRepository).AsImplementedInterfaces();

            var servicesDllFile = Path.Combine(basePath, "Service.dll");
            var assemblysServices = Assembly.LoadFrom(servicesDllFile);
            builder.RegisterAssemblyTypes(assemblysServices)
                         .AsImplementedInterfaces()
                         .InstancePerLifetimeScope()
                         .EnableInterfaceInterceptors();

            var repositoryDllFile = Path.Combine(basePath, "Repository.dll");
            var assemblysRepository = Assembly.LoadFrom(repositoryDllFile);
            builder.RegisterAssemblyTypes(assemblysRepository).AsImplementedInterfaces();

            //将services填充到Autofac容器生成器中
            builder.Populate(services);

            //使用已进行的组件登记创建新容器
            var ApplicationContainer = builder.Build();

            var sysUserService = ApplicationContainer.Resolve<ISysUserService>();
            string test = sysUserService.Print();

            Assert.True(ApplicationContainer.ComponentRegistry.Registrations.Count() > 0);
        }
    }
}
