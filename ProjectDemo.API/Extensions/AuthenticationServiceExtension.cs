﻿using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Identity.Web;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using ProjectDemoApi.Controllers;

namespace ProjectDemoApi.Extensions
{
    public static class AuthenticationServiceExtension
    {

        public static IServiceCollection AddCustomAuthentication(
            this IServiceCollection services, 
            IConfiguration configuration
            )
        {
            
            var keyVaultUrl = configuration["KeyVault:Url"];

            // Fix for CS8604: Ensure keyVaultUrl is not null or empty before creating the Uri object.  
            if (string.IsNullOrEmpty(keyVaultUrl))
            {
                throw new ArgumentNullException(nameof(keyVaultUrl), "KeyVault URL cannot be null or empty.");
            }

            var client = new SecretClient(new Uri(keyVaultUrl), new DefaultAzureCredential());

            Console.WriteLine("keyVaultUrl: {0}", keyVaultUrl);

            //string jwtAudience = client.GetSecret("JwtAudience").Value.Value;
            //string jwtIssuer = client.GetSecret("JwtIssuer").Value.Value;
            //string jwtSigningKey = client.GetSecret("JwtSigningKey").Value.Value;


            var key = Encoding.UTF8.GetBytes("QWxhZGRpbpoisgTjpvcGVuIHNlc2FtZQ==");
            string jwtAudience = "https://localhost:7200";
            string jwtIssuer = "https://localhost:7209";

            services
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

            return services;
        }
    }
}
