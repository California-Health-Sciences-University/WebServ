using System;
using System.Configuration;
using System.Data.SqlClient;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Management;

namespace PDCA_ASPX.Data
{
    public class PDCAUser
    {
        public string strConnectionstring { get; set; }
        public string UserName { get; set; }
        public string UserRole { get; set; }
        public string UserFirstName { get; set; }
        public string UserLastName { get; set; }
        public string PDCAUserName { get; set; }
        public string PDCAUserGroupMember { get; set; }
        public string PDCAUserEntered { get; set; }
        public Int32 PDCAUserID { get; set; }
        public SqlConnection connection = new SqlConnection();

        public void VerifyCurrentUser()
        {
            ManagementObjectSearcher searcher = new ManagementObjectSearcher("SELECT UserName FROM Win32_ComputerSystem");
            ManagementObjectCollection collection = searcher.Get();
            string smusername = (string)collection.Cast<ManagementBaseObject>().First()["UserName"];

            UserName = smusername.Substring(6, smusername.Length - 6);
            //string sUserTemp =
            VerifyUser(UserName);
        }

        public void VerifyUser(string InUserName)
        {
            //ManagementObjectSearcher searcher = new ManagementObjectSearcher("SELECT UserName FROM Win32_ComputerSystem");
            //ManagementObjectCollection collection = searcher.Get();
            //string smusername = (string)collection.Cast<ManagementBaseObject>().First()["UserName"];
            //UserName = smusername + "  [--]  " + System.Security.Principal.WindowsIdentity.GetCurrent().Name + "  |--|  " + System.Web.HttpContext.Current.User.Identity.Name + " -- " + Environment.UserDomainName + "  --  " + Environment.UserName;
            strConnectionstring = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            GetUserbyNetworkID(InUserName);
            SetPDCAUserGroupMember(InUserName);
        }

        private void GetUserbyNetworkID(string InUserName)
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString; ;
            string sQuery = "PDCAUser_select ";
            sQuery += "@NetworkUserID =" + InUserName + " ";
            connection.Open();
            using (connection)
            {
                SqlCommand command = new SqlCommand(sQuery, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        //this.lblDepartmentID.Text = reader.GetInt32(0).ToString();
                        UserRole = reader.GetString(4);
                        UserFirstName = reader.GetString(2);
                        UserLastName = reader.GetString(3);
                        PDCAUserEntered = "True";
                        PDCAUserID = reader.GetInt32(0);
                        //this.txtDescription.Text = reader.GetString(2);
                    }
                }
                else
                {
                    //Console.WriteLine("No rows found.");
                    PDCAUserEntered = "False";
                }
                reader.Close();
            }
        }

        public void SetPDCAUserGroupMember(string InUserName)
        {
            //List<GroupPrincipal> result = new List<GroupPrincipal>();
            string result = "";
            // establish domain context
            PrincipalContext yourDomain = new PrincipalContext(ContextType.Domain);

            // find your user
            UserPrincipal user = UserPrincipal.FindByIdentity(yourDomain, InUserName);
            PDCAUserGroupMember = "False";
            // if found - grab its groups
            if (user != null)
            {
                PrincipalSearchResult<Principal> groups = user.GetAuthorizationGroups();

                // iterate over all groups
                foreach (Principal p in groups)
                {
                    if (p.Name.Contains("PDCAUsers"))
                    {
                        PDCAUserGroupMember = "True";
                    }
                    // make sure to add only group principals
                    //if (p is GroupPrincipal)
                    //{
                    //    //result.Add((GroupPrincipal)p);
                    //    //if (p.DisplayName == "PDCAUsers")
                    //    if (p.DisplayName != null)
                    //    {
                    //        if (p.DisplayName.Contains("PDCAUsers"))
                    //        {
                    //            PDCAUserGroupMember = "True";
                    //        }
                    //    }
                    //}
                }
            }

            //return result;
        }

        public void Save_NewUser()
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            
            string SQLQuery = "";
            //connection.Open();
            SQLQuery = "PDCAUsers_Insert ";
            SQLQuery += " @networkuserid= '" + UserName + "'";
            SQLQuery += " ,@firstname= '" + UserFirstName + "'";
            SQLQuery += " ,@lastname= '" + UserLastName + "'";
            SQLQuery += " ,@userrole= 'User'";
            SqlConnection con = new SqlConnection(strConnectionstring);
            con.Open();
            SqlCommand commanda = new SqlCommand(SQLQuery, con);
            commanda.CommandType = System.Data.CommandType.Text;
            SqlDataReader readera = commanda.ExecuteReader();
            //Response.Redirect("~/Entitylist.aspx");
        }

        //public List<GroupPrincipal> GetGroups(string userName)
        //{
        //    List<GroupPrincipal> result = new List<GroupPrincipal>();

        //    // establish domain context
        //    PrincipalContext yourDomain = new PrincipalContext(ContextType.Domain);

        //    // find your user
        //    UserPrincipal user = UserPrincipal.FindByIdentity(yourDomain, userName);
        //    PDCAUserGroupMember = "False";
        //    // if found - grab its groups
        //    if (user != null)
        //    {
        //        PrincipalSearchResult<Principal> groups = user.GetAuthorizationGroups();

        //        // iterate over all groups
        //        foreach (Principal p in groups)
        //        {
        //            // make sure to add only group principals
        //            if (p is GroupPrincipal)
        //            {
        //                result.Add((GroupPrincipal)p);
        //                if (p.DisplayName=="PDCAUsers")
        //                {
        //                    PDCAUserGroupMember = "True";
        //                }
        //            }
        //        }
        //    }

        //    return result;
        //}
    }
}