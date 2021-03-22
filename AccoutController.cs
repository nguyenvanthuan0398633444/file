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
    [Authorize(Roles = "Account")]
    public class AccoutController : Controller
    {
        AccountServises account = new AccountServises();
        ShopEntityDb db = new ShopEntityDb();
        // GET: Accout
        public ActionResult Index(int? page, string seach)
        {
            return View(account.GetListAccount(page, seach));
        }
        // new Accout
        [HttpGet]
        public ActionResult NewAccount()
        {
            ViewBag.AccountType = db.Account_types;
            return View();
        }
        
        [ValidateInput(false)]// tắt kiểm tra dữ liệu đầu vào
        [HttpPost]
        public ActionResult NewAccount(Account accountNew, HttpPostedFileBase photoPath)
        {
            accountNew.PhotoPath= Photo(photoPath);
            if ( account.NewAccount(accountNew)==true)
            {                
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.error = "Email đã đăng kí";
                 return View();
            }          
        }
        //edit
        [HttpGet]
        public ActionResult EditAccount(int id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            Account pd = db.Accounts.SingleOrDefault(n => n.AccountID == id);
            if (pd == null)
            {
                return HttpNotFound();
            }
            ViewBag.AccountType = db.Account_types;
            return View(pd);
        }
        
        [HttpPost]
        public ActionResult EditAccount(Account model, HttpPostedFileBase photoPath)
        {
            model.PhotoPath = Photo(photoPath);
            if (ModelState.IsValid)
            {
                account.EditAccount(model);
                return RedirectToAction("Index");
            }
            return View(model);
        }
        // delete
        [HttpGet]
        public ActionResult DeleteAccount(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (account.DeleteAccount(id) == true)
            {
                return RedirectToAction("Index");               
            }
            return HttpNotFound();
        }
        public string Photo(HttpPostedFileBase photoPath)
        {
            if (photoPath != null)
            {
                //lay ten anh
                var fileName = Path.GetFileName(photoPath.FileName);
                // lay anh chuyen vao thu muc
                var path = Path.Combine(Server.MapPath("~/Content/Image"), fileName);
                photoPath.SaveAs(path);
                return fileName.ToString();
            }
            Response.StatusCode = 404;
            return null;
        }
    }
}
       
    