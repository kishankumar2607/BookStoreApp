using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KishanKumarDas_BookStore.Models
{
    public class CartItem
    {
        public int BookId { get; set; }
        public string BookName { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }
}