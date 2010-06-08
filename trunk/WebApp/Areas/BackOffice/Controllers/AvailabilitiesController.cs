using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.People;

namespace WebApp.Areas.BackOffice.Controllers
{
    public class AvailabilitiesController : Controller
    {
        private IPeopleService service;
        private const int pageSize = 2;

        public AvailabilitiesController()
        {
            service = new PeopleService();
        }

        

        //
        // GET: /BackOffice/Availabilities/

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

            ViewData.Model = service.getAvailabilitiesForUser(User.Identity.Name, pageCount - 1, pageSize, out totalRecords);

            ViewData["numpages"] = Decimal.Ceiling(Decimal.Divide(totalRecords, pageSize));

            ViewData["curpage"] = pageCount;

            return View();
        }

        //
        // GET: /BackOffice/Availabilities/Details/5

        public ActionResult Details(int id)
        {

            ViewData.Model = service.getAvailabilityById(id);

            return View();
        }

        //
        // GET: /BackOffice/Availabilities/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /BackOffice/Availabilities/Create

        [HttpPost]
        public ActionResult Create(DAL.Availability a)
        {
            if (!ModelState.IsValid)
            {
                return View(a);
            }
            service.createAvailability(a,User.Identity.Name);
            return RedirectToAction("Index");
        }
        
        //
        // GET: /BackOffice/Availabilities/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = service.getAvailabilityById(id);
            return View();
        }

        //
        // POST: /BackOffice/Availabilities/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, DAL.Availability a)
        {
            service.updateAvailability(a, User.Identity.Name);

            return RedirectToAction("Index");
        }

        //
        // GET: /BackOffice/Availabilities/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = service.getAvailabilityById(id);
            return View();
        }

        //
        // POST: /BackOffice/Availabilities/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, DAL.Availability a)
        {
            service.deleteAvailability(id, User.Identity.Name);
            return RedirectToAction("Index");
        }
    }
}
