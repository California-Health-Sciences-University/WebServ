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
    public partial class DepartmentEdit : System.Web.UI.Page
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
                this.lblDepartmentID.Text = Request.QueryString["DepartmentID"];
                LoadData();

            }
        }

        private void LoadData()
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            connection.ConnectionString = PDCATempUser.strConnectionstring;
            string sQuery = "Department_select ";

            sQuery += "@Departmentid =" + this.lblDepartmentID.Text + " ";
            connection.Open();
            using (connection)
            {
                SqlCommand command = new SqlCommand(sQuery, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        this.lblDepartmentID.Text = reader.GetInt32(0).ToString();
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
            LoadEntityList();
        }

        private void LoadEntityList()
        {
            //connection.ConnectionString = "Data Source = 4QLJWK2; Initial Catalog = PDCA; Integrated Security = True";
            connection.ConnectionString = PDCATempUser.strConnectionstring;
            string sQuery = "[DepartmentEntity_select] ";
            sQuery += "@Departmentid =" + this.lblDepartmentID.Text + " ";
            connection.Open();
            this.ddEntity.Items.Clear();
            ListItem l1a = new ListItem();
            l1a.Value = "";
            l1a.Text = "";
            l1a.Selected = false;
            this.ddEntity.Items.Add(l1a);
            using (connection)
            {
                SqlCommand command = new SqlCommand(sQuery, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ListItem l1 = new ListItem();
                        l1.Value = reader.GetInt32(0).ToString();
                        l1.Text = reader.GetString(1);
                        l1.Selected = Convert.ToBoolean(reader.GetString(6));
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
            SQLQuery = "Department_Update @Departmentid =" + this.lblDepartmentID.Text + ",";
            SQLQuery += " @name= '" + this.txtName.Text.Replace("'", "''") + "'";
            SQLQuery += " ,@description= '" + this.txtDescription.Text.Replace("'", "''") + "'";
            SQLQuery += " ,@entityid= " + this.ddEntity.SelectedValue;

            SqlCommand commanda = new SqlCommand("", connection);
            commanda.CommandText = SQLQuery;
            SqlDataReader readera = commanda.ExecuteReader();
            Response.Redirect("~/Departmentlist.aspx");
        }
    }
}