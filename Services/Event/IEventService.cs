using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Event
{
    interface IEventService
    {
        void Create(DAL.Event ev, int authorId);

        DAL.Event GetById(int id);

        List<DAL.Event> GetAll();

        void Update(int id, DAL.Event e);

        void Delete(int id);

    }
}
