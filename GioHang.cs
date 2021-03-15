using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopWebApplication.Models
{
    public class GioHang
    {
        public string tenSp { get; set; }
        public int maSP { get; set; }
        public int soLuong { get; set; }
        public Nullable<int> DonGia { get; set; }
        public Nullable<int> thanhTien { get; set; }
        public string hinhAnh { get; set; }
        public GioHang(int iMaSp, int soluong)
        {
            using(ShopEntityDb db = new ShopEntityDb())
            {
                this.maSP = iMaSp;
                Product sp = db.Products.Single(n => n.ProductID == iMaSp);
                this.tenSp = sp.ProductName;
                this.soLuong = 1;
                this.DonGia = sp.Price;
                this.hinhAnh = sp.PhotoPath;
                this.soLuong = soLuong;
                this.thanhTien = DonGia * soLuong;
            }
        }
        public GioHang(int iMaSp)
        {
            using (ShopEntityDb db = new ShopEntityDb())
            {
                this.maSP = iMaSp;
                Product sp = db.Products.Single(n => n.ProductID == iMaSp);
                this.tenSp = sp.ProductName;
                this.soLuong = 1;
                this.DonGia = sp.Price;
                this.hinhAnh = sp.PhotoPath;
                this.thanhTien = DonGia * soLuong;
            }
        }
        public GioHang() { }

    }
}