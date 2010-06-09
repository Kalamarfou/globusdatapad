using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Areas.BackOffice.Controllers
{
    public class CampusesController : Controller
    {
        private Services.Campus.ICampusService service;
        private const int pageSize = 20;

        public CampusesController()
        {
            service = new Services.Campus.CampusService();
            
        }

        //
        // GET: /BackOffice/Campuses/
        public ActionResult Index(int? page)
        {

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

            ViewData.Model = service.GetAll(pageCount - 1, pageSize, out totalRecords);

            ViewData["numpages"] = Decimal.Ceiling(Decimal.Divide(totalRecords, pageSize));

            ViewData["curpage"] = pageCount;

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

            service.Update(campus, User.Identity.Name);
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
            service.Delete(id, User.Identity.Name);
            return RedirectToAction("Index");
        }
    }
}
