using System;

namespace Common.Extends
{
    public static class ObjectExt
    {
        public static string ObjectToString(this object thisValue)
        {
            if (thisValue != null)
            {
                return thisValue.ToString().Trim();
            }
            return string.Empty;
        }

        public static bool ObjectToBool(this object thisValue, bool errorValue = false)
        {
            bool result = errorValue;
            if (thisValue != null && !Convert.IsDBNull(thisValue) && thisValue != DBNull.Value && bool.TryParse(thisValue.ToString(), out result))
            {
                return result;
            }
            return result;
        }

        public static int ObjectToInt(this object thisValue, int errorValue = 0)
        {
            int result = errorValue;
            //null：引用型变量；Convert.IsDBNull()：对象；DBNull.Value：数据库dt.Rows[0][0]；
            if (thisValue != null && !Convert.IsDBNull(thisValue) && thisValue != DBNull.Value && int.TryParse(thisValue.ToString(), out result))
            {
                return result;
            }
            return result;
        }

        public static DateTime ObjectToDateTime(this object thisValue)
        {
            DateTime result = DateTime.MinValue;
            if (thisValue != null && !Convert.IsDBNull(thisValue) && thisValue != DBNull.Value && DateTime.TryParse(thisValue.ToString(), out result))
            {
                return result;
            }
            return result;
        }
    }
}
