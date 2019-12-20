namespace BTL_WEB.Models.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyDBContext : DbContext
    {
        public MyDBContext()
            : base("name=MyDBContext")
        {
        }

        public virtual DbSet<tbl_anh> tbl_anh { get; set; }
        public virtual DbSet<tbl_chitietdonhang> tbl_chitietdonhang { get; set; }
        public virtual DbSet<tbl_danhmuc> tbl_danhmuc { get; set; }
        public virtual DbSet<tbl_dondathang> tbl_dondathang { get; set; }
        public virtual DbSet<tbl_news> tbl_news { get; set; }
        public virtual DbSet<tbl_nhasanxuat> tbl_nhasanxuat { get; set; }
        public virtual DbSet<tbl_quyen> tbl_quyen { get; set; }
        public virtual DbSet<tbl_sanpham> tbl_sanpham { get; set; }
        public virtual DbSet<tbl_taikhoan> tbl_taikhoan { get; set; }
        public virtual DbSet<tbl_thongtincanhan> tbl_thongtincanhan { get; set; }
        public virtual DbSet<tbl_tinhtrangdonhang> tbl_tinhtrangdonhang { get; set; }
        public virtual DbSet<tbl_xulydon> tbl_xulydon { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tbl_anh>()
                .Property(e => e.duongdan)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_danhmuc>()
                .Property(e => e.ten)
                .IsFixedLength();

            modelBuilder.Entity<tbl_danhmuc>()
                .HasMany(e => e.tbl_sanpham)
                .WithOptional(e => e.tbl_danhmuc)
                .HasForeignKey(e => e.id_dm);

            modelBuilder.Entity<tbl_dondathang>()
                .Property(e => e.tonggia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tbl_dondathang>()
                .HasMany(e => e.tbl_chitietdonhang)
                .WithOptional(e => e.tbl_dondathang)
                .HasForeignKey(e => e.id_don);

            modelBuilder.Entity<tbl_dondathang>()
                .HasMany(e => e.tbl_xulydon)
                .WithRequired(e => e.tbl_dondathang)
                .HasForeignKey(e => e.id_don)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tbl_news>()
                .Property(e => e.anh)
                .IsFixedLength();

            modelBuilder.Entity<tbl_nhasanxuat>()
                .Property(e => e.ten)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_nhasanxuat>()
                .HasMany(e => e.tbl_sanpham)
                .WithOptional(e => e.tbl_nhasanxuat)
                .HasForeignKey(e => e.id_nsx);

            modelBuilder.Entity<tbl_quyen>()
                .HasMany(e => e.tbl_taikhoan)
                .WithRequired(e => e.tbl_quyen)
                .HasForeignKey(e => e.id_q)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tbl_sanpham>()
                .Property(e => e.trongluong)
                .IsFixedLength();

            modelBuilder.Entity<tbl_sanpham>()
                .Property(e => e.ROM)
                .IsFixedLength();

            modelBuilder.Entity<tbl_sanpham>()
                .Property(e => e.RAM)
                .IsFixedLength();

            modelBuilder.Entity<tbl_sanpham>()
                .Property(e => e.camera_truoc)
                .IsFixedLength();

            modelBuilder.Entity<tbl_sanpham>()
                .Property(e => e.camera_sau)
                .IsFixedLength();

            modelBuilder.Entity<tbl_sanpham>()
                .Property(e => e.baohanh)
                .IsFixedLength();

            modelBuilder.Entity<tbl_sanpham>()
                .Property(e => e.CPU)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_sanpham>()
                .HasMany(e => e.tbl_anh)
                .WithOptional(e => e.tbl_sanpham)
                .HasForeignKey(e => e.id_sp);

            modelBuilder.Entity<tbl_sanpham>()
                .HasMany(e => e.tbl_chitietdonhang)
                .WithRequired(e => e.tbl_sanpham)
                .HasForeignKey(e => e.id_sp)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tbl_taikhoan>()
                .Property(e => e.matkhau)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_taikhoan>()
                .HasMany(e => e.tbl_chitietdonhang)
                .WithRequired(e => e.tbl_taikhoan)
                .HasForeignKey(e => e.id_tk)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tbl_taikhoan>()
                .HasMany(e => e.tbl_news)
                .WithOptional(e => e.tbl_taikhoan)
                .HasForeignKey(e => e.id_tk);

            modelBuilder.Entity<tbl_thongtincanhan>()
                .Property(e => e.sdt)
                .HasPrecision(18, 0);

            modelBuilder.Entity<tbl_thongtincanhan>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_thongtincanhan>()
                .Property(e => e.anhdaidien)
                .IsUnicode(false);

            modelBuilder.Entity<tbl_thongtincanhan>()
                .HasMany(e => e.tbl_taikhoan)
                .WithRequired(e => e.tbl_thongtincanhan)
                .HasForeignKey(e => e.id_ttcn)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<tbl_tinhtrangdonhang>()
                .HasMany(e => e.tbl_chitietdonhang)
                .WithOptional(e => e.tbl_tinhtrangdonhang)
                .HasForeignKey(e => e.id_tinhtrang);
        }
    }
}
