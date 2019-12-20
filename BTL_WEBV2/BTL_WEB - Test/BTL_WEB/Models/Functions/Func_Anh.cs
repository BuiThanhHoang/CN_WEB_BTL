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
    public class Func_Anh
    {
        private MyDBContext context;
        public Func_Anh()
        {
            context = new MyDBContext();
        }
        public IQueryable<tbl_anh> DS_Anh
        {
            get { return context.tbl_anh; }
        }

        // Trả về 1 đối tượng khi biết khóa
        public tbl_anh FindEntity(int id)
        {
            tbl_anh dbEntry = context.tbl_anh.Find(id);
            return dbEntry;
        }

        // Thêm 1 đối tượng
        public int? Insert(tbl_anh model)
        {
            tbl_anh dbEntry = context.tbl_anh.Find(model.id);
            if (dbEntry != null)
            {
                return null;
            }

            context.tbl_anh.Add(model);
            context.SaveChanges();
            return model.id;
        }

        // Sửa dữ liệu
        public int? Update(tbl_anh model)
        {
            tbl_anh dbEntry = context.tbl_anh.Find(model.id);
            if (dbEntry == null)
            {
                return null;
            }

            dbEntry.duongdan = model.duongdan;
            dbEntry.id_sp = model.id_sp;

            context.SaveChanges();

            return model.id;
        }

        // Xóa theo key
        public int? Delete(int id)
        {
            tbl_anh dbEntry = context.tbl_anh.Find(id);
            if (dbEntry == null)
            {
                return null;
            }

            context.tbl_anh.Remove(dbEntry);
            context.SaveChanges();
            return id;
        }

        public List<string> getImg_sp(int id_sp)
        {

            var listImg = context.Database.SqlQuery<string>("exec LayAnh_id_sp @id_sp", new SqlParameter("id_sp", id_sp)).ToList();
            return listImg;

        }
    }
}