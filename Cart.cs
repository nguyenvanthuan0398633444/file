using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopWebApplication.Models;

namespace ShopWebApplication.Models
{
    public class Cart
    {
        public int Id { get; set; }
        public string name { get; set; }
        public int count { get; set; }
        public Nullable<decimal> cost { get; set; }
        public string photo { get; set; }
        public Nullable<decimal> intoMoney { get; set; }
        public Cart(int Ids, int counts)
        {
            using (ShopEntityDb db = new ShopEntityDb())
            {
                this.Id = Ids;
                Product sp = db.Products.Single(n => n.ProductID == Ids);
                name = sp.ProductName;
                cost = sp.Price;
                photo = sp.PhotoPath;
                count = counts;
                intoMoney = cost * count;
            }
                
        }
        public Cart(int Ids)
        {
            using (ShopEntityDb db = new ShopEntityDb())
            {
                this.Id = Ids;
                Product sp = db.Products.Single(n => n.ProductID == Ids);
                name = sp.ProductName;
                cost = sp.Price;
                photo = sp.PhotoPath;
                count = 1;
                intoMoney = cost * count;
            }

        }
        public Cart()
        {

        }
    }
}