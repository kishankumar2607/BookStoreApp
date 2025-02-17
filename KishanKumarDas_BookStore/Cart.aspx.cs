using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using KishanKumarDas_BookStore.Models;

namespace KishanKumarDas_BookStore
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
                Page.Title = "Cart";
            }

        }

        private void LoadCart()
        {
            if (Session["Cart"] != null && ((List<CartItem>)Session["Cart"]).Count > 0)
            {
                List<CartItem> cart = (List<CartItem>)Session["Cart"];
                GridViewCart.DataSource = cart;
                GridViewCart.DataBind();

                decimal totalBeforeTax = cart.Sum(item => item.Price * item.Quantity);
                decimal totalAfterTax = totalBeforeTax * 1.13m;

                totalPriceWithTaxLabel.Text = totalAfterTax.ToString("C");
                totalBooksLabel.Text = cart.Sum(item => item.Quantity).ToString();

                pnlCart.Visible = true;
                pnlEmptyCart.Visible = false;
            }
            else
            {
                pnlCart.Visible = false;
                pnlEmptyCart.Visible = true;
            }
        }

        protected void RemoveItem_Click(object sender, EventArgs e)
        {
            Button btnRemove = (Button)sender;
            int bookId = int.Parse(btnRemove.CommandArgument);
            List<CartItem> cart = (List<CartItem>)Session["Cart"];

            CartItem itemToRemove = cart.FirstOrDefault(item => item.BookId == bookId);
            if (itemToRemove != null)
            {
                cart.Remove(itemToRemove);
                Session["Cart"] = cart;
                Response.Redirect("Cart.aspx");
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["firstName"] == null) 
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Login to Check Out');", true);
            }
            else
            {
                Response.Redirect("CheckOut.aspx");
            }
        }
    }
}