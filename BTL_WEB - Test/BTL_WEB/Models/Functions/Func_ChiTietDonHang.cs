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
    public class Func_ChiTietDonHang
    {
        private MyDBContext context;
        public Func_ChiTietDonHang()
        {
            context = new MyDBContext();
        }
        public IQueryable<tbl_chitietdonhang> DS_ChiTietDonHang
        {
            get { return context.tbl_chitietdonhang ; }
        }

        // Trả về 1 đối tượng khi biết khóa
        public tbl_chitietdonhang FindEntity(int id)
        {
            tbl_chitietdonhang dbEntry = context.tbl_chitietdonhang.Find(id);
            return dbEntry;
        }

        // Thêm 1 đối tượng
        public int? Insert(tbl_chitietdonhang model)
        {
            tbl_chitietdonhang  dbEntry = context.tbl_chitietdonhang.Find(model.id);
            if (dbEntry != null)
            {
                return null;
            }
            model.id_don = 1;
            context.tbl_chitietdonhang.Add(model);
            context.SaveChanges();
            return model.id;
        }

        // Sửa dữ liệu
        public int? Update(tbl_chitietdonhang model)
        {
            tbl_chitietdonhang dbEntry = context.tbl_chitietdonhang.Find(model.id);
            if (dbEntry == null)
            {
                return null;
            }

            dbEntry.id_don = model.id_don;
            dbEntry.id_sp = model.id_sp;
            dbEntry.id_tinhtrang = model.id_tinhtrang;
            dbEntry.soluong = model.soluong;
            dbEntry.id_tk = model.id_tk;
            dbEntry.thoigian = model.thoigian;
            context.SaveChanges();

            return model.id;
        }

        // Xóa theo key
        public int? Delete(int id)
        {
            tbl_chitietdonhang dbEntry = context.tbl_chitietdonhang.Find(id);
            if (dbEntry == null)
            {
                return null;
            }

            context.tbl_chitietdonhang.Remove(dbEntry);
            context.SaveChanges();
            return id;
        }

        public  int? AddSanPhamGioHang(int iduser, int idsp, int soluong)
        {
            List<tbl_chitietdonhang>  donhang = context.tbl_chitietdonhang.Where(x => x.id_tk == iduser && x.id_sp == idsp && x.id_tinhtrang == 1).ToList();
            if (donhang.Count > 0 )
            {
                tbl_chitietdonhang hang = donhang[0];
                hang.soluong+= soluong;
                return Update(hang);
            }
            else
            {
                tbl_chitietdonhang newhang = new tbl_chitietdonhang();
                newhang.soluong = soluong;
                newhang.id_sp = idsp;
                newhang.id_tinhtrang = 1;
                newhang.id_tk = iduser;
                newhang.thoigian = DateTime.Now;
                return Insert(newhang);
            }
            
        }
        public int? updatesanpham(int iduser, int idsp, int soluong)
        {
            List<tbl_chitietdonhang> donhang = context.tbl_chitietdonhang.Where(x => x.id_tk == iduser && x.id_sp == idsp && x.id_tinhtrang == 1).ToList();
            if (donhang.Count > 0)
            {
                tbl_chitietdonhang hang = donhang[0];
                hang.soluong = soluong;
                return Update(hang);
            }
            return null;
        }

        public List<tbl_chitietdonhang> getSanPhamGioHang(int iduser)
        {
            List<tbl_chitietdonhang> donhang = context.tbl_chitietdonhang.Where(x => x.id_tk == iduser  && x.id_tinhtrang == 1).ToList();
            return donhang;
        }
         public List<tbl_chitietdonhang> OUT (int iduser)
         {
            List<tbl_chitietdonhang> donhang = context.tbl_chitietdonhang.Where(x => x.id_tk == iduser && x.id_tinhtrang != 1).ToList();
            return donhang;
         }
    }
}