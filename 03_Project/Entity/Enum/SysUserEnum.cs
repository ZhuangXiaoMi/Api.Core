using System.ComponentModel;

namespace Entity.Enum
{
    public enum Gender
    {
        [Description("保密")]
        Secrecy = 0,
        [Description("男")]
        Gentleman = 1,
        [Description("女")]
        Lady = 2,
    }
}
