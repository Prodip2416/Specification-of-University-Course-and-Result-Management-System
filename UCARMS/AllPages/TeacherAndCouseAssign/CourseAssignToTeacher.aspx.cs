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
    public partial class CourseAssignToTeacher : System.Web.UI.Page
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

            ListItem liTeacher = new ListItem("Select Teacher", "-1");
            ddlTeacher.Items.Insert(0, liTeacher);

            ListItem liCourse = new ListItem("Select CourseCode", "-1");
            ddlCourseCode.Items.Insert(0, liCourse);

            ddlTeacher.Enabled = false;
            ddlCourseCode.Enabled = false;
            ddlCredit.Enabled = false;

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

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDepartment.SelectedIndex == 0)
            {
                ddlCredit.SelectedIndex = 0;
                ddlTeacher.SelectedIndex = 0;
                ddlCourseCode.SelectedIndex = 0;
                ddlCourseCode.Enabled = false;
                ddlTeacher.Enabled = false;
               ddlCredit.Enabled = false;
                ClearTextBox();
            }
            else
            {
                ddlTeacher.Enabled = true;
                ddlCourseCode.Enabled = true;
                ClearTextBox();

                SqlParameter parameter = new SqlParameter("@Id",ddlDepartment.SelectedValue);
                DataSet ds = GetData("spGetNameById", parameter);

                ddlTeacher.DataSource = ds;
                ddlTeacher.DataBind();

                ListItem liCountry = new ListItem("Select Teacher", "-1");
                ddlTeacher.Items.Insert(0, liCountry);



                SqlParameter parameter1 = new SqlParameter("@Id", ddlDepartment.SelectedValue);
                DataSet dss = GetData("spGetCodeById", parameter1);

                ddlCourseCode.DataSource = dss;
                ddlCourseCode.DataBind();

                ListItem liCountrys = new ListItem("Select CourseCode", "-1");
                ddlCourseCode.Items.Insert(0, liCountrys);           
            }
        }

        private void ClearTextBox()
        {
            txtName.Text = String.Empty;
            txtCredit.Text = String.Empty;
           // txtCreditToBeTaken.Text = String.Empty;
            txtRemainingCredit.Text = String.Empty;
            ddlCredit.SelectedIndex = -1;
        }

        protected void ddlCourseCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da= new SqlDataAdapter("spGetCodeNameAndCredit", con);
            da.SelectCommand.CommandType=CommandType.StoredProcedure;

             da.SelectCommand.Parameters.AddWithValue("@Id",ddlCourseCode.SelectedValue);
             DataSet ds= new DataSet();

            da.Fill(ds, "Students");
            if (ds.Tables["Students"].Rows.Count > 0)
            {
                DataRow dr = ds.Tables["Students"].Rows[0];
                txtName.Text = dr["Name"].ToString();
                txtCredit.Text = dr["Credit"].ToString();
            }
        }

        protected void ddlTeacher_SelectedIndexChanged(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter("spGetRemainingCredit", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            da.SelectCommand.Parameters.AddWithValue("@Name", ddlTeacher.SelectedItem.Text);
            DataSet ds = new DataSet();

            da.Fill(ds, "Students");
            if (ds.Tables["Students"].Rows.Count > 0)
            {
                DataRow dr = ds.Tables["Students"].Rows[0];
                  //txtCreditToBeTaken.Text =dr["CreditTaken"].ToString();
                 ddlCredit.SelectedItem.Text = dr["CreditTaken"].ToString();
                txtRemainingCredit.Text =dr["RemainingCredit"].ToString();
            }
            ddlCredit.Enabled = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            try
            {
                SqlCommand cmd = new SqlCommand("spGetAssignTeacherValue", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Department", ddlDepartment.SelectedValue);
                cmd.Parameters.AddWithValue("@TeacherName", ddlTeacher.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@CreditTaken",ddlCredit.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@CreditRemaining",txtRemainingCredit.Text);
                cmd.Parameters.AddWithValue("@CourseCode",ddlCourseCode.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@CourseName",txtName.Text);
                cmd.Parameters.AddWithValue("@CourseCredit",txtCredit.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Assign Successfully";
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Course already assigned. Please select another course.";
            }
            finally
            {
                con.Close();
            }


        }
    }
}