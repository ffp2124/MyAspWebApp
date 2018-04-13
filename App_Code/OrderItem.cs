using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderItem
/// </summary>
namespace Model
{
    public class OrderItem
    {
        public int shoeId { get; set; }
        public double price { get; set; }
        public string color { get; set; }
        public double size { get; set; }
        public int qty { get; set; }
        public double subTotal
        {
            get
            {
                return this.price * this.qty;
            }
            set
            {
                this.subTotal = this.price * this.qty;
            }
        }
        public OrderItem(int shoeId, double price, string color, double size)
        {
            this.shoeId = shoeId;
            this.price = price;
            this.color = color;
            this.size = size;
            this.qty = 1;
        }
    }

}