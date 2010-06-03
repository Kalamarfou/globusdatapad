using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Event;

namespace WebApp.Areas.FrontOffice.Controllers
{
    [Authorize]
    public class CalendarController : Controller
    {
        //
        // GET: /FrontOffice/Calendar/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /FrontOffice/Calendar/WorldWideEvent/5

        public ActionResult WorldWideEvent(int id)
        {
            IEventService service = new EventService();

            DAL.WorldWideEvent e = service.GetWorldWideEventById(id);

            if (e == null)
            {
                throw new ApplicationException("WorldWide Event #" + id + " is not found.");
            }

            ViewData.Model = e;

            return View();
        }

        //
        // GET: /FrontOffice/Calendar/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /FrontOffice/Calendar/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /FrontOffice/Calendar/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /FrontOffice/Calendar/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /FrontOffice/Calendar/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /FrontOffice/Calendar/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /FrontOffice/Calendar/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
