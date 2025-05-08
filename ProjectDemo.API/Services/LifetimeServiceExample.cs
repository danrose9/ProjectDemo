namespace ProjectDemoApi.Services
{
    public interface IGuidService 
    { 
        Guid GetGuid(); 
    }

    public class TransientGuidService : IGuidService
    { 
        private readonly Guid _guid = Guid.NewGuid(); 
        public Guid GetGuid() => _guid; 
    }

    public class ScopedGuidService : IGuidService 
    { 
        private readonly Guid _guid = Guid.NewGuid(); 
        public Guid GetGuid() => _guid; 
    }

    public class SingletonGuidService : IGuidService 
    { 
        private readonly Guid _guid = Guid.NewGuid(); 
        public Guid GetGuid() => _guid; 
    }

}
