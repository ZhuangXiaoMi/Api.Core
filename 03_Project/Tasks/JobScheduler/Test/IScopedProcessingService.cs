using System.Threading;
using System.Threading.Tasks;

namespace Tasks.JobScheduler
{
    public interface IScopedProcessingService
    {
        Task DoWork(CancellationToken stoppingToken);
    }
}
