using Microsoft.EntityFrameworkCore;
using ProjectDemoApi.Extensions;
using ProjectDemoApi.Models;
using ProjectDemoApi.Services;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var configuration = builder.Configuration;


builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer()
    .AddSwaggerServices()
    .AddCustomAuthentication(configuration)
    .AddCustomAuthorization()
    .AddCustomServices();

var connectionString =
    builder.Configuration.GetConnectionString("DefaultConnection")
        ?? throw new InvalidOperationException("Connection string"
        + "'DefaultConnection' not found.");

builder.Services.AddDbContext<ProjectDemoContext>(options =>
    options.UseSqlServer(connectionString));

var app = builder.Build();

//using (var scope = app.Services.CreateScope())
//{
//    var diagnostics = scope.ServiceProvider.GetRequiredService<IStartupDiagnosticsService>();
//    diagnostics.LogRegisteredServices();
//}

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
