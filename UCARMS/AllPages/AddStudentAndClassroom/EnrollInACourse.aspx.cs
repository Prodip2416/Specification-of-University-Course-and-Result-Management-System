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
    public partial class EnrollInACourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateNameAndCodeDropDownList();
                Calendar1.Visible = false;
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con= new SqlConnection(cs);
            try
            {
                SqlCommand cmd = new SqlCommand("spGetvalueEnrollCourse", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@RegNo", ddlStudentRegistration.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Department", txtDeparrtment.Text);
                cmd.Parameters.AddWithValue("@Course", ddlCourse.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                con.Open();
                cmd.ExecuteNonQuery();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Enroll a Course Successfully";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Course already enroll, please select another courses.";
            }
            finally
            {
                con.Close();
            }
        }

        protected void ddlStudentRegistration_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlStudentRegistration.SelectedIndex == 0)
            {
                txtName.Text = String.Empty;
                txtEmail.Text = String.Empty;
                txtDeparrtment.Text = String.Empty;
                ddlCourse.SelectedValue = "-1";
                txtDate.Text=String.Empty;
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
                DataSet dss = GetData("spGetCourseNameByRegistrationStudent", parameter);

                ddlCourse.DataSource = dss;
                ddlCourse.DataBind();

                ListItem liCourse = new ListItem("Select Course", "-1");
                ddlCourse.Items.Insert(0, liCourse);
            }
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
           
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