namespace BTL_WEB.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_news
    {
        public int id { get; set; }

        [StringLength(250)]
        public string tieude { get; set; }

        public string noidung { get; set; }

        public DateTime? ngaydang { get; set; }

        public int? id_tk { get; set; }

        [StringLength(255)]
        public string anh { get; set; }

        public virtual tbl_taikhoan tbl_taikhoan { get; set; }
    }
}
