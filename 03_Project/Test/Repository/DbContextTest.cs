using System;
using System.Collections.Generic;
using System.Text;
using NUnit.Framework;
using Repository.SqlSugar;

namespace Test.Repository
{
    public class DbContextTest
    {
        private static string _strConnection = "Persist Security Info=True;Data Source=.;User ID=sa;Password=123456;Initial Catalog=ApiCore;";
        private ApiDbContext _dbContext;

        [SetUp]
        public void Setup()
        {
            ApiDbContext.Init(_strConnection);
            _dbContext = ApiDbContext.GetDbContext();
        }

        [Test]
        public void CreateEntityByDBT()
        {
            //_dbContext.CreateEntityByDBT("D:\\DbFirst\\Entity\\", "Entity");
            _dbContext.CreateModelByDBT("D:\\DbFirst\\Entity\\", "Entity");
            _dbContext.CreateIRepositoryByDBT("D:\\DbFirst\\IRepository\\", "IRepository.Sys");
            _dbContext.CreateIServiceByDBT("D:\\DbFirst\\IService\\", "IService.Sys");
            _dbContext.CreateRepositoryByDBT("D:\\DbFirst\\Repository\\", "Repository.Sys");
            _dbContext.CreateServiceByDBT("D:\\DbFirst\\Service\\", "Service.Sys");
            Assert.Pass();
        }

        [Test]
        public void CreateDBTByEntity()
        {
            _dbContext.CreateDBTByEntity(false);
            Assert.Pass();
        }
    }
}
