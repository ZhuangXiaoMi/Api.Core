using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity
{
    /// <summary>
    /// 角色与用户组关联表
    /// </summary>
    [Table("sys_role_grp_user")]
    public partial class SysRoleGrpUser : ABTAggregateRoot
    {
        #region 原始字段
        /// <summary>
        /// 角色Id
        /// </summary>
        [Description("角色Id")]
        public long role_id { get; set; }

        /// <summary>
        /// 用户组Id
        /// </summary>
        [Description("用户组Id")]
        public long grp_user_id { get; set; }

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
