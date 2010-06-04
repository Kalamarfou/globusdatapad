using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Event;

namespace WebApp.Areas.FrontOffice.Controllers
{
    public class MyEventsController : Controller
    {

        //
        // GET: /FrontOffice/MyEvents/Details/5

        public ActionResult Details(int id)
        {
            IEventService service = new EventService();

            ViewData.Model = service.GetById(id);
            return View();
        }

        //
        // GET: /FrontOffice/MyEvents/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /FrontOffice/MyEvents/Create

        [HttpPost]
        public ActionResult Create(DAL.Event e)
        {
            try
            {
                IEventService service = new EventService();
                service.CreateUserEvent(e, User.Identity.Name);
                return RedirectToAction("Index", "Calendar");
            }
            catch( Exception ex)
            {
                return View();
            }
        }
        
        //
        // GET: /FrontOffice/MyEvents/Edit/5
 
        public ActionResult Edit(int id)
        {
            IEventService service = new EventService();
            DAL.Event e = service.GetById(id);
            if (e.User != null)
            {
                if (e.User.Username == User.Identity.Name)
                {
                    ViewData.Model = service.GetById(id);
                    return View();
                }
            }
            return RedirectToAction("Error");
        }

        //
        // POST: /FrontOffice/MyEvents/Edit/5

        [HttpPost]
        public ActionResult Edit(DAL.Event e)
        {
            try
            {
                IEventService service = new EventService();
                service.UpdateUserEvent(e, User.Identity.Name);

                return RedirectToAction("Index", "Calendar");
            }
            catch(Exception ex)
            {
                return View();
            }
        }

        //
        // GET: /FrontOffice/MyEvents/Delete/5
 
        public ActionResult Delete(int id)
        {

            IEventService service = new EventService();
            ViewData.Model = service.GetById(id);

            return View();
        }

        //
        // POST: /FrontOffice/MyEvents/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                IEventService service = new EventService();
                service.Delete(id, User.Identity.Name);

                return RedirectToAction("Index", "Calendar");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /FrontOffice/MyEvents/Error
        public ActionResult Error()
        {
            return View();
        }
    }
}
