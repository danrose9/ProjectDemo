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

        public PingController(
            ILogger<PingController> logger, 
            ITimeServiceOptionsBased optionsTime,
            ITimeServiceFactoryBased factoryTime)
        {
            _logger = logger;
            _optionsTime = optionsTime;
            _factoryTime = factoryTime;
        }

        [HttpGet()]
        public IActionResult Get()
        {
            
            string pingResult = $"Ping Success at {_optionsTime.GetFormattedTime()}";

            _logger.LogInformation(pingResult);
            
            return Ok(new
            {
                FromOptions = _optionsTime.GetFormattedTime(),
                FromFactory = _factoryTime.GetFormattedTime(),
            });

        }

        [HttpGet("test-log")]
        public IActionResult TestLog([FromServices] TelemetryClient telemetryClient)
        {
            telemetryClient.TrackTrace("Manual telemetry test");
            return Ok("Logged a manual trace.");
        }

    }
}
