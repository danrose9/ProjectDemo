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

            return services;
        }
    }
}
