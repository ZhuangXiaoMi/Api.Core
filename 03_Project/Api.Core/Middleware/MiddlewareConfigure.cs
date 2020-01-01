using Microsoft.AspNetCore.Builder;

namespace Api.Core.Middleware
{
    public static class MiddlewareConfigure
    {
        public static IApplicationBuilder UseSignalRConfigure(this IApplicationBuilder app)
        {
            return app.UseMiddleware<SignalRMiddleware>();
        }
    }
}
