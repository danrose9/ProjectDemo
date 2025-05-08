using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectDemoApi.Services;

namespace ProjectDemoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GuidTestController(IEnumerable<IGuidService> guidServices) : ControllerBase
    {
        private readonly IEnumerable<IGuidService> _guidServices = guidServices;

        [HttpGet]
        public IActionResult GetGuids()
        {
            return Ok(_guidServices.Select(s => new {Type = s.GetType().Name, Guid = s.GetGuid() }));
        }
    }
}
