using System;
using System.Collections.Generic;

namespace Common
{
    public class LogDateResponseDTO
    {
        public string[] Columns { get; set; }
        public List<LogDateModel> Rows { get; set; }
    }
}
