using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Threading;
using System.Threading.Tasks;
using Tasks.JobScheduler;

namespace Tasks
{
    /// <summary>
    /// 每次执行都开启新线程，线程内部数据互不影响，每个线程都执行到底
    /// 源地址：https://www.cnblogs.com/catcher1994/p/9961228.html
    /// 源地址：https://www.cnblogs.com/zhangchaoran/p/11121846.html
    /// https://docs.microsoft.com/zh-cn/dotnet/architecture/microservices/multi-container-microservice-net-applications/background-tasks-with-ihostedservice
    /// https://docs.microsoft.com/zh-cn/aspnet/core/fundamentals/host/hosted-services?view=aspnetcore-3.1&tabs=visual-studio
    /// https://stackoverflow.com/questions/53116461/background-task-of-writing-to-the-database-by-timer
    /// https://azhuge233.com/asp-net-core-%E9%80%9A%E8%BF%87-ihostedservice-%E5%AE%9E%E7%8E%B0%E5%90%8E%E5%8F%B0%E4%BB%BB%E5%8A%A1%E8%BF%90%E8%A1%8C/
    /// https://www.cnblogs.com/darrenji/p/10254957.html
    /// https://www.cnblogs.com/fujinliang/archive/2012/06/17/2552841.html
    /// </summary>
    public class JobBackService : BackgroundService
    {
        private Timer _timer;
        private IServiceProvider _services;

        public JobBackService(IServiceProvider services)
        {
            _services = services;
        }

        protected override Task ExecuteAsync(CancellationToken stoppingToken)
        {
            #region 一直跑
            DoWork(stoppingToken);
            while (!stoppingToken.IsCancellationRequested)
            {
                Task.Delay(TimeSpan.FromSeconds(1), stoppingToken);
            }
            #endregion 一直跑

            #region 定时跑
            _timer = new Timer(DoWork, null, TimeSpan.Zero, TimeSpan.FromSeconds(2 * 60 * 60));//2h
            return Task.CompletedTask;
            #endregion 定时跑
        }

        private void DoWork(object state)
        {
            // DoWork ...
            Task.Delay(TimeSpan.FromSeconds(1)).Wait();//等待1s
        }

        private void DoWork(CancellationToken stoppingToken)
        {
            using (var scope = _services.CreateScope())
            {
                var scopedProcessingService = scope.ServiceProvider.GetRequiredService<IScopedProcessingService>();
                scopedProcessingService.DoWork(stoppingToken);
            }
        }

        public override void Dispose()
        {
            base.Dispose();
            _timer?.Dispose();
        }
    }
}
