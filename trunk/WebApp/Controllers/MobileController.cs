using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    [HandleError]
    public class MobileController : Controller
    {
        //
        // GET: /Mobile/
        [Authorize]
        public ActionResult Index()
        {
            Services.Event.IEventService service = new Services.Event.EventService();

            int i;

            ViewData["WorldWideEvents"] = service.GetWorldWideEvents(DateTime.Today, DateTime.Today.AddDays(10), 0, 10, out i);
            return View();
        }

        [Authorize]
        public ActionResult MainPage()
        {
            ViewData["Title"] = "MainPage";
            return View();
        }

        [Authorize]
        public ActionResult LogOn()
        {
            ViewData["Title"] = "LogOn";
            return View();
        }
    }
}
