namespace ProjectDemoApi.Services
{
    public interface ITimeService
    {
        string GetFormattedTime();
    }


    public class TimeService : ITimeService
    {
        private readonly string _format;

        public TimeService(string format)
        {
            _format = format;
        }

        public string GetFormattedTime() => DateTime.UtcNow.ToString(_format);
    }
}
