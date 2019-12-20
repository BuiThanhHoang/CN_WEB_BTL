using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_WEB.Models.Entities;

namespace BTL_WEB.Models.Functions
{
    public class Func_DanhMuc
    {
        private MyDBContext context;
        public Func_DanhMuc()
        {
            context = new MyDBContext();
        }

        // Trả về tất cả các bản ghi
        // Trả về danh mục
        public IQueryable<tbl_danhmuc> DS_DanhMuc
        {
            get { return context.tbl_danhmuc; }
        }

        // Trả về 1 đối tượng khi biết khóa
        public tbl_danhmuc FindEntity(int MaDM)
        {
            tbl_danhmuc dbEntry = context.tbl_danhmuc.Find(MaDM);
            return dbEntry;
        }

        // Thêm 1 đối tượng
        public int? Insert(tbl_danhmuc model)
        {
            tbl_danhmuc dbEntry = context.tbl_danhmuc.Find(model.id);
            if (dbEntry != null)
            {
                return null;
            }
            context.tbl_danhmuc.Add(model);
            context.SaveChanges();

            return model.id;
        }
        // Sửa dữ liệu
        public int? Update(tbl_danhmuc model)
        {
            tbl_danhmuc dbEntry = context.tbl_danhmuc.Find(model.id);
            if (dbEntry == null)
            {
                return null;
            }

            dbEntry.ten = model.ten;
            context.SaveChanges();
            return model.id;
        }

        // Xóa theo key
        public int? Delete(int MaDM)
        {
            tbl_danhmuc dbEntry = context.tbl_danhmuc.Find(MaDM);
            if (dbEntry == null)
            {
                return null;
            }

            context.tbl_danhmuc.Remove(dbEntry);
            context.SaveChanges();
            return MaDM;
        }
    }
}