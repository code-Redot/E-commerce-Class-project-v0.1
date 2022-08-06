using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace Shop
{
    public partial class renewpass : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Shop_Connection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_id.Text = Request.QueryString["Id"];
        }

        protected void Btn_submitPwd_Click(object sender, EventArgs e)
        {


            con.Open();
            string UpdateUser = "Update Account set Password = @pwd where Id = @id";
            SqlCommand com = new SqlCommand(UpdateUser, con);

            com.Parameters.AddWithValue("@id", lbl_id.Text);
            com.Parameters.AddWithValue("@pwd", hashPassword(HttpUtility.HtmlEncode(txt_pwd.Text)));
            com.ExecuteNonQuery();

            Response.Redirect("Home.aspx");

        }

        private string hashPassword(string password)
        {
            SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();
            byte[] password_bytes = Encoding.ASCII.GetBytes(password);
            byte[] encrypted_bytes = sha1.ComputeHash(password_bytes);
            return Convert.ToBase64String(encrypted_bytes);
        }

    }
}