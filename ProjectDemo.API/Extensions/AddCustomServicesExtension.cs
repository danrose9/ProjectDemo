using ProjectDemoApi.Models;
using ProjectDemoApi.Services;

namespace ProjectDemoApi.Extensions
{
    public static class AddCustomServicesExtension
    {

        /// <summary>
        /// Extension method to add custom services to the IServiceCollection.
        /// 
        /// Transient scope, new instance is registered every time
        /// Scoped scope, new instance is registered per request
        /// Singleton scope, new instance is registered once and shared across the application lifetime
        /// 
        /// </summary>
        /// <param name="services"></param>
        /// <returns></returns>
        public static IServiceCollection AddCustomServices(
            this IServiceCollection services, 
            IConfiguration configuration
            )
        {
            services
                .AddApplicationInsightsTelemetry()
                .AddTransient<IGuidService, TransientGuidService>()
                .AddScoped<IGuidService, ScopedGuidService>()
                .AddSingleton<IGuidService, SingletonGuidService>()
                .AddTransient<ICustomLogger, CustomLogger>()

                // Add TimeService as a factory
                .Configure<TimeOptions>(configuration.GetSection("TimeOptions"))

                // Options pattern registration
                .AddSingleton<ITimeServiceOptionsBased, TimeServiceOptionsBased>()

                // Factory-based registration with custom logic
                .AddSingleton<ITimeServiceFactoryBased>(provider =>
                {
                    var env = provider.GetRequiredService<IHostEnvironment>();
                    var format = env.IsDevelopment() ? "HH:mm:ss" : "yyyy-MM-dd HH:mm:ss";
                    return new TimeServiceFactoryBased(format);
                });


            return services;
        }
    }
}
