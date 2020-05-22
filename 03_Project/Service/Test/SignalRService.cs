using IService.Test;

namespace Service.Test
{
    public class SignalRService : ISignalRService
    {
        public int Count { get; set; }
        public SignalRService()
        {
            Count = 0;
        }

        public int GetCount() => Count++;
    }
}
