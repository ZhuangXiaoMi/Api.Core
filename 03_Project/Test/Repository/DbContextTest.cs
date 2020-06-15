using System;
using System.Collections.Generic;
using System.Text;
using NUnit.Framework;
using Repository.SqlSugar;
using SqlSugar;

namespace Test.Repository
{
    public class DbContextTest
    {
        //private static string _strConnection = "Persist Security Info=True;Data Source=.;User ID=sa;Password=123456;Initial Catalog=ApiCore;";
        private static string _strConnection = "server=130.168.0.55;user id=erp_test;database=erp-catering-dev;password=erp_test@abc";
        private ApiDbContext _dbContext;

        [SetUp]
        public void Setup()
        {
            ApiDbContext.Init(_strConnection, DbType.MySql);
            _dbContext = ApiDbContext.GetDbContext();
        }

        [Test]
        public void CreateEntityByDBT()
        {
            //_dbContext.CreateEntityByDBT("D:\\DbFirst\\Entity\\", "Entity");
            //_dbContext.CreateModelByDBT("D:\\DbFirst\\Entity\\", "Entity");
            //_dbContext.CreateIRepositoryByDBT("D:\\DbFirst\\IRepository\\", "IRepository.Sys");
            //_dbContext.CreateIServiceByDBT("D:\\DbFirst\\IService\\", "IService.Sys");
            //_dbContext.CreateRepositoryByDBT("D:\\DbFirst\\Repository\\", "Repository.Sys");
            //_dbContext.CreateServiceByDBT("D:\\DbFirst\\Service\\", "Service.Sys");


            _dbContext.CreateModelByDBTXYEntity("D:\\DbFirst\\Entity\\", "xinyartech.Repository.Domain");
            _dbContext.CreateModelByDBTXYDto("D:\\DbFirst\\Dto\\", "xinyartech.Repository.Domain");
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
