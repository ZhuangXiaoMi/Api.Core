using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.Extensions.Logging;
using System.Data.Common;
using System.Data.Entity.Infrastructure.Interception;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using DbCommandInterceptor = Microsoft.EntityFrameworkCore.Diagnostics.DbCommandInterceptor;
using IDbCommandInterceptor = Microsoft.EntityFrameworkCore.Diagnostics.IDbCommandInterceptor;

namespace Common
{
    /// <summary>
    /// Linq To EF 拦截器
    /// </summary>
    public class EFDbCommandAOP : DbCommandInterceptor, IDbCommandInterceptor
    {
        private readonly ILogger<EFDbCommandAOP> _logger;

        public EFDbCommandAOP(ILogger<EFDbCommandAOP> logger)
        {
            _logger = logger;
        }

        #region 同步
        public override InterceptionResult<int> NonQueryExecuting(DbCommand command, CommandEventData eventData, InterceptionResult<int> result)
            => base.NonQueryExecuting(command, eventData, result);
        public override int NonQueryExecuted(DbCommand command, CommandExecutedEventData eventData, int result)
        {
            SaveCmdSql(command, eventData);
            return base.NonQueryExecuted(command, eventData, result);
        }

        public override InterceptionResult<DbDataReader> ReaderExecuting(DbCommand command, CommandEventData eventData, InterceptionResult<DbDataReader> result)
            => base.ReaderExecuting(command, eventData, result);
        public override DbDataReader ReaderExecuted(DbCommand command, CommandExecutedEventData eventData, DbDataReader result)
        {
            SaveCmdSql(command, eventData);
            return base.ReaderExecuted(command, eventData, result);
        }

        public override InterceptionResult<object> ScalarExecuting(DbCommand command, CommandEventData eventData, InterceptionResult<object> result)
            => base.ScalarExecuting(command, eventData, result);
        public override object ScalarExecuted(DbCommand command, CommandExecutedEventData eventData, object result)
        {
            SaveCmdSql(command, eventData);
            return base.ScalarExecuted(command, eventData, result);
        }

        public void SaveCmdSql(DbCommand command, CommandExecutedEventData eventData)
        {
            //Trace.TraceInformation($"执行：{eventData.Duration.TotalMilliseconds} 毫秒，SQL：{command.GetCommandText()}");
            _logger.LogInformation($"执行：{eventData.Duration.TotalMilliseconds} 毫秒，SQL：{command.GetCommandText()}");
        }
        #endregion 同步

        #region 异步
        public async override Task<InterceptionResult<int>> NonQueryExecutingAsync(DbCommand command, CommandEventData eventData, InterceptionResult<int> result, CancellationToken cancellationToken = default)
            => await base.NonQueryExecutingAsync(command, eventData, result, cancellationToken);
        public async override Task<int> NonQueryExecutedAsync(DbCommand command, CommandExecutedEventData eventData, int result, CancellationToken cancellationToken = default)
        {
            SaveCmdSql(command, eventData);
            return await base.NonQueryExecutedAsync(command, eventData, result, cancellationToken);
        }

        public async override Task<InterceptionResult<DbDataReader>> ReaderExecutingAsync(DbCommand command, CommandEventData eventData, InterceptionResult<DbDataReader> result, CancellationToken cancellationToken = default)
            => await base.ReaderExecutingAsync(command, eventData, result, cancellationToken);
        public async override Task<DbDataReader> ReaderExecutedAsync(DbCommand command, CommandExecutedEventData eventData, DbDataReader result, CancellationToken cancellationToken = default)
        {
            SaveCmdSql(command, eventData);
            return await base.ReaderExecutedAsync(command, eventData, result, cancellationToken);
        }

        public async override Task<InterceptionResult<object>> ScalarExecutingAsync(DbCommand command, CommandEventData eventData, InterceptionResult<object> result, CancellationToken cancellationToken = default)
            => await base.ScalarExecutingAsync(command, eventData, result, cancellationToken);
        public async override Task<object> ScalarExecutedAsync(DbCommand command, CommandExecutedEventData eventData, object result, CancellationToken cancellationToken = default)
        {
            SaveCmdSql(command, eventData);
            return await base.ScalarExecutedAsync(command, eventData, result, cancellationToken);
        }

        #endregion 异步
    }
}
