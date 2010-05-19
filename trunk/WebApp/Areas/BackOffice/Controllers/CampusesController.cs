using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Areas.BackOffice.Controllers
{
    public class CampusesController : Controller
    {
        private Services.Campus service;

        public CampusesController()
        {
            service = new Services.Campus();
            
        }

        //
        // GET: /BackOffice/Campuses/

        public ActionResult Index()
        {
            ViewData.Model = service.GetAll();
            return View();
        }

        //
        // GET: /BackOffice/Campuses/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = service.GetById(id);
            return View();
        }

        //
        // GET: /BackOffice/Campuses/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /BackOffice/Campuses/Create

        [HttpPost]
        public ActionResult Create(DAL.Campus campus)
        {
            
            campus.CreatedAt = DateTime.Now;
            campus.CreatedBy = "wam";
            campus.ModifiedAt = DateTime.Now;
            campus.ModifiedBy = "wam";
            campus.Address.CreatedAt = DateTime.Now;
            campus.Address.CreatedBy = "wam";
            campus.Address.ModifiedAt = DateTime.Now;
            campus.Address.ModifiedBy = "wam";
            
            if (!ModelState.IsValid)
            {
                return View(campus);
            }

            
            
            service.Create(campus, "wam");
            return RedirectToAction("Index");
        }
        
        //
        // GET: /BackOffice/Campuses/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = service.GetById(id);
            return View();
        }

        //
        // POST: /BackOffice/Campuses/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, DAL.Campus campus)
        {
            campus.CreatedAt = DateTime.Now;
            campus.CreatedBy = "wam";
            campus.ModifiedAt = DateTime.Now;
            campus.ModifiedBy = "wam";
            campus.Address.CreatedAt = DateTime.Now;
            campus.Address.CreatedBy = "wam";
            campus.Address.ModifiedAt = DateTime.Now;
            campus.Address.ModifiedBy = "wam";
            
            service.Update(id, campus);
            return RedirectToAction("Index");
        }

        //
        // GET: /BackOffice/Campuses/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = service.GetById(id);
            return View();
        }

        //
        // POST: /BackOffice/Campuses/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, DAL.Campus c)
        {
            service.Delete(id);
            return RedirectToAction("Index");
        }
    }
}
