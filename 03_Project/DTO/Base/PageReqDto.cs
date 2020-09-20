using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    public class PageReqDto<T> where T : class, new()
    {
        public T parames { get; set; }

        public PageInfoDto page_info { get; set; }

        public PageReqDto()
        {
            parames = new T();
            page_info = new PageInfoDto();
        }
    }
}
