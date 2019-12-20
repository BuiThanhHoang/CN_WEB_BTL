namespace BTL_WEB.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_xulydon
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int id { get; set; }

        public int id_don { get; set; }

        [StringLength(30)]
        public string tinhtrang { get; set; }

        public DateTime? thoigian { get; set; }

        public virtual tbl_dondathang tbl_dondathang { get; set; }
    }
}
