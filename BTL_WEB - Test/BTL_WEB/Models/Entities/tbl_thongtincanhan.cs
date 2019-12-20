namespace BTL_WEB.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_thongtincanhan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_thongtincanhan()
        {
            tbl_taikhoan = new HashSet<tbl_taikhoan>();
        }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_taikhoan> tbl_taikhoan { get; set; }
    }
}
