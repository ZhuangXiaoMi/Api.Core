using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 菜单表
    /// </summary>
    [Table("sys_menu")]
    public partial class SysMenu : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 上级菜单Id
        /// </summary>
        [Description("上级菜单Id")]
        public long parent_id { get; set; }

        /// <summary>
        /// 族谱ids
        /// </summary>
        [Description("族谱ids")]
        public string parent_ids { get; set; }

        /// <summary>
        /// 菜单编码
        /// </summary>
        [Description("菜单编码")]
        public string menu_code { get; set; }

        /// <summary>
        /// 菜单名称
        /// </summary>
        [Description("菜单名称")]
        public string menu_name { get; set; }

        /// <summary>
        /// 菜单层次
        /// </summary>
        [Description("菜单层次")]
        public int level { get; set; }

        /// <summary>
        /// 链接
        /// </summary>
        [Description("链接")]
        public string url { get; set; }

        /// <summary>
        /// 目标：mainFrame、_blank、_self、_parent、_top
        /// </summary>
        [Description("目标")]
        public string target { get; set; }

        /// <summary>
        /// 图标
        /// </summary>
        [Description("图标")]
        public string icon { get; set; }

        /// <summary>
        /// 是否菜单：0否 1是
        /// </summary>
        [Description("是否菜单")]
        public int is_menu { get; set; }

        /// <summary>
        /// 是否展开：0否 1是
        /// </summary>
        [Description("是否展开")]
        public int is_expand { get; set; }

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
