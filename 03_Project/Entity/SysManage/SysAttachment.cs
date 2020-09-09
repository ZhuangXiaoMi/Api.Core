using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 附件表
    /// </summary>
    [Table("sys_attachment")]
    public partial class SysAttachment : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 类型
        /// </summary>
        [Description("类型")]
        public string atta_type { get; set; }

        /// <summary>
        /// 对象Id
        /// </summary>
        [Description("对象Id")]
        public long object_id { get; set; }

        /// <summary>
        /// 文件路径
        /// </summary>
        [Description("文件路径")]
        public string file_path { get; set; }

        /// <summary>
        /// 文件路径前缀
        /// </summary>
        [Description("文件路径前缀")]
        [NotMapped]
        public string prefix_path { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        [Description("文件名称")]
        public string file_name { get; set; }

        /// <summary>
        /// 文件类型
        /// </summary>
        [Description("文件类型")]
        public string file_type { get; set; }

        /// <summary>
        /// 文件大小：MB
        /// </summary>
        [Description("文件大小")]
        public double file_size { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Description("排序")]
        public int sort { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        public string description { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Description("备注")]
        public string remark { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
