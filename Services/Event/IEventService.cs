using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.Event
{
    public interface IEventService
    {
        #region "Creation"

        void CreateCampusEvent(DAL.Event ev, string authorId, int campusId);

        /// <summary>
        /// User create an event for himself
        /// </summary>
        /// <param name="ev">Event to create</param>
        /// <param name="authorId">User whom event belong to</param>
        void CreateUserEvent(DAL.Event ev, string authorId);

        void CreateClassEvent(DAL.BaseCourse bc, string authorId);

        void CreateWorldWideEvent(DAL.WorldWideEvent ev, string authorId);

        #endregion

        #region "Retrieve events"

        DAL.Event GetById(int id);

        DAL.WorldWideEvent GetWorldWideEventById(int wweId);

        List<DAL.WorldWideEvent> GetWorldWideEvents(DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords);

        List<DAL.WorldWideEvent> GetWorldWideEvents(int pageNum, int pageSize, out int totalRecords);
        
        List<DAL.Event> GetCampusEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords);

        List<DAL.Event> GetCampusEventsForUser(int userId, int pageNum, int pageSize, out int totalRecords);

        List<DAL.Event> GetEventsForCampus(int campusId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords);

        List<DAL.Event> GetEventsForCampus(int campusId, int pageNum, int pageSize, out int totalRecords);

        DAL.BaseCourse GetClassEventById(int eventId);

        List<DAL.Event> GetClassEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords);

        List<DAL.Event> GetClassEventsForUser(int userId, int pageNum, int pageSize, out int totalRecords);

        List<DAL.Event> GetEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords);

        List<DAL.Event> GetEventsForUser(int userId, int pageNum, int pageSize, out int totalRecords);

        #endregion

        #region "Update events"

        void Update(DAL.Event e, string authorId);

        void UpdateWorldWideEvent(DAL.WorldWideEvent wwe, string authorId);

        void UpdateUserEvent(DAL.Event e, string authorId);

        void UpdateClassEvent(DAL.BaseCourse bc, string authorId);

        void UpdateCampusEvent(DAL.Event e, string authorId);

        #endregion

        #region "Delete"

        void Delete(int eventId, string authorId);

        void Delete(DAL.Event e, string authorId);

        #endregion
    }
}
