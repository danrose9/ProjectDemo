using Microsoft.Extensions.Options;
using ProjectDemoApi.Models;

namespace ProjectDemoApi.Services
{
    // Options pattern version
    public class TimeServiceOptionsBased : ITimeServiceOptionsBased
    {
        private readonly TimeOptions _options;

        public TimeServiceOptionsBased(IOptions<TimeOptions> options)
        {
            _options = options.Value;
        }

        public string GetFormattedTime()
        {
            return DateTime.UtcNow.ToString(_options.Format);
        }
    }

    // Factory-based version
    public class TimeServiceFactoryBased : ITimeServiceFactoryBased
    {
        private readonly string _format;

        public TimeServiceFactoryBased(string format)
        {
            _format = format;
        }

        public string GetFormattedTime()
        {
            return DateTime.UtcNow.ToString(_format);
        }
    }

}
