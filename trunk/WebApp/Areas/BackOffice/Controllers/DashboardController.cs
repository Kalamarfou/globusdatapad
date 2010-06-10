using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Areas.BackOffice.Controllers
{
    public class DashboardController : Controller
    {
        //
        // GET: /BackOffice/Home/

        public ActionResult Index()
        {
            return View();
        }

    }
}
