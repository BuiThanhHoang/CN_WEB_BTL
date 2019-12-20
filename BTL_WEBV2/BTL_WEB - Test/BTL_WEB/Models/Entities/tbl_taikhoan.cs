namespace BTL_WEB.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_taikhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_taikhoan()
        {
            tbl_chitietdonhang = new HashSet<tbl_chitietdonhang>();
            tbl_news = new HashSet<tbl_news>();
        }

        public int id { get; set; }

        public int id_q { get; set; }

        [Required]
        [StringLength(50)]
        public string tentaikhoan { get; set; }

        [Required]
        [StringLength(30)]
        public string matkhau { get; set; }

        public int id_ttcn { get; set; }

        public bool trangthai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_chitietdonhang> tbl_chitietdonhang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_news> tbl_news { get; set; }

        public virtual tbl_quyen tbl_quyen { get; set; }

        public virtual tbl_thongtincanhan tbl_thongtincanhan { get; set; }
    }
}
