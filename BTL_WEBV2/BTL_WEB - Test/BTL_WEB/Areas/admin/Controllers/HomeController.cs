using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_WEB.Models.Entities;
using BTL_WEB.Models.Functions;
namespace BTL_WEB.Areas.admin.Controllers
{
    
    public class HomeController: Controller
    {
        private MyDBContext context = new MyDBContext();
        private Func_SanPham sp = new Func_SanPham();
        // GET: Admin/Home
        public ActionResult Index()
        {
            if(Session["username"] == null)
            {
                return RedirectToAction("Index","Login");
            }
            else
            {
                var list = new Func_SanPham().DS_SanPham.ToList();
                ViewBag.SP = list;
                ViewBag.tittle = "Admin shop mua ban";
                ViewBag.select = "dashbord";
                return View();
            }   
        }

    }
}