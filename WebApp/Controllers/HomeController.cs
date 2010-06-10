using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Event;
using Services.People;

namespace WebApp.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        [Authorize]
        public ActionResult Index()
        {
            
            IEventService service = new EventService();
            ISecurityService secService = new SecurityService();
            int i;

            ViewData["WorldWideEvents"] = service.GetWorldWideEvents(DateTime.Today, DateTime.Today.AddDays(10), 0, 10, out i);
            ViewData["CampusEvents"] = service.GetCampusEventsForUser(secService.getUserByUsername(User.Identity.Name).Id,DateTime.Today, DateTime.Today.AddDays(10), 0, 10, out i);
            ViewData["ClassEvents"] = service.GetClassEventsForUser(secService.getUserByUsername(User.Identity.Name).Id, DateTime.Today, DateTime.Today.AddDays(10), 0, 10, out i);
            ViewData["UserEvents"] = service.GetEventsForUser(User.Identity.Name,DateTime.Today, DateTime.Today.AddDays(10), 0, 10, out i);

            return View();
        }

        [Authorize]
        public ActionResult About()
        {
            return View();
        }
    }
}
