using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Cursus
{
    public interface ICursusService
    {
        void Create(DAL.Cursus c);

        DAL.Cursus GetById(int id);

        List<DAL.Cursus> GetAll();

        void Update(int id, DAL.Cursus c);

        void Delete(int id);
    }
}
