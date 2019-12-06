using PDCA_ASPX.Data;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace PDCA_ASPX
{
    public partial class PDCAUserEdit : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection();
        private PDCAUser PDCATempUser = new PDCAUser();

        protected void Page_Load(object sender, EventArgs e)
        {
            PDCATempUser = (PDCAUser)Session["PDCAUser"];
            if (IsPostBack)
            {
            }
            else
            {
                this.lblPDCAUserID.Text = Request.QueryString["PDCAUserID"];
                LoadData();
            }
        }

        private void LoadData()
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            connection.ConnectionString = PDCATempUser.strConnectionstring;
            string sQuery = "PDCAUser_select ";

            sQuery += "@PDCAUserid =" + this.lblPDCAUserID.Text + " ";
            connection.Open();
            using (connection)
            {
                SqlCommand command = new SqlCommand(sQuery, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        this.lblPDCAUserID.Text = reader.GetInt32(0).ToString();
                        this.txtName.Text = reader.GetString(1);
                        this.ddUserType.SelectedValue = reader.GetString(4);
                    }
                    reader.Close();
                    LoadUserEndPointLists();
                }
                else
                {
                    Console.WriteLine("No rows found.");
                }
                if (!reader.IsClosed)
                {
                    reader.Close();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            connection.ConnectionString = PDCATempUser.strConnectionstring;
            string SQLQuery = "";
            connection.Open();
            SQLQuery = "PDCAUser_Update @PDCAUserid =" + this.lblPDCAUserID.Text + ",";

            //SQLQuery += " @description= '" + this.txtDescription.Text.Replace("'", "''") + "'";

            SqlCommand commanda = new SqlCommand("", connection);
            commanda.CommandText = SQLQuery;
            SqlDataReader readera = commanda.ExecuteReader();
            SaveUserEndpointLists();
            Response.Redirect("~/PDCAUserlist.aspx");
        }

        private void SaveUserEndpointLists()
        {
            for (int i = 1; i <= 4; i++)
            {
                SaveUserEndpointList(i);
            }
        }

        protected void SaveUserEndpointList(int iEntityID)
        {
            CheckBoxList cb1 = new CheckBoxList();
            switch (iEntityID)
            {
                case 1:
                    cb1 = this.ckblCOP;
                    break;

                case 2:
                    cb1 = this.ckblCOM;
                    break;

                case 3:
                    cb1 = this.ckblCHSU;
                    break;

                case 4:
                    cb1 = this.ckblOther;
                    break;
            }
            // clear out the existing list
            SqlCommand commanda = new SqlCommand("", connection);
            string sQuery = "UserClearEndpoints @pdcaUserid=" + this.lblPDCAUserID.Text;
            commanda.CommandText = sQuery;
            commanda.CommandType = CommandType.StoredProcedure;
            SqlDataReader readera = commanda.ExecuteReader();
            foreach (ListItem item1 in cb1.Items)
            {
                if (item1.Selected == true)
                {
                    commanda = new SqlCommand("", connection);
                    sQuery = "UserEndpoint_insert @pdcaUserid=" + this.lblPDCAUserID.Text;
                    sQuery += ", @endpointid=" + item1.Value;
                    commanda.CommandText = sQuery;
                    readera = commanda.ExecuteReader();
                }
            }
            readera.Close();
        }

        protected void LoadUserEndPointLists()
        {
            for (int i = 1; i <= 4; i++)
            {
                LoadUserEndPointList(i);
            }
        }

        private string LoadUserEndPointList(int iEntityID)
        {
            CheckBoxList cb1 = new CheckBoxList();
            switch (iEntityID)
            {
                case 1:
                    cb1 = this.ckblCOP;
                    break;

                case 2:
                    cb1 = this.ckblCOM;
                    break;

                case 3:
                    cb1 = this.ckblCHSU;
                    break;

                case 4:
                    cb1 = this.ckblOther;
                    break;
            }

            string sReturn = "";
            SqlCommand commandb = new SqlCommand("", connection);
            string sQuery = "UserEndpoint_Select @pdcauserid=" + this.lblPDCAUserID.Text;
            sQuery += (", @entityid=" + iEntityID.ToString());
            commandb.CommandText = sQuery;
            commandb.CommandType = CommandType.Text;
            SqlDataReader readerb = commandb.ExecuteReader();
            cb1.Items.Clear();

            if (readerb.HasRows)
            {
                while (readerb.Read())
                {
                    ListItem item1 = new ListItem();
                    item1.Text = readerb.GetString(6);
                    item1.Value = readerb.GetInt32(2).ToString();
                    item1.Selected = Convert.ToBoolean(readerb.GetString(7));
                    cb1.Items.Add(item1);
                }
            }
            readerb.Close();
            commandb.Dispose();
            return sReturn;
        }

        protected void btnVerifyName_Click(object sender, EventArgs e)
        {
            PDCAUser PDCATempUser1 = new PDCAUser();
            PDCATempUser1.VerifyUser(this.txtName.Text);
            this.lblUserName.Text = PDCATempUser1.UserFirstName + " " + PDCATempUser1.UserLastName;
            if (PDCATempUser1.PDCAUserGroupMember != "True")
            {
                this.lblError.Text = "This person is not a member of the PDCAUsers Group and cannot be added until they are added to the Network User Group.";
                this.btnSave.Enabled = false;
            }
            else
            {
                this.btnSave.Enabled = true;
                this.lblError.Text = "";
            }
        }
    }
}