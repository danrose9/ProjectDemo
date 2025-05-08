using ProjectDemoApi.Services;

namespace ProjectDemoApi.Extensions
{
    public static class AddCustomServicesExtension
    {
        public static IServiceCollection AddCustomServices(this IServiceCollection services)
        {
            services.AddTransient<IGuidService, TransientGuidService>();
            services.AddScoped<IGuidService, ScopedGuidService>();
            services.AddSingleton<IGuidService, SingletonGuidService>();

            return services;
        }
    }
}
