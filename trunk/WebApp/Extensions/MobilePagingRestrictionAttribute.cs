using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApp.Extensions
{
    /// <summary>
    /// See http://www.devproconnections.com/article/aspnet2/How-to-Build-Mobile-Websites-with-ASP-NET-MVC-2-and-Visual-Studio-2010.aspx
    /// </summary>
    public class MobilePagingRestrictionAttribute : ActionFilterAttribute
    {
        public const int DefaultMaxPageSize = 5;
        public const string PageSizeParameterName = "pageSize";

        public int MaxPageSize { get; set; }

        public MobilePagingRestrictionAttribute()
        {
            MaxPageSize = DefaultMaxPageSize;
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // Only proceed if this is a mobile device
            if (filterContext.HttpContext.Request.Browser.IsMobileDevice == false)
                return;

            var pageSize = (int?)filterContext.ActionParameters[PageSizeParameterName];

            if (pageSize.GetValueOrDefault(0) > MaxPageSize)
            {
                filterContext.ActionParameters[PageSizeParameterName] = MaxPageSize;
            }
        }
    }
}