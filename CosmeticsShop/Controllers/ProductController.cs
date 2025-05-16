using CosmeticsShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
namespace CosmeticsShop.Controllers
{
    public class ProductController : Controller
    {
        ShoppingEntities db = new ShoppingEntities();
        public ActionResult Index(int? page, int? pageSize, int CategoryID = 0, string keyword = "")
        {
            ViewBag.ListCategory = db.Categories.Where(x => x.IsActive == true).ToList();
            if (keyword != "")
            {
                ViewBag.NamePage = "Tìm kiếm sản phẩm";
                ViewBag.ListProduct = db.Products.Where(x => x.IsActive == true && x.Name.Contains(keyword)).ToList();
                return View();
            }
            if (CategoryID != 0)
            {
                ViewBag.NamePage = "Danh mục " + db.Categories.Find(CategoryID).Name;
                ViewBag.ListProduct = db.Products.Where(x => x.IsActive == true && x.CategoryID == CategoryID).ToList();
            }
            else
            {
                ViewBag.NamePage = "";
                ViewBag.ListProduct = db.Products.Where(x => x.IsActive == true).ToList();
            }
            // phan trang
            if (page == null)
            {
                page = 1;
            }
            if (pageSize == null)
            {
                pageSize = 9;
            }
            IQueryable<Product> productQuery = db.Products.Where(x => x.IsActive == true);

            if (!string.IsNullOrEmpty(keyword))
            {
                productQuery = productQuery.Where(x => x.Name.Contains(keyword));
                ViewBag.NamePage = "Tìm kiếm sản phẩm";
            }
            else if (CategoryID != 0)
            {
                var category = db.Categories.Find(CategoryID);
                ViewBag.NamePage = (category != null ? category.Name : "");
                productQuery = productQuery.Where(x => x.CategoryID == CategoryID);
            }
            else
            {
                ViewBag.NamePage = "Tất cả sản phẩm";
            }

            ViewBag.ListCategory = db.Categories.Where(x => x.IsActive == true).ToList();

            if (page == null) page = 1;
            if (pageSize == null) pageSize = 9;

            var pagedList = productQuery.OrderBy(x => x.ID).ToPagedList((int)page, (int)pageSize);
            return View(pagedList);

        }
        public ActionResult Details(int ID)
        {
            Product product = db.Products.Find(ID);
            return View(product);
        }
    }
}