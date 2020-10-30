using Entity;
using System.Collections.Generic;

namespace Common
{
    /// <summary>
    /// 授权策略上下文
    /// </summary>
    public class AuthStrategyContext
    {
        private readonly IAuthStrategy _strategy;

        public AuthStrategyContext(IAuthStrategy strategy)
        {
            _strategy = strategy;
        }

        public SysUser User
        {
            get { return _strategy.User; }
        }

        public List<SysRole> Roles
        {
            get { return _strategy.Roles; }
        }
    }
}
