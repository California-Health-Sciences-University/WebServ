using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.Odbc;
using System.Configuration;

namespace PDCA_ASPX
{
    public partial class PDCAField1 : System.Web.UI.MasterPage
    {
        private SqlConnection connection = new SqlConnection();
        //private OdbcConnection connection = new OdbcConnection();
        public string strConnectionstring = "";
        private string userName = System.Web.HttpContext.Current.User.Identity.Name;

        protected void Page_Load(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            Session["UserName"] = userName;
            Session["Connstr"] = strcon;
            strConnectionstring = Session["Connstr"].ToString();
            Session["UserType"] = GetApplicationUserType();
            this.lblUserName.Text = userName;
            if (GetApplicationUserType() == "Approver")
            {
                this.tcPDCAFieldList.Visible = true;
            }
            else
            {
                this.tcPDCAFieldList.Visible = false;
            }
        }

        private string GetApplicationUserType()
        {
            string sReturn = "";
            string errormessage1 = "";
            OpenConnection();
            string sQuery = "PDCAUser_select ";
            sQuery += "@NetworkUserID ='" + userName + "' ";
            try
            {
                using (connection)
                {
                    SqlCommand command = new SqlCommand(sQuery, connection);
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            sReturn = reader.GetString(4);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                errormessage1 = ex.Message.ToString();
                errormessage1 += "";
                //lblResults.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
            return sReturn;
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
    }
}