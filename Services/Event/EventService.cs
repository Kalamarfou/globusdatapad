using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Services;
using Services.People;
using Services.Campus;

namespace Services.Event
{
    public class EventService : IEventService
    {

        private DAL.GDPEntities db;

        public EventService()
        {
            db = new DAL.GDPEntities();
        }

        public void CreateUserEvent(DAL.Event ev, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(ev.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(ev);
        }

        public void CreateClassEvent(DAL.BaseCourse bc, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(bc.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(bc);
        }

        public void CreateWorldWideEvent(DAL.WorldWideEvent ev, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(ev.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(ev);
        }

        public DAL.Event GetById(int id)
        {
            return db.Events.First(e => e.Id == id);
        }

        public DAL.WorldWideEvent GetWorldWideEventById(int wweId)
        {
            return db.Events.OfType<DAL.WorldWideEvent>().First(e => e.Id == wweId);
        }

        public List<DAL.WorldWideEvent> GetWorldWideEvents(DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            var result = (from wwe in db.Events.OfType<DAL.WorldWideEvent>()
                        where wwe.StartDate == startDate && wwe.EndDate >= endDate
                        select wwe);
            totalRecords = result.Count();
            return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.WorldWideEvent>();
        }

        //GUILLAUME all ou que les pas finis?
        public List<DAL.WorldWideEvent> GetWorldWideEvents(int pageNum, int pageSize, out int totalRecords)
        {
            var result = (from wwe in db.Events.OfType<DAL.WorldWideEvent>()
                          where wwe.EndDate >= DateTime.Now
                          select wwe);
            totalRecords = result.Count();
            return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.WorldWideEvent>();
        }

        public List<DAL.Event> GetCampusEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
           
            ISecurityService secService = new SecurityService();
            DAL.User user = secService.getUserById(userId);
            
            if (user != null)
            {
                var result = (from e in user.CurrentClass.Campus.Events
                              where e.StartDate >= startDate && e.EndDate >= endDate
                              select e);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Event>();
            }
            else
            {
                throw new ApplicationException("User " + userId + " does not exist.");
            }
        }

        //GUILLAUME All ou que les pas fini?
        public List<DAL.Event> GetCampusEventsForUser(int userId, int pageNum, int pageSize, out int totalRecords)
        {
            ISecurityService secService = new SecurityService();
            DAL.User user = secService.getUserById(userId);
            totalRecords = user.CurrentClass.Campus.Events.Count();
            if (user != null)
            {
                var result = (from e in user.CurrentClass.Campus.Events
                              where e.EndDate >= DateTime.Now
                              select e);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Event>();
            }
            else
            {
                throw new ApplicationException("User " + userId + " does not exist.");
            }
        }

        public List<DAL.Event> GetEventsForCampus(int campusId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            ICampusService campusService = new CampusService();
            DAL.Campus campus = campusService.GetById(campusId);
            totalRecords = campus.Events.Count();
            if (campus != null)
            {
                var result = (from e in campus.Events
                              where e.StartDate >= startDate && e.EndDate >= endDate
                              select e);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Event>();
            }
            else
            {
                throw new ApplicationException("Campus " + campus + " does not exist.");
            }
        }

        //GUILLAUME All ou que les pas finis?
        public List<DAL.Event> GetEventsForCampus(int campusId, int pageNum, int pageSize, out int totalRecords)
        {
            ICampusService campusService = new CampusService();
            DAL.Campus campus = campusService.GetById(campusId);
            totalRecords = campus.Events.Count();
            if (campus != null)
            {
                var result = (from e in campus.Events
                              where e.EndDate >= DateTime.Now
                              select e);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Event>();
            }
            else
            {
                throw new ApplicationException("Campus " + campus + " does not exist.");
            }
        }

        public DAL.BaseCourse GetClassEventById(int eventId)
        {
            return db.Events.OfType<DAL.BaseCourse>().First(e => e.Id == eventId);
        }

        public List<DAL.Event> GetClassEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public List<DAL.Event> GetClassEventsForUser(int userId, int pageNum, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public List<DAL.Event> GetEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public List<DAL.Event> GetEventsForUser(int userId, int pageNum, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public void Update(DAL.Event e, string authorId)
        {
            throw new NotImplementedException();
        }

        public void UpdateWorldWideEvent(DAL.WorldWideEvent wwe, string authorId)
        {
            throw new NotImplementedException();
        }

        public void UpdateUserEvent(DAL.Event e, string authorId)
        {
            throw new NotImplementedException();
        }

        public void UpdateClassEvent(DAL.BaseCourse bc, string authorId)
        {
            throw new NotImplementedException();
        }

        public void UpdateCampusEvent(DAL.Event e, string authorId)
        {
            throw new NotImplementedException();
        }

        public void Delete(int eventId, string authorId)
        {
            throw new NotImplementedException();
        }

        public void Delete(DAL.Event e, string authorId)
        {
            throw new NotImplementedException();
        }

        public void CreateCampusEvent(DAL.Event ev, string authorId)
        {
            throw new NotImplementedException();
        }
    }
}
