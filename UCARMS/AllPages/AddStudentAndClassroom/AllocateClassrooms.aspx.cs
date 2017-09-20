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
    public partial class AllocateClassrooms : System.Web.UI.Page
    {
        //bool _checklRow = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateNameAndCodeDropDownList();
                GetRoomNo();
            }
        }
        private void GetRoomNo()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            SqlDataAdapter da = new SqlDataAdapter("select * from RoomNo", con);
            DataSet ds = new DataSet();
            da.Fill(ds);

            ddlRoomNo.DataTextField = "RoomNo";
            ddlRoomNo.DataValueField = "Id";

            ddlRoomNo.DataSource = ds;
            ddlRoomNo.DataBind();

            ListItem li = new ListItem("Select RoomNo", "-1");
            ddlRoomNo.Items.Insert(0, li);
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

            if (ddlDepartment.SelectedIndex == 0)
            {
                ddlCourse.SelectedIndex = 0;
                ddlRoomNo.SelectedIndex = 0;
                ddlDay.SelectedIndex = 0;
                txtFrom.Text = String.Empty;
                txtTo.Text = String.Empty;
                ddlCourse.Enabled = false;
                ddlRoomNo.Enabled = false;
                ddlDay.Enabled = false;
            }
            else
            {
                ddlCourse.Enabled = true;
                SqlParameter parameter1 = new SqlParameter("@Id", ddlDepartment.SelectedValue);
                DataSet dss = GetData("spGetCodeById", parameter1);

                ddlCourse.DataSource = dss;
                ddlCourse.DataBind();

                ListItem liCourse = new ListItem("Select CourseCode", "-1");
                ddlCourse.Items.Insert(0, liCourse);

            }
        }

        protected void btnAllocate_Click(object sender, EventArgs e)
        {
           // GetValue();
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(CS);
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("spGetAllocateClassRomm", con);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;

                da.SelectCommand.Parameters.AddWithValue("@Department", ddlDepartment.SelectedValue);
                da.SelectCommand.Parameters.AddWithValue("@Course", ddlCourse.SelectedValue);
                da.SelectCommand.Parameters.AddWithValue("@RoomNo", ddlRoomNo.SelectedItem.Text);
                da.SelectCommand.Parameters.AddWithValue("@Day", ddlDay.SelectedItem.Text);
                da.SelectCommand.Parameters.AddWithValue("@FromTime", txtFrom.Text);
                da.SelectCommand.Parameters.AddWithValue("@ToTime", txtTo.Text);
               // GetValue();
                DataSet ds = new DataSet();
                da.Fill(ds);

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Class Allocated Successfully";
            }

            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Course already allocated, please try another courses.";
            }
            finally
            {
              //  something........
            }
        }

        //public void GetValue()
        //{
        //    string RoomNo;
        //    string Day;
        //    string FromTime;
        //    string ToTime;
        //    string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //    SqlConnection con = new SqlConnection(CS);
        //    con.Open();
        //    SqlCommand cmd= new SqlCommand("select RoomNo,Day,FromTime,ToTime from AllocateClassRoom",con);

        //    SqlDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        RoomNo = dr["RoomNo"].ToString();
        //        Day = dr["Day"].ToString();
        //        FromTime = dr["FromTime"].ToString();
        //        ToTime = dr["ToTime"].ToString();

        //        if (RoomNo == ddlRoomNo.SelectedItem.Text
        //            && Day == ddlDay.SelectedItem.Text &&
        //            FromTime == txtFrom.Text && ToTime == txtTo.Text)
        //        {
        //            _checklRow = true;
        //            con.Close();
        //            break;
        //        }
        //    }
        //    if (_checklRow == true)
        //    {
        //        lblMessage.Text = "etfgertvgisbj";
        //    }
        //  //  con.Close();
        //}

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedItem != null)
            {
                if (RadioButtonList1.SelectedIndex == 0)
                {
                    txtFrom.Text = txtFrom.Text + " " + RadioButtonList1.SelectedItem.Text;
                }
                if (RadioButtonList1.SelectedIndex == 1)
                {
                    txtFrom.Text = txtFrom.Text + " " + RadioButtonList1.SelectedItem.Text;
                }
            }
        }
        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList2.SelectedItem != null)
            {
                txtTo.Text = txtTo.Text + " " + RadioButtonList2.SelectedItem.Text;
            }
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCourse.SelectedIndex == 0)
            {
                ddlRoomNo.SelectedIndex = 0;
                ddlDay.SelectedIndex = 0;
                txtFrom.Text = String.Empty;
                txtTo.Text = String.Empty;
                ddlRoomNo.Enabled = false;
                ddlDay.Enabled = false;
            }
            else
            {
                ddlRoomNo.Enabled = true;
            }
        }

        protected void ddlRoomNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRoomNo.SelectedIndex == 0)
            {
                ddlDay.SelectedIndex = 0;
                txtFrom.Text = String.Empty;
                txtTo.Text = String.Empty;
                ddlDay.Enabled = false;
            }
            else
            {
                ddlDay.Enabled = true;
            }
        }

        protected void ddlDay_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }
}
