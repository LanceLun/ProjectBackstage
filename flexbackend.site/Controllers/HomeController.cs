using Flex.Products.dll.Interface;
using Flex.Products.dll.Models.Infra.EFRepository;
using Flex.Products.dll.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace flexbackend.site.Controllers
{
    public class HomeController : Controller
    {

		public ActionResult Index()
        {
			return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

    }
}