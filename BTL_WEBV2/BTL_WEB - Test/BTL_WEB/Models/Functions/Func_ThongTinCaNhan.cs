using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_WEB.Models.Entities;
using System.Data.SqlClient;

namespace BTL_WEB.Models.Functions
{
    public class Func_ThongTinCaNhan
    {
        private MyDBContext context;
        public Func_ThongTinCaNhan()
        {
            context = new MyDBContext();
        }
        public IQueryable<tbl_thongtincanhan> DS_ThongTinCaNhan
        {
            get { return context.tbl_thongtincanhan; }
        }

        // Trả về 1 đối tượng khi biết khóa
        public tbl_thongtincanhan FindEntity(int id)
        {
            tbl_thongtincanhan dbEntry = context.tbl_thongtincanhan.Find(id);
            return dbEntry;
        }

        // Thêm 1 đối tượng
        public int? Insert(tbl_thongtincanhan model)
        {
            tbl_thongtincanhan dbEntry = context.tbl_thongtincanhan.Find(model.id);
            if (dbEntry != null)
            {
                return null;
            }

            context.tbl_thongtincanhan.Add(model);
            context.SaveChanges();
            return model.id;
        }

        // Sửa dữ liệu
        public int? Update(tbl_thongtincanhan model)
        {
            tbl_thongtincanhan dbEntry = context.tbl_thongtincanhan.Find(model.id);
            if (dbEntry == null)
            {
                return null;
            }

            dbEntry.ten = model.ten;
            dbEntry.ngaysinh = model.ngaysinh;
            dbEntry.sdt = model.sdt;
            dbEntry.gioitinh = model.gioitinh;
            dbEntry.diachi = model.diachi;
            dbEntry.anhdaidien = model.anhdaidien;
            dbEntry.email = model.email;

            context.SaveChanges();

            return model.id;
        }

        // Xóa theo key
        public int? Delete(int id)
        {
            tbl_thongtincanhan dbEntry = context.tbl_thongtincanhan.Find(id);
            if (dbEntry == null)
            {
                return null;
            }

            context.tbl_thongtincanhan.Remove(dbEntry);
            context.SaveChanges();
            return id;
        }
    }
}