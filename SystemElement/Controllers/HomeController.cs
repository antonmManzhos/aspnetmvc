using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SystemElement.Models;

namespace SystemElement.Controllers
{
    public class HomeController : Controller
    {
        ElementContext db = new ElementContext();

        public ActionResult Index(string permalink)
        {
            Element parentElement = null;
            if (permalink != null)
            {
                parentElement = db.Elements.Where(u => u.Url == permalink).FirstOrDefault();
            } else
            {
                parentElement = db.Elements.Where(u => u.ParentId == null).FirstOrDefault();
            }
            if(parentElement == null)
            {
                if (permalink.IndexOf('/') != -1)
                {
                    string[] arrayParams = permalink.Split('/');
                    string parEln = arrayParams[arrayParams.Length-1];
                    parentElement = db.Elements.Where(u => u.Url == parEln).FirstOrDefault();
                }
            }
            ViewBag.parentElement = parentElement;
            ViewBag.elements = db.Elements.Where(m => m.ParentId == parentElement.Id);
            if(parentElement == null)
            {
                return View("Error");
            }
            return View();
        }
    }
}