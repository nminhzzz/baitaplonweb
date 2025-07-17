using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace baitaplon
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected string ProductName = "";
        protected string ProductPrice = "";
        protected string ProductImage = "";
        protected string ProductId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Xử lý thêm vào giỏ hàng qua AJAX
            if (Request.HttpMethod == "POST" && Request["action"] == "add_to_cart")
            {
                string id = Request["id"];
                string name = Request["name"];
                string price = Request["price"];
                string image = Request["image"];
                var cart = Session["cart"] as List<Dictionary<string, string>> ?? new List<Dictionary<string, string>>();
                cart.Add(new Dictionary<string, string> {
                    {"id", id},
                    {"name", name},
                    {"price", price},
                    {"image", image}
                });
                Session["cart"] = cart;
                Response.ContentType = "application/json";
                Response.Write("{\"success\":true}");
                Response.End();
            }

            // Hiển thị chi tiết sản phẩm
            string pid = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(pid))
            {
                ProductId = pid;
                var products = Application["products"] as System.Collections.Generic.List<Product>;
                if (products != null)
                {
                    var product = products.FirstOrDefault(p => p.Id.ToString() == pid);
                    if (product != null)
                    {
                        ProductName = product.Name;
                        ProductPrice = product.Price;
                        ProductImage = product.Image;
                    }
                }
            }
        }
    }
}