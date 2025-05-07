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

        public PingController(ILogger<PingController> logger)
        {
            _logger = logger;
        }

        [HttpGet()]
        public IActionResult Get()
        {
            _logger.LogInformation("Ping Success");

            return Ok(new { message = "Ping Success" });
        }
    }
}
