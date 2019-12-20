namespace BTL_WEB.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_chitietdonhang
    {
        public int id { get; set; }

        public int? id_don { get; set; }

        public int id_sp { get; set; }

        public int id_tk { get; set; }

        public int? soluong { get; set; }

        public int? id_tinhtrang { get; set; }

        public DateTime? thoigian { get; set; }

        public virtual tbl_dondathang tbl_dondathang { get; set; }

        public virtual tbl_sanpham tbl_sanpham { get; set; }

        public virtual tbl_taikhoan tbl_taikhoan { get; set; }

        public virtual tbl_tinhtrangdonhang tbl_tinhtrangdonhang { get; set; }
    }
}
