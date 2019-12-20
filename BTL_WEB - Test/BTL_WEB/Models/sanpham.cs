using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_WEB.Models
{
  
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    [JsonObject(IsReference = true)]
    public partial class sanpham
    {
        public sanpham()
        {

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

    }
}