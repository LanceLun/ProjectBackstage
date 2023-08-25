using flexbackend.site.App_Start;
using System.Web;
using System.Web.Mvc;

namespace flexbackend.site
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            filters.Add(new AuthorizeAttribute());
        }
    }
}
