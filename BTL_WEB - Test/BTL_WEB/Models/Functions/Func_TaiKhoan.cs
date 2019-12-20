using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_WEB.Models.Entities;
using System.Data.SqlClient;
using Newtonsoft.Json;
using BTL_WEB.Models;

namespace BTL_WEB.Models.Functions
{
    public class Func_TaiKhoan
    {
        private MyDBContext context;
        public Func_TaiKhoan()
        {
            context = new MyDBContext();
        }
        public IQueryable<tbl_taikhoan> DS_TaiKhoan
        {
            get { return context.tbl_taikhoan; }
        }

        // Trả về 1 đối tượng khi biết khóa
        public tbl_taikhoan FindEntity(int id)
        {
            tbl_taikhoan dbEntry = context.tbl_taikhoan.Find(id);
            return dbEntry;
        }

        // Thêm 1 đối tượng
        public int? Insert(tbl_taikhoan model)
        {
            tbl_taikhoan dbEntry = context.tbl_taikhoan.Find(model.id);
            if (dbEntry != null)
            {
                return null;
            }

            context.tbl_taikhoan.Add(model);
            context.SaveChanges();
            return model.id;
        }

        // Sửa dữ liệu
        public int? Update(tbl_taikhoan model)
        {
            tbl_taikhoan dbEntry = context.tbl_taikhoan.Find(model.id);
            if (dbEntry == null)
            {
                return null;
            }

            dbEntry.id_q = model.id_q;
            dbEntry.id_ttcn = model.id_ttcn;
            dbEntry.matkhau = model.matkhau;
            dbEntry.tentaikhoan = model.tentaikhoan;
            dbEntry.trangthai = model.trangthai;
            
            context.SaveChanges();

            return model.id;
        }

        // Xóa theo key
        public int? Delete(int id)
        {
            tbl_taikhoan dbEntry = context.tbl_taikhoan.Find(id);
            if (dbEntry == null)
            {
                return null;
            }

            context.tbl_taikhoan.Remove(dbEntry);
            context.SaveChanges();
            return id; 
        }

        public tbl_taikhoan getTaiKhoan(string name)
        {
            List<tbl_taikhoan> res = context.tbl_taikhoan.Where(x => x.tentaikhoan == name).ToList();
            if (res.Count >= 1)
                return res[0];
            else return null;
        }

        public tbl_thongtincanhan getThongTin(int IDTinhTrang)
        {
            return context.tbl_thongtincanhan.SingleOrDefault(x => x.id == IDTinhTrang);       
        }

        public int? UpdateThongTinCaNhan(tbl_thongtincanhan model)
        {
            tbl_thongtincanhan dbEntry = context.tbl_thongtincanhan.Find(model.id);
            if(dbEntry == null)
            {
                return null;
            }

            dbEntry.email = model.email;
            dbEntry.sdt = model.sdt;
            dbEntry.ten = model.ten;
            dbEntry.ngaysinh = model.ngaysinh;
            dbEntry.diachi = model.diachi;
            //dbEntry.gioitinh = model.gioitinh;
            context.SaveChanges();
            return model.id;
        }

    }
}