namespace BTL_WEB.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_anh
    {
        public int id { get; set; }

        [StringLength(255)]
        public string duongdan { get; set; }

        public int? id_sp { get; set; }

        public virtual tbl_sanpham tbl_sanpham { get; set; }
    }
}
