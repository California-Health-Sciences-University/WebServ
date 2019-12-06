using System;
using System.DirectoryServices;
using System.Web.UI.WebControls;

namespace PDCA_ASPX.Data
{
    public class CheckNames
    {
        public static void AD(string strQuery, string strReturn, ref ListBox listbox1)
        {
            if (strQuery == "")
                return;
            // strQuery = "khalid.mehmood@mobilink.net"

            System.DirectoryServices.DirectoryEntry oroot = new System.DirectoryServices.DirectoryEntry("LDAP://mobilink");
            System.DirectoryServices.DirectorySearcher osearcher = new System.DirectoryServices.DirectorySearcher(oroot);
            System.DirectoryServices.SearchResult result;
            System.DirectoryServices.SearchResultCollection resultAll;
            osearcher.PropertiesToLoad.Clear();            
            osearcher.PropertiesToLoad.Add("department");
            osearcher.PropertiesToLoad.Add("displayName");
            osearcher.PropertiesToLoad.Add("userPrincipalName");
            osearcher.PropertiesToLoad.Add("givenname");
            osearcher.PropertiesToLoad.Add("sn");
            osearcher.PropertiesToLoad.Add("samAccountName");
            osearcher.PropertiesToLoad.Add("mail");
            // osearcher.Filter = "(&(objectCategory=person)(objectClass=user)(mail=" & strQuery & "))"  ' search filter
            //osearcher.Filter = "(&(anr=" + strQuery + ")(mail=*))";  // search filter
            osearcher.Filter = "";
            resultAll = osearcher.FindAll();

            if (resultAll.Count > 0)
            {
                foreach (SearchResult userResults in resultAll)
                {
                    string Last_Name = userResults.Properties["sn"][0].ToString();
                    string First_Name = userResults.Properties["givenname"][0].ToString();
                    string userName = userResults.Properties["samAccountName"][0].ToString();
                    string Email_Address = userResults.Properties["mail"][0].ToString();
                    listbox1.Items.Add(Last_Name + "|" + First_Name + "|" + userName + "|" + Email_Address);

                    //for (int i = 0; i <= (resultAll.Count - 1); i++)
                    //    listbox1.Items.Add(resultAll[i].Properties("mail")(0).ToString());
                }
            }

            oroot = null/* TODO Change to default(_) if this is not a reference type */;
            osearcher = null/* TODO Change to default(_) if this is not a reference type */;
            result = null/* TODO Change to default(_) if this is not a reference type */;
            resultAll = null/* TODO Change to default(_) if this is not a reference type */;

            return;
        }

        public static bool AuthenticateUserPassword(string szUserName, string szPassword)
        {
            bool result = false;
            string szUserDomain = "";
            string myLDAPPath;

            // Determine what the domain name should be.
            if (szUserName.Contains(@"\"))
            {
                // Pull the domain out of the user name.
                szUserDomain = szUserName.Substring(0, szUserName.IndexOf(@"\"));
                // Set user name to just user name.
                szUserName = szUserName.Substring(szUserName.IndexOf(@"\") + 1);
            }
            else if (szUserName.Contains("@"))
            {
                // User Name is in form of "user@domain"
                // Pull the domain out of the user name.
                szUserDomain = szUserName.Substring(szUserName.IndexOf("@") + 1);
                // Set user name to just user name.
                szUserName = szUserName.Substring(0, szUserName.IndexOf("@"));
            }
            else
            {
                // A "." refers to the local system.
                szUserDomain = Environment.MachineName;
                szUserName = szUserName.Substring(szUserName.IndexOf(@"\") + 1);
            }

            // Determine which entry it will need to be.
            if (string.Compare(szUserDomain, Environment.MachineName, true) == 0)
                myLDAPPath = "WinNT://" + szUserDomain;
            else
                myLDAPPath = "LDAP://" + szUserDomain;

            try
            {
                DirectoryEntry entry = new DirectoryEntry(myLDAPPath, szUserName, szPassword);
                object nativeObject = entry.NativeObject;
                result = true; // no exception thrown, user must exist
                nativeObject = null;  // be sure and clean up these object as this service could be used many times
                entry = null/* TODO Change to default(_) if this is not a reference type */;
            }
            catch (Exception ex)
            {
                result = false;
            }// exception thrown - no user with that name/pwd combination
            return result;
        }
    }
}