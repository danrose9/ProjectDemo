using ProjectDemoApi.Services;

namespace ProjectDemoApi.Middleware
{
    public class CustomLoggingMiddleware
    {
        private readonly RequestDelegate _next;

        public CustomLoggingMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context, ICustomLogger customeLogger)
        {
            customeLogger.WriteMessagetoConsole($"Request to: {context.Request.Path}");
            await _next(context);
        }
    }
}
