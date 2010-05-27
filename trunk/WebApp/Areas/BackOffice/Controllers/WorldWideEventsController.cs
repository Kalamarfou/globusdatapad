using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Event;

namespace WebApp.Areas.BackOffice.Controllers
{
    [Authorize(Roles = "Admin")]
    public class WorldWideEventsController : Controller
    {
        //
        // GET: /BackOffice/WorldWideEvents/

        public ActionResult Index()
        {
            IEventService service = new EventService();

            ViewData.Model = service.GetWorldWideEvents(0, 100);

            return View();
        }

        //
        // GET: /BackOffice/WorldWideEvents/Details/5

        public ActionResult Details(int id)
        {
            IEventService service = new EventService();

            ViewData.Model = service.GetWorldWideEventById(id);

            return View();
        }

        //
        // GET: /BackOffice/WorldWideEvents/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /BackOffice/WorldWideEvents/Create

        [HttpPost]
        public ActionResult Create(DAL.WorldWideEvent wwe)
        {
            if (ModelState.IsValid)
            {
                IEventService service = new EventService();
                service.CreateWorldWideEvent(wwe, User.Identity.Name);

                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }

        //
        // GET: /BackOffice/WorldWideEvents/Edit/5

        public ActionResult Edit(int id)
        {
            IEventService service = new EventService();
            ViewData.Model = service.GetWorldWideEventById(id);

            return View();
        }

        //
        // POST: /BackOffice/WorldWideEvents/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, DAL.WorldWideEvent wwe)
        {
            if (ModelState.IsValid)
            {
                IEventService service = new EventService();
                service.UpdateWorldWideEvent(wwe, User.Identity.Name);

                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }

        //
        // GET: /BackOffice/WorldWideEvents/Delete/5

        public ActionResult Delete(int id)
        {
            IEventService service = new EventService();

            ViewData.Model = service.GetWorldWideEventById(id);

            return View();
        }

        //
        // POST: /BackOffice/WorldWideEvents/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                IEventService service = new EventService();

                throw new NotImplementedException("TODO");

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
