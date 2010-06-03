using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Event;
using WebApp.Extensions;
using System.Collections;

namespace WebApp.Areas.FrontOffice.Controllers
{
    public class CalendarApiController : Controller
    {
        //
        // GET: /FrontOffice/CalendarApi/

        public ActionResult Index()
        {
            return View();
        }


        [Authorize]
        public JsonResult WorldWideEvents(double start, double end)
        {
            IEventService service = new EventService();
            ArrayList eventList = new ArrayList();
            int totalRecords;

            List<DAL.WorldWideEvent> wwe = service.GetWorldWideEvents(GlobalUtils.ConvertFromUnixTimestamp(start), GlobalUtils.ConvertFromUnixTimestamp(end), 0, 100, out totalRecords);

            foreach (DAL.WorldWideEvent e in wwe)
            {
                eventList.Add(new CalendarEvent(e,"WorldWideEvent", ""));
            }

            return Json(eventList, JsonRequestBehavior.AllowGet);
        }

        [Authorize]
        public JsonResult UserEvents(double start, double end)
        {
            IEventService service = new EventService();
            ArrayList eventList = new ArrayList();
            int totalRecords;

            List<DAL.Event> events = service.GetEventsForUser(User.Identity.Name, GlobalUtils.ConvertFromUnixTimestamp(start), GlobalUtils.ConvertFromUnixTimestamp(end), 0, 100, out totalRecords);

            foreach (DAL.WorldWideEvent e in events)
            {
                eventList.Add(new CalendarEvent(e, "WorldWideEvent", ""));
            }

            return Json(eventList, JsonRequestBehavior.AllowGet);
        }

    }


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
        /// Crée un event compatible avec fullcalendar a partir d'un DAL.Event
        /// </summary>
        /// <param name="e"></param>
        /// <param name="className"></param>
        /// <param name="baseUrl">Il faut rajouter le slash final de baseUrl</param>
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
