﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.Campus;

namespace WebApp.Areas.BackOffice.Controllers
{
    public class ClassesController : Controller
    {
        //
        // GET: /BackOffice/Classes/5

        public ActionResult Index(int id)           // classes for campus
        {
            ICampusService service = new CampusService();

            int count;

            ViewData["campusId"] = id;

            ViewData.Model = service.GetClassesForCampus(id, 0, 100, out count);        // TODO pagin

            return View();
        }

        //
        // GET: /BackOffice/Classes/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /BackOffice/Classes/Create

        [HttpPost]
        public ActionResult Create(int id, DAL.Class c)
        {
            if (ModelState.IsValid)
            {
                ICampusService service = new CampusService();

                service.CreateClassForCampus(id, c, User.Identity.Name);

                return RedirectToAction("Index", new { id = id });
            }
            else
            {
                return View(c);
            }
        }
        
        //
        // GET: /BackOffice/Classes/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /BackOffice/Classes/Edit/5

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
        // GET: /BackOffice/Classes/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /BackOffice/Classes/Delete/5

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