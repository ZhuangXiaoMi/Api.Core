﻿using Entity.SysManage;
using IRepository.Sys;
using IService.Sys;
using Service.Base;

namespace Service.Sys
{
    public class SysDBBackupService : BaseService<SysDBBackup>, ISysDBBackupService
    {
        ISysDBBackupRepository _repository;

        public SysDBBackupService(ISysDBBackupRepository repository)
        {
            this._repository = repository;
            base._baseRepository = repository;
        }
    }
}