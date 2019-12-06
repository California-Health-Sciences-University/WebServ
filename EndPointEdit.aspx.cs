using PDCA_ASPX.Data;
using System;
using System.Collections.Generic;
using System.Collections;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace PDCA_ASPX
{
    public partial class EndPointEdit : System.Web.UI.Page
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
                this.lblEndpointID.Text = Request.QueryString["EndpointID"];
                LoadData();
            }
        }

        private void LoadData()
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            connection.ConnectionString = PDCATempUser.strConnectionstring;
            string sQuery = "Endpoint_select ";

            sQuery += "@Endpointid =" + this.lblEndpointID.Text + " ";
            connection.Open();
            using (connection)
            {
                SqlCommand command = new SqlCommand(sQuery, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        this.lblEndpointID.Text = reader.GetInt32(0).ToString();
                        this.txtName.Text = reader.GetString(1);
                        this.txtDescription.Text = reader.GetString(2);
                    }
                }
                else
                {
                    Console.WriteLine("No rows found.");
                }
                reader.Close();
            }
        }
        private void LoadEntityList()
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            connection.ConnectionString = PDCATempUser.strConnectionstring;
            string sQuery = "Entity_select ";            
            connection.Open();
            this.ddEntity.Items.Clear();
            using (connection)
            {
                SqlCommand command = new SqlCommand(sQuery, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ListItem l1 = new ListItem();
                        l1.Value = reader.GetString(1);
                        l1.Text = reader.GetString(1);
                        l1.Selected = Convert.ToBoolean( reader.GetString(1));
                        this.ddEntity.Items.Add(l1);
                   
                    }
                }
                else
                {
                    Console.WriteLine("No rows found.");
                }
                reader.Close();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            connection.ConnectionString = PDCATempUser.strConnectionstring;
            string SQLQuery = "";
            connection.Open();
            SQLQuery = "Endpoint_Update @Endpointid =" + this.lblEndpointID.Text + ",";
            SQLQuery += " @name= '" + this.txtName.Text.Replace("'", "''") + "'";
            SQLQuery += " ,@description= '" + this.txtDescription.Text.Replace("'", "''") + "'";
            SQLQuery += " ,@entityid= " + this.ddEntity.SelectedIndex.ToString();

            SqlCommand commanda = new SqlCommand("", connection);
            commanda.CommandText = SQLQuery;
            SqlDataReader readera = commanda.ExecuteReader();
            Response.Redirect("~/Endpointlist.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }
    }
}