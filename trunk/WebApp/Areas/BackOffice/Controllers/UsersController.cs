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
        //
        // GET: /BackOffice/Users/

        public ActionResult Index()
        {
            ISecurityService service = new SecurityService();

            int i;

            ViewData.Model = service.getAllUsers(0, 100, out i);

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
    }
}
