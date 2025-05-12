using ProjectDemoApi.Services;

namespace ProjectDemoApi.Extensions
{
    public static class AddCustomServicesExtension
    {
        public static IServiceCollection AddCustomServices(this IServiceCollection services)
        {
            services.AddTransient<IGuidService, TransientGuidService>()
                .AddScoped<IGuidService, ScopedGuidService>()
                .AddSingleton<IGuidService, SingletonGuidService>()
                .AddTransient<ICustomLogger, CustomLogger>()
                .AddScoped<ITimeService>(provider =>
                {
                    var format = "yyyy-MM-dd HH:mm:ss";
                    return new TimeService(format);
                });

            //.AddSingleton(services)
            //.AddSingleton<IStartupDiagnosticsService, StartupDiagnosticsService>();

            return services;
        }
    }
}
