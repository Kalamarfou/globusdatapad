using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL.Utils;
using DAL;

namespace Services.Cursus
{
    public class CursusService : ICursusService
    {

        public void CreateCursus(DAL.Cursus c, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(c);
        }
        
        public DAL.Cursus GetCursusById(int id)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return db.Cursuses.Include("StudyPeriods").First(c => c.Id == id && c.Common.IsDeleted == false);
            }
        }

        public List<DAL.Cursus> GetAllCursuses(int pageNum, int pageSize, out int totalRecords)
        {
            using (GDPEntities db = new GDPEntities())
            {
                var result = (from c in db.Cursuses
                              where c.Common.IsDeleted == false
                              orderby c.Name
                              select c);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Cursus>();
            }
        }

        public List<DAL.Cursus> GetAllActiveCursuses(int pageNum, int pageSize, out int totalRecords)
        {
            using (GDPEntities db = new GDPEntities())
            {
                var result = (from s in db.StudyPeriods
                              where s.EndDate >= DateTime.Now && s.Common.IsDeleted == false
                              select s.Cursus).Distinct();
                result = result.OrderBy(c => c.Name);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Cursus>();
            }
        }

        public void UpdateCursus(DAL.Cursus c, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(c);
        }

        public void DeleteCursus(int id, string authorId)
        {
            DAL.Cursus c = GetCursusById(id);
            c.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(c);
        }

        public void CreateStudyPeriodForCursus(int cursusId, DAL.StudyPeriod sp, string authorId)
        {
            using (GDPEntities gdp = new GDPEntities())
            {
                DAL.Cursus cursus = (from c in gdp.Cursuses
                                     where c.Id == cursusId && c.Common.IsDeleted == false
                                     select c).FirstOrDefault<DAL.Cursus>();

                if (cursus == null)
                {
                    throw new ApplicationException("Cursus #" + cursusId + " doesn't exist or has been deleted.");
                }

                DAL.Utils.GenericCrud.SetAudit(sp.Common.Audit, authorId);

                cursus.StudyPeriods.Add(sp);

                gdp.SaveChanges();
            }
        }

        public DAL.StudyPeriod GetStudyPeriodById(int id)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return db.StudyPeriods.First(s => s.Id == id && s.Common.IsDeleted == false);
            }
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
                              orderby d.Name
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

        public void DeleteStudyPeriod(int id, string authorId)
        {
            DAL.StudyPeriod sp = GetStudyPeriodById(id);
            sp.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.SetAudit(sp.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(sp);
        }

        public void Create(DAL.Discipline disc, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(disc.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(disc);
        }

        public DAL.Discipline GetById(int discId)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return db.Disciplines.First(e => e.Id == discId && e.Common.IsDeleted == false);
            }
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
                               orderby u.Name
                               select u).Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Discipline>();
            }

            return disciplines;
        }

        public void Update(DAL.Discipline disc, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(disc.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(disc);
        }

        public void Delete(int id, string authorId)
        {
            DAL.Discipline disc = GetById(id);
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
                              orderby u.Name
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
                              orderby u.Name
                              select u);
                totalRecors = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.CourseType>();
            }
            else
            {
                throw new ApplicationException("Discipline " + discId + " does not exist");
            }
        }

        public List<DAL.StudyPeriod> getAllStudyPeriods(int pageNum, int pageSize, out int totalRecords)
        {
            using (GDPEntities gdp = new GDPEntities())
            {
                totalRecords = 0;

                List<DAL.StudyPeriod> studyPeriods = (from sp in gdp.StudyPeriods.Include("Cursus")
                                                      where sp.Common.IsDeleted == false
                                                      orderby sp.Name
                                                      select sp).ToList<DAL.StudyPeriod>();

                // TODO pagin

                return studyPeriods;
            }


        }

        public void AddStudyPeriodToClass(int studyPeriodId, int classId, string authorId)
        {
            using (GDPEntities db = new GDPEntities())
            {
                DAL.Class c = (from cl in db.Classes
                               where cl.Id == classId && cl.Common.IsDeleted == false
                               select cl).FirstOrDefault<DAL.Class>();

                DAL.StudyPeriod s = (from sp in db.StudyPeriods
                                      where sp.Id == studyPeriodId && sp.Common.IsDeleted == false
                                      select sp).FirstOrDefault<DAL.StudyPeriod>();

                c.StudyPeriods.Add(s);

                db.SaveChanges();
            }
        }

        public List<DAL.StudyPeriod> getAllStudyPeriodsForClass(int classId)
        {
            using (GDPEntities db = new GDPEntities())
            {
                DAL.Class c = (from cl in db.Classes.Include("StudyPeriods")
                               where cl.Id == classId && cl.Common.IsDeleted == false
                               select cl).FirstOrDefault<DAL.Class>();

                return c.StudyPeriods.ToList<DAL.StudyPeriod>();
            }
        }
    }
}
