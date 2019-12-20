using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace BTL_WEB.Areas.admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage ="Mời bạn nhập User Name.")]
        public string tentaikhoan { set; get; }
        [Required(ErrorMessage = "Mời bạn nhập Password.")]
        public string matkhau { set; get; }

        public bool rememberMe { set; get; }
    }
}