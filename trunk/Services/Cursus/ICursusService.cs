using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Cursus
{
    public interface ICursusService
    {
        #region "Cursus"

        void CreateCursus(DAL.Cursus c, string authorId);

        DAL.Cursus GetCursusById(int id);

        List<DAL.Cursus> GetAllCursuses(int pageNum, int pageSize, out int totalRecords);

        /// <summary>
        /// Get cursuses that are not over (having currently a study period or in the future.
        /// </summary>
        /// <param name="pageNum"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalRecords"></param>
        /// <returns></returns>
        List<DAL.Cursus> GetAllActiveCursuses(int pageNum, int pageSize, out int totalRecords);

        void UpdateCursus(DAL.Cursus c, string authorId);

        void DeleteCursus(DAL.Cursus c, string authorId);

        #endregion

        #region "StudyPeriods"

        void CreateStudyPeriod(DAL.StudyPeriod sp, string authorId);

        DAL.StudyPeriod GetStudyPeriodById(int id);

        List<DAL.Discipline> getStudyPeriodDisciplines(int id, int pageNum, int pageSize, out int totalRecords);

        void UpdateStudyPeriod(DAL.StudyPeriod sp, string authorId);

        void DeleteStudyPeriod(DAL.StudyPeriod sp, string authorId);
        
        #endregion

        #region "Disciplines"

        void Create(DAL.Discipline disc, string authorId);

        DAL.Discipline GetById(int discId);

        List<DAL.Discipline> GetAll(int pageNum, int pageSize, out int totalRecords);

        void Update(DAL.Discipline disc, string authorId);

        void Delete(DAL.Discipline disc, string authorId);

        List<DAL.EvaluationType> GetDisciplineEvaluationTypes(int discId, int pageNum, int pageSize, out int totalRecords);

        List<DAL.CourseType> GetDisciplineCourseTypes(int discId, int pageNum, int pageSize, out int totalRecors);

        #endregion

    }
}
