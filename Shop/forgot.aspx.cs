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
    public partial class forgot : System.Web.UI.Page
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
                    string checkUser = "select count(*) from Account where Name=@name AND Username = @uname AND Email = @email";
                    SqlCommand cmd = new SqlCommand(checkUser, con);
                    cmd.Parameters.AddWithValue("@name", HttpUtility.HtmlEncode(txt_Name.Text));
                    cmd.Parameters.AddWithValue("@uname", HttpUtility.HtmlEncode(txt_UName.Text));
                    cmd.Parameters.AddWithValue("@email", HttpUtility.HtmlEncode(txt_Email.Text));
                    tmp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    if (tmp >= 1)
                    {

                        string selectUser = "select Id from Account where Name=@name AND Username = @uname AND Email = @email";
                        SqlCommand SuId = new SqlCommand(selectUser, con);
                        SuId.Parameters.AddWithValue("@name", HttpUtility.HtmlEncode(txt_Name.Text));
                        SuId.Parameters.AddWithValue("@uname", HttpUtility.HtmlEncode(txt_UName.Text));
                        SuId.Parameters.AddWithValue("@email", HttpUtility.HtmlEncode(txt_Email.Text));
                        lbl_Status.Text = SuId.ExecuteScalar().ToString();

                        Clear();
                        Response.Redirect("renewpass.aspx?Id="+ lbl_Status.Text);

                    }
                    else 
                    {


                        lbl_Status.Text = " user do not exist!";
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
            txt_Name.Text = txt_UName.Text = txt_Email.Text = "";
        }

        protected void Btn_renew_Click(object sender, EventArgs e)
        {

        }
    }
}