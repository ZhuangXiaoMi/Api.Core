using Microsoft.EntityFrameworkCore.Internal;
using System.Collections.Generic;
using System.Linq;

namespace Common
{
    public static class CollectionExt
    {
        public static bool IsNullOrEmpty<TSource>(this IEnumerable<TSource> source)
        {
            return source == null || !source.Any();
        }

        public static IEnumerable<TSource> CheckNull<TSource>(this IEnumerable<TSource> source)
        {
            return source.IsNullOrEmpty() ? Enumerable.Empty<TSource>() : source;
        }
    }
}
