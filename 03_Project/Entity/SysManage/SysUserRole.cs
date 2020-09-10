using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 用户角色表
    /// </summary>
    [Table("sys_user_role")]
    public partial class SysUserRole : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 用户Id
        /// </summary>
        [Description("用户Id")]
        public long user_id { get; set; }

        /// <summary>
        /// 角色Id
        /// </summary>
        [Description("角色Id")]
        public long role_id { get; set; }

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
