using Microsoft.Extensions.Options;
using ProjectDemoApi.Swagger;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace ProjectDemoApi.Extensions
{
    public static class SwaggerServicesExtension
    {
        public static IServiceCollection AddSwaggerServices(this IServiceCollection services)
        {
            services
                .AddSwaggerGen()
                .AddTransient<IConfigureOptions<SwaggerGenOptions>, ConfigureSwaggerOptions>();
            
            return services;
        }
    }
}
