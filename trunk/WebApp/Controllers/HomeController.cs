using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Event;

namespace WebApp.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        [Authorize]
        public ActionResult Index()
        {
            
            IEventService service = new EventService();

            int i;

            ViewData["WorldWideEvents"] = service.GetWorldWideEvents(DateTime.Today, DateTime.Today.AddDays(10), 0, 10, out i);

            return View();
        }

        [Authorize]
        public ActionResult About()
        {
            return View();
        }
    }
}
