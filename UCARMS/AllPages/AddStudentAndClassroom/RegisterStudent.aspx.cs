using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UCRMS
{
    public partial class RegisterStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                PopulateNameAndCodeDropDownList();
            }
        }
        private void PopulateNameAndCodeDropDownList()
        {
            ddlDepartment.DataSource = GetData("spGetNameDepartmentById", null);
            ddlDepartment.DataBind();

            ListItem liDepartment = new ListItem("Select Department", "-1");
            ddlDepartment.Items.Insert(0, liDepartment);

        }
        private DataSet GetData(string SPName, SqlParameter SPParameter)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter(SPName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (SPParameter != null)
            {
                da.SelectCommand.Parameters.Add(SPParameter);
            }
            DataSet DS = new DataSet();
            da.Fill(DS);
            return DS;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            try
            {
                SqlCommand cmd = new SqlCommand("spGetValueRegisterStudent", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
                cmd.Parameters.AddWithValue("@DateTime", txtDate.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Department", Convert.ToInt32(ddlDepartment.SelectedValue));

                SqlParameter outputParameter = new SqlParameter();
                outputParameter.ParameterName = "@Id";
                outputParameter.SqlDbType = System.Data.SqlDbType.Int;
                outputParameter.Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.Add(outputParameter);

                con.Open();
                cmd.ExecuteNonQuery();

                string outputId = outputParameter.Value.ToString();

                //lblMessage.ForeColor = System.Drawing.Color.Green;
                //lblMessage.Text = "Your Register Id is: " + outputId + " :) ";

                Session["Id"] = outputId;
                Session["Name"] = txtName.Text;
                Session["Email"] = txtEmail.Text;
                Session["Contact"] = txtContactNo.Text;
                Session["DateTime"] = txtDate.Text;
                Session["Address"] = txtAddress.Text;
                Session["Department"] = ddlDepartment.SelectedItem.Text;
                Response.Redirect("StudentDetails.aspx");
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Unknown Problem Here....";
            }
            finally
            {
                con.Close();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToShortDateString();
            Calendar1.Visible = false;
        }
    }
}