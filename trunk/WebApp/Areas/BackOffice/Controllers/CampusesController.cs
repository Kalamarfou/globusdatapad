using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.People;

namespace WebApp.Areas.BackOffice.Controllers
{
    [Authorize(Roles="Admin")]
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
            if (ModelState.IsValid)
            {
                service.Update(campus, User.Identity.Name);

                DAL.Campus dbCampus = service.GetById(id);

                dbCampus.Name = campus.Name;
                dbCampus.Address.City = campus.Address.City;
                dbCampus.Address.Country = campus.Address.Country;
                dbCampus.Address.PostalCode = campus.Address.PostalCode;
                dbCampus.Address.Street = campus.Address.Street;
                dbCampus.Address.Common.ConcurrencyToken = campus.Address.Common.ConcurrencyToken ;
                dbCampus.Common.ConcurrencyToken = campus.Common.ConcurrencyToken;

                service.Update(dbCampus, User.Identity.Name);

                return RedirectToAction("Index");
            }
            else
            {
                return View(campus);
            }
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

        public ActionResult Managers(int id)
        {
            ISecurityService rolesService = new SecurityService();
            
            List<DAL.User> campusManagers = service.GetManagersForCampus(id);           // managers of this campus
            List<DAL.User> managers = rolesService.getDalUsersInRole("CampusManager");  // all campus managers

            List<DAL.User> managersNotInCampus = new List<DAL.User>();                  // managers not in this campus

            foreach (DAL.User manager in managers)
            {
                var result = (from u in campusManagers                  // if manager not manager of THIS campus
                              where u.Id == manager.Id                  // TODO cleanup and learn lambda expressions
                              select u).FirstOrDefault<DAL.User>();
                if (result == null)
                {
                    managersNotInCampus.Add(manager);
                }
            }

            var selectItems = from m in managersNotInCampus
                              select new SelectListItem
                              {
                                  Text = m.FirstName + " " + m.LastName,
                                  Value = m.Id.ToString()
                              };

            ViewData["campusManagers"] = selectItems;

            ViewData.Model = campusManagers;

            return View();
        }

        [HttpPost]
        public ActionResult Managers(int id, FormCollection form)
        {
            int campusManagerId;

            campusManagerId = int.Parse(Request.Form["AddManager"]);

            service.AddManagerToCampus(campusManagerId, id);

            return RedirectToAction("Managers");
        }

    }
}
