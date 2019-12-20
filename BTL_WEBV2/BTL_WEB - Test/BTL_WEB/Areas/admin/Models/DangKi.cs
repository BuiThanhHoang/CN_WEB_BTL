using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace BTL_WEB.Areas.admin.Models
{
    public class DangKi
    {
        public int id { get; set; }

        [StringLength(100)]
        public string ten { get; set; }

        public decimal sdt { get; set; }

        [Required]
        [StringLength(100)]
        public string email { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ngaysinh { get; set; }

        [StringLength(3)]
        public string gioitinh { get; set; }

        [StringLength(255)]
        public string anhdaidien { get; set; }

        [StringLength(100)]
        public string diachi { get; set; }


        [Required]
        [StringLength(50)]
        public string tentaikhoan { get; set; }

        [Required]
        [StringLength(30)]
        public string matkhau { get; set; }

    }
}