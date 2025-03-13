using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Identity.Web;
using Microsoft.IdentityModel.Tokens;
using ProjectDemoApi.Helpers;
using System.Text;

namespace ProjectDemoApi.Extensions
{
    public static class AuthenticationServiceExtension
    {
        public static IServiceCollection AddCustomAuthentication(this IServiceCollection services, IConfiguration configuration)
        {

            services
                .AddAuthentication(options =>
                {
                    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                    //options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                })
                .AddMicrosoftIdentityWebApi(options =>
                {
                    configuration.Bind("AzureAd", options);
                    options.TokenValidationParameters.NameClaimType = "name";
                }, options => configuration.Bind("AzureAd", options));

            //.AddJwtBearer(options =>
            //{
            //    options.RequireHttpsMetadata = false;
            //    options.SaveToken = true;
            //    options.TokenValidationParameters = new TokenValidationParameters
            //    {
            //        IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(AuthSettings.PrivateKey)),
            //        ValidateIssuer = false,
            //        ValidateAudience = false,
            //    };
            //});

            return services;
        }
    }
}
