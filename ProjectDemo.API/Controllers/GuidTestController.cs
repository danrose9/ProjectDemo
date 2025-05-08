using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.DotNet.Scaffolding.Shared;
using ProjectDemoApi.Services;

namespace ProjectDemoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GuidTestController : ControllerBase
    {
        private readonly IEnumerable<IGuidService> _guidServices;
        private readonly IServiceProvider _provider;

        public GuidTestController(IEnumerable<IGuidService> guidServices, IServiceProvider provider)
        {
            _guidServices = guidServices;
            _provider = provider;
        }

        [HttpGet]
        public IActionResult GetGuids()
        {
            return Ok(_guidServices.Select(s => new {Type = s.GetType().Name, Guid = s.GetGuid() }));
        }

        [HttpGet("/api/RequiredService")]
        public IActionResult GetRequiredService()
        {
            // .GetRequiredService<IGuidService>() will only return the last registered implementation,
            // and if you want multiple implementations, you either:
            // Use different interfaces, or
            // Inject IEnumerable<T> to work with all at once.

            var service = _provider.GetRequiredService<IGuidService>();
            return Ok(new { Guid = service.GetGuid() });
        }
    }
}
