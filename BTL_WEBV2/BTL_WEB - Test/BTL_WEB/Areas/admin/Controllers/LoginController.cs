using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_WEB.Areas.admin.Models;
using BTL_WEB.Models.Functions;
using BTL_WEB.Models.Entities;
using BTL_WEB.Code;
namespace BTL_WEB.Areas.admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: admin/Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Index(string Username,string Password)
        {
            //if (ModelState.IsValid)
            //{ 
                var dao = new UserDao();
                var result = dao.Login(Username, Password);
                var quyen = dao.getIdQuyen(Username, Password);
                if (result == true && quyen == 1)
                {
                    var user = dao.GetById(Username);
                    var userSession = new UserLogin();
                    userSession.tentaikhoan = user.tentaikhoan;
                    userSession.id = user.id;
                    Session["username"] = userSession.tentaikhoan;
                    //Session.Add(CodeConstants.tentaikhoan_session, userSession);
                    return Redirect("~/admin/Home/Index");
                }
                else if (result == true && quyen == 3)
                {
                    var user = dao.GetById(Username);
                    var userSession = new UserLogin();
                    userSession.tentaikhoan = user.tentaikhoan;
                    userSession.id = user.id;
                    userSession.id_ttcn = user.id_ttcn;
                    Session["userLogin"] = userSession.tentaikhoan;
                    Session["IDTinhTrang"] = userSession.id_ttcn;
                    //Session.Add(CodeConstants.tentaikhoan_session, userSession);
                    return Redirect("~/Home/Index");
                }
                else
                {
                ModelState.AddModelError("", "Đăng nhập không thành công.");
                    //ViewData["Message"] = "Đăng nhập không đúng.";
                    return View();
                }
            //}
        }

        public ActionResult LogOut()
        {
            Session["username"] = null;
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult SignUp(DangKi model)
        {
            tbl_thongtincanhan ttcn = new tbl_thongtincanhan();
            tbl_taikhoan tk = new tbl_taikhoan();

            Func_ThongTinCaNhan f_ttcn = new Func_ThongTinCaNhan();
            Func_TaiKhoan f_tk = new Func_TaiKhoan();

            ttcn.ten = model.ten;
            ttcn.sdt = model.sdt;
            ttcn.email = model.email;
            ttcn.ngaysinh = model.ngaysinh;
            ttcn.gioitinh = model.gioitinh;
            if (ttcn.gioitinh == "Nam")
            {
                ttcn.anhdaidien = "anhNam.png";
            }
            else ttcn.anhdaidien = "anhNu.png";
            ttcn.diachi = model.diachi;
            f_ttcn.Insert(ttcn);


            tk.id_q = 3;
            tk.tentaikhoan = model.tentaikhoan;
            tk.matkhau = model.matkhau;
            tk.id_ttcn = ttcn.id;
            tk.trangthai = true;
            f_tk.Insert(tk);


            return Redirect("/Home/Index");
        }
    }
}