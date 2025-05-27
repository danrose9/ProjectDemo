namespace ProjectDemoApi.Models
{
    public class TimeOptions
    {
        public bool Enabled { get; set; }
        public required string Format { get; set; } = "yyyy-MM-dd HH:mm";
    }

    // Separate interfaces for clarity
    public interface ITimeServiceOptionsBased
    {
        string GetFormattedTime();
    }

    public interface ITimeServiceFactoryBased
    {
        string GetFormattedTime();
    }
}
