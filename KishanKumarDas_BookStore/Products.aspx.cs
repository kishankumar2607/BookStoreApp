 using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using KishanKumarDas_BookStore.Models;

namespace KishanKumarDas_BookStore
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Page.Title = "Products";

                DropDownList1.DataBind();
                DropDownListBook.DataBind();

                if (DropDownListBook.Items.Count > 0)
                {
                    DropDownListBook.SelectedIndex = 0;
                    LoadBookDetails();
                }
            }

            // Initialize shopping cart session if it doesn't exist
            if (Session["Cart"] == null)
            {
                Session["Cart"] = new List<CartItem>();
            }

            if (Session["firstName"] != null)
            {
                lblWelcomMessage.Text = "Welcome Back, " + Session["firstName"] + " " + Session["lastName"];
            }
            else
            {
                lblWelcomMessage.Visible= false;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Rebind the books dropdown when category selection changes
            DropDownListBook.DataBind();

            // Load book details if available, otherwise clear details
            if (DropDownListBook.Items.Count > 0)
            {
                DropDownListBook.SelectedIndex = 0;
                LoadBookDetails();
            }
            else
            {
                lblBookName.Text = "";
                lblShortDesc.Text = "";
                lblLongDesc.Text = "";
                lblUnitPrice.Text = "";
            }
        }

        protected void DropDownListBook_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Load book details when a new book is selected
            LoadBookDetails();
        }

        private void LoadBookDetails()
        {
            // Clear labels if no book is selected
            if (DropDownListBook.SelectedValue == "")
            {
                lblBookName.Text = "";
                lblShortDesc.Text = "";
                lblLongDesc.Text = "";
                lblUnitPrice.Text = "";
                return;
            }

            // Retrieve book details from the database
            DataView bookTable = (DataView)SqlDataSourceBook.Select(DataSourceSelectArguments.Empty);
            bookTable.RowFilter = "BookId = '" + DropDownListBook.SelectedValue + "'";

            // Populate the book details labels if data exists  
            if (bookTable.Count > 0)
            {
                DataRowView row = bookTable[0];
                lblBookName.Text = row["BookName"].ToString();
                lblShortDesc.Text = row["ShortDescription"].ToString();
                lblLongDesc.Text = row["LongDescription"].ToString();
                lblUnitPrice.Text = Convert.ToDecimal(row["UnitPrice"]).ToString("c") + " each";
            }
        }

        protected void btnPlus_Click(object sender, EventArgs e)
        {
            // Increase quantity by 1 when the plus button is clicked
            int quantity = int.Parse(txtQuantity.Text);
            txtQuantity.Text = (quantity + 1).ToString();
        }

        protected void btnMinus_Click(object sender, EventArgs e)
        {
            // Decrease quantity by 1 when the minus button is clicked
            int quantity = int.Parse(txtQuantity.Text);
            if (quantity > 1)
            {
                txtQuantity.Text = (quantity - 1).ToString();
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtQuantity.Text, out int quantity) || quantity < 1)
            {
                lblMessage.Text = "Please enter a valid quantity.";
                return;
            }

            // Retrieve user-selected quantity and book details
            string bookName = DropDownListBook.SelectedItem.Text;
            int bookId = int.Parse(DropDownListBook.SelectedValue);
            decimal price = GetBookPrice(bookId);

            // Get the cart from session or initialize a new list
            List<CartItem> cart = (List<CartItem>)Session["Cart"];

            if (cart == null)
            {
                cart = new List<CartItem>();
            }

            // Check if adding more books exceeds the cart limit (max 10 books)
            if (cart.Sum(item => item.Quantity) + quantity > 10)
            {
                lblMessage.Text = "You can only add up to 10 books in your cart.";
                return;
            }

            // Check if the book is already in the cart, update quantity if found
            var existingItem = cart.FirstOrDefault(item => item.BookId == bookId);

            if (existingItem != null)
            {
                existingItem.Quantity += quantity;
            }
            else
            {
                // Add a new book item to the cart
                CartItem newItem = new CartItem
                {
                    BookId = bookId,
                    BookName = bookName,
                    Quantity = quantity,
                    Price = price
                };
                cart.Add(newItem);
            }

            // Update the cart in the session
            Session["Cart"] = cart;

            // Display confirmation message
            lblMessage.Text = $"{quantity} x {bookName} has been added to the cart.";
        }


        protected void btnGoToCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        private decimal GetBookPrice(int bookId)
        {
            DataView bookTable = (DataView)SqlDataSourceBook.Select(DataSourceSelectArguments.Empty);
            bookTable.RowFilter = "BookId = '" + bookId + "'";

            if (bookTable.Count > 0)
            {
                DataRowView row = bookTable[0];
                return Convert.ToDecimal(row["UnitPrice"]);
            }
            return 0;
        }
    }
}