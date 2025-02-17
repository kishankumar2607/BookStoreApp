using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KishanKumarDas_BookStore.Models;

namespace KishanKumarDas_BookStore
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Page.Title = "CheckOut";

                // Load cart summary here
                List<CartItem> cart = (List<CartItem>)Session["Cart"];
                if (cart != null)
                {
                    int totalItems = cart.Sum(item => item.Quantity);
                    lblTotalItems.Text = totalItems.ToString();

                    decimal totalPrice = cart.Sum(item => item.Quantity * item.Price);
                    decimal totalAfterTax = totalPrice * 1.13m;
                    lblTotalPrice.Text = totalAfterTax.ToString("C");
                }
            }
        }

        protected void btnSubmitOrder_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Retrieve form data
                string email = txtEmail.Text;
                string emailAgain = txtEmailAgain.Text;
                string firstName = txtFirstName.Text;
                string lastName = txtLastName.Text;
                string phone = txtPhone.Text;
                string address = txtAddress.Text;
                string city = txtCity.Text;
                string state = txtState.Text;
                string country = txtCountry.Text;
                string paymentMethod = ddlPaymentMethod.SelectedValue;
                string cardNumber = txtCardNumber.Text;
                string expiryDate = txtExpiryDate.Text;
                string cvv = txtCVV.Text;

                Session.Remove("Cart");

                Response.Redirect("OrderConfirmation");
            }
        }
    }
}