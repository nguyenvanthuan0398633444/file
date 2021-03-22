using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopWebApplication.Models;
using PagedList;
using ShopWebApplication.Services;


namespace ShopWebApplication.Controllers
{
    [Authorize(Roles = "Product")]
    public class ProductController : Controller
    {
        // GET: Product
        ShopEntityDb db = new ShopEntityDb();
        ProductServices product = new ProductServices();
        public ActionResult Index(int? page, string seach)
        {
            return View(product.GetListProduct(page, seach));         
        }
        // New Prodduc
        [HttpGet]
        public ActionResult NewProduct()
        {
            ViewBag.SupplierID = new SelectList(db.Suppliers.OrderBy(n => n.SupplierName), "SupplierID", "SupplierName");
            ViewBag.CategoryID = new SelectList(db.Categories.OrderBy(n => n.CategoryName), "CategoryID", "CategoryName");
            return View();
        }
        [ValidateInput(false)]// tắt kiểm tra dữ liệu đầu vào

        [HttpPost]
        public ActionResult NewProduct(Product pd, HttpPostedFileBase PhotoPath)
        {
            ViewBag.SupplierID = new SelectList(db.Suppliers.OrderBy(n => n.SupplierName), "SupplierID", "SupplierName");
            ViewBag.CategoryID = new SelectList(db.Categories.OrderBy(n => n.CategoryName), "CategoryID", "CategoryName");
            if(PhotoPath.ContentLength > 0)
            {
                //lay ten anh
                var fileName = Path.GetFileName(PhotoPath.FileName);
                // lay anh chuyen vao thu muc
                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                PhotoPath.SaveAs(path);                    
                pd.PhotoPath = fileName;                             
            }
            else
            {
                Response.StatusCode = 404;
                return null;
            }
            product.NewProduct(pd);
            return RedirectToAction("Index");
        }
        // Edit Product
        [HttpGet]
        public ActionResult EditProduct(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            Product pd = db.Products.SingleOrDefault(n =>n.ProductID == id);
            if(pd == null)
            {
                return HttpNotFound();
            }
            ViewBag.SupplierID = new SelectList(db.Suppliers.OrderBy(n => n.SupplierName), "SupplierID", "SupplierName");
            ViewBag.CategoryID = new SelectList(db.Categories.OrderBy(n => n.CategoryName), "CategoryID", "CategoryName");
            return View(pd);
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult EditProduct(Product model, HttpPostedFileBase PhotoPath)
        {
            ViewBag.SupplierID = new SelectList(db.Suppliers.OrderBy(n => n.SupplierName), "SupplierID", "SupplierName",model.SupplierID);
            ViewBag.CategoryID = new SelectList(db.Categories.OrderBy(n => n.CategoryName), "CategoryID", "CategoryName",model.CategoryID);
            if (PhotoPath != null)
            {
                var fileName = Path.GetFileName(PhotoPath.FileName);
                // lay anh chuyen vao thu muc
                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                //lay anh dua vao thu muc hinh anh
                PhotoPath.SaveAs(path);
                //Session["tenHinh"] = PhotoPath.FileName;
                //ViewBag.tenHinh = "";
                model.PhotoPath = fileName;
            }
            if (ModelState.IsValid)
            {
                product.EditProduct(model);
                return RedirectToAction("Index");
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult DeleteProduct(int id)
        {
            product.DeleteProduct(id);
            return RedirectToAction("Index");
        }
    }
}