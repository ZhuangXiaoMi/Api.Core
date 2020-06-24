using Microsoft.AspNetCore.Builder;

namespace Common
{
    public static class MiddlewareConfigure
    {
        public static IApplicationBuilder UseSignalRConfigure(this IApplicationBuilder app)
        {
            return app.UseMiddleware<SignalRMiddleware>();
        }
    }
}
