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
        private Services.Cursus.ICursusService service;

        public CursusesController()
        {
            service = new Services.Cursus.CursusService();
        }

        //
        // GET: /BackOffice/Cursuses/

        public ActionResult Index()
        {
            //ViewData.Model = service.GetAll();    TODO
            return View();
        }

        //
        // GET: /BackOffice/Cursuses/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = service.GetCursusById(id);
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
        public ActionResult Create(Cursus c)
        {
            if (!ModelState.IsValid)
            {
                return View(c);
            }
            service.CreateCursus(c, User.Identity.Name);
            return RedirectToAction("Index");
        }
        
        //
        // GET: /BackOffice/Cursuses/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = service.GetCursusById(id);
            return View();
        }

        //
        // POST: /BackOffice/Cursuses/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, Cursus c)
        {
            service.UpdateCursus(c, User.Identity.Name);
            return RedirectToAction("Index");
        }

        //
        // GET: /BackOffice/Cursuses/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = service.GetCursusById(id);
            return View();
        }

        //
        // POST: /BackOffice/Cursuses/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            // TODO
            return RedirectToAction("Index");
        }
    }
}
