using DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System;

namespace Common
{
    public class LocalAuth : IAuth
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IRedisCacheManage _redisCache;
        private readonly AuthContextFactory _factory;
        private readonly ILogger<LocalAuth> _logger;

        public LocalAuth(IHttpContextAccessor httpContextAccessor, IRedisCacheManage redisCache
            , AuthContextFactory factory, ILogger<LocalAuth> logger)
        {
            _httpContextAccessor = httpContextAccessor;
            _redisCache = redisCache;
            _factory = factory;
            _logger = logger;
        }

        public int CheckLogin(string token)
        {
            if (string.IsNullOrEmpty(token))
            {
                token = GetToken();
            }
            if (string.IsNullOrEmpty(token))
            {
                return DEFINE.ERROR_UNAUTHORIZED;
            }

            ClaimName claimName = _redisCache.GetAsync<ClaimName>(token).Result;
            if (claimName != null)
            {
                return DEFINE.ERROR_UNAUTHORIZED;
            }
            if (DateTime.Compare(claimName.exp, DateTime.Now) < 0)
            {
                return DEFINE.ERROR_UNAUTHORIZED;
            }
            return DEFINE.SUCCESS;
        }

        public AuthStrategyContext GetCurrentUser()
        {
            AuthStrategyContext authStrategy = null;
            string token = GetToken();
            ClaimName claimName = _redisCache.GetAsync<ClaimName>(token).Result;
            if (claimName != null)
            {
                authStrategy = _factory.GetAuthStrategyContext(claimName.account);
            }
            return authStrategy;
        }

        public bool Logout()
        {
            var token = GetToken();
            if (string.IsNullOrEmpty(token)) return true;

            try
            {
                _redisCache.DeleteAsync(token);
                return true;
            }
            catch
            {
                return false;
            }
        }

        private string GetToken()
        {
            string token = _httpContextAccessor.HttpContext.Request.Query[DEFINE.TOKEN_NAME];
            if (!string.IsNullOrEmpty(token)) return DEFINE.ACCESS_TOKEN + token;

            token = _httpContextAccessor.HttpContext.Request.Headers[DEFINE.TOKEN_NAME];
            if (!string.IsNullOrEmpty(token)) return DEFINE.ACCESS_TOKEN + token;

            token = _httpContextAccessor.HttpContext.Request.Cookies[DEFINE.TOKEN_NAME];
            if (!string.IsNullOrEmpty(token)) return DEFINE.ACCESS_TOKEN + token;

            return string.Empty;
        }
    }
}
