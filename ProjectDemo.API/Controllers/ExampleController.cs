using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectDemoApi.Services;

namespace ProjectDemoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExampleController : ControllerBase
    {
        private readonly IDependancyInjectionExample _dependancyInjectionExample;

        public ExampleController(IDependancyInjectionExample dependancyInjectionExample)
        {
            _dependancyInjectionExample = dependancyInjectionExample;
        }

        [HttpGet()]
        public IActionResult Get()
        {
            _dependancyInjectionExample.WriteMessagetoConsole("Hello World");
            return Ok();
        }
    }
}
