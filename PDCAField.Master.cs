using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using PDCA_ASPX.Data;

namespace PDCA_ASPX
{
    public partial class PDCAField1 : System.Web.UI.MasterPage
    {
        private SqlConnection connection = new SqlConnection();
        private PDCAUser PDCATempUser = new PDCAUser();
        //private OdbcConnection connection = new OdbcConnection();
        public string strConnectionstring = "";

        private string userName = System.Web.HttpContext.Current.User.Identity.Name;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            PDCATempUser = (PDCAUser)Session["PDCAUser"];
            this.lblWelcomeUser.Text = "Welcome: " + PDCATempUser.UserFirstName + " " + PDCATempUser.UserLastName;
            this.lblWelcomeUser.Text += " - " + PDCATempUser.UserRole;
            this.tcPDCAFieldList.Visible = (PDCATempUser.UserRole == "Administrator");
       
        }


        public ArrayList GetGroups()
        {
            ArrayList groups = new ArrayList();
            foreach (System.Security.Principal.IdentityReference group in
            System.Web.HttpContext.Current.Request.LogonUserIdentity.Groups)
            {
                groups.Add(group.Translate(typeof
                (System.Security.Principal.NTAccount)).ToString());
            }
            return groups;
        }

     

        private void OpenConnection()
        {
            if (connection.State != ConnectionState.Open)
            {
                connection.Close();

                connection.ConnectionString = strConnectionstring;
                connection.Open();
            }
        }
        public static string NetworkUserID
        {
            get
            {
                object value = HttpContext.Current.Session["NetworkUserID"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["NetworkUserID"] = value;
            }
        }
        public static string UserFirstName
        {
            get
            {
                object value = HttpContext.Current.Session["FirstName"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["FirstName"] = value;
            }
        }
        public static string UserLastName
        {
            get
            {
                object value = HttpContext.Current.Session["LastName"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["LastName"] = value;
            }
        }
        public static string UserRole
        {
            get
            {
                object value = HttpContext.Current.Session["UserRole"];
                return value == null ? "" : (string)value;
            }
            set
            {
                HttpContext.Current.Session["UserRole"] = value;
            }
        }
        //public static Hashtable UserEndPointList
        //{
        //    get
        //    {
        //        object value = HttpContext.Current.Session["UserEndPointList"];
        //        return value ==  (Hashtable)value;
        //    }
        //    set
        //    {
        //        HttpContext.Current.Session["UserEndPointList"] = value;
        //    }
        //}
    }
}