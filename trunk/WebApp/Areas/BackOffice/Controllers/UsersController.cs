using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Services.People;
using System.Web.Security;

namespace WebApp.Areas.BackOffice.Controllers
{
    [Authorize(Roles = "Admin,CampusManager")]
    public class UsersController : Controller
    {
        private const int pageSize = 20;

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

            ViewData.Model = service.getAllUsers(pageCount - 1, pageSize, out totalRecords);

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

            return RedirectToAction("UserDeleted");
        }

        //
        // GET: /BackOffice/Users/Roles/5

        public ActionResult UserDeleted()
        {
            return View();
        }

        public ActionResult Roles(int id)
        {
            ISecurityService service = new SecurityService();
            DAL.User user = service.getUserById(id);
            string[] roles = service.getUserRoles(user.Username);

            foreach (string role in roles)              // TODO clean that ugly code...
            {
                if (role == "Admin")
                {
                    ViewData["isAdmin"] = true;
                }
                else if (role == "CampusManager")
                {
                    ViewData["isCampusManager"] = true;
                }
                else if (role == "Stakeholder")
                {
                    ViewData["isStakeholder"] = true;
                }
                else if (role == "Student")
                {
                    ViewData["isStudent"] = true;
                }
            }

            if (ViewData["isAdmin"] == null)
            {
                ViewData["isAdmin"] = false;
            }
            if (ViewData["isCampusManager"] == null)
            {
                ViewData["isCampusManager"] = false;
            }
            if (ViewData["isStakeholder"] == null)
            {
                ViewData["isStakeholder"] = false;
            }
            if (ViewData["isStudent"] == null)
            {
                ViewData["isStudent"] = false;
            }

            return View();
        }

        //
        // POST: /BackOffice/Users/Roles/5

        [HttpPost]
        public ActionResult Roles(int id, FormCollection collection)
        {
            ISecurityService service = new SecurityService();
            DAL.User user = service.getUserById(id);

            try
            {
                if (Boolean.Parse(Request.Form.GetValues("Admin")[0]))
                {
                    System.Web.Security.Roles.AddUserToRole(user.Username, "Admin");
                }
                else
                {
                    System.Web.Security.Roles.RemoveUserFromRole(user.Username, "Admin");
                }
            }
            catch (Exception) { }

            try
            {
                if (Boolean.Parse(Request.Form.GetValues("Student")[0]))
                {
                    System.Web.Security.Roles.AddUserToRole(user.Username, "Student");
                }
                else
                {
                    System.Web.Security.Roles.RemoveUserFromRole(user.Username, "Student");
                }
            }
            catch (Exception) { }

            try
            {
                if (Boolean.Parse(Request.Form.GetValues("Stakeholder")[0]))
                {
                    System.Web.Security.Roles.AddUserToRole(user.Username, "Stakeholder");
                }
                else
                {
                    System.Web.Security.Roles.RemoveUserFromRole(user.Username, "Stakeholder");
                }
            }
            catch (Exception) { }

            try
            {
                if (Boolean.Parse(Request.Form.GetValues("CampusManager")[0]))
                {
                    System.Web.Security.Roles.AddUserToRole(user.Username, "CampusManager");
                }
                else
                {
                    System.Web.Security.Roles.RemoveUserFromRole(user.Username, "CampusManager");
                }
            }
            catch (Exception) { }

            return RedirectToAction("Index");
        }
    }
}
