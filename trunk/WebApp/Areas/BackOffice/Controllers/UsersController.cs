using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.People;

namespace WebApp.Areas.BackOffice.Controllers
{
    [Authorize(Roles="Admin,CampusManager")]
    public class UsersController : Controller
    {
        private const int pageSize = 2;

        //
        // GET: /BackOffice/Users/

        public ActionResult Index(int? page)
        {
            ISecurityService service = new SecurityService();

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

            ViewData.Model = service.getAllUsers(pageCount -1, pageSize, out totalRecords);

            ViewData["numpages"] = Decimal.Ceiling(Decimal.Divide(totalRecords, pageSize));

            ViewData["curpage"] = pageCount;

            return View();
        }

        //
        // GET: /BackOffice/Users/NonAproved

        public ActionResult NonApproved(int? page)
        {
            ISecurityService service = new SecurityService();

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

            ViewData.Model = service.getAllNonApprovedUsers(pageCount - 1, pageSize, out totalRecords);

            ViewData["numpages"] = Decimal.Ceiling(Decimal.Divide(totalRecords, pageSize));

            ViewData["curpage"] = pageCount;

            return View();
        }
        

        //
        // GET: /BackOffice/Users/Details/5

        public ActionResult Details(int id)
        {
            ISecurityService service = new SecurityService();

            ViewData.Model = service.getUserById(id);

            return View();
        }

        //
        // GET: /BackOffice/Users/Edit/5
 
        public ActionResult Edit(int id)
        {
            ISecurityService service = new SecurityService();

            ViewData.Model = service.getUserById(id);

            return View();
        }

        //
        // POST: /BackOffice/Users/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, DAL.User newUser)
        {
            ISecurityService service = new SecurityService();

            DAL.User user = service.getUserById(id);

            if (user != null)
            {
                user.FirstName = newUser.FirstName;
                user.LastName = newUser.LastName;
                user.Title = newUser.Title;
                user.Email = newUser.Email;
                user.IsApproved = newUser.IsApproved;

                service.updateUser(user, User.Identity.Name);
            }
            else
            {
                throw new ApplicationException("User #" + id + " doesn't exist.");
            }

            return RedirectToAction("Index");
        }

        //
        // GET: /BackOffice/Users/Delete/5
 
        public ActionResult Delete(int id)
        {
            ISecurityService service = new SecurityService();

            ViewData.Model = service.getUserById(id);

            return View();
        }

        //
        // POST: /BackOffice/Users/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            ISecurityService service = new SecurityService();

            DAL.User user = service.getUserById(id);

            if (user != null)
            {
                service.deleteUser(user, User.Identity.Name);
            }
            else
            {
                throw new ApplicationException("User #" + id + " doesn't exist.");
            }

            return RedirectToAction("Index");
        }

        //
        // GET: /BackOffice/Users/Roles/5
 
        public ActionResult Roles(int id)
        {
            ISecurityService service = new SecurityService();

            return null;
        }

        //
        // POST: /BackOffice/Users/Roles/5

        [HttpPost]
        public ActionResult Roles(int id, FormCollection collection)
        {
            return null;
        }
    }
}
