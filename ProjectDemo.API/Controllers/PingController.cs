using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectDemoApi.Services;

namespace ProjectDemoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PingController : ControllerBase
    {

        private readonly ILogger<PingController> _logger;
        private readonly ICustomLogger _customLogger;
        private readonly ITimeService _timeService;

        public PingController(ILogger<PingController> logger, ICustomLogger customLogger, ITimeService timeService)
        {
            _logger = logger;
            _customLogger = customLogger;
            _timeService = timeService;
        }

        [HttpGet()]
        public IActionResult Get()
        {
            
            string pingResult = $"Ping Success at {_timeService.GetFormattedTime()}";

            _logger.LogInformation(pingResult);
            _customLogger.WriteMessagetoConsole(pingResult);

            return Ok(new { message = pingResult });
        }
    }
}
