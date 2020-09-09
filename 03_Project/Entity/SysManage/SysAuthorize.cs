using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 授权表
    /// </summary>
    [Table("sys_authorize")]
    public partial class SysAuthorize : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 项目类型：1菜单SysMenu 2页面元素SysElement 3操作按钮SysOperateBtn 4附件SysAttachment 5模块表单SysModuleForm
        /// </summary>
        [Description("项目类型")]
        public int item_type { get; set; }

        /// <summary>
        /// 项目外键
        /// </summary>
        [Description("项目外键")]
        public long item_id { get; set; }

        /// <summary>
        /// 对象类型：1角色 2用户 3用户组
        /// </summary>
        [Description("对象类型")]
        public int object_type { get; set; }

        /// <summary>
        /// 对象外键
        /// </summary>
        [Description("对象外键")]
        public long object_id { get; set; }

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
