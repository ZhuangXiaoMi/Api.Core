using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    [Serializable]
    public class DeptAddReqDto
    {
        /// <summary>
        /// 上级部门Id
        /// </summary>
        [Description("上级部门Id")]
        [Display(Name = "上级部门Id")]
        public long? parent_id { get; set; }

        /// <summary>
        /// 部门编码
        /// </summary>
        [Description("部门编码")]
        [Display(Name = "部门编码")]
        [Required(ErrorMessage = "{0}必填")]
        public string dept_code { get; set; }

        /// <summary>
        /// 部门名称
        /// </summary>
        [Description("部门名称")]
        [Display(Name = "部门名称")]
        [Required(ErrorMessage = "{0}必填")]
        public string dept_name { get; set; }

        /// <summary>
        /// 简称
        /// </summary>
        [Description("简称")]
        [Display(Name = "简称")]
        public string simple_name { get; set; }

        /// <summary>
        /// 机构类型：1公司 2部门 3小组
        /// </summary>
        [Description("机构类型")]
        [Display(Name = "机构类型", Description = "1公司 2部门 3小组")]
        [Required(ErrorMessage = "{0}必填")]
        [Range(1, 3, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int dept_type { get; set; }

        /// <summary>
        /// 机构等级：1一级 2二级 3三级 4四级
        /// </summary>
        [Description("机构等级")]
        [Display(Name = "机构等级", Description = "1一级 2二级 3三级 4四级")]
        [Range(1, 4, ErrorMessage = "{0}只能取{1}~{2}之间")]
        public int? level { get; set; }

        /// <summary>
        /// 当前层级顺序
        /// </summary>
        [Description("当前层级顺序")]
        [Display(Name = "当前层级顺序")]
        public int? seq { get; set; }

        /// <summary>
        /// 所属地区Id
        /// </summary>
        [Description("所属地区Id")]
        [Display(Name = "所属地区Id")]
        public long? area_id { get; set; }

        /// <summary>
        /// 负责人Id
        /// </summary>
        [Description("负责人Id")]
        [Display(Name = "负责人Id")]
        public long? leader_id { get; set; }

        /// <summary>
        /// 联系地址
        /// </summary>
        [Description("联系地址")]
        [Display(Name = "联系地址")]
        [StringLength(200, MinimumLength = 0, ErrorMessage = "{0}长度范围{2}~{1}之间")]
        public string address { get; set; }

        /// <summary>
        /// 固定电话
        /// </summary>
        [Description("固定电话")]
        [Display(Name = "固定电话")]
        public string telephone { get; set; }

        /// <summary>
        /// 邮箱
        /// </summary>
        [Description("邮箱")]
        [Display(Name = "邮箱")]
        //[EmailAddress(ErrorMessage = "{0}格式不正确")]
        [DataType(DataType.EmailAddress, ErrorMessage = "{0}格式不正确")]
        public string email { get; set; }

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
        public int? is_enabled { get; set; }
    }
}
