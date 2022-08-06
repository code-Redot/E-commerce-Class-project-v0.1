using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Security.Cryptography;
using System.Text;

namespace Shop
{
    public partial class checkout : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Shop_Connection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Order_Click(object sender, EventArgs e)
        {

            string insertOrder = "insert into Orders (Cart_ID, Items_ID, Account_ID, Payment) values (@cart, @itm, @account, @payment)";
            string items = "DECLARE @Names VARCHAR(8000) SELECT @Names = COALESCE (@Names + ', ', '') + CAST (Item_ID as nvarchar) FROM Cart WHERE Cart_ID = @cart  Select @Names";
            string payment = "Select Payment_method from Account";
            con.Open();
            SqlCommand com = new SqlCommand(insertOrder, con);
            SqlCommand itm = new SqlCommand(items, con);
            SqlCommand pay = new SqlCommand(payment, con);

            itm.Parameters.AddWithValue("@cart", Convert.ToInt32(Session["Cart_ID"]));
            com.Parameters.AddWithValue("@cart", Convert.ToInt32(Session["Cart_ID"]));
            com.Parameters.AddWithValue("@itm", itm.ExecuteScalar().ToString());
            com.Parameters.AddWithValue("@account", Convert.ToInt32(Session["Id"]));
            com.Parameters.AddWithValue("@payment", pay.ExecuteScalar().ToString());
            com.ExecuteNonQuery();
            con.Close();

            Response.Redirect("purchased.aspx");
        }
    }
}