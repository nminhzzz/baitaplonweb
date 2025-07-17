using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace baitaplon
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST" && Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                ProcessAjaxSignup();
                Response.End();
            }
        }

        private void ProcessAjaxSignup()
        {
            var phone = Request.Form["phone"]?.Trim();
            var password = Request.Form["password"];
            var result = new Dictionary<string, object>();
            var errors = new Dictionary<string, string>();
            if (string.IsNullOrEmpty(phone))
                errors["phone"] = "Vui lòng nhập số điện thoại!";
            else if (!System.Text.RegularExpressions.Regex.IsMatch(phone, "^0\\d{9}$"))
                errors["phone"] = "Số điện thoại phải có 10 số và bắt đầu bằng 0!";
            if (string.IsNullOrEmpty(password))
                errors["password"] = "Vui lòng nhập mật khẩu!";
            // Kiểm tra trùng số điện thoại
            var users = Application["users"] as List<User> ?? new List<User>();
            if (users.Exists(u => u.Phone == phone))
                errors["phone"] = "Số điện thoại đã tồn tại!";
            if (errors.Count > 0)
            {
                result["success"] = false;
                result["errors"] = errors;
            }
            else
            {
                // Lưu user mới vào Application
                users.Add(new User { Phone = phone, Password = password, Role = "user" });
                Application["users"] = users;
                result["success"] = true;
            }
            Response.ContentType = "application/json";
            Response.Write(new JavaScriptSerializer().Serialize(result));
        }
    }
}