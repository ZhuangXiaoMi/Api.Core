using Entity.BaseManage;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.SysManage
{
    [Serializable]
    [Table("Sys_JobHistory")]
    [Display(Name = "任职表")]
    public partial class SysJobHistory : ABTEntity<SysJobHistory>, ICreateEntity, IDeleteEntity
    {
        #region 原始字段
        /// <summary>
        /// 主键Id
        /// </summary>
        [Key]
        [Display(Name = "主键Id")]
        public int Id { get; set; }

        /// <summary>
        /// 用户Id
        /// </summary>
        [Display(Name = "用户Id")]
        public int UserId { get; set; }

        /// <summary>
        /// 岗位Id
        /// </summary>
        [Display(Name = "岗位Id")]
        public int JobId { get; set; }

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
