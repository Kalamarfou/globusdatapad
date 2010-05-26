﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Services;

namespace Services.Event
{
    class EventService:IEventService
    {

        private DAL.GDPEntities db;

        public EventService()
        {
            db = new DAL.GDPEntities();
        }

        public void CreateCampusEvent(DAL.Event ev, string authorId, int campusId)
        {
            ev.Common.Audit.CreatedBy = authorId;

            Services.Campus.CampusService service = new Campus.CampusService();
            DAL.Campus campus = service.GetById(campusId);
            campus.Events.Add(DAL.Utils.GenericCrud.Create(ev));
        }

        public void CreateUserEvent(DAL.Event ev, string authorId, int userId)
        {
            ev.Common.Audit.CreatedBy = authorId;

            Services.People.SecurityService serv = new People.SecurityService();
            DAL.User user = serv.getUserById(userId);
            user.Person.Events.Add(DAL.Utils.GenericCrud.Create(ev));

        }

        public void CreateWorldWideEvent(DAL.WorldWideEvent ev, string authorId, int userId)
        {
            ev.Common.Audit.CreatedBy = authorId;

            Services.People.SecurityService serv = new People.SecurityService();
            DAL.User user = serv.getUserById(userId);
            user.Person.Events.Add(DAL.Utils.GenericCrud.Create(ev));
        }

        public DAL.Event GetById(int id)
        {
            return db.Events.First(ev => ev.Id == id);
        }

        public DAL.WorldWideEvent GetWorldWideEventById(int wweId)
        {
            return (DAL.WorldWideEvent)db.Events.First(ev => ev.Id == wweId); 
        }

        public List<DAL.WorldWideEvent> GetWorldWideEvents(DateTime startDate, DateTime endDate, int pageNum, int pageSize)
        {   
            List<DAL.WorldWideEvent> wevents = (from we in db.Events.OfType<DAL.WorldWideEvent>()
                                                where we.Common.IsDeleted == false && we.StartDate >= startDate && we.EndDate <= endDate
                                                orderby we.StartDate
                       select we).Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.WorldWideEvent>();

            return wevents;
        }

        public List<DAL.WorldWideEvent> GetWorldWideEvents(int pageNum, int pageSize)
        {
            return GetWorldWideEvents(new DateTime(1975, 01, 01), new DateTime(2050, 11, 28), pageNum, pageSize);
        }

        public DAL.Event GetCampusEventById(int eventId)
        {
            Services.Campus.CampusService campServ = new Services.Campus.CampusService();
            DAL.Campus camp = campServ.GetById(eventId);
            List<DAL.Event> campEvList = camp.Events.ToList<DAL.Event>();

            DAL.Event ev = (from e in db.Events.OfType<DAL.Event>()
                            where e.Id == eventId
                            select e).Single<DAL.Event>();

            return ev;
        }

        public List<DAL.Event> GetCampusEventsForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize)
        {
            throw new NotImplementedException();
        }

        public List<DAL.Event> GetEventsForCampus(int userId, int pageNum, int pageSize)
        {
            throw new NotImplementedException();
        }

        public DAL.Event GetClassEventById(int eventId)
        {
            throw new NotImplementedException();
        }

        public List<DAL.Event> GetClassEventForUser(int userId, DateTime startDate, DateTime endDate, int pageNum, int pageSize)
        {
            throw new NotImplementedException();
        }

        public List<DAL.Event> GetClassEventForUser(int userId, int pageNum, int pageSize)
        {
            throw new NotImplementedException();
        }

        public List<DAL.Event> GetCampusEventsForUser(int userId, int pageNum, int pageSize)
        {
            throw new NotImplementedException();
        }

        public List<DAL.Event> GetEventsForCampus(int campusId, DateTime startDate, DateTime endDate, int pageNum, int pageSize)
        {
            throw new NotImplementedException();
        }


        public void Update(int id, DAL.Event e)
        {
            DAL.Utils.GenericCrud.Update(e.Venue);
            DAL.Utils.GenericCrud.Update(e);
        }

        public void Delete(int id)
        {
            DAL.Event ev = GetById(id);
            ev.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.Update(ev);
        }
    }
}
