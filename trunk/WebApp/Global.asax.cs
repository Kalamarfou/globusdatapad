using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using WebApp.Extensions;
using Services.People;

namespace WebApp
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            #region "Roles verification and creation"

            ISecurityService securityService = new SecurityService();

            if (!securityService.roleExists("Admin"))
            {
                securityService.createRole("Admin", "Administrator", "System");
            }

            if (!securityService.roleExists("CampusManager"))
            {
                securityService.createRole("CampusManager", "Campus Manager", "System");
            }

            if (!securityService.roleExists("Student"))
            {
                securityService.createRole("Student", "Student", "System");
            }

            if (!securityService.roleExists("Stakeholder"))
            {
                securityService.createRole("Stakeholder", "Stakeholder", "System");
            }

            #endregion

            AreaRegistration.RegisterAllAreas();

            ViewEngines.Engines.Clear();
            ViewEngines.Engines.Add(new MobileEnabledViewEngine());     // in order to support mobile devices views

            RegisterRoutes(RouteTable.Routes);
        }
    }
}