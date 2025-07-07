using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace baitaplon
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra xem URL có ?action=account không
            string action = Request.QueryString["action"];

            if (action == "account")
            {
                // Nếu chưa đăng nhập
                if (Session["username"] == null)
                {
                    // Chuyển sang trang đăng nhập
                    Response.Redirect("signin.aspx");
                }
                else
                {
                    // Nếu đã đăng nhập, chuyển sang trang tài khoản
                    Response.Redirect("account.aspx");
                }
            }
        }

    }

}