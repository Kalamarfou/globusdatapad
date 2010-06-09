using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Services;
using Services.People;
using Services.Campus;
using System.Data.Objects.DataClasses;
using DAL;

namespace Services.Event
{
    public class EventService : IEventService
    {


        public void CreateUserEvent(DAL.Event ev, string authorId)
        {
            using (DAL.GDPEntities gdp = new DAL.GDPEntities())
            {
                DAL.User user = (from u in gdp.Users
                                 where u.Username == authorId && u.Common.IsDeleted == false
                                 select u).FirstOrDefault<DAL.User>();

                if (user == null)
                {
                    throw new ApplicationException("User " + authorId + " not found.");
                }
                else
                {
                    DAL.Utils.GenericCrud.SetAudit(ev.Common.Audit, authorId);

                    user.Events.Add(ev);

                    gdp.SaveChanges();
                }
            }
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
            using (GDPEntities db = new GDPEntities())
            {
                return db.Events.First(e => e.Id == id && e.Common.IsDeleted == false);
            }
        }

        public DAL.WorldWideEvent GetWorldWideEventById(int wweId)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return db.Events.OfType<DAL.WorldWideEvent>().First(e => e.Id == wweId && e.Common.IsDeleted == false);
            }
        }

        public List<DAL.WorldWideEvent> GetWorldWideEvents(DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            using (GDPEntities db = new GDPEntities())
            {
                var result = (from wwe in db.Events.OfType<DAL.WorldWideEvent>()
                              where wwe.StartDate >= startDate && wwe.StartDate <= endDate && wwe.Common.IsDeleted == false
                              orderby wwe.StartDate
                              select wwe);

                totalRecords = result.Count<DAL.WorldWideEvent>();

                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.WorldWideEvent>();
            }
        }

        public List<DAL.Event> GetCampusEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            ISecurityService secService = new SecurityService();
            DAL.User user = secService.getUserById(userId);
            
            if (user != null)
            {
                if (user.CurrentClass == null)
                {
                    totalRecords = 0;
                    return null;
                }
                var result = (from e in user.CurrentClass.Campus.Events
                              where e.StartDate >= startDate && e.StartDate <= endDate && e.Common.IsDeleted == false
                              orderby e.StartDate
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
            if (campus != null)
            {
                var result = (from e in campus.Events
                              where e.StartDate >= startDate && e.StartDate <= endDate && e.Common.IsDeleted == false
                              orderby e.StartDate
                              select e);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Event>();
            }
            else
            {
                throw new ApplicationException("Campus #" + campus + " does not exist.");
            }
        }

        public DAL.BaseCourse GetClassEventById(int eventId)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return db.Events.OfType<DAL.BaseCourse>().First(e => e.Id == eventId && e.Common.IsDeleted == false);
            }
        }

        public List<DAL.Event> GetClassEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            ISecurityService peopleService = new SecurityService();
            DAL.User user = peopleService.getUserById(userId);
            if (user != null)
            {
                if (user.CurrentClass == null)          // if user doesn't have a class
                {
                    totalRecords = 0;
                    return null;
                }
                var result = (from e in user.CurrentClass.Courses
                              where e.StartDate >= startDate && e.StartDate <= endDate && e.Common.IsDeleted == false
                              orderby e.StartDate
                              select e);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Event>();
            }
            else
            {
                throw new ApplicationException("User " + user + " does not exist.");
            }
        }

        public List<DAL.Event> GetEventsForUser(string userName, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            using (GDPEntities db = new GDPEntities())
            {
                var result = (from e in db.Events
                              where e.StartDate >= startDate && e.StartDate <= endDate && e.Common.IsDeleted == false && e.User.Username == userName
                              orderby e.StartDate
                              select e);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Event>();
            }
        }

        public void Update(DAL.Event e, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(e.Common.Audit, authorId);
            DAL.Utils.GenericCrud.SetAudit(e.Venue.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(e.Venue);
            DAL.Utils.GenericCrud.Update(e);
        }

        public void UpdateWorldWideEvent(DAL.WorldWideEvent wwe, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(wwe.Common.Audit, authorId);
            //DAL.Utils.GenericCrud.SetAudit(wwe.Venue.Common.Audit, authorId);
            //DAL.Utils.GenericCrud.Update(wwe.Venue);
            DAL.Utils.GenericCrud.Update<DAL.WorldWideEvent>(wwe);
        }

        public void UpdateUserEvent(DAL.Event e, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(e.Common.Audit, authorId);
            //TODO, il faudrais deja avoir une venue
            //DAL.Utils.GenericCrud.SetAudit(e.Venue.Common.Audit, authorId);
            //DAL.Utils.GenericCrud.Update(e.Venue);
            DAL.Utils.GenericCrud.Update(e);
        }

        public void UpdateClassEvent(DAL.BaseCourse bc, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(bc.Common.Audit, authorId);
            DAL.Utils.GenericCrud.SetAudit(bc.Venue.Common.Audit, authorId);
            
            DAL.Utils.GenericCrud.Update(bc.Venue);
            //GUILLAUME heu... peu etre :
            //DAL.Utils.GenericCrud.Update(bc.Stakeholder);
            //DAL.Utils.GenericCrud.Update(bc.Discipline);
            DAL.Utils.GenericCrud.Update(bc);
        }
      
        public void UpdateCampusEvent(DAL.Event e, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(e.Common.Audit, authorId);
            DAL.Utils.GenericCrud.SetAudit(e.Venue.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(e.Venue);
            DAL.Utils.GenericCrud.Update(e);
        }

        public void Delete(int eventId, string authorId)
        {
            DAL.Event ev = GetById(eventId);
            
            ev.Common.Audit.LastModifiedAt = DateTime.Now;
            ev.Common.Audit.LastModifiedBy = authorId;
            ev.Common.IsDeleted = true;

            DAL.Utils.GenericCrud.Update(ev);
        }

        public void Delete(DAL.Event e, string authorId)
        {
            e.Common.Audit.LastModifiedAt = DateTime.Now;
            e.Common.Audit.LastModifiedBy = authorId;
            e.Common.IsDeleted = true;

            DAL.Utils.GenericCrud.Update(e);
        }

        public void CreateCampusEvent(DAL.Event ev, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(ev.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(ev);
        }
    }
}
