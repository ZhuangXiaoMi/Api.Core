using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.BaseManage
{
    [NotMapped]
    public abstract class ABTAggregateRoot<TEntity> : IAggregateRoot where TEntity : class, new()
    {
        /// <summary>
        /// 主键
        /// </summary>
        public int Id { get; set; }

        public virtual void Create()
        {
            var entity = this as ICreateEntity;
            entity.CreateUserId = 1;
            entity.CreateTime = DateTime.Now;
        }

        public virtual void Modify()
        {
            var entity = this as IModifyEntity;
            entity.ModifyUserId = 1;
            entity.ModifyTime = DateTime.Now;
        }

        public virtual void Remove()
        {
            var entity = this as IDeleteEntity;
            entity.IsDelete = true;
            entity.DeleteUserId = 1;
            entity.DeleteTime = DateTime.Now;
        }
    }
}
