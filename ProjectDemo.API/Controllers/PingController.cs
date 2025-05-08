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

        public PingController(ILogger<PingController> logger, ICustomLogger customLogger)
        {
            _logger = logger;
            _customLogger = customLogger;
        }

        [HttpGet()]
        public IActionResult Get()
        {
            _logger.LogInformation("Ping Success!");
            _customLogger.WriteMessagetoConsole("Ping Success!");

            return Ok(new { message = "Ping Success!" });
        }
    }
}
