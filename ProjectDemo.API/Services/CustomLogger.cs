namespace ProjectDemoApi.Services
{
    public interface ICustomLogger
    {
        void WriteMessagetoConsole(string message);
    }

    public class CustomLogger : ICustomLogger
    {
        public void WriteMessagetoConsole(string message)
        { 
            Console.WriteLine("CustomLogger: {0}", message);
        }
    }
}
