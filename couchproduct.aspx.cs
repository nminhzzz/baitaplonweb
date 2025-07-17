using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace baitaplon
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nếu là request lấy danh sách sản phẩm (AJAX)
            if (Request.HttpMethod == "GET" && Request.QueryString["action"] == "get_products")
            {
                var products = Application["products"] as List<Product> ?? new List<Product>();
                Response.ContentType = "application/json";
                Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(products));
                Response.End();
            }
        }
    }
}