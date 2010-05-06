using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Extensions
{
    /// <summary>
    /// Will try to return a view specific to mobile if it is a mobile device
    /// </summary>
    /// <remarks>http://www.devproconnections.com/article/aspnet2/How-to-Build-Mobile-Websites-with-ASP-NET-MVC-2-and-Visual-Studio-2010.aspx</remarks>
    public class MobileEnabledViewEngine : WebFormViewEngine
    {
        public override ViewEngineResult FindView(ControllerContext controllerContext, string viewName, string masterName, bool useCache)
        {
            ViewEngineResult result = null;

            var browser = controllerContext.HttpContext.Request.Browser;

            if (browser.IsMobileDevice)
            {
                if (browser.MobileDeviceModel.Contains("iPhone"))
                    result = base.FindView(controllerContext, "iPhone/" + viewName, masterName, useCache);

                // Add any other specific devices you'd like to support here...

                if (result == null || result.View == null)
                    result = base.FindView(controllerContext, "Mobile/" + viewName, masterName, useCache);
            }

            return result ?? base.FindView(controllerContext, viewName, masterName, useCache);
        }
    }
}