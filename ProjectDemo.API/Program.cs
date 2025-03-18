using Microsoft.EntityFrameworkCore;
using ProjectDemoApi.Extensions;
using ProjectDemoApi.Models;
using ProjectDemoApi.Services;
using System.Configuration;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var configuration = builder.Configuration;

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddCustomSwaggerGen(configuration);

var connectionString =
    builder.Configuration.GetConnectionString("DefaultConnection")
        ?? throw new InvalidOperationException("Connection string"
        + "'DefaultConnection' not found.");

builder.Services.AddDbContext<ProjectDemoContext>(options =>
    options.UseSqlServer(connectionString));

builder.Services.AddCustomAuthentication(configuration);
//builder.Services.AddCustomAuthorization(configuration);

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
