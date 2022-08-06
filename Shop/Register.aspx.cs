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
    public partial class Register : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Shop_Connection"].ConnectionString);
        int tmp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {
                    con.Open();
                    string checkUser = "select count(*) from Account where Username = @uname OR Email = @email";
                    SqlCommand cmd = new SqlCommand(checkUser, con);
                    cmd.Parameters.AddWithValue("@uname", HttpUtility.HtmlEncode(txt_UserName.Text));
                    cmd.Parameters.AddWithValue("@email", HttpUtility.HtmlEncode(txt_Email.Text));
                    tmp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    if (tmp >= 1)
                    {
                        lbl_Status.ForeColor = System.Drawing.Color.Red;
                        lbl_Status.Text = "User Already exist!";
                        Clear();

                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
                finally
                {
                    con.Close();
                }
            }

        }


        private void Clear()
        {
            txt_Name.Text = txt_UserName.Text = txt_Email.Text = txt_Password.Text = txt_CPassword.Text = txt_Address.Text = txt_Payment.Text = "";
            lbl_Status.ForeColor = System.Drawing.Color.Black;
        }

        protected void Btn_Register_Click(object sender, EventArgs e)
        {

            try
            {
                if (tmp == 0)
                {
                    con.Open();
                    string insertUser = "insert into Account (Name, Username, Email, Password, Address, Payment_method) " +
                        "values (@name, @uname, @email, @pwd, @addrs, @Payment_method)";
                    SqlCommand com = new SqlCommand(insertUser, con);
                    com.Parameters.AddWithValue("@name", HttpUtility.HtmlEncode(txt_Name.Text));
                    com.Parameters.AddWithValue("@uname", HttpUtility.HtmlEncode(txt_UserName.Text));
                    com.Parameters.AddWithValue("@email", HttpUtility.HtmlEncode(txt_Email.Text));
                    com.Parameters.AddWithValue("@pwd", hashPassword(txt_Password.Text));
                    com.Parameters.AddWithValue("@addrs", HttpUtility.HtmlEncode(txt_Address.Text));
                    com.Parameters.AddWithValue("@Payment_method", HttpUtility.HtmlEncode(txt_Payment.Text));
                    com.ExecuteNonQuery();
                    lbl_Status.Text = "User Registered Successfully!";
                    Clear();

                    Response.Redirect("Home.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                con.Close();
            }
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