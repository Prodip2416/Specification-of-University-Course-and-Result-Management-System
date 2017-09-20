using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UCRMS
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null && Session["Password"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void Button1_OnClick(object sender, EventArgs e)
        {
            Session.Remove("Email");
            Session.Remove("Password");
            Session.RemoveAll();
            Response.Redirect("Login.aspx");
         
        }
    }
}