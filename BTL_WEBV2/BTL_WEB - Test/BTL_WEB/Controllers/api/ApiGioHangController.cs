using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BTL_WEB.Models.Entities;
using BTL_WEB.Models.Functions;
using BTL_WEB.Models;
using Newtonsoft.Json.Linq;

namespace BTL_WEB.Controllers
{
    [JsonObject(IsReference = true)]
    public class ApiGioHangController: ApiController
    {
        // GET api/<controller>
        [HttpPost]
        [Route("api/apigiohang/selectsanpham/")]
        public string selectsanpham([FromBody] string data)
        {
            dynamic stuff = JsonConvert.DeserializeObject(data);
            var idsp = (int)stuff.idsp;
            var iduser = (int)stuff.iduser;
            var soluong = (int)stuff.soluong;
            Func_ChiTietDonHang donhang = new Func_ChiTietDonHang();
            int? res = donhang.AddSanPhamGioHang(iduser, idsp, soluong);
            if (res != null)
            {
                return "{\"status\":1, \"donhang\":" + res + "}";
            }
            else return "{\"status\":-1 }";
        }
        [HttpGet]
        [Route("api/apigiohang/deletesanpham/{id}")]
        public string deletesanpham(int id)
        {
            
            Func_ChiTietDonHang donhang = new Func_ChiTietDonHang();
            int? res = donhang.Delete(id);
            if (res != null)
            {
                return "{\"status\":1, \"donhang\":" + res + "}";
            }
            else return "{\"status\":-1 }";
        }

        [HttpPost]
        [Route("api/apigiohang/updatesanpham/")]
        public string updatesanpham([FromBody] string data)
        {
            dynamic stuff = JsonConvert.DeserializeObject(data);
            var idsp = (int)stuff.idsp;
            var iduser = (int)stuff.iduser;
            var soluong = (int)stuff.soluong;
            Func_ChiTietDonHang donhang = new Func_ChiTietDonHang();
            int? res = donhang.updatesanpham(iduser, idsp, soluong);
            if (res != null)
            {
                return "{\"status\":1, \"donhang\":" + res + "}";
            }
            else return "{\"status\":-1 }";
        }
    }
}