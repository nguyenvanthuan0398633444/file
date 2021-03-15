using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopWebApplication.Models;

namespace ShopWebApplication.Controllers
{
    public class GioHangController : Controller
    {
        ShopEntityDb db =new ShopEntityDb();
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if(lstGioHang == null)
            {
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
                return lstGioHang;
            }
            return lstGioHang;
        }
        public ActionResult ThemGioHang(int MaSP,string url)
        {
            Product sp = db.Products.SingleOrDefault(n => n.ProductID == MaSP);
            if(sp == null)
            {
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang spChet = lstGioHang.SingleOrDefault(n => n.maSP == MaSP);
            if(spChet != null)
            {
                spChet.soLuong++;
                return Redirect(url);
            }
            GioHang itemgiohang = new GioHang(MaSP);
            lstGioHang.Add(itemgiohang);
            if(lstGioHang.Count == 0)
            {
                return View();
            }
            return Redirect(url);
        }
        public double TinhTongSoLuong()
        {
            List<GioHang> lstgioHang = Session["GioHang"] as List<GioHang>;
            if(lstgioHang == null)
            {
                return 0;
            }
            return lstgioHang.Sum(n => n.soLuong);
        }
        // GET: GioHang
        public ActionResult XemGioHang()
        {
            return View();
        }
        public ActionResult GioHangPatial()
        {
            if (TinhTongSoLuong() == 0) 
            {
                ViewBag.TongSoLuong = 0;
                return PartialView();
            }
            ViewBag.TongSoLuong = TinhTongSoLuong();
            return PartialView();
        }
    }
}