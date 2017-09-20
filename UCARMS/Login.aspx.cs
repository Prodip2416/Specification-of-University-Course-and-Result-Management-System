using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UCRMS
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con= new SqlConnection(cs);
            SqlCommand cmd= new SqlCommand("select count(*) from Login where Email= '" +txtEmail.Text + "' and Password= '" + txtPassword.Text + "'", con);
            con.Open();
           int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

            con.Close();
            if (temp == 1)
            {
                Session["Email"] = txtEmail.Text;
                Session["Password"] = txtPassword.Text;
                Response.Redirect("~/MainPage.aspx");
            }
            else
            {
                lblmessage.ForeColor = System.Drawing.Color.Red;
                lblmessage.Text = "Email or PassWord Incorrect";
            }
        }
    }
}