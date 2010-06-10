using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Campus;

namespace WebApp.Areas.BackOffice.Controllers
{
    public class VenuesController : Controller
    {
        private const int pageSize = 20;
        //
        // GET: /BackOffice/Venues/5

        public ActionResult Index(int id, int? page)
        {
            ICampusService service = new CampusService();
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

            ViewData.Model = service.GetAllVenuesForCampus(id,pageCount - 1, pageSize, out totalRecords);

            ViewData["numpages"] = Decimal.Ceiling(Decimal.Divide(totalRecords, pageSize));

            ViewData["curpage"] = pageCount;

            DAL.Campus campus = service.GetById(id);

            ViewData["campusId"] = campus.Id;
            ViewData["campusName"] = campus.Name;

            return View();
        }

        //
        // GET: /BackOffice/Venues/Create

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">This is the CampusID !!!</param>
        /// <returns></returns>
        public ActionResult Create(int id)
        {
            return View();
        } 

        //
        // POST: /BackOffice/Venues/Create

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">This is the CampusID !!!</param>
        /// <param name="venue"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Create(int id, DAL.Venue venue)
        {
            ICampusService service = new CampusService();

            if (ModelState.IsValid)
            {
                service.CreateVenueForCampus(id, venue, User.Identity.Name);
                return RedirectToAction("Index", new { id = id });
            }
            else
            {
                return View(venue);
            }
        }
        
        //
        // GET: /BackOffice/Venues/Edit/5
 
        public ActionResult Edit(int id)
        {
            ICampusService service = new CampusService();

            ViewData.Model = service.GetVenueById(id);

            return View();
        }

        //
        // POST: /BackOffice/Venues/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, DAL.Venue venue)
        {
            if (ModelState.IsValid)
            {
                ICampusService service = new CampusService();

                DAL.Venue dbVenue = service.GetVenueById(id);

                dbVenue.Name = venue.Name;
                dbVenue.Common.ConcurrencyToken = venue.Common.ConcurrencyToken;

                service.UpdateVenue(dbVenue, User.Identity.Name);
                return RedirectToAction("Index", new { id = dbVenue.Campus.Id });
            }
            else
            {
                return View(venue);
            }
        }

        //
        // GET: /BackOffice/Venues/Delete/5
 
        public ActionResult Delete(int id)
        {
            ICampusService service = new CampusService();

            ViewData.Model = service.GetVenueById(id);

            return View();
        }

        //
        // POST: /BackOffice/Venues/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            ICampusService service = new CampusService();
            DAL.Venue v = service.GetVenueById(id);
            int campusId = v.Campus.Id;
            service.DeleteVenue(v, User.Identity.Name);

            return RedirectToAction("Index", new {id=campusId });
        }
    }
}