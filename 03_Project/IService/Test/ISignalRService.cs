using System;

namespace IService.Test
{
    public interface ISignalRService
    {
        public int Count { get; set; }

        int GetCount();
    }
}
