using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL.Utils;

namespace Services.Cursus
{
    public class CursusService : ICursusService
    {

        private DAL.GDPEntities db;
        
        public CursusService()
        {
            db = new DAL.GDPEntities();
        }

        #region ICursusService Members

        public void CreateCursus(DAL.Cursus c, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit ,authorId);
            DAL.Utils.GenericCrud.Create(c);

        }
        
        public DAL.Cursus GetCursusById(int id)
        {
            return db.Cursuses.First(c => c.Id == id && c.Common.IsDeleted == false);
        }

        public List<DAL.Cursus> GetAllCursuses(int pageNum, int pageSize, out int totalRecords)
        {
            var result = (from c in db.Cursuses
                          where c.Common.IsDeleted == false
                          orderby c.Name
                          select c);
            totalRecords = result.Count();
            return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Cursus>();
        }

        public List<DAL.Cursus> GetAllActiveCursuses(int pageNum, int pageSize, out int totalRecords)
        {
            var result = (from s in db.StudyPeriods
                          where s.EndDate >= DateTime.Now && s.Common.IsDeleted == false
                          select s.Cursus).Distinct();
            totalRecords = result.Count();
            return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Cursus>();
        }

        public void UpdateCursus(DAL.Cursus c, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(c);
        }

        public void DeleteCursus(DAL.Cursus c, string authorId)
        {
            c.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(c);
        }

        public void CreateStudyPeriod(DAL.StudyPeriod sp, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(sp.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(sp);
        }

        public DAL.StudyPeriod GetStudyPeriodById(int id)
        {
            return db.StudyPeriods.First(s => s.Id == id);
        }


        public void UpdateStudyPeriod(DAL.StudyPeriod sp, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(sp.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(sp);
        }

        public void DeleteStudyPeriod(DAL.StudyPeriod sp, string authorId)
        {
            sp.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.SetAudit(sp.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(sp);
        }

        #endregion
    }
}
