using IService.Sys;
using Microsoft.Extensions.Logging;
using System.Threading;
using System.Threading.Tasks;

namespace Tasks.JobScheduler
{
    public class ScopedProcessingService : IScopedProcessingService
    {
        private readonly ILogger<ScopedProcessingService> _logger;
        private readonly ISysUserService _sysUserService;

        public ScopedProcessingService(ILogger<ScopedProcessingService> logger, ISysUserService sysUserService)
        {
            _logger = logger;
            _sysUserService = sysUserService;
        }

        public async Task DoWork(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                _logger.LogInformation("");
                _sysUserService.Print();
                await Task.Delay(10000, stoppingToken);
            }
        }
    }
}
