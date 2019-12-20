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
    [JsonObject(IsReference = true)]
    public class Func_SanPham
    {
        private MyDBContext context;
        public Func_SanPham()
        {
            context = new MyDBContext();
        }

        // Trả về tất cả các bản ghi
        // Trả về danh mục
        public IQueryable<tbl_sanpham> DS_SanPham
        {
            get { return context.tbl_sanpham.Where(x => x.tinhtrang == 1); }
        }

        // Trả về 1 đối tượng khi biết khóa
        public tbl_sanpham FindEntity(int MaSP)
        {
            tbl_sanpham dbEntry = context.tbl_sanpham.Find(MaSP);
            return dbEntry;
        }

        // Thêm 1 đối tượng
        public int? Insert(tbl_sanpham model)
        {
            tbl_sanpham dbEntry = context.tbl_sanpham.Find(model.id);
            if (dbEntry != null)
            {
                return null;
            }

            context.tbl_sanpham.Add(model);
            context.SaveChanges();
            return model.id;
        }

        // Sửa dữ liệu
        public int? Update(tbl_sanpham model)
        {
            tbl_sanpham dbEntry = context.tbl_sanpham.Find(model.id);
            if (dbEntry == null)
            {
                return null;
            }
            
            dbEntry.ten = model.ten;
            dbEntry.gia = model.gia;
            dbEntry.soluong = model.soluong;
            dbEntry.trongluong = model.trongluong;
            dbEntry.ROM = model.ROM;
            dbEntry.RAM = model.RAM;
            dbEntry.thenho = model.thenho;
            dbEntry.camera_truoc = model.camera_truoc;
            dbEntry.camera_sau = model.camera_sau;
            dbEntry.pin = model.pin;
            dbEntry.baohanh = model.baohanh;
            dbEntry.bluetooth = model.bluetooth;
            dbEntry.id_nsx = model.id_nsx;
            dbEntry.CPU = model.CPU;
            dbEntry.manhinh = model.manhinh;
            dbEntry.tinhtrang = model.tinhtrang;

            context.SaveChanges();

            return model.id;
        }

        // Xóa theo key
        public int? Delete(int MaSP)
        {
            tbl_sanpham dbEntry = context.tbl_sanpham.Find(MaSP);
            if (dbEntry == null)
            {
                return null;
            }

            context.tbl_sanpham.Remove(dbEntry);
            context.SaveChanges();
            return MaSP;
        }
        public List<string> getImg(int id_sp)
        {
          
            var listImg = context.Database.SqlQuery<string>("exec LayAnh_id_sp @id_sp", new SqlParameter("id_sp", id_sp)).ToList();
            return listImg;
            
        }

        //public List<tbl_sanpham> search_san_pham(string name)
        //{
        //    tbl_sanpham dbEntry = context.tbl_sanpham.Find
        //}
        
        public sanpham getnewsanpham(tbl_sanpham oldsanpham)
        {
            sanpham newsanpham = new sanpham();
            newsanpham.baohanh = oldsanpham.baohanh;
            newsanpham.bluetooth = oldsanpham.bluetooth;
            newsanpham.camera_sau = oldsanpham.camera_sau;
            newsanpham.camera_truoc = oldsanpham.camera_truoc;
            newsanpham.CPU = oldsanpham.CPU;
            newsanpham.gia = oldsanpham.gia;
            newsanpham.id = oldsanpham.id;
            newsanpham.id_dm = oldsanpham.id_dm;
            newsanpham.id_nsx = oldsanpham.id_nsx;
            newsanpham.manhinh = oldsanpham.manhinh;
            newsanpham.pin = oldsanpham.pin;
            newsanpham.RAM = oldsanpham.RAM;
            newsanpham.ROM = oldsanpham.ROM;
            newsanpham.soluong = oldsanpham.soluong;
            newsanpham.ten = oldsanpham.ten;
            newsanpham.thenho = oldsanpham.thenho;
            newsanpham.tinhtrang = oldsanpham.tinhtrang;
            newsanpham.trongluong = oldsanpham.trongluong;
            return newsanpham;
        }

        public tbl_sanpham getsanpham(sanpham oldsanpham)
        {

            tbl_sanpham newsanpham = new tbl_sanpham();
            newsanpham.baohanh = oldsanpham.baohanh;
            newsanpham.bluetooth = oldsanpham.bluetooth;
            newsanpham.camera_sau = oldsanpham.camera_sau;
            newsanpham.camera_truoc = oldsanpham.camera_truoc;
            newsanpham.CPU = oldsanpham.CPU;
            newsanpham.gia = oldsanpham.gia;
            newsanpham.id = oldsanpham.id;
            newsanpham.id_dm = oldsanpham.id_dm;
            newsanpham.id_nsx = oldsanpham.id_nsx;
            newsanpham.manhinh = oldsanpham.manhinh;
            newsanpham.pin = oldsanpham.pin;
            newsanpham.RAM = oldsanpham.RAM;
            newsanpham.ROM = oldsanpham.ROM;
            newsanpham.soluong = oldsanpham.soluong;
            newsanpham.ten = oldsanpham.ten;
            newsanpham.thenho = oldsanpham.thenho;
            newsanpham.tinhtrang = oldsanpham.tinhtrang;
            newsanpham.trongluong = oldsanpham.trongluong;
            return newsanpham;
        }

        

    }
}