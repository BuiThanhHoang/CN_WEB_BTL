using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_WEB.Models.Entities;
using BTL_WEB.Models.Functions;
using System.IO;
namespace BTL_WEB.Areas.admin.Controllers
{
    public class ProductController : Controller
    {
        // GET: admin/Product
        public ActionResult Index()
        {
            ViewBag.select = "product";
            return View();
        }

        [HttpGet]
        public ActionResult Add()
        {
            int? add = null;
            if (Request.QueryString["add"]!= null) 
              add = Int32.Parse(Request.QueryString["add"]);
            if (add != null) ViewBag.add = add;
            
            return View();
        }
        public static String GetTimestamp(DateTime value)
        {
            return value.ToString("yyyyMMddHHmmssffff");
        }

        [HttpPost]
        public ActionResult AddProduct()
        {
            int? res = null;
            tbl_sanpham data = new tbl_sanpham();
            try
            {
                data.ten = Request["tensp"];
                data.thenho = Request["thenhosp"];
                data.gia = Int32.Parse(Request["giasp"]);
                data.trongluong = Request["trongluongsp"];
                data.soluong = Int32.Parse(Request["soluongsp"]);

                data.ROM = Request["romsp"];
                data.RAM = Request["ramsp"];
                data.baohanh = Request["thoigianbaohanhsp"];
                data.camera_sau = Request["camerasausp"];
                data.camera_truoc = Request["cameratruocsp"];
                data.CPU = Request["cpusp"];
                data.manhinh = Request["manhinhsp"];
                data.pin = Int32.Parse(Request["pinsp"]);
                data.tinhtrang = 1;
                data.id_nsx = Int32.Parse(Request["nhasanxuatsp"]);
                data.bluetooth = Int32.Parse(Request["bluetoothsp"]);
                HttpPostedFileBase fileUpload = Request.Files["imgsp"];
                
                Func_SanPham tp = new Func_SanPham();
                res = tp.Insert(data);
                if (res != null)
                {
                    int id = (int)res;

                    if (fileUpload != null)
                    {
                        String timeStamp = GetTimestamp(DateTime.Now);
                        var fileName = timeStamp + Path.GetExtension(fileUpload.FileName);

                        
                        var path =   Path.Combine(Server.MapPath("~/Content/images"), fileName);
                        // file is uploaded
                        if (System.IO.File.Exists(path))
                        {
                            ViewBag.ThongBao = "Hình ảnh đã tồn tại";
                        }
                        else
                        {
                            Func_Anh installanh = new Func_Anh();
                            tbl_anh anh = new tbl_anh();
                            anh.duongdan = fileName;
                            anh.id_sp = id;

                            int? x = installanh.Insert(anh);
                            if (x == null)
                            {
                                res = -1;
                            }
                            else fileUpload.SaveAs(path);
                        }                       
                    }
                }
            }
            catch
            {
                res = -1;
            }           
            if (res != null) ViewBag.add = res;
            else ViewBag.add = -1;
            return RedirectToAction("Add", new {
                add = res
            });
        }

    }
}