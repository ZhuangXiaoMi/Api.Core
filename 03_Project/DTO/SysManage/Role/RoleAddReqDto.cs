using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class RoleAddReqDto
    {
        /// <summary>
        /// 角色编码
        /// </summary>
        [Description("角色编码")]
        [Display(Name = "角色编码")]
        [Required(ErrorMessage = "{0}必填")]
        public string role_code { get; set; }

        /// <summary>
        /// 角色名称
        /// </summary>
        [Description("角色名称")]
        [Display(Name = "角色名称")]
        [Required(ErrorMessage = "{0}必填")]
        [StringLength(20, MinimumLength = 1, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string role_name { get; set; }

        /// <summary>
        /// 角色类型：0管理用户 1员工 2VIP类型 3普通用户
        /// </summary>
        [Description("角色类型")]
        [Display(Name = "角色类型", Description = "0管理用户 1员工 2VIP类型 3普通用户")]
        [Required(ErrorMessage = "{0}必填")]
        [Range(0, 3, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int role_type { get; set; }

        /// <summary>
        /// 数据范围：0所有数据 1所在公司及以下数据 2所在公司数据 3所在部门及以下数据 4所在部门数据 8仅本人数据 9按明细设置
        /// </summary>
        [Description("数据范围")]
        [Display(Name = "数据范围", Description = "0所有数据 1所在公司及以下数据 2所在公司数据 3所在部门及以下数据 4所在部门数据 8仅本人数据 9按明细设置")]
        [Range(0, 9, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int? data_scope { get; set; }

        /// <summary>
        /// 所属机构Id
        /// </summary>
        [Description("所属机构Id")]
        [Display(Name = "所属机构Id")]
        public long? dept_id { get; set; }

        /// <summary>
        /// 角色组Id
        /// </summary>
        [Description("角色组Id")]
        [Display(Name = "角色组Id")]
        public long? grp_role_id { get; set; }

        /// <summary>
        /// 是否允许编辑：0否 1是
        /// </summary>
        [Description("是否允许编辑")]
        [Display(Name = "是否允许编辑")]
        public int? is_allow_edit { get; set; }

        /// <summary>
        /// 是否允许删除：0否 1是
        /// </summary>
        [Description("是否允许删除")]
        [Display(Name = "是否允许删除")]
        public int? is_allow_delete { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Description("排序")]
        [Display(Name = "排序")]
        public int? sort { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [Description("描述")]
        [Display(Name = "描述")]
        [StringLength(300, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string description { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Description("备注")]
        [Display(Name = "备注")]
        [StringLength(500, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string remark { get; set; }

        /// <summary>
        /// 是否启用：0否 1是
        /// </summary>
        [Description("是否启用")]
        [Display(Name = "是否启用")]
        [Range(0, 1, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int? is_enabled { get; set; }
    }
}
