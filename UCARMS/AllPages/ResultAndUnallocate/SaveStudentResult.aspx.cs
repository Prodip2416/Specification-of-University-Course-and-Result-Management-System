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
    public partial class SaveStudentResult : System.Web.UI.Page
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
            ddlStudentRegistration.DataSource = GetData("spGetAllstudentById", null);
            ddlStudentRegistration.DataBind();

            ListItem liDepartment = new ListItem("Select Reg. No", "-1");
            ddlStudentRegistration.Items.Insert(0, liDepartment);
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

        protected void ddlStudentRegistration_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlStudentRegistration.SelectedIndex == 0)
            {
                txtName.Text = String.Empty;
                txtEmail.Text = String.Empty;
                txtDeparrtment.Text = String.Empty;
                ddlCourse.SelectedValue = "-1";
                //   txtDate.Text = String.Empty;
                ddlCourse.Enabled = false;
            }
            else
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlDataAdapter da = new SqlDataAdapter("spGetNameEmailDepartmentByStudentId", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.AddWithValue("@Id", ddlStudentRegistration.SelectedValue);
                DataSet ds = new DataSet();

                da.Fill(ds, "Students");
                if (ds.Tables["Students"].Rows.Count > 0)
                {
                    DataRow dr = ds.Tables["Students"].Rows[0];
                    txtName.Text = dr["StudentName"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtDeparrtment.Text = dr["Name"].ToString();
                }

                SqlParameter parameter = new SqlParameter("@Id", ddlStudentRegistration.SelectedValue);
                DataSet dss = GetData("spGetCourseByEnrollStudent", parameter);

                ddlCourse.DataSource = dss;
                ddlCourse.DataBind();

                ListItem LiCourse = new ListItem("Select Course", "-1");
                ddlCourse.Items.Insert(0, LiCourse);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            try
            {
                SqlCommand cmd = new SqlCommand("spGetSaveStudentResult", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@RegNo", ddlStudentRegistration.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Department", txtDeparrtment.Text);
                cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@CourseGrade", ddlGrade.SelectedItem.Text);

                con.Open();
                cmd.ExecuteNonQuery();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Result Saved";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Unknown Problem....";
            }
            finally
            {
                con.Close();
            }
        }
    }
}