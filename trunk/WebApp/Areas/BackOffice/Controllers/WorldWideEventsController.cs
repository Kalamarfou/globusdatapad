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

        private const int pageSize = 20;

        //
        // GET: /BackOffice/WorldWideEvents/

        public ActionResult Index(int? page)
        {
            IEventService service = new EventService();
            int totalRecords;       // total records
            int pageCount;

            if (!page.HasValue)
            {
                pageCount = 1;
            }
            else
            {
                pageCount = page.Value;
            }

            ViewData.Model = service.GetWorldWideEvents(DateTime.Today, DateTime.Today.AddYears(1), pageCount - 1, pageSize, out totalRecords);

            ViewData["numpages"] = Decimal.Ceiling(Decimal.Divide(totalRecords, pageSize));

            ViewData["curpage"] = pageCount;

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

                DAL.WorldWideEvent dbWwe = service.GetWorldWideEventById(id);

                dbWwe.StartDate = wwe.StartDate;
                dbWwe.EndDate = wwe.EndDate;
                dbWwe.Name = wwe.Name;
                dbWwe.Description = wwe.Description;
                dbWwe.IsMandatory = wwe.IsMandatory;
                dbWwe.Common.ConcurrencyToken = wwe.Common.ConcurrencyToken;

                service.UpdateWorldWideEvent(dbWwe, User.Identity.Name);

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
        public ActionResult Delete(int id, DAL.WorldWideEvent wwe)
        {
            IEventService service = new EventService();
            service.Delete(id, User.Identity.Name);

            return RedirectToAction("Index");

        }
    }
}
