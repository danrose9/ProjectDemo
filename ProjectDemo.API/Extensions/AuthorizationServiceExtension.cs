using ProjectDemoApi.Services;

namespace ProjectDemoApi.Extensions
{
    public static class AutherizationServiceExtension
    {
        public static IServiceCollection AddCustomAuthorization(this IServiceCollection services, IConfiguration configuration)
        {

            services
                .AddAuthorization(o =>
                {
                    o.AddPolicy(AuthorizationPolicyIdentity.AdminUserPolicyName, p =>
                    p.RequireClaim(AuthorizationPolicyIdentity.AdminUserClaimName, "true"));
                });

            return services;
        }
    }
}
