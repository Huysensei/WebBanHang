using CosmeticsShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CosmeticsShop.Controllers
{
    public class AdminController : Controller
    {
        ShoppingEntities db = new ShoppingEntities();
        // GET: Admin
        public ActionResult Index()
        {
            if (CheckRole("Admin"))
            {

            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.TotalOrder = db.Orders.Count(x => x.Status == "Complete");
            ViewBag.TotalMoney = db.Orders.Where(x => x.Status == "Complete").ToList().Sum(x => x.OrderDetails.Sum(n => n.ProductPrice * n.Quantity));
            ViewBag.TotalClient = db.Users.Count(x => x.UserType.Name == "Client");
            ViewBag.TotalProduct = db.Products.Count(x => x.IsActive == true);
            return View();
        }
        public bool CheckRole(string type)
        {
            Models.User user = Session["User"] as Models.User;
            if (user != null && user.UserType.Name == type)
            {
                return true;
            }
            return false;
        }

        public ActionResult LogIn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogIn(FormCollection fC)
        {
            string acccount = fC["username"];
            string password = fC["password"];
            var result = db.Users.Where(x => x.Email == acccount && x.Password == password).FirstOrDefault();
            if (result != null)
            {
                Session["User"] = result;
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                ViewBag.Error = "Tài khoản hoặc mật khẩu không đúng!";
                return View();
            }
        }
    }
}