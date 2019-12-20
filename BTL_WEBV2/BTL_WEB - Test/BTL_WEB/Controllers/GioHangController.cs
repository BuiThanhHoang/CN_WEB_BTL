using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_WEB.Models.Functions;
using BTL_WEB.Models.Entities;
using BTL_WEB.Code;

namespace BTL_WEB.Controllers
{
    
    public class GioHangController : Controller
    {
        private MyDBContext db = new MyDBContext();
        // GET: GioHang
        public ActionResult Index()
        {
            if (Session["userLogin"] == null)
            {
                return Redirect("~/admin/Login/Index");
            }
            Func_TaiKhoan  getid = new Func_TaiKhoan();
            //UserLogin user = (UserLogin)Session["userLogin"];
            tbl_taikhoan tk = getid.getTaiKhoan((string)Session["userLogin"]);
            ViewBag.iduser = tk.id;
            return View();
        }

        public ActionResult NecessaryInfomation()
        {
           
            if(Session["userLogin"] == null)
            {
                return Redirect("~/admin/Login/Index");
            }
            else
            {

                var xuly = new Func_TaiKhoan();
                
                ViewBag.user = xuly.getThongTin((int)Session["IDTinhTrang"]);
                tbl_taikhoan tk = xuly.getTaiKhoan((string)Session["userLogin"]);
                ViewBag.idBook = tk.id;
                
                return View();
            }
        }

        [HttpPost]
        public ActionResult DonHang(string giatien, string sdt, string ngaymua, string diachigiaohang)
        {
            
            var xuly = new Func_TaiKhoan();
            tbl_taikhoan tk = xuly.getTaiKhoan((string)Session["userLogin"]);
            var model = new tbl_dondathang();
            
            model.ngaylap = Convert.ToDateTime(ngaymua);
            model.tonggia = Convert.ToInt32(giatien);
            model.diachi = diachigiaohang;
            model.sdt = sdt;
            db.tbl_dondathang.Add(model);
            db.SaveChanges();

            List<tbl_chitietdonhang> a = new Func_ChiTietDonHang().getSanPhamGioHang(tk.id);
            foreach (tbl_chitietdonhang x in a)
            {
                x.id_tinhtrang = 2;
                var update = new Func_ChiTietDonHang().Update(x);
            }
            return Redirect("/GioHang/Index");
        }
    }
}