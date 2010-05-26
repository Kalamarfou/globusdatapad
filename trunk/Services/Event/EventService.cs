using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Event
{
    class EventService:IEventService
    {
        #region IEventService Members

        public void Create(DAL.Event ev, int authorId)
        {
            throw new NotImplementedException();
        }

        public DAL.Event GetById(int id)
        {
            throw new NotImplementedException();
        }

        public List<DAL.Event> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(int id, DAL.Event e)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
