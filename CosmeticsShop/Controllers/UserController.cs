using CosmeticsShop.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace CosmeticsShop.Controllers
{
    public class UserController : Controller
    {
        ShoppingEntities db = new ShoppingEntities();
        public bool CheckRole(string type)
        {
            Models.User user = Session["User"] as Models.User;
            if (user.UserType.Name == type)
            {
                return true;
            }
            return false;
        }
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ConfirmEmail(int ID)
        {
            Models.User user = db.Users.SingleOrDefault(x => x.ID == ID);
            if (user.IsConfirm.Value)
            {
                ViewBag.Message = "EmailConfirmed";
                return View();
            }
            string urlBase = Request.Url.GetLeftPart(UriPartial.Authority) + Url.Content("~");
            ViewBag.Email = "Truy cập vào Email để xác minh tài khoản: " + user.Email;
            SentMail("Mã xác minh tài khoản", user.Email,"duongnm110198@gmail.com","xuum skth fmxr vtpl", "Xác minh nhanh bằng cách click vào link: " + urlBase + "User/ConfirmEmailLink/" + ID + "?Captcha=" + user.Captcha + "</p>");
            return View();
        }
        [HttpGet]
        public ActionResult ConfirmEmailLink(int ID, string Captcha)
        {
            User user = db.Users.SingleOrDefault(x => x.ID == ID && x.Captcha == Captcha);
            if (user != null)
            {
                user.IsConfirm = true;
                db.SaveChanges();
                ViewBag.Message = "Xác minh tài khoản thành công";
                return View();
            }
            ViewBag.Message = "Mã xác minh tài khoản không đúng";
            return View();
        }
        public void SentMail(string Title, string ToEmail, string FromEmail, string Password, string Content)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(ToEmail);
            mail.From = new MailAddress(ToEmail);
            mail.Subject = Title;
            mail.Body = Content;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential(FromEmail, Password);
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
        public ActionResult CheckoutOrder()
        {
            if (CheckRole("Client"))
            {

            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
            Models.User user = Session["User"] as Models.User;
            List<Order> orders = db.Orders.Where(x => x.UserID == user.ID).ToList();
            return View(orders);
        }
        public ActionResult OrderDetails(int ID)
        {
            if (CheckRole("Client"))
            {

            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
            List<OrderDetail> orderDetails = db.OrderDetails.Where(x => x.OrderID.Value == ID).ToList();
            return View(orderDetails);
        }
        public ActionResult Complete(int ID)
        {
            Order order = db.Orders.Find(ID);
            order.Status = "Complete";
            order.DateShip = DateTime.Now;
            db.SaveChanges();

            // Cập nhật sản phẩm
            List<OrderDetail> orderDetails = db.OrderDetails.Where(x => x.OrderID.Value == ID).ToList();
            foreach (var item in orderDetails)
            {
                Product product = db.Products.Find(item.ProductID);
                product.Quantity -= item.Quantity;
                product.PurchasedCount += item.Quantity;
                db.SaveChanges();
            }
            return RedirectToAction("CheckoutOrder");
        }

        [HttpGet]
        public ActionResult FindProfile(int ID)
        {
            var user = db.Users.FirstOrDefault(x => x.ID == ID);
            var profile = new Profile();
            profile.Name = user.Name;
            profile.Address = user.Address;
            profile.Phone = user.Phone;
            return Json(profile, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public Boolean UpdateProfile(int Id, string Name, string Address, string Phone)
        {
            var user = db.Users.Find(Id);
            user.Name = Name;
            user.Address = Address;
            user.Phone = Phone;
            db.Users.AddOrUpdate(user);
            db.SaveChanges();
            return true;
        }


        [HttpGet]
        public Boolean UpdatePassword(int Id, string PasswordNew, string ConFirmPasswordNew)
        {
            if (PasswordNew != ConFirmPasswordNew)
            {
                ViewBag.Error = "Mật khẩu không trùng khớp";
                return false;
            }
            else
            {
                var user = db.Users.Find(Id);
                user.Password = PasswordNew;
                return true;
            }
        }
    }
    public class Profile
    {
        public string Name { get; set; }

        public string Address { get; set; }

        public string Phone { get; set; }
    }
}