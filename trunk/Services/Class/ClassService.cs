using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Class
{
    class ClassService : IClassService
    {

        private DAL.GDPEntities db;

        public ClassService()
        {
            DAL.GDPEntities db = new DAL.GDPEntities();
        }
    
        #region IClassService Members

public void  Create(DAL.Class c, string authorId)
{
    DAL.Utils.GenericCrud.SetFirstAudit(c.Common.Audit, authorId);
    DAL.Utils.GenericCrud.Create(c);
}

public DAL.Class  GetById(int id)
{
    return db.Classes.First(c => c.Id == id && c.Common.IsDeleted == false);
}

public List<DAL.Class> GetAll(int pageNum, int pageSize, out int totalRecords)
{
    var result = (from c in db.Classes
                  where c.Common.IsDeleted == false
                  select c);
    totalRecords = result.Count();
    return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Class>();
}

public void  Update(DAL.Class c, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
    DAL.Utils.GenericCrud.Update(c);
}

public void  Delete(DAL.Class c, string authorId)
{
    DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
    c.Common.IsDeleted = true;
    DAL.Utils.GenericCrud.Update(c);
}

#endregion
}
}
