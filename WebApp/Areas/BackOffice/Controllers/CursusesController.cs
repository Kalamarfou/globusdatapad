using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAL;

namespace WebApp.Areas.BackOffice.Controllers
{
    public class CursusesController : Controller
    {
        private Services.Cursus service;

        public CursusesController()
        {
            service = new Services.Cursus();
        }

        //
        // GET: /BackOffice/Cursuses/

        public ActionResult Index()
        {
            ViewData.Model = service.GetAll();
            return View();
        }

        //
        // GET: /BackOffice/Cursuses/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = service.GetById(id);
            return View();
        }

        //
        // GET: /BackOffice/Cursuses/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /BackOffice/Cursuses/Create

        [HttpPost]
        public ActionResult Create(Cursuses c)
        {
            if (!ModelState.IsValid)
            {
                return View(c);
            }
            service.Create(c);
            return RedirectToAction("Index");
        }
        
        //
        // GET: /BackOffice/Cursuses/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = service.GetById(id);
            return View();
        }

        //
        // POST: /BackOffice/Cursuses/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, Cursuses c)
        {
            service.Update(id, c);
            return RedirectToAction("Index");
        }

        //
        // GET: /BackOffice/Cursuses/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = service.GetById(id);
            return View();
        }

        //
        // POST: /BackOffice/Cursuses/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            service.Delete(id);
            return RedirectToAction("Index");
        }
    }
}
