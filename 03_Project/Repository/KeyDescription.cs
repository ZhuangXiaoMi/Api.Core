using System;

namespace Repository
{
    public class KeyDescription
    {
        /// <summary>
        /// 键值
        /// </summary>
        public string key { get; set; }

        /// <summary>
        /// 键的描述
        /// </summary>
        public string description { get; set; }

        /// <summary>
        /// 前端是否显示
        /// </summary>
        public bool browsable { get; set; }

        /// <summary>
        /// 字段类型
        /// </summary>
        public string type { get; set; }
    }
}
