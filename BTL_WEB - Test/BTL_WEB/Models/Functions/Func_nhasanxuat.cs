using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_WEB.Models.Entities;
using System.Data.SqlClient;

namespace BTL_WEB.Models.Functions
{
    public class Func_nhasanxuat
    {
        private MyDBContext context;
        public Func_nhasanxuat()
        {
            context = new MyDBContext();
        }

        // Trả về tất cả các bản ghi
        // Trả về danh mục
        public IQueryable<tbl_nhasanxuat> DS_NhaSanXuat
        {
            get { return context.tbl_nhasanxuat; }
        }

        // Trả về 1 đối tượng khi biết khóa
        public tbl_nhasanxuat FindEntity(int MaSP)
        {
            tbl_nhasanxuat dbEntry = context.tbl_nhasanxuat.Find(MaSP);
            return dbEntry;
        }

        // Thêm 1 đối tượng
        public int? Insert(tbl_nhasanxuat model)
        {
            tbl_sanpham dbEntry = context.tbl_sanpham.Find(model.id);
            if (dbEntry != null)
            {
                return null;
            }

            context.tbl_nhasanxuat.Add(model);
            context.SaveChanges();
            return model.id;
        }

        // Sửa dữ liệu
        public int? Update(tbl_nhasanxuat model)
        {
            tbl_sanpham dbEntry = context.tbl_sanpham.Find(model.id);
            if (dbEntry == null)
            {
                return null;
            }

            dbEntry.ten = model.ten;
            dbEntry.id = model.id;


            context.SaveChanges();

            return model.id;
        }

        // Xóa theo key
        public int? Delete(int MaSP)
        {
            tbl_nhasanxuat dbEntry = context.tbl_nhasanxuat.Find(MaSP);
            if (dbEntry == null)
            {
                return null;
            }

            context.tbl_nhasanxuat.Remove(dbEntry);
            context.SaveChanges();
            return MaSP;
        }


        public string getname_nhasanxuat(int id)
        {
            tbl_nhasanxuat temp = FindEntity(id);
            return temp.ten;
        }


    }
}