namespace BTL_WEB.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_sanpham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_sanpham()
        {
            tbl_anh = new HashSet<tbl_anh>();
            tbl_chitietdonhang = new HashSet<tbl_chitietdonhang>();
        }

        public int id { get; set; }

        public int? id_dm { get; set; }

        [StringLength(150)]
        public string ten { get; set; }

        public int? gia { get; set; }

        public int? soluong { get; set; }

        [StringLength(10)]
        public string trongluong { get; set; }

        [StringLength(10)]
        public string ROM { get; set; }

        [StringLength(10)]
        public string RAM { get; set; }

        [StringLength(50)]
        public string thenho { get; set; }

        [StringLength(10)]
        public string camera_truoc { get; set; }

        [StringLength(10)]
        public string camera_sau { get; set; }

        public int? pin { get; set; }

        [StringLength(50)]
        public string baohanh { get; set; }

        public int? bluetooth { get; set; }

        public int? id_nsx { get; set; }

        [StringLength(50)]
        public string CPU { get; set; }

        [StringLength(50)]
        public string manhinh { get; set; }

        public int? tinhtrang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_anh> tbl_anh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_chitietdonhang> tbl_chitietdonhang { get; set; }

        public virtual tbl_danhmuc tbl_danhmuc { get; set; }

        public virtual tbl_nhasanxuat tbl_nhasanxuat { get; set; }
    }
}
