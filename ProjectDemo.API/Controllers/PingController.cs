using Microsoft.ApplicationInsights;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectDemoApi.Models;
using ProjectDemoApi.Services;

namespace ProjectDemoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PingController : ControllerBase
    {

        private readonly ILogger<PingController> _logger;
        private readonly ITimeServiceOptionsBased _optionsTime;
        private readonly ITimeServiceFactoryBased _factoryTime;
        private readonly IWebHostEnvironment _env;

        public PingController(
            ILogger<PingController> logger, 
            ITimeServiceOptionsBased optionsTime,
            ITimeServiceFactoryBased factoryTime,
            IWebHostEnvironment env)
        {
            _logger = logger;
            _optionsTime = optionsTime;
            _factoryTime = factoryTime;
            _env = env;
        }

        [HttpGet()]
        public IActionResult Get()
        {
            
            string pingResult = $"Ping Success at {_optionsTime.GetFormattedTime()}";

            // Information, Debug, Trace not appearing in App Insights
            _logger.LogInformation("Log Information at {0}", _optionsTime.GetFormattedTime());
            _logger.LogDebug("Log Debug at {0}", _optionsTime.GetFormattedTime());
            _logger.LogTrace("Log Trace at {0}", _optionsTime.GetFormattedTime());
            _logger.LogWarning("Log Warning at {0}", _optionsTime.GetFormattedTime());
            _logger.LogError("Log Error at {0}", _optionsTime.GetFormattedTime());
            _logger.LogCritical("Log Critical at {0}", _optionsTime.GetFormattedTime());

            return Ok(new
            {
                FromOptions = _optionsTime.GetFormattedTime(),
                FromFactory = _factoryTime.GetFormattedTime(),
            });

        }

        [HttpGet("environment")]
        public IActionResult TestLog([FromServices] TelemetryClient telemetryClient)
        {
            string envName = _env.EnvironmentName;
            
            telemetryClient.TrackTrace($"Environment: {envName}");
            return Ok($"Environment: {envName}");
        }

    }
}
