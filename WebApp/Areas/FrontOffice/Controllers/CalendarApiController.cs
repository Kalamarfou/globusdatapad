using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Event;
using WebApp.Extensions;

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
        public JsonResult GetWorldWideEvents(double start, double end)
        {
            IEventService service = new EventService();

            int i;

            List<DAL.WorldWideEvent> wwe = service.GetWorldWideEvents(GlobalUtils.ConvertFromUnixTimestamp(start), GlobalUtils.ConvertFromUnixTimestamp(end), 0, 100, out i);

            var eventList = from e in wwe
                            select new
                            {
                                id = e.Id,
                                title = e.Name,
                                start = e.StartDate.ToString("s"),
                                end = e.EndDate.ToString("s"),
                                allDay = false,
                                className = "worldWideEvent",
                                url = "/FrontOffice/Calendar/Details/" + e.Id.ToString()
                            };

            var rows = eventList.ToArray();

            return Json(rows, JsonRequestBehavior.AllowGet);
        }

    }
}
