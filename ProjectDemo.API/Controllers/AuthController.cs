using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectDemoApi.Models;
using ProjectDemoApi.Services;

namespace ProjectDemoApi.Controllers
{
    [Route("api/authenticate")]
    [ApiController]
    public class AuthController : ControllerBase
    {

        private readonly AuthService _authService;

        public AuthController(AuthService authService)
        {
            _authService = authService;
        }

        [HttpPost]
        public async Task<ActionResult<string>> PostAuthenticate(User user)
        {
            return await Task.FromResult<ActionResult<string>>(
                _authService.GenerateToken(user));
        }
    }
}
