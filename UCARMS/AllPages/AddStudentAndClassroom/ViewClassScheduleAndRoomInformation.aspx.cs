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
    public partial class ViewClassScheduleAndRoomInformation : System.Web.UI.Page
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
            if (Session["Statu"] != null)
            {
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand("spGetClassSchedulaByDepartment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", ddlDepartment.SelectedValue);

                DataTable dt = new DataTable();
                dt.Columns.Add("Code");
                dt.Columns.Add("Name");
                dt.Columns.Add("RoomNo");
                dt.Columns.Add("Day");
                dt.Columns.Add("FromTime");
                dt.Columns.Add("ToTime");
                dt.Columns.Add("UnAssign");

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    DataRow dr = dt.NewRow();
                    dr["Code"] = rdr["Code"].ToString();
                    dr["Name"] = rdr["Name"].ToString();
                    dr["RoomNo"] = rdr["RoomNo"].ToString();
                    dr["Day"] = rdr["Day"].ToString();
                    dr["FromTime"] = rdr["FromTime"].ToString();
                    dr["ToTime"] = rdr["ToTime"].ToString();
                    dr["UnAssign"] = "Yes";

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
                    SqlCommand cmd = new SqlCommand("spGetClassSchedulaByDepartment", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", ddlDepartment.SelectedValue);

                    DataTable dt = new DataTable();
                    dt.Columns.Add("Code");
                    dt.Columns.Add("Name");
                    dt.Columns.Add("RoomNo");
                    dt.Columns.Add("Day");
                    dt.Columns.Add("FromTime");
                    dt.Columns.Add("ToTime");
                    dt.Columns.Add("UnAssign");

                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        DataRow dr = dt.NewRow();
                        dr["Code"] = rdr["Code"].ToString();
                        dr["Name"] = rdr["Name"].ToString();
                        dr["RoomNo"] = rdr["RoomNo"].ToString();
                        dr["Day"] = rdr["Day"].ToString();
                        dr["FromTime"] = rdr["FromTime"].ToString();
                        dr["ToTime"] = rdr["ToTime"].ToString();
                        dr["UnAssign"] = "No";

                        dt.Rows.Add(dr);
                    }

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }
    }
}