using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using PDCA_ASPX.Data;

namespace PDCA_ASPX
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            Session["EndpointList"] = new Hashtable();
            Session["NetworkUserID"] = new object();
            Session["UserRole"] = new object();
            Session["FirstName"] = new object();
            Session["LastName"] = new object();
            Session["PDCAUser"] = new PDCAUser();
        }
    }
}