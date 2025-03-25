using System.Text.Json;

namespace Identity.Api
{
    public class TokenGenerationRequest
    {
        public string? Email { get; set; }
        public Guid UserId { get; set; }
        public Dictionary<string, JsonElement> CustomClaims { get; set; } = [];
    }

}
