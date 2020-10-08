using Common;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.SignalR;
using System.Threading.Tasks;

namespace Common
{
    /// <summary>
    /// 记录请求和响应数据
    /// </summary>
    public class SignalRMiddleware
    {
        private readonly RequestDelegate _request;
        private readonly IHubContext<ChatHub> _hubContext;

        public SignalRMiddleware(RequestDelegate request, IHubContext<ChatHub> hubContext)
        {
            _request = request;
            _hubContext = hubContext;
        }

        public async Task InvokeAsync(HttpContext httpContext)
        {
            if (AppSettingsHelper.GetElement("Middleware", "SignalR", "Enabled").ParseToBool())
            {
                //await _hubContext.Clients.All.SendAsync("ReceiveUpdate", LogLock.GetLogData());
            }
            await _request(httpContext);
        }
    }
}
