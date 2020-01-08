using AutoMapper;

namespace Api.Core.AutoMapperHelper
{
    public class CustomProfile : Profile
    {
        /// <summary>
        /// 配置构造函数，用来创建关系映射
        /// </summary>
        public CustomProfile()
        {
            //把两张存在外键关联的表，自动映射整合成一个实体
            //CreateMap<XXX, XXXDTO>();
            //CreateMap<XXXDTO, XXX>();

            //属性名称不一样
            //CreateMap<XXX, XXXDTO>()
            //    .ForMember(d => d.CountyName, o => o.MapFrom(s => s.County));

            //包含子类的复杂类型
            //CreateMap<XXX, XXXDTO>()
            //    .ForMember(d => d.County, o => o.MapFrom(s => s.Address.County));
        }
    }
}
