using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Class
{
    public class ClassService : IClassService
    {

        private DAL.GDPEntities db;

        public ClassService()
        {
            DAL.GDPEntities db = new DAL.GDPEntities();
        }
    
        #region IClassService Members

public void  CreateClass(DAL.Class c, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
    DAL.Utils.GenericCrud.Create(c);
}

public DAL.Class  GetClassById(int id)
{
    return db.Classes.First(c => c.Id == id && c.Common.IsDeleted == false);
}

public List<DAL.Class> GetAllClasses(int pageNum, int pageSize, out int totalRecords)
{
    var result = (from c in db.Classes
                  where c.Common.IsDeleted == false
                  orderby c.Id
                  select c);
    totalRecords = result.Count();
    return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Class>();
}

public void  UpdateClass(DAL.Class c, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
    DAL.Utils.GenericCrud.Update(c);
}

public void  DeleteClass(DAL.Class c, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
    c.Common.IsDeleted = true;
    DAL.Utils.GenericCrud.Update(c);
}

#endregion

#region IClassService Members


public void CreateCourseType(DAL.CourseType courseType, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(courseType.Common.Audit, authorId);
    People.ISecurityService serv = new People.SecurityService();

    if ((serv.isUserInRole(authorId, "Admin")) || (serv.isUserInRole(authorId, "CampusManager")))
    {
        DAL.Utils.GenericCrud.Create(courseType);
    }
}

public DAL.CourseType GetCourseTypeById(int id)
{
    return db.BaseTypes.OfType<DAL.CourseType>().First(c => c.Id == id && c.Common.IsDeleted == false);
}

public List<DAL.CourseType> GetAllCourseTypes(int pageNum, int pageSize, out int totalRecords)
{
    var result = (from c in db.BaseTypes.OfType<DAL.CourseType>()
                  where c.Common.IsDeleted == false
                  orderby c.Id
                  select c);
    totalRecords = result.Count();
    
    return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.CourseType>();
}

public void UpdateCourseType(DAL.CourseType c, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
    People.ISecurityService serv = new People.SecurityService();

    if ( (serv.isUserInRole(authorId, "Admin")) || (serv.isUserInRole(authorId, "CampusManager")) ) 
    {
        c.Common.IsDeleted = true;
        DAL.Utils.GenericCrud.Update(c);
    }
}

public void DeleteCourseType(DAL.CourseType c, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
    People.ISecurityService serv = new People.SecurityService();

    if ((serv.isUserInRole(authorId, "Admin")) || (serv.isUserInRole(authorId, "CampusManager")))
    {
        c.Common.IsDeleted = true;
        DAL.Utils.GenericCrud.Update(c);
    }
}

public void CreateEvaluationType(DAL.EvaluationType evalType, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(evalType.Common.Audit, authorId);
    People.ISecurityService serv = new People.SecurityService();

    if ((serv.isUserInRole(authorId, "Admin")) || (serv.isUserInRole(authorId, "CampusManager")))
    {
        evalType.Common.IsDeleted = true;
        DAL.Utils.GenericCrud.Update(evalType);
    }
}

public DAL.EvaluationType GetEvaluationTypeById(int id)
{
    return db.BaseTypes.OfType<DAL.EvaluationType>().First(e => e.Id == id && e.Common.IsDeleted == false);
}

public List<DAL.EvaluationType> GetAllEvaluationTypes(int pageNum, int pageSize, out int totalRecords)
{
    var result = (from e in db.BaseTypes.OfType<DAL.EvaluationType>()
                  where e.Common.IsDeleted == false
                  orderby e.Id
                  select e);
    totalRecords = result.Count();

    return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.EvaluationType>();
}

public void UpdateEvaluationType(DAL.EvaluationType e, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(e.Common.Audit, authorId);
    People.ISecurityService serv = new People.SecurityService();

    if ((serv.isUserInRole(authorId, "Admin")) || (serv.isUserInRole(authorId, "CampusManager")))
    {
        e.Common.IsDeleted = true;
        DAL.Utils.GenericCrud.Update(e);
    }
}

public void DeleteEvaluationType(DAL.EvaluationType e, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(e.Common.Audit, authorId);
    People.ISecurityService serv = new People.SecurityService();

    if ((serv.isUserInRole(authorId, "Admin")) || (serv.isUserInRole(authorId, "CampusManager")))
    {
        e.Common.IsDeleted = true;
        DAL.Utils.GenericCrud.Update(e);
    }
}

#endregion
    }
}
