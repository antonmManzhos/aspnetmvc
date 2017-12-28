using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace SystemElement.Models
{
    public class UrlConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
        {
            ElementContext db = new ElementContext();
            if (values[parameterName] != null)
            {
                var permalink = values[parameterName].ToString();
                if (db.Elements.Any(p => p.Url == permalink))
                {
                    return true;
                }
                else
                {
                    if (permalink.IndexOf('/') != -1)
                    {
                        string[] arrayParams = permalink.Split('/');
                        int counterTrueElements = 0;
                        foreach (string param in arrayParams)
                        {
                            if(db.Elements.Any(p => p.Url == param))
                            {
                                counterTrueElements++;
                            }
                        }
                        return counterTrueElements == arrayParams.Length;
                    }
                }
            }
            return false;
        }
    }
}