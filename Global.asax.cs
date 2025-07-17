using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace baitaplon
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Khởi tạo danh sách user nếu chưa có
            if (Application["users"] == null)
            {
                var users = new List<User>();
                users.Add(new User { Phone = "0999999999", Password = "admin123", Role = "admin" });
                users.Add(new User { Phone = "0900000002", Password = "admin456", Role = "admin" });
                users.Add(new User { Phone = "0900000003", Password = "admin789", Role = "admin" });
                Application["users"] = users;
            }
            // Khởi tạo danh sách sản phẩm nếu chưa có
            if (Application["products"] == null)
            {
                var products = new List<Product>
                {
                    new Product { Id = 1, Name = "nâu Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product1.png" },
                    new Product { Id = 2, Name = "đỏ Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product2.png" },
                    new Product { Id = 3, Name = "tím Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product3.png" },
                    new Product { Id = 4, Name = "vàng Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product4.png" },
                    new Product { Id = 5, Name = "đen Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product5.png" },
                    new Product { Id = 6, Name = "Trắng Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product6.png" },
                    new Product { Id = 7, Name = "xanh Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product7.png" },
                    new Product { Id = 8, Name = "lam Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product8.png" },
                    new Product { Id = 9, Name = "minh Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product9.png" },
                    new Product { Id = 10, Name = "xám Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product10.png" },
                    new Product { Id = 11, Name = "ngọc Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product11.png" },
                    new Product { Id = 12, Name = "đất Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product12.png" },
                    new Product { Id = 13, Name = "da trời  Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product13.png" },
                    new Product { Id = 14, Name = "kẻ Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product14.png" },
                    new Product { Id = 15, Name = "light Couch", Price = "1,519.00 - 2,349.00", Image = "assets/image/sec20-product15.png" }
                };
                Application["products"] = products;
            }
        }
        protected void Session_Start(object sender, EventArgs e) { }
        protected void Application_BeginRequest(object sender, EventArgs e) { }
        protected void Application_AuthenticateRequest(object sender, EventArgs e) { }
        protected void Application_Error(object sender, EventArgs e) { }
        protected void Session_End(object sender, EventArgs e) { }
        protected void Application_End(object sender, EventArgs e) { }
    }

    [Serializable]
    public class User
    {
        public string Phone { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
    }
    [Serializable]
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Price { get; set; }
        public string Image { get; set; }
    }
}