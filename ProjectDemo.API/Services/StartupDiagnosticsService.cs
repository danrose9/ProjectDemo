namespace ProjectDemoApi.Services
{
    public interface IStartupDiagnosticsService
    {
        void LogRegisteredServices();
    }

    public class StartupDiagnosticsService : IStartupDiagnosticsService
    {
        private readonly ILogger<StartupDiagnosticsService> _logger;
        private readonly IServiceCollection _services;

        public StartupDiagnosticsService(ILogger<StartupDiagnosticsService> logger, IServiceCollection services)
        {
            _logger = logger;
            _services = services;
        }

        public void LogRegisteredServices()
        {
            foreach (var service in _services)
            {
                var serviceType = service.ServiceType;
                var implementationType = service.ImplementationType;
                var lifetime = service.Lifetime;
                _logger.LogInformation($"Service: {serviceType}, Implementation: {implementationType}, Lifetime: {lifetime}");
            }
        }
    }
}
