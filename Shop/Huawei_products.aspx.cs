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
    public partial class Huawei_products : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Shop_Connection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            Btn_Add.Enabled = false;
        }


        protected void LBtn_view_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (con.State == ConnectionState.Closed)
                con.Open();

            string selUser = "select * from Products where Id = @id";
            SqlDataAdapter sqa = new SqlDataAdapter(selUser, con);
            sqa.SelectCommand.Parameters.AddWithValue("@id", Id);
            DataTable dtbl = new DataTable();
            sqa.Fill(dtbl);
            con.Close();
            Preview.ImageUrl = dtbl.Rows[0]["img_link"].ToString();
            lbl_DescriptionTag.Text = "Description:";
            lbl_Description.Text = dtbl.Rows[0]["description_long"].ToString();
            lbl_id.Text = dtbl.Rows[0]["Id"].ToString();
            lbl_price.Text = dtbl.Rows[0]["Price"].ToString();
            lbl_currency.Text = "$";

            if (Session["Id"] != null)
            {
                Btn_Add.Enabled = true;
            }
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            string insertCart = "insert into Cart (Cart_ID, Item_ID, Account_ID, item_description, Price) values (@cart, @item, @account, @desc, @price)";
            con.Open();
            SqlCommand com = new SqlCommand(insertCart, con);
            com.Parameters.AddWithValue("@cart", Session["Cart_ID"]);
            com.Parameters.AddWithValue("@item", lbl_id.Text);
            com.Parameters.AddWithValue("@account", Session["Id"]);
            com.Parameters.AddWithValue("@desc", lbl_Description.Text);
            com.Parameters.AddWithValue("@price", lbl_price.Text);
            com.ExecuteNonQuery();
            con.Close();
        }
    }
}