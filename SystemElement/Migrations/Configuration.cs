namespace SystemElement.Migrations
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using SystemElement.Models;

    internal sealed class Configuration : DbMigrationsConfiguration<SystemElement.Models.ElementContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(SystemElement.Models.ElementContext context)
        {

        }
    }
}
