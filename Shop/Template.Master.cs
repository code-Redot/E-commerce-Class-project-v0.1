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
    public partial class Template : System.Web.UI.MasterPage
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BD_Shop_Connection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] == null)
            {

                Btn_Signin.Visible = true;
                Btn_Signin.Enabled = true;
                Btn_Signout.Visible = false;
                Btn_Signout.Enabled = false;
                Btn_Cart.Visible = false;
                Btn_Cart.Enabled = false;
            }
            else
            {

                Btn_Signin.Visible = false;
                Btn_Signin.Enabled = false;
                Btn_Signout.Visible = true;
                Btn_Signout.Enabled = true;
                Btn_Cart.Visible = true;
                Btn_Cart.Enabled = true;


                con.Open();
                string idfinder = "select UserName from Account where Id = '" + Session["Id"] + "'";
                SqlCommand cmd = new SqlCommand(idfinder, con);
                String name = cmd.ExecuteScalar().ToString();

                lbl_LoggedUser.Text = name;
            }
        }
        protected void LnkBtn_Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void Btn_Signin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signing.aspx");
        }

        protected void Btn_Signout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            lbl_LoggedUser.Text = null;
            Btn_Signin.Visible = true;
            Btn_Signin.Enabled = true;
            Btn_Signout.Visible = false;
            Btn_Signout.Enabled = false;
            Btn_Cart.Visible = false;
            Btn_Cart.Enabled = false;
        }

        protected void logo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Signing.aspx");
        }

        protected void Btn_Cart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }
}