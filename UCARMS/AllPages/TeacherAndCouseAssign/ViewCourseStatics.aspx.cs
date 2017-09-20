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
    public partial class ViewCourseStatics : System.Web.UI.Page
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

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["Status"] != null)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("spGetTeacherNameByDepartment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", ddlDepartment.SelectedValue);

                DataTable dt = new DataTable();
                dt.Columns.Add("CourseCode");
                dt.Columns.Add("CourseName");
                dt.Columns.Add("Semester");
                dt.Columns.Add("TeacherName");
                dt.Columns.Add("Unassign");

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DataRow dr = dt.NewRow();
                    dr["CourseCode"] = rdr["CourseCode"].ToString();
                    dr["CourseName"] = rdr["CourseName"].ToString();
                    dr["Semester"] = rdr["Semester"].ToString();
                    dr["TeacherName"] = rdr["TeacherName"].ToString();
                    dr["Unassign"] = "Yes";

                    dt.Rows.Add(dr);
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                if (ddlDepartment.SelectedIndex == 0)
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                }
                else
                {
                    string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    SqlConnection con = new SqlConnection(CS);
                    SqlCommand cmd = new SqlCommand("spGetTeacherNameByDepartment", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", ddlDepartment.SelectedValue);

                    DataTable dt = new DataTable();
                    dt.Columns.Add("CourseCode");
                    dt.Columns.Add("CourseName");
                    dt.Columns.Add("Semester");
                    dt.Columns.Add("TeacherName");
                    dt.Columns.Add("UnAssign");

                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        DataRow dr = dt.NewRow();
                        dr["CourseCode"] = rdr["CourseCode"].ToString();
                        dr["CourseName"] = rdr["CourseName"].ToString();
                        dr["Semester"] = rdr["Semester"].ToString();
                        dr["TeacherName"] = rdr["TeacherName"].ToString();
                        dr["Unassign"] = "No";

                        dt.Rows.Add(dr);
                    }

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }
}