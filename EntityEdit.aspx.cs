using PDCA_ASPX.Data;
using System;
using System.Collections.Generic;
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
    public partial class EntityEdit : System.Web.UI.Page
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
                this.lblEntityID.Text = Request.QueryString["EntityID"];
                LoadData();
            }
        }

        private void LoadData()
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            connection.ConnectionString = PDCATempUser.strConnectionstring;
            string sQuery = "Entity_select ";

            sQuery += "@Entityid =" + this.lblEntityID.Text + " ";
            connection.Open();
            using (connection)
            {
                SqlCommand command = new SqlCommand(sQuery, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        this.lblEntityID.Text = reader.GetInt32(0).ToString();
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
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            connection.ConnectionString = PDCATempUser.strConnectionstring;
            string SQLQuery = "";
            connection.Open();
            SQLQuery = "Entity_Update @Entityid =" + this.lblEntityID.Text + ",";
            SQLQuery += " @name= '" + this.txtName.Text.Replace("'", "''") + "'";
            SQLQuery += " ,@description= '" + this.txtDescription.Text.Replace("'", "''") + "'";

            SqlCommand commanda = new SqlCommand("", connection);
            commanda.CommandText = SQLQuery;
            SqlDataReader readera = commanda.ExecuteReader();
            Response.Redirect("~/Entitylist.aspx");
        }
    }
}