using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UCRMS
{
    public partial class UnallocateAllClassrooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Unassign AllClass Rooms successfully";
            Session["Statu"] = lblMessage.Text;
        }
    }
}