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
    public partial class SaveDepartment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSaveDepartment_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            try
            {             
                SqlCommand cmd = new SqlCommand("spGetNameAndCodeFromDepartment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Code", txtCode.Text);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                con.Open();
                cmd.ExecuteNonQuery();

                txtCode.Text = String.Empty;
                txtName.Text = String.Empty;

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Department Save Successfully.";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Something Problem....";
            }
            finally
            {
                con.Close();
            }
        }
    }
}