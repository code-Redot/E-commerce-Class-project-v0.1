using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace Shop
{
    public partial class Home : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_appl_redirect_Click(object sender, EventArgs e)
        {

            Response.Redirect("Apple_products.aspx");
        }

        protected void Btn_hua_redirect_Click(object sender, EventArgs e)
        {

            Response.Redirect("Huawei_products.aspx");
        }

        protected void Btn_sams_redirect_Click(object sender, EventArgs e)
        {
            Response.Redirect("Samsung_products.aspx");
        }
    }
}