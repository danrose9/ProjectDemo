namespace ProjectDemoApi.Extensions
{
    public static class AutherizationServiceExtension
    {
        public static IServiceCollection AddCustomAuthorization(this IServiceCollection services, IConfiguration configuration)
        {

            services
                .AddAuthorization();

            return services;
        }
    }
}
