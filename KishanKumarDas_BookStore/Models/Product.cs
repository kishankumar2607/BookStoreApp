using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KishanKumarDas_BookStore.Models
{
    public class Product
    {
        public int BookId { get; set; }
        public string BookName { get; set; }
        public string ShortDescription { get; set; }
        public string LongDescription { get; set; }
        public decimal UnitPrice { get; set; }
    }
}