using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopWebApplication.Models;

namespace ShopWebApplication.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        ShopEntityDb db = new ShopEntityDb();
       
        public List<Cart> getCart()
        {
            List<Cart> lsCart = Session["Cart"] as List<Cart>;
            if(lsCart == null)
            {
                List<Cart> ls = new List<Cart>();
                Session["Cart"] = lsCart;
                return lsCart;
            }
            return lsCart;
        }
        public ActionResult AddCart( int Ids, string url)
        {
            Product sp = db.Products.SingleOrDefault(n => n.ProductID == Ids);
            if(sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //lay gio hang
            List<Cart> lsCart = new List<Cart>();
            lsCart = getCart();
            //san pham ton tai trong gio hang
            if (lsCart != null)
            {
                Cart spChesk = lsCart.SingleOrDefault(n => n.Id == Ids);
                if (spChesk != null)
                {
                    spChesk.count++;
                    return Redirect(url);
                }
            }

            Cart itemCart = new Cart(Ids);
            lsCart.Add(itemCart);
            return Redirect(url);            
        }
        public double sumProduct()
        {
            List<Cart> lsCart = Session["Cart"] as List<Cart>;
            if(lsCart == null)
            {
                return 0;
            }
            return lsCart.Sum( n => n.count) ;

        }
        public Nullable<decimal> sumMoney()
        {
            List<Cart> lsCart = Session["Cart"] as List<Cart>;
            if (lsCart == null)
            {
                return 0;
            }
            return lsCart.Sum(n => n.intoMoney);

        }
        public ActionResult CartPatial()
        {
            if(sumProduct() == 0)
            {
                ViewBag.sumProduct = 0;
                return PartialView();
            }
            ViewBag.sumProduct = sumProduct();
            return PartialView();
        }
        public ActionResult Index()
        {
            List<Cart> lstCart = getCart();
            return View(lstCart);
        }

    }
}