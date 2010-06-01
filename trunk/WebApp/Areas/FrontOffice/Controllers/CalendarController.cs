using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Areas.FrontOffice.Controllers
{
    public class CalendarController : Controller
    {
        //
        // GET: /FrontOffice/Calendar/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Today()
        {
            return View();
        }

        public ActionResult Month()
        {
            return View();
        }

        public ActionResult Week()
        {
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
