using System;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Linq; // Added for .Where() and .ToList()

namespace baitaplon
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected List<Dictionary<string, string>> Cart = new List<Dictionary<string, string>>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["action"] == "get_cart")
            {
                var cart = Session["cart"] as List<Dictionary<string, string>> ?? new List<Dictionary<string, string>>();
                // Debug: In ra số lượng sản phẩm trong cart
                System.Diagnostics.Debug.WriteLine("Cart count: " + cart.Count);
                foreach (var item in cart)
                {
                    System.Diagnostics.Debug.WriteLine($"Item: {item["name"]} - {item["image"]}");
                }
                Response.ContentType = "application/json";
                Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(cart));
                Response.End();
            }
            string action = Request["action"] ?? Request.QueryString["action"];
            if (action == "remove_item" && Request.HttpMethod == "POST")
            {
                string id = Request["id"];
                var cart = Session["cart"] as List<Dictionary<string, string>> ?? new List<Dictionary<string, string>>();
                cart = cart.Where(item => item["id"] != id).ToList();
                Session["cart"] = cart;
                Response.ContentType = "application/json";
                Response.Write("{\"success\":true}");
                Response.End();
            }
            if (action == "checkout" && Request.HttpMethod == "POST")
            {
                string name = Request["name"];
                string phone = Request["phone"];
                string date = Request["date"];
                string address = Request["address"];
                var cart = Session["cart"] as List<Dictionary<string, string>> ?? new List<Dictionary<string, string>>();
                if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(phone) || string.IsNullOrWhiteSpace(date) || string.IsNullOrWhiteSpace(address) || cart.Count == 0)
                {
                    Response.ContentType = "application/json";
                    Response.Write("{\"success\":false,\"msg\":\"Thiếu thông tin hoặc giỏ hàng trống\"}");
                    Response.End();
                }
                // Lưu đơn hàng vào session
                var orders = Session["orders"] as List<Dictionary<string, object>> ?? new List<Dictionary<string, object>>();
                var order = new Dictionary<string, object>
                {
                    {"name", name},
                    {"phone", phone},
                    {"date", date},
                    {"address", address},
                    {"products", cart},
                    {"created", DateTime.Now}
                };
                orders.Add(order);
                Session["orders"] = orders;
                Session["cart"] = null;
                Response.ContentType = "application/json";
                Response.Write("{\"success\":true}");
                Response.End();
            }
            if (Session["cart"] != null)
            {
                Cart = Session["cart"] as List<Dictionary<string, string>>;
            }
        }
    }
}