using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ReportingServices.Rendering;
using Microsoft.ReportingServices;
using System.Runtime.InteropServices;
using System.Web.


namespace PDCA_ASPX
{
    public partial class Report11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportingService2010 rs1 = new ReportingService2010;
            //ReportingService2010 rs = new ReportingService2010();
            rs.Credentials = System.Net.CredentialCache.DefaultCredentials;
            CatalogItem[] items = rs.ListChildren("/", true);
        }
    }
}