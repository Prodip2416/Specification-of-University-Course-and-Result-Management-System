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
    public partial class UnassignAllCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
      //  private bool button1WasClicked = false;
        protected void Button1_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Unassign Courses successfully";
            Session["Status"] = lblMessage.Text;
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
}
}