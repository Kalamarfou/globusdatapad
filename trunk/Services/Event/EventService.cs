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
            return db.Events.First(e => e.Id == id && e.Common.IsDeleted == false);
        }

        public DAL.WorldWideEvent GetWorldWideEventById(int wweId)
        {
            return db.Events.OfType<DAL.WorldWideEvent>().First(e => e.Id == wweId && e.Common.IsDeleted == false);
        }

        public List<DAL.WorldWideEvent> GetWorldWideEvents(DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            totalRecords = (from wwe in db.Events.OfType<DAL.WorldWideEvent>()
                            where wwe.StartDate >= startDate && wwe.EndDate <= endDate && wwe.Common.IsDeleted == false
                            orderby wwe.StartDate
                            select wwe).Count<DAL.WorldWideEvent>();

            List<DAL.WorldWideEvent> result = (from wwe in db.Events.OfType<DAL.WorldWideEvent>()
                        where wwe.StartDate >= startDate && wwe.EndDate <= endDate && wwe.Common.IsDeleted == false
                        orderby wwe.StartDate
                        select wwe).Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.WorldWideEvent>();

            return result;
        }


        public List<DAL.WorldWideEvent> GetWorldWideEvents(int pageNum, int pageSize, out int totalRecords)
        {
            //GUILLAUME @Martin: Je croyais que tu aimais le code propre ...
            return GetWorldWideEvents(new DateTime(1980, 1, 1), new DateTime(2050, 1, 1), pageNum, pageSize, out totalRecords);
        }

        public List<DAL.Event> GetCampusEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
           
            ISecurityService secService = new SecurityService();
            DAL.User user = secService.getUserById(userId);
            
            if (user != null)
            {
                var result = (from e in user.CurrentClass.Campus.Events
                              where e.StartDate >= startDate && e.EndDate >= endDate && e.Common.IsDeleted == false
                              select e);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Event>();
            }
            else
            {
                throw new ApplicationException("User " + userId + " does not exist.");
            }
        }

        public List<DAL.Event> GetCampusEventsForUser(int userId, int pageNum, int pageSize, out int totalRecords)
        {
            return GetCampusEventsForUser(userId, new DateTime(1980, 1, 1), new DateTime(2050, 1, 1), pageNum, pageSize, out totalRecords);
        }

        public List<DAL.Event> GetEventsForCampus(int campusId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            ICampusService campusService = new CampusService();
            DAL.Campus campus = campusService.GetById(campusId);
            totalRecords = campus.Events.Count();
            if (campus != null)
            {
                var result = (from e in campus.Events
                              where e.StartDate >= startDate && e.EndDate >= endDate && e.Common.IsDeleted == false
                              select e);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Event>();
            }
            else
            {
                throw new ApplicationException("Campus " + campus + " does not exist.");
            }
        }


        public List<DAL.Event> GetEventsForCampus(int campusId, int pageNum, int pageSize, out int totalRecords)
        {
            return GetEventsForCampus(campusId, new DateTime(1980, 1, 1), new DateTime(2050, 1, 1), pageNum, pageSize, out totalRecords);
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
            DAL.Utils.GenericCrud.SetAudit(e.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update<DAL.Event>(e);
        }

        public void UpdateWorldWideEvent(DAL.WorldWideEvent wwe, string authorId)
        {
            wwe.Common.Audit = GetWorldWideEventById(wwe.Id).Common.Audit;
            DAL.Utils.GenericCrud.SetAudit(wwe.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update<DAL.WorldWideEvent>(wwe);
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
