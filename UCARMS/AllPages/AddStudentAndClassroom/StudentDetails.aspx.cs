using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UCRMS.AllPages.AddStudentAndClassroom
{
    public partial class StudentDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Id"] != null&& Session["Department"]!=null&& Session["DateTime"]!=null)
            {
                lblRegistrationId.ForeColor = System.Drawing.Color.Green;
                lblRegistrationId.Text =Session["Department"]+"-"+Session["DateTime"]+"-"+ Session["Id"].ToString();
            }
            if (Session["Name"] != null)
            {
                lblName.Text = Session["Name"].ToString();
            }
            if (Session["Email"] != null)
            {
                lblEmail.Text = Session["Email"].ToString();
            }
            if (Session["Contact"] != null)
            {
                lblContactNo.Text = Session["Contact"].ToString();
            }
            if (Session["DateTime"] != null)
            {
                lblDate.Text = Session["DateTime"].ToString();
            }
            if (Session["Address"] != null)
            {
                lblAddress.Text = Session["Address"].ToString();
            }
            if (Session["Department"] != null)
            {
                lblDepartment.Text = Session["Department"].ToString();
            }
        }
    }
}