using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Event;
using WebApp.Extensions;
using System.Collections;
using Services.People;

namespace WebApp.Areas.FrontOffice.Controllers
{
    public class CalendarApiController : Controller
    {
        /// <summary>
        /// As we do NOT paginate in web service, defines the MAX events to retrieve.
        /// </summary>
        private const int maxEventsToRetrieve = 100;

        //
        // GET: /FrontOffice/CalendarApi/WorldWideEvents/

        [Authorize]
        public JsonResult WorldWideEvents(double start, double end)
        {
            IEventService service = new EventService();
            ArrayList eventList = new ArrayList();
            int totalRecords;

            List<DAL.WorldWideEvent> wwe = service.GetWorldWideEvents(GlobalUtils.ConvertFromUnixTimestamp(start), GlobalUtils.ConvertFromUnixTimestamp(end), 0, maxEventsToRetrieve, out totalRecords);
            if (wwe != null)
            {
                foreach (DAL.WorldWideEvent e in wwe)
                {
                    eventList.Add(new CalendarEvent(e, "WorldWideEvent", "/FrontOffice/Calendar/WorldWideEvent/"));
                }
            }

            return Json(eventList, JsonRequestBehavior.AllowGet);
        }


        [Authorize]
        public JsonResult MandatoryWorldWideEvents(double start, double end)
        {
            IEventService service = new EventService();
            ArrayList eventList = new ArrayList();
            int totalRecords;

            List<DAL.WorldWideEvent> wwe = service.GetMandatoryWorldWideEvents(GlobalUtils.ConvertFromUnixTimestamp(start), GlobalUtils.ConvertFromUnixTimestamp(end), 0, maxEventsToRetrieve, out totalRecords);
            if (wwe != null)
            {
                foreach (DAL.WorldWideEvent e in wwe)
                {
                    eventList.Add(new CalendarEvent(e, "WorldWideEvent", "/FrontOffice/Calendar/WorldWideEvent/"));
                }
            }

            return Json(eventList, JsonRequestBehavior.AllowGet);
        }

        //
        // GET: /FrontOffice/CalendarApi/UserEvents/

        [Authorize]
        public JsonResult UserEvents(double start, double end)
        {
            IEventService service = new EventService();
            ArrayList eventList = new ArrayList();
            int totalRecords;

            List<DAL.Event> events = service.GetEventsForUser(User.Identity.Name, GlobalUtils.ConvertFromUnixTimestamp(start), GlobalUtils.ConvertFromUnixTimestamp(end), 0, maxEventsToRetrieve, out totalRecords);
            if (events != null)
            {
                foreach (DAL.Event e in events)
                {
                    eventList.Add(new CalendarEvent(e, "UserEvent", "/FrontOffice/MyEvents/Details/"));
                }
            }
            return Json(eventList, JsonRequestBehavior.AllowGet);
        }

        //
        // GET: /FrontOffice/CalendarApi/CampusEvents/

        [Authorize]
        public JsonResult CampusEvents(double start, double end)
        {
            IEventService eventService = new EventService();
            SecurityService securityService = new SecurityService();
            ArrayList eventList = new ArrayList();
            int totalRecords;

            DAL.User user = securityService.getUserByUsername(User.Identity.Name);          // TODO : devrait pas y avoir toute cette logique ici ! méthode dans Services... (MF)
            
            if (user.CurrentClass == null)      // if user doesn't have a class
            {
                return null;
            }

            int campusId = user.CurrentClass.Campus.Id;

            List<DAL.Event> events = eventService.GetCampusEventsForUser(user.Id, GlobalUtils.ConvertFromUnixTimestamp(start), GlobalUtils.ConvertFromUnixTimestamp(end), 0, maxEventsToRetrieve, out totalRecords);
            if (events != null)
            {
                foreach (DAL.Event e in events)
                {
                    eventList.Add(new CalendarEvent(e, "CampusEvent", "/FrontOffice/Calendar/CampusEvent/"));
                }
            }

            return Json(eventList, JsonRequestBehavior.AllowGet);
        }

        [Authorize]
        public JsonResult MandatoryCampusEvents(double start, double end)
        {
            IEventService eventService = new EventService();
            SecurityService securityService = new SecurityService();
            ArrayList eventList = new ArrayList();
            int totalRecords;

            DAL.User user = securityService.getUserByUsername(User.Identity.Name);          // TODO : devrait pas y avoir toute cette logique ici ! méthode dans Services... (MF)

            if (user.CurrentClass == null)      // if user doesn't have a class
            {
                return null;
            }

            int campusId = user.CurrentClass.Campus.Id;

            List<DAL.Event> events = eventService.GetMandatoryEventsForCampus(campusId, GlobalUtils.ConvertFromUnixTimestamp(start), GlobalUtils.ConvertFromUnixTimestamp(end), 0, maxEventsToRetrieve, out totalRecords);
            if (events != null)
            {
                foreach (DAL.Event e in events)
                {
                    eventList.Add(new CalendarEvent(e, "CampusEvent", "/FrontOffice/Calendar/CampusEvent/"));
                }
            }

            return Json(eventList, JsonRequestBehavior.AllowGet);
        }

        //
        // GET: /FrontOffice/CalendarApi/ClassEvents/

        [Authorize]
        public JsonResult ClassEvents(double start, double end)
        {
            IEventService eventService = new EventService();
            SecurityService securityService = new SecurityService();
            ArrayList eventList = new ArrayList();
            int totalRecords;

            int userId = securityService.getUserByUsername(User.Identity.Name).Id;

            List<DAL.Event> events = eventService.GetClassEventsForUser(userId, GlobalUtils.ConvertFromUnixTimestamp(start), GlobalUtils.ConvertFromUnixTimestamp(end), 0, maxEventsToRetrieve, out totalRecords);
            if (events != null)
            {
                foreach (DAL.Event e in events)
                {
                    eventList.Add(new CalendarEvent(e, "ClassEvent", "/FrontOffice/Calendar/ClassEvent/"));
                }
            } 
            return Json(eventList, JsonRequestBehavior.AllowGet);
        }

        [Authorize]
        public JsonResult MandatoryClassEvents(double start, double end)
        {
            IEventService eventService = new EventService();
            SecurityService securityService = new SecurityService();
            ArrayList eventList = new ArrayList();
            int totalRecords;

            int userId = securityService.getUserByUsername(User.Identity.Name).Id;

            List<DAL.Event> events = eventService.GetMandatoryClassEventsForUser(userId, GlobalUtils.ConvertFromUnixTimestamp(start), GlobalUtils.ConvertFromUnixTimestamp(end), 0, maxEventsToRetrieve, out totalRecords);
            if (events != null)
            {
                foreach (DAL.Event e in events)
                {
                    eventList.Add(new CalendarEvent(e, "ClassEvent", "/FrontOffice/Calendar/ClassEvent/"));
                }
            }
            return Json(eventList, JsonRequestBehavior.AllowGet);
        }
    }

    /// <summary>
    /// This represent an event object for FullCalendar
    /// </summary>
    public class CalendarEvent
    {
        public int id { get; set; }
        public string title { get; set; }
        public string start { get; set; }
        public string end { get; set; }
        public bool allDay { get; set; }
        public string className { get; set; }
        public string url { get; set; }

        /// <summary>
        /// Create a CalendarEvent from a DAL.Event
        /// </summary>
        /// <param name="e">DAL.Event</param>
        /// <param name="className">CSS class name</param>
        /// <param name="baseUrl">URL to find details about the event. Put the final slash s'il vous plait.</param>
        public CalendarEvent(DAL.Event e, string className, string baseUrl)
        {
            id = e.Id;
            title = e.Name;
            start = e.StartDate.ToString("s");
            end = e.EndDate.ToString("s");
            allDay = false;
            this.className = className;
            url = baseUrl + e.Id.ToString();
        }
    }
}
