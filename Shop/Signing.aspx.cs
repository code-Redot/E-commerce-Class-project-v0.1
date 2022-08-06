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
    public partial class Signing : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Shop_Connection"].ConnectionString);
        int tmp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        private void Clear()
        {
            txt_UserName.Text = txt_Password.Text = "";
            lbl_Status.ForeColor = System.Drawing.Color.Black;
        }
        protected void Btn_Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void Btn_Login_Click(object sender, EventArgs e)
        {
            try
            {


                con.Open();
                string checkUser = "select count(*) from Account where Username = @uname AND Password = @pwd";
                SqlCommand cmd = new SqlCommand(checkUser, con);
                cmd.Parameters.AddWithValue("@uname", HttpUtility.HtmlEncode(txt_UserName.Text));
                cmd.Parameters.AddWithValue("@pwd", hashPassword(HttpUtility.HtmlEncode(txt_Password.Text)));
                tmp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                if (tmp > 0)
                {
                    string idfinder = "select Id from Account where Username = @uname AND Password = @pwd";
                    SqlCommand cmdID = new SqlCommand(idfinder, con);
                    cmdID.Parameters.AddWithValue("@uname", HttpUtility.HtmlEncode(txt_UserName.Text));
                    cmdID.Parameters.AddWithValue("@pwd", hashPassword(HttpUtility.HtmlEncode(txt_Password.Text)));
                    int id = Convert.ToInt32(cmdID.ExecuteScalar().ToString());
                    Session["Id"] = id;



                    string checkOrders = "select MAX(Cart_ID) from Orders where Account_ID = @id";
                    string checkCart = "select MAX(Cart_ID) from Cart where Account_ID = @id";

                    SqlCommand ordersChk = new SqlCommand(checkOrders, con);
                    SqlCommand cartChk = new SqlCommand(checkCart, con);

                    ordersChk.Parameters.AddWithValue("@id", Convert.ToInt32(Session["Id"]));
                    cartChk.Parameters.AddWithValue("@id", Convert.ToInt32(Session["Id"]));

                    if (ordersChk.ExecuteScalar() == null)
                    {

                        if (cartChk.ExecuteScalar() == null)
                        {
                            Session["Cart_ID"] = 3000001;

                        }
                        else
                        {

                            Session["Cart_ID"] = Convert.ToInt32(cartChk.ExecuteScalar().ToString()) + 1;

                        }

                    }
                    else
                    {

                        if (cartChk.ExecuteScalar() == null)
                        {
                            Session["Cart_ID"] = 3000001;

                        }


                        if (cartChk.ExecuteScalar() == ordersChk.ExecuteScalar())
                        {

                            Session["Cart_ID"] = Convert.ToInt32(cartChk.ExecuteScalar().ToString()) + 1;

                        }
                        else
                        {


                            Session["Cart_ID"] = Convert.ToInt32(cartChk.ExecuteScalar().ToString());

                        }

                    }

                    Clear();

                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lbl_Status.Text = "The Username or Password is wrong";
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

        private string hashPassword(string password)
        {
            SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();
            byte[] password_bytes = Encoding.ASCII.GetBytes(password);
            byte[] encrypted_bytes = sha1.ComputeHash(password_bytes);
            return Convert.ToBase64String(encrypted_bytes);
        }

        protected void Btn_Forgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgot.aspx");
        }
    }
}