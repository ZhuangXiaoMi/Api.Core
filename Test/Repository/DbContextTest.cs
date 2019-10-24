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
        private DbContext _dbContext;

        [SetUp]
        public void Setup()
        {
            DbContext.Init(_strConnection);
            _dbContext = DbContext.GetDbContext();
        }

        [Test]
        public void CreateEntityByDBT()
        {
            _dbContext.CreateEntityByDBT("D:\\DbFirst\\", "Entity");
            Assert.Pass();
        }
    }
}
