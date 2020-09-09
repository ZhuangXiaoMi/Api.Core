using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    /// <summary>
    /// 数据库备份表
    /// </summary>
    [Table("sys_db_backup")]
    public partial class SysDBBackup : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 备份类型：1完全备份 2增量备份
        /// </summary>
        [Description("备份类型")]
        public int backup_type { get; set; }

        /// <summary>
        /// 数据库名称
        /// </summary>
        [Description("数据库名称")]
        public string db_name { get; set; }

        /// <summary>
        /// 文件名称
        /// </summary>
        [Description("文件名称")]
        public string file_name { get; set; }

        /// <summary>
        /// 文件大小：MB
        /// </summary>
        [Description("文件大小")]
        public double file_size { get; set; }

        /// <summary>
        /// 文件路径
        /// </summary>
        [Description("文件路径")]
        public string file_path { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        public string description { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
