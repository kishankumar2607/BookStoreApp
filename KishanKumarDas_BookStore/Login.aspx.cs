using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KishanKumarDas_BookStore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "Login";
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String firstName = txtFirstName.Text;
            String lastName = txtLastName.Text;

            Session["firstName"] = firstName;
            Session["lastName"] = lastName;

            Response.Redirect("Products");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home");
        }
    }
}