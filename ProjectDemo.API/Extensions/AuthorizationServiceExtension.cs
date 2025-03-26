using Microsoft.Extensions.Options;
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

                    //o.AddPolicy("AdminOnly", p => p.RequireRole("Admin"));
                    //o.AddPolicy("UserOnly", p => p.RequireRole("ProjectDemo-User"));
                    //o.AddPolicy("ContributorOnly", p => p.RequireRole("Contributor"));

                    o.AddPolicy("UserPolicy", policy =>
                        policy.RequireClaim("groups", "970d6b63-66ca-4796-addc-8406593ef772"));

                    o.AddPolicy("AdminPolicy", policy =>
                        policy.RequireClaim("groups", "a6385461-f2a8-4067-9124-56a124081a23"));

                });

            return services;
        }
    }
}
