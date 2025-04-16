namespace ProjectDemoApi.Services
{
    public class CustomLogger : ICustomLogger
    {
        public void WriteMessagetoConsole(string message)
        { 
            Console.WriteLine(message);
        }
    }
}
