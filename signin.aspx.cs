using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace baitaplon
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST" && Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                ProcessAjaxSignin();
                Response.End();
            }
        }

        private void ProcessAjaxSignin()
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
            var users = Application["users"] as List<User> ?? new List<User>();
            var user = users.FirstOrDefault(u => u.Phone == phone && u.Password == password);
            if (errors.Count == 0 && user == null)
                errors["phone"] = "Số điện thoại hoặc mật khẩu không đúng!";
            if (errors.Count > 0)
            {
                result["success"] = false;
                result["errors"] = errors;
            }
            else
            {
                // Lưu trạng thái đăng nhập vào Session
                Session["UserID"] = user.Phone;
                Session["UserPhone"] = user.Phone;
                Session["UserRole"] = user.Role;
                Session["IsLoggedIn"] = true;
                result["success"] = true;
                result["userRole"] = user.Role;
            }
            Response.ContentType = "application/json";
            Response.Write(new JavaScriptSerializer().Serialize(result));
        }
    }
}