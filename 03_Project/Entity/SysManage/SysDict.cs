using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 字典表
    /// </summary>
    [Table("sys_dict")]
    public partial class SysDict : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 上级Id
        /// </summary>
        [Description("上级Id")]
        public long parent_id { get; set; }

        /// <summary>
        /// 族谱ids
        /// </summary>
        [Description("族谱ids")]
        public string parent_ids { get; set; }

        /// <summary>
        /// 名称
        /// </summary>
        [Description("名称")]
        public string name { get; set; }

        /// <summary>
        /// 值
        /// </summary>
        [Description("值")]
        public string value { get; set; }

        /// <summary>
        /// 类型
        /// </summary>
        [Description("类型")]
        public string type { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Description("排序")]
        public int sort { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Description("备注")]
        public string remark { get; set; }

        /// <summary>
        /// 是否启用：0否 1是
        /// </summary>
        [Description("是否启用")]
        public int is_enabled { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
