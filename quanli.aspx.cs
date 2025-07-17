using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace baitaplon
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Xử lý AJAX thêm sản phẩm trước mọi return hoặc IsPostBack
            if (Request.HttpMethod == "POST" && Request.QueryString["action"] == "add_product")
            {
                var result = new Dictionary<string, object>();
                try
                {
                    var name = Request.Form["name"];
                    var price = Request.Form["price"];
                    var image = Request.Form["image"];
                    if (string.IsNullOrWhiteSpace(name) || string.IsNullOrWhiteSpace(price) || string.IsNullOrWhiteSpace(image))
                    {
                        result["success"] = false;
                        result["error"] = "Vui lòng nhập đầy đủ thông tin.";
                    }
                    else
                    {
                        var products = Application["products"] as List<Product> ?? new List<Product>();
                        int newId = products.Count > 0 ? products.Max(p => p.Id) + 1 : 1;
                        var newProduct = new Product { Id = newId, Name = name, Price = price, Image = image };
                        products.Add(newProduct);
                        Application["products"] = products;
                        result["success"] = true;
                    }
                }
                catch (Exception ex)
                {
                    result["success"] = false;
                    result["error"] = "Lỗi server: " + ex.Message;
                }
                Response.ContentType = "application/json";
                Response.Write(new JavaScriptSerializer().Serialize(result));
                Response.End();
                return;
            }
            if (Request.HttpMethod == "GET" && Request.QueryString["action"] == "get_products")
            {
                var products = Application["products"] as List<Product> ?? new List<Product>();
                Response.ContentType = "application/json";
                Response.Write(new JavaScriptSerializer().Serialize(products));
                Response.End();
            }
            // Thêm xử lý xóa sản phẩm
            if (Request.HttpMethod == "POST" && Request.QueryString["action"] == "delete_product")
            {
                int id;
                var result = new Dictionary<string, object>();
                if (int.TryParse(Request.Form["id"], out id))
                {
                    var products = Application["products"] as List<Product> ?? new List<Product>();
                    var product = products.Find(p => p.Id == id);
                    if (product != null)
                    {
                        products.Remove(product);
                        Application["products"] = products;
                        result["success"] = true;
                    }
                    else
                    {
                        result["success"] = false;
                        result["error"] = "Không tìm thấy sản phẩm.";
                    }
                }
                else
                {
                    result["success"] = false;
                    result["error"] = "ID không hợp lệ.";
                }
                Response.ContentType = "application/json";
                Response.Write(new JavaScriptSerializer().Serialize(result));
                Response.End();
            }
            // Thêm xử lý sửa sản phẩm
            if (Request.HttpMethod == "POST" && Request.QueryString["action"] == "edit_product")
            {
                int id;
                var result = new Dictionary<string, object>();
                if (int.TryParse(Request.Form["id"], out id))
                {
                    var name = Request.Form["name"];
                    var price = Request.Form["price"];
                    var image = Request.Form["image"];
                    var products = Application["products"] as List<Product> ?? new List<Product>();
                    var product = products.Find(p => p.Id == id);
                    if (product != null)
                    {
                        product.Name = name;
                        product.Price = price;
                        product.Image = image;
                        Application["products"] = products;
                        result["success"] = true;
                    }
                    else
                    {
                        result["success"] = false;
                        result["error"] = "Không tìm thấy sản phẩm.";
                    }
                }
                else
                {
                    result["success"] = false;
                    result["error"] = "ID không hợp lệ.";
                }
                Response.ContentType = "application/json";
                Response.Write(new JavaScriptSerializer().Serialize(result));
                Response.End();
            }
            // API lấy danh sách user
            if (Request.HttpMethod == "GET" && Request.QueryString["action"] == "get_users")
            {
                var users = Application["users"] as List<User> ?? new List<User>();
                Response.ContentType = "application/json";
                Response.Write(new JavaScriptSerializer().Serialize(users));
                Response.End();
                return;
            }
            // API thêm user
            if (Request.HttpMethod == "POST" && Request.QueryString["action"] == "add_user")
            {
                var result = new Dictionary<string, object>();
                try
                {
                    var phone = Request.Form["phone"];
                    var password = Request.Form["password"];
                    var role = Request.Form["role"];
                    var users = Application["users"] as List<User> ?? new List<User>();
                    if (string.IsNullOrWhiteSpace(phone) || string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(role))
                    {
                        result["success"] = false;
                        result["error"] = "Vui lòng nhập đầy đủ thông tin.";
                    }
                    else if (users.Exists(u => u.Phone == phone))
                    {
                        result["success"] = false;
                        result["error"] = "Số điện thoại đã tồn tại!";
                    }
                    else
                    {
                        users.Add(new User { Phone = phone, Password = password, Role = role });
                        Application["users"] = users;
                        result["success"] = true;
                    }
                }
                catch (Exception ex)
                {
                    result["success"] = false;
                    result["error"] = "Lỗi server: " + ex.Message;
                }
                Response.ContentType = "application/json";
                Response.Write(new JavaScriptSerializer().Serialize(result));
                Response.End();
                return;
            }
            // API sửa user
            if (Request.HttpMethod == "POST" && Request.QueryString["action"] == "edit_user")
            {
                var result = new Dictionary<string, object>();
                try
                {
                    var phone = Request.Form["phone"];
                    var password = Request.Form["password"];
                    var role = Request.Form["role"];
                    var users = Application["users"] as List<User> ?? new List<User>();
                    var user = users.Find(u => u.Phone == phone);
                    if (user == null)
                    {
                        result["success"] = false;
                        result["error"] = "Không tìm thấy user.";
                    }
                    else
                    {
                        user.Password = password;
                        user.Role = role;
                        Application["users"] = users;
                        result["success"] = true;
                    }
                }
                catch (Exception ex)
                {
                    result["success"] = false;
                    result["error"] = "Lỗi server: " + ex.Message;
                }
                Response.ContentType = "application/json";
                Response.Write(new JavaScriptSerializer().Serialize(result));
                Response.End();
                return;
            }
            // API xóa user
            if (Request.HttpMethod == "POST" && Request.QueryString["action"] == "delete_user")
            {
                var result = new Dictionary<string, object>();
                try
                {
                    var phone = Request.Form["phone"];
                    var users = Application["users"] as List<User> ?? new List<User>();
                    var user = users.Find(u => u.Phone == phone);
                    if (user == null)
                    {
                        result["success"] = false;
                        result["error"] = "Không tìm thấy user.";
                    }
                    else
                    {
                        users.Remove(user);
                        Application["users"] = users;
                        result["success"] = true;
                    }
                }
                catch (Exception ex)
                {
                    result["success"] = false;
                    result["error"] = "Lỗi server: " + ex.Message;
                }
                Response.ContentType = "application/json";
                Response.Write(new JavaScriptSerializer().Serialize(result));
                Response.End();
                return;
            }
        }
    }
}
