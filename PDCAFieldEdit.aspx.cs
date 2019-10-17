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
    public partial class PDCAFieldEdit : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
            }
            else
            {
                this.lblFieldID.Text = Request.QueryString["PDCAFieldID"];
                LoadData();
            }
        }

        private void LoadData()
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            connection.ConnectionString = Session["Connstr"].ToString();
            string sQuery = "PDCAFields_select ";

            sQuery += "@pdcafieldid =" + this.lblFieldID.Text + " ";
            connection.Open();
            using (connection)
            {
                SqlCommand command = new SqlCommand(sQuery, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        this.lblFieldID.Text = reader.GetInt32(0).ToString();
                        this.lblFieldName.Text = reader.GetString(1);
                        this.lblTitle.Text = reader.GetString(3);
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
            connection.ConnectionString = Session["Connstr"].ToString();
            string SQLQuery = "";
            connection.Open();
                 SQLQuery = "PDCAField_Update @pdcafieldid =" + this.lblFieldID.Text + ",";

            SQLQuery += " @description= '" + this.txtDescription.Text.Replace("'","''") + "'";
          
            SqlCommand commanda = new SqlCommand("", connection);
            commanda.CommandText = SQLQuery;
            SqlDataReader readera = commanda.ExecuteReader();
            Response.Redirect("~/pdcafieldlist.aspx");
        }
    }
}