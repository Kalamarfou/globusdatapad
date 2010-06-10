using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Cursus;

namespace WebApp.Areas.BackOffice.Controllers
{
    public class StudyPeriodsController : Controller
    {
        //
        // GET: /BackOffice/StudyPeriods/

        public ActionResult Index(int id)
        {
            ICursusService service = new CursusService();

            DAL.Cursus cursus = service.GetCursusById(id);

            ViewData["cursusId"] = id;
            ViewData["cursusName"] = cursus.Name;
            ViewData.Model = cursus.StudyPeriods.OrderBy(s => s.StartDate).ToList<DAL.StudyPeriod>();

            return View();
        }

        //
        // GET: /BackOffice/StudyPeriods/Create

        public ActionResult Create(int id)
        {
            return View();
        }

        //
        // POST: /BackOffice/StudyPeriods/Create

        [HttpPost]
        public ActionResult Create(int id, DAL.StudyPeriod sp)
        {
            if (ModelState.IsValid)
            {
                ICursusService service = new CursusService();

                service.CreateStudyPeriodForCursus(id, sp, User.Identity.Name);

                return RedirectToAction("Index", new { id = id });
            }
            else
            {
                return View(sp);
            }
        }

        //
        // GET: /BackOffice/StudyPeriods/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /BackOffice/StudyPeriods/Edit/5

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
        // GET: /BackOffice/StudyPeriods/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /BackOffice/StudyPeriods/Delete/5

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
