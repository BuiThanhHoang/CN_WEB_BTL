using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_WEB.Models.Entities;
namespace BTL_WEB.Models.Functions
{
    public class UserDao
    {
        MyDBContext db = null;
        public UserDao()
        {
            db = new MyDBContext();
        }
        public bool Login(string tentaikhoan, string matkhau)
        {

            var result = db.tbl_taikhoan.SingleOrDefault(x => x.tentaikhoan == tentaikhoan && x.matkhau == matkhau);
            if (result != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public tbl_taikhoan GetById(string tentaikhoan)
        {
            return db.tbl_taikhoan.SingleOrDefault(x => x.tentaikhoan == tentaikhoan);
        }

        public int? getIdQuyen(string tentaikhoan, string matkhau)
        {
            BTL_WEB.Models.Entities.tbl_taikhoan account = new Entities.tbl_taikhoan();
            var result = db.tbl_taikhoan.SingleOrDefault(x => x.tentaikhoan == tentaikhoan && x.matkhau == matkhau);
            if (result != null)
            {
                return result.id_q;
            }
            else
            {
                return 0;
            }
        }



    }
}