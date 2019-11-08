﻿using Entity.BaseManage;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    [Serializable]
    [Table("Sys_ModuleButton")]
    [Display(Name = "模块按钮")]
    public partial class SysModuleButton : ABTEntity<SysModuleButton>, ICreateEntity, IModifyEntity, IDeleteEntity
    {
        #region 原始字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Display(Name = "主键Id")]
        public int Id { get; set; }

        /// <summary>
        /// 模块Id
        /// </summary>
        [Display(Name = "模块Id")]
        public int ModuleId { get; set; }

        /// <summary>
        /// 模块按钮编码
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "模块按钮编码")]
        public string ModuleBtnCode { get; set; }

        /// <summary>
        /// 模块按钮名称
        /// </summary>
        [Required(ErrorMessage = "必填")]
        [Display(Name = "模块按钮名称")]
        public string ModuleBtnName { get; set; }

        /// <summary>
        /// 位置
        /// </summary>
        [Display(Name = "位置")]
        public string Location { get; set; }

        /// <summary>
        /// 事件
        /// </summary>
        [Display(Name = "事件")]
        public string Event { get; set; }

        /// <summary>
        /// 链接
        /// </summary>
        [Url]
        [Display(Name = "链接")]
        public string Url { get; set; }

        /// <summary>
        /// 图标
        /// </summary>
        [FileExtensions(Extensions = "jpg,jpeg", ErrorMessage = "扩展名必须为{0}")]
        [Display(Name = "图标")]
        public string Icon { get; set; }

        /// <summary>
        /// 是否公共：0：否；1：是；
        /// </summary>
        [Column(TypeName = "bit")]
        [Display(Name = "是否公共", Description = "0：否；1：是；")]
        public bool IsPublic { get; set; }

        /// <summary>
        /// 是否显示：0：否；1：是；
        /// </summary>
        [Display(Name = "是否显示", Description = "0：否；1：是；")]
        public bool IsShow { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        [Display(Name = "排序", Description = "升序")]
        public int Sort { get; set; }

        /// <summary>
        /// 描述
        /// </summary>
        [StringLength(500, ErrorMessage = "少于{0}个字")]
        [Display(Name = "描述")]
        public string Description { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        [Display(Name = "备注")]
        public string Remark { get; set; }

        /// <summary>
        /// 是否删除：0：否；1：是；
        /// </summary>
        [Column(TypeName = "bit")]
        [Display(Name = "是否删除", Description = "0：否；1：是；")]
        public bool IsDelete { get; set; }

        /// <summary>
        /// 创建用户Id
        /// </summary>
        [Display(Name = "创建用户Id")]
        public int CreateUserId { get; set; }

        /// <summary>
        /// 修改用户Id
        /// </summary>
        [Display(Name = "修改用户Id")]
        public int? ModifyUserId { get; set; }

        /// <summary>
        /// 删除用户Id
        /// </summary>
        [Display(Name = "删除用户Id")]
        public int? DeleteUserId { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "创建时间")]
        public DateTime CreateTime { get; set; }

        /// <summary>
        /// 修改时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "修改时间")]
        public DateTime? ModifyTime { get; set; }

        /// <summary>
        /// 删除时间
        /// </summary>
        [DisplayFormat(DataFormatString = "{0:g}")]
        [Display(Name = "删除时间")]
        public DateTime? DeleteTime { get; set; }
        #endregion 原始字段

        #region 扩展字段

        #endregion 扩展字段
    }
}
