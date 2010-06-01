using System.Web.Mvc;

namespace WebApp.Areas.FrontOffice
{
    public class FrontOfficeAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "FrontOffice";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "FrontOffice_default",
                "FrontOffice/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
