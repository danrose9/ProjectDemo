using Microsoft.EntityFrameworkCore;
using ProjectDemoApi.Extensions;
using ProjectDemoApi.Models;
using ProjectDemoApi.Services;


var builder = WebApplication.CreateBuilder(args);

var configuration = builder.Configuration;

builder.Services.AddControllers();
builder.Services
    .AddApplicationInsightsTelemetry(options =>
    {
        options.ConnectionString = configuration["ApplicationInsights:ConnectionString"] ?? string.Empty;
    })
    .AddEndpointsApiExplorer()
    .AddSwaggerServices()
    .AddCustomAuthentication(configuration)
    .AddCustomAuthorization()
    .AddCustomServices(configuration);

builder.Logging.AddApplicationInsights();

var connectionString =
    builder.Configuration.GetConnectionString("DefaultConnection")
        ?? throw new InvalidOperationException("Connection string"
        + "'DefaultConnection' not found.");

builder.Services.AddDbContext<ProjectDemoContext>(options =>
    options.UseSqlServer(connectionString));

var app = builder.Build();

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
