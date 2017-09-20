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
    public partial class SaveTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
                SqlCommand cmd = new SqlCommand("spGetTeacherValue", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name",txtName.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Email",txtEmail.Text);
                cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
                cmd.Parameters.AddWithValue("@Designation", ddlDesignation.SelectedValue);
                cmd.Parameters.AddWithValue("@Department",Convert.ToInt32(ddlDepartment.SelectedValue));
                cmd.Parameters.AddWithValue("@Credit", ddlCredit.SelectedValue);
                con.Open();
                cmd.ExecuteNonQuery();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Teacher Save Successfully.";
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