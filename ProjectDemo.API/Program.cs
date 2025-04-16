using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using ProjectDemoApi.Extensions;
using ProjectDemoApi.Models;
using ProjectDemoApi.Swagger;
using System.Configuration;
using Swashbuckle.AspNetCore.SwaggerGen;
using ProjectDemoApi.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var configuration = builder.Configuration;

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddTransient<IConfigureOptions<SwaggerGenOptions>, ConfigureSwaggerOptions>();
builder.Services.AddScoped<IDependancyInjectionExample, DependancyInjectionExample>();

var connectionString =
    builder.Configuration.GetConnectionString("DefaultConnection")
        ?? throw new InvalidOperationException("Connection string"
        + "'DefaultConnection' not found.");

builder.Services.AddDbContext<ProjectDemoContext>(options =>
    options.UseSqlServer(connectionString));

builder.Services.AddCustomAuthentication(configuration);
builder.Services.AddCustomAuthorization(configuration);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
