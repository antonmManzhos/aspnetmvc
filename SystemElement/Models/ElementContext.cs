using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace SystemElement.Models
{
    public class ElementContext : DbContext
    {
        public ElementContext(): base("DBConnection")
        {

        }
        public DbSet<Element> Elements { get; set; }
    }
}