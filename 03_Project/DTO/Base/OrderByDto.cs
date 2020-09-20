using System.ComponentModel;

namespace DTO
{
    public class OrderByDto
    {
        /// <summary>
        /// 排序属性名称
        /// </summary>
        [Description("排序属性名称")]
        public string property_name { get; set; }

        /// <summary>
        /// 排序方式
        /// </summary>
        [Description("排序方式")]
        public OrderByEnum method { get; set; }
    }
}
