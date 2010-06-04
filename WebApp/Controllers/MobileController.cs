using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Controllers
{
    [HandleError]
    public class MobileController : Controller
    {
        //
        // GET: /Mobile/
        [Authorize]
        public ActionResult Index()
        {
            ViewData["Title"] = "Index";
            return View();
        }

        [Authorize]
        public ActionResult LogOut()
        {
            ViewData["Title"] = "LogOut";
            return View();
        }

    }
}
