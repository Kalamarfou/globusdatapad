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
            DAL.Utils.GenericCrud.SetFirstAudit(c.Common.Audit, authorId);
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
            DAL.Utils.GenericCrud.SetFirstAudit(sp.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(sp);
        }

        public DAL.StudyPeriod GetStudyPeriodById(int id)
        {
            return db.StudyPeriods.First(s => s.Id == id);
        }

        public DAL.Cursus GetStudyPeriodCursus(int id)
        {
            DAL.StudyPeriod studyPeriod = GetStudyPeriodById(id);
            if (studyPeriod != null)
            {
                return studyPeriod.Cursus;
            }
            else
            {
                throw new ApplicationException("Study period " + id + " does not exist");
            }
        }

        public List<DAL.Discipline> getStudyPeriodDisciplines(int id, int pageNum, int pageSize, out int totalRecords)
        {
            DAL.StudyPeriod studyPeriod = GetStudyPeriodById(id);

            if (studyPeriod != null)
            {
                var result = (from d in studyPeriod.Disciplines
                              where d.Common.IsDeleted == false
                              select d);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Discipline>();
            }
            else
            {
                throw new ApplicationException("Study period " + id + " does not exist");
            }
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

        #region ICursusService Members


        public void Create(DAL.Discipline disc, string authorId)
        {
            DAL.Utils.GenericCrud.SetFirstAudit(disc.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(disc);
        }

        public DAL.Discipline GetById(int discId)
        {
            return db.Disciplines.First(e => e.Id == discId && e.Common.IsDeleted == false);
        }

        public List<DAL.Discipline> GetAll(int pageNum, int pageSize, out int totalRecords)
        {
            totalRecords = 0;
            List<DAL.Discipline> disciplines;

            using (DAL.GDPEntities db = new DAL.GDPEntities())
            {
                totalRecords = (from u in db.Disciplines
                                where u.Common.IsDeleted == false
                                select u).Count<DAL.Discipline>();

                disciplines = (from u in db.Disciplines
                               where u.Common.IsDeleted == false
                               select u).Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Discipline>();
            }

            return disciplines;
        }

        public void Update(DAL.Discipline disc, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(disc.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(disc);
        }

        public void Delete(DAL.Discipline disc, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(disc.Common.Audit, authorId);
            disc.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.Update(disc);
        }

        public List<DAL.EvaluationType> GetDisciplineEvaluationTypes(int discId, int pageNum, int pageSize, out int totalRecords)
        {
            DAL.Discipline disc = GetById(discId);
            totalRecords = disc.EvaluationTypes.Count;

            if (disc != null)
            {
                var result = (from u in disc.EvaluationTypes
                              where u.Common.IsDeleted == false
                              select u);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.EvaluationType>();
            }
            else
            {
                throw new ApplicationException("Discipline " + discId + " does not exist");
            }
        }

        public List<DAL.CourseType> GetDisciplineCourseTypes(int discId, int pageNum, int pageSize, out int totalRecors)
        {
            DAL.Discipline disc = GetById(discId);
            totalRecors = disc.CourseTypes.Count;

            if (disc != null)
            {
                var result = (from u in disc.CourseTypes
                              where u.Common.IsDeleted == false
                              select u);
                totalRecors = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.CourseType>();
            }
            else
            {
                throw new ApplicationException("Discipline " + discId + " does not exist");
            }
        }

        #endregion
    }
}
