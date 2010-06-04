using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Class
{
    public interface IClassService
    {
        #region "Class"

        void CreateClass(DAL.Class c, string authorId);

        DAL.Class GetClassById(int id);

        List<DAL.Class> GetAllClasses(int pageNum, int pageSize, out int totalRecords);

        void UpdateClass(DAL.Class c, string authorId);

        void DeleteClass(DAL.Class c, string authorId);

        #endregion

        #region "CourseType"

        void CreateCourseType(DAL.CourseType courseType, string authorId);

        DAL.CourseType GetCourseTypeById(int id);

        List<DAL.CourseType> GetAllCourseTypes(int pageNum, int pageSize, out int totalRecords);

        void UpdateCourseType(DAL.CourseType c, string authorId);

        void DeleteCourseType(DAL.CourseType c, string authorId);

        #endregion

        #region "EvaluationType"

        void CreateEvaluationType(DAL.EvaluationType evalType, string authorId);

        DAL.EvaluationType GetEvaluationTypeById(int id);

        List<DAL.EvaluationType> GetAllEvaluationTypes(int pageNum, int pageSize, out int totalRecords);

        void UpdateEvaluationType(DAL.EvaluationType e, string authorId);

        void DeleteEvaluationType(DAL.EvaluationType e, string authorId);

        #endregion
    }
}
