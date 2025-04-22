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
            var request = context.Request;
            var response = context.Response;
            
            customeLogger.WriteMessagetoConsole($"Request to: [{request.Method}] {request.Path} {response.StatusCode}");
            await _next(context);
        }
    }
}
