using Microsoft.Extensions.Hosting;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Tasks
{
    /// <summary>
    /// 源地址：https://www.cnblogs.com/darrenji/p/10254957.html
    /// </summary>
    public class JobHostService : IHostedService, IDisposable
    {
        private Timer _timer;

        public JobHostService() { }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            _timer = new Timer(DoWork, null, TimeSpan.Zero, TimeSpan.FromSeconds(2 * 60 * 60));//2h
            return Task.CompletedTask;
        }

        private void DoWork(object state)
        {
            // DoWork ...
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            _timer?.Change(Timeout.Infinite, 0);
            return Task.CompletedTask;
        }

        public void Dispose()
        {
            _timer?.Dispose();
        }
    }
}
