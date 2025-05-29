using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Identity.Web;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;

namespace ProjectDemoApi.Extensions
{
    public static class AuthenticationServiceExtension
    {
        public static IServiceCollection AddCustomAuthentication(this IServiceCollection services, IConfiguration configuration)
        {
            //var keyVaultUrl = configuration["KeyVault:Url"];
            ////var client = new SecretClient(new Uri(keyVaultUrl), new DefaultAzureCredential());
            //var client = new SecretClient(new Uri("https://projectdemoapi.vault.azure.net/"), new DefaultAzureCredential());

            //string jwtAudience = client.GetSecret("JwtAudience").Value.Value;
            //string jwtIssuer = client.GetSecret("JwtIssuer").Value.Value;
            //string jwtSigningKey = client.GetSecret("JwtSigningKey").Value.Value;

            var key = Encoding.UTF8.GetBytes("QWxhZGRpbpoisgTjpvcGVuIHNlc2FtZQ==");
            string jwtAudience = "https://localhost:7200";
            string jwtIssuer = "https://localhost:7209";

            services
                //.AddAuthentication(o =>
                //{
                //    o.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                //    o.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                //    o.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
                //})
                .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    //var key = Encoding.UTF8.GetBytes(jwtSigningKey);

                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = false,
                        ValidIssuer = jwtIssuer,

                        ValidateAudience = false,
                        ValidAudience = jwtAudience,

                        ValidateLifetime = true,
                        ClockSkew = TimeSpan.Zero,

                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(key),
                    };

                    options.Events = new JwtBearerEvents
                    {
                        OnTokenValidated = context =>
                        {
                            Console.WriteLine("Token validated.");
                            return Task.CompletedTask;
                        },
                        OnAuthenticationFailed = context =>
                        {
                            Console.WriteLine($"Authentication failed: {context.Exception.Message}");
                            return Task.CompletedTask;
                        }
                    };
                });
            //.AddMicrosoftIdentityWebApi(configuration.GetSection("AzureAd"));

            //services.Configure<JwtBearerOptions>(JwtBearerDefaults.AuthenticationScheme, o =>
            //    {
            //        o.TokenValidationParameters = new TokenValidationParameters
            //        {
            //            ValidateIssuer = true,
            //            ValidIssuer = $"https://sts.windows.net/{configuration["AzureAd:TenantId"]}/",
            //            ValidateAudience = true,
            //            ValidAudience = configuration["AzureAd:Audience"],
            //            ValidateLifetime = true,
            //            ClockSkew = TimeSpan.Zero,
            //            RequireSignedTokens = true
            //        };

            //        o.Events = new JwtBearerEvents
            //        {
            //            OnTokenValidated = async context =>
            //            {
            //                var claims = context.Principal?.Claims
            //                    .Select(c => $"{c.Type}: {c.Value}")
            //                    .ToList();

            //                Console.WriteLine("Claims received from Azure AD:");
            //                claims?.ForEach(Console.WriteLine);

            //                await Task.CompletedTask;
            //            },
            //            OnAuthenticationFailed = context => 
            //            {
            //                Console.WriteLine($"Authentication failed: {context.Exception.Message}");
            //                return Task.CompletedTask;
            //            }
            //        };
            //    }); ;

            return services;
        }
    }
}
