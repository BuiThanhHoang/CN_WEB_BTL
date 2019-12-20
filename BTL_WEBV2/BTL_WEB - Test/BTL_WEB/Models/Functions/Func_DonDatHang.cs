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
    public class Func_DonDatHang
    {
        private MyDBContext context;
        public Func_DonDatHang()
        {
            context = new MyDBContext();
        }
        public IQueryable<tbl_dondathang> DS_DonDatHang
        {
            get { return context.tbl_dondathang; }
        }

        // Trả về 1 đối tượng khi biết khóa
        public tbl_dondathang FindEntity(int id)
        {
            tbl_dondathang dbEntry = context.tbl_dondathang.Find(id);
            return dbEntry;
        }

        // Thêm 1 đối tượng
        public int? Insert(tbl_dondathang model)
        {
            tbl_dondathang dbEntry = context.tbl_dondathang.Find(model.id);
            if (dbEntry != null)
            {
                return null;
            }

            context.tbl_dondathang.Add(model);
            context.SaveChanges();
            return model.id;
        }
        

    }
}