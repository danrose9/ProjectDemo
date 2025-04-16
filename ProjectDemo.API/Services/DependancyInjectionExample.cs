namespace ProjectDemoApi.Services
{
    public class DependancyInjectionExample : IDependancyInjectionExample
    {
        public void WriteMessagetoConsole(string message)
        { 
            Console.WriteLine(message);
        }
    }
}
