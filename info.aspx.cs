using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace baitaplon
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected List<Dictionary<string, object>> Orders = new List<Dictionary<string, object>>();
        protected string UserPhone = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["phone"] != null)
            {
                UserPhone = Session["phone"].ToString();
            }
            if (Request.QueryString["action"] == "get_orders")
            {
                var orders = Session["orders"] as List<Dictionary<string, object>> ?? new List<Dictionary<string, object>>();
                var result = orders.Select(order => new {
                    name = order.ContainsKey("name") ? order["name"] : "",
                    phone = order.ContainsKey("phone") ? order["phone"] : "",
                    date = order.ContainsKey("date") ? order["date"] : "",
                    address = order.ContainsKey("address") ? order["address"] : "",
                    created = order.ContainsKey("created") ? ((DateTime)order["created"]).ToString("dd/MM/yyyy") : "",
                    products = (order.ContainsKey("products") ? (order["products"] as List<Dictionary<string, string>>) : new List<Dictionary<string, string>>())
                }).ToList();
                Response.ContentType = "application/json";
                Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(result));
                Response.End();
            }
            if (Request.QueryString["action"] == "get_phone")
            {
                string phone = Session["UserPhone"] != null ? Session["UserPhone"].ToString() : "";
                Response.ContentType = "application/json";
                Response.Write("{\"phone\":\"" + phone + "\"}");
                Response.End();
            }
            if (Session["orders"] != null)
            {
                Orders = Session["orders"] as List<Dictionary<string, object>>;
            }
        }
    }
}