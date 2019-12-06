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
    public partial class DepartmentList : System.Web.UI.Page
    {
        public string strConnString = "";
        private PDCAUser PDCATempUser = new PDCAUser();
        protected void Page_Load(object sender, EventArgs e)
        {
            PDCATempUser = (PDCAUser)Session["PDCAUser"];            
            if (!IsPostBack)
            {
                LoadGridData();
            }
        }

        private void LoadGridData()
        {
            string sQuery = "Department_select ";
            gvDepartmentList.DataSource = GetData(sQuery);
            gvDepartmentList.DataBind();
        }

        private DataTable GetData(string query)
        {
            string strConnString = PDCATempUser.strConnectionstring;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //string customerId = gvSONISStudents.DataKeys[e.Row.RowIndex].Value.ToString();
                //GridView gvEducation = e.Row.FindControl("gvEducation") as GridView;
                //gvEducation.DataSource = GetData(string.Format("select * from vwSonisEducation where [Source Id]='{0}'", customerId));
                //gvEducation.DataBind();

                //GridView gvMAddress = e.Row.FindControl("gvMailingAddress") as GridView;
                //gvMAddress.DataSource = GetData(string.Format("select * from vwSonisAddressesMailing where [Source Id]='{0}'", customerId));
                //gvMAddress.DataBind();

                //GridView gvPAddress = e.Row.FindControl("gvPermanentAddress") as GridView;
                //gvPAddress.DataSource = GetData(string.Format("select * from vwSonisAddressesPermanent where [Source Id]='{0}'", customerId));
                //gvPAddress.DataBind();

                //GridView gvLAddress = e.Row.FindControl("gvLocalAddress") as GridView;
                //gvLAddress.DataSource = GetData(string.Format("select * from vwSonisAddressesLocal where [Source Id]='{0}'", customerId));
                //gvLAddress.DataBind();
            }
        }

        protected void DepartmentGridView_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < gvDepartmentList.Rows.Count; i++)
            {
                // Ignore values that cannot be cast as integer.
                try
                {
                    if ((int)gvDepartmentList.DataKeys[i].Value == (int)ViewState["SelectedKey"])
                        gvDepartmentList.SelectedIndex = i;
                }
                catch { }
            }
        }

        protected void DepartmentGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvDepartmentList.SelectedIndex = -1;
        }

        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDepartmentList.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void gvDepartmentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvDepartmentList.SelectedIndex >= 0)
                ViewState["SelectedKey"] = gvDepartmentList.SelectedValue;
            else
                ViewState["SelectedKey"] = null;
            foreach (GridViewRow row1 in gvDepartmentList.Rows)
            {
                ImageButton IB2 = row1.FindControl("ClickImage") as ImageButton;
                if (row1 == gvDepartmentList.SelectedRow)
                {
                    IB2.ImageUrl = "~/images/btn_check_on_selected.png";
                }
                else
                {
                    //IB2.ImageUrl = "~/images/btn_check_off_selected.png";
                    IB2.ImageUrl = "";
                }
            }

            GridViewRow srow = gvDepartmentList.SelectedRow;
            //ImageButton IB1 = srow.FindControl("ClickImage") as ImageButton;
            //IB1.ImageUrl = "~/images/btn_check_on_selected.png";
            //string customerId = gvSONISStudents.DataKeys[e.Row.RowIndex].Value.ToString();
            //GridView gvEducation = this.Master.FindControl("MainContent").FindControl("grdEducation") as GridView;
            //gvEducation.DataSource = GetData(string.Format("select * from vwPharmCASCollegesAttendedETL where cas_id='{0}'", ViewState["SelectedKey"]));
            //gvEducation.DataBind();

            //GridView gAddress = this.Master.FindControl("MainContent").FindControl("grdAddress") as GridView;
            //gAddress.DataSource = GetData(string.Format("select * from vwPharmCASApplicantAddresses where cas_id='{0}'", ViewState["SelectedKey"]));
            //gAddress.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
        }
    }
}