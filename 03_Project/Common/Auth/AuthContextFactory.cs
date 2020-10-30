using Entity;
using IRepository;

namespace Common
{
    public class AuthContextFactory
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly NormalAuthStrategy _normalAuthStrategy;

        public AuthContextFactory(IUnitOfWork unitOfWork, NormalAuthStrategy normalAuthStrategy)
        {
            _unitOfWork = unitOfWork;
            _normalAuthStrategy = normalAuthStrategy;
        }

        public AuthStrategyContext GetAuthStrategyContext(string account)
        {
            if (string.IsNullOrEmpty(account)) return null;
            IAuthStrategy strategy = _normalAuthStrategy;
            strategy.User = _unitOfWork.FindSingle<SysUser>(p => p.account == account);
            return strategy.User == null ? null : new AuthStrategyContext(strategy);
        }
    }
}
