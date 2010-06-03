using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Class
{
    public interface IClassService
    {
        #region "Class"

        void Create(DAL.Class c, string authorId);

        DAL.Class GetById(int id);

        List<DAL.Class> GetAll(int pageNum, int pageSize, out int totalRecords);

        void Update(DAL.Class c, string authorId);

        void Delete(DAL.Class c, string authorId);

        #endregion
    }
}
