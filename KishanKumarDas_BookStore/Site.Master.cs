using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KishanKumarDas_BookStore
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["firstName"] != null)
            {
                // User is logged in.
                liLogin.Visible = false;
                liUser.Visible = true;
                liLogout.Visible = true;
                lblUser.InnerText = "Welcome, " + Session["firstName"].ToString();
            }
            else
            {
                // User is not logged in.
                liLogin.Visible = true;
                liUser.Visible = false;
                liLogout.Visible = false;
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Home");
        }
    }
}