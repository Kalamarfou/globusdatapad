using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Event
{
    public interface IEventService
    {
        void CreateCampusEvent(DAL.Event ev, string authorId, int campusId);

        void CreateUserEvent(DAL.Event ev, string authorId, int userId);

        void CreateWorldWideEvent(DAL.WorldWideEvent ev, string authorId, int userId);

        DAL.Event GetById(int id);

        DAL.WorldWideEvent GetWorldWideEventById(int wweId);

        List<DAL.WorldWideEvent> GetWorldWideEvents(DateTime startDate, DateTime endDate, int pageNum, int pageSize);

        List<DAL.WorldWideEvent> GetWorldWideEvents(int pageNum, int pageSize);
        
        List<DAL.Event> GetCampusEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize);

        List<DAL.Event> GetCampusEventsForUser(int userId, int pageNum, int pageSize);

        List<DAL.Event> GetEventsForCampus(int campusId, DateTime startDate, DateTime endDate, int pageNum, int pageSize);

        List<DAL.Event> GetEventsForCampus(int campusId, int pageNum, int pageSize);

        DAL.Event GetClassEventById(int eventId);

        List<DAL.Event> GetClassEventForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize);

        List<DAL.Event> GetClassEventForUser(int userId, int pageNum, int pageSize);

        void Update(int id, DAL.Event e);

        void Delete(int id);

    }
}
