using CosmeticsShop.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CosmeticsShop.Controllers
{
    public class KhachHangManageController : Controller
    {
        ShoppingEntities db = new ShoppingEntities();
        public bool CheckRole(string type)
        {
            Models.User user = Session["User"] as Models.User;
            if (user != null && user.UserType.Name == type)
            {
                return true;
            }
            return false;
        }
        public ActionResult Index(string keyword = "")
        {
            if (CheckRole("Admin"))
            {

            }
            else
            {
                return RedirectToAction("Index", "Admin");
            }
            List<User> categories = new List<User>();
            if (keyword != "")
            {
                categories = db.Users.Where(x => x.Name.Contains(keyword) && x.UserTypeID == 2).ToList();
            }
            else
            {
                categories = db.Users.Where(x => x.Name.Contains(keyword) && x.UserTypeID == 2).ToList();
            }
            return View(categories);
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            if (!CheckRole("Admin"))
            {
                return RedirectToAction("Index", "Admin");
            }

            var user = db.Users.Find(id);
            if (user != null && user.UserTypeID == 2) 
            {
                db.Users.Remove(user);
                db.SaveChanges();
                TempData["Success"] = "Đã xóa khách hàng thành công!";
            }
            else
            {
                TempData["Error"] = "Không tìm thấy người dùng hoặc không phải khách hàng!";
            }

            return RedirectToAction("Index");
        }
    }
}