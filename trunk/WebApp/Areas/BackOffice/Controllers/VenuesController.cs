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
        //
        // GET: /BackOffice/Venues/5

        public ActionResult Index(int id)
        {
            ICampusService service = new CampusService();
            int i = 0;      // TODO paginer
            ViewData.Model = service.GetAllVenuesForCampus(id, 0, 100, out i);

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

            service.DeleteVenue(service.GetVenueById(id), User.Identity.Name);

            return RedirectToAction("Index");
        }
    }
}
