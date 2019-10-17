using PDCA_ASPX.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Drawing;

namespace PDCA_ASPX
{
    public partial class _Default : Page
    {
 
        private DataTable dataTable;        
        private List<CheckBox> _CheckBoxes = new List<CheckBox>();
        private System.Web.UI.WebControls.Image sortImage = new System.Web.UI.WebControls.Image();
        
        private string WCUSCAccreditation = "";
        private string COCAAccreditation = "";
        private string ACPEAccreditation = "";
        private string strConnectionstring = "";
        private string userName = System.Web.HttpContext.Current.User.Identity.Name;

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] WCUSCAccreditationList = WCUSCAccreditation.Split('|');
            string[] COCAAccreditationList = COCAAccreditation.Split('|');
            string[] ACPEAccreditationList = ACPEAccreditation.Split('|');
            
            strConnectionstring = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            if (!IsPostBack)
            {
                //this..ViewState = Session["SearchView"];
                LoadGridData();
                BindGrid();
            }

        }

        public string SortDirectiona
        {
            get
            {
                if (ViewState["SortDirection"] == null)
                    return string.Empty;
                else
                    return ViewState["SortDirection"].ToString();
            }
            set
            {
                ViewState["SortDirection"] = value;
            }
        }

        private string _sortDirection;


        protected void PDCAGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            SetSortDirection(SortDirectiona);
            LoadGridData();
            if (dataTable != null)
            {
                //Sort the data.
                dataTable.DefaultView.Sort = e.SortExpression + " " + _sortDirection;
                gvPDCAList.DataSource = dataTable;
                gvPDCAList.DataBind();
                SortDirectiona = _sortDirection;
                int columnIndex = 0;
                foreach (DataControlFieldHeaderCell headerCell in gvPDCAList.HeaderRow.Cells)
                {
                    if (headerCell.ContainingField.SortExpression == e.SortExpression)
                    {
                        columnIndex = gvPDCAList.HeaderRow.Cells.GetCellIndex(headerCell);
                    }
                }
                sortImage.BackColor = System.Drawing.Color.Maroon;

                gvPDCAList.HeaderRow.Cells[columnIndex].Controls.Add(sortImage);
                gvPDCAList.SelectedIndex = -1;
            }
        }

        protected void SetSortDirection(string sortDirection)
        {
            if (sortDirection == "ASC")
            {
                _sortDirection = "DESC";
                sortImage.ImageUrl = "~/images/view_sort_ascending.png";
            }
            else
            {
                _sortDirection = "ASC";
                sortImage.ImageUrl = "~/images/view_sort_descending.png";
            }
        }

        private void LoadGridData()
        {
            string strentities = "";
            string strStatuses = "";
            string strSchoolYears = "";
            string strResults = "";

            foreach (ListItem item in ckblEntity.Items)
            {
                if (item.Selected == true)
                {
                    strentities += item.Value + "|";
                }
            }
            foreach (ListItem item in ckblStatus.Items)
            {
                if (item.Selected == true)
                {
                    strStatuses += item.Value + "|";
                }
            }
            foreach (ListItem item in ckblSchoolYear.Items)
            {
                if (item.Selected == true)
                {
                    strSchoolYears += item.Value + "|";
                }
            }

            string sQuery = "PDCA_select ";
            sQuery += "@department ='" + this.txtDepartment.Text + "' ";
            sQuery += ",@title='" + this.txtTitle.Text + "' ";
            sQuery += ", @description ='" + this.txtDescription.Text + "'";
            sQuery += ", @enteredby ='" + this.txtEnteredBy.Text + "'";
            sQuery += ", @entity ='" + this.ckblEntity.Text + "'";
            sQuery += ", @status ='" + this.ckblStatus.Text + "'";
            sQuery += ", @SchoolYear ='" + this.ckblSchoolYear.Text + "'";

            //sQuery += ", @paSurvey ='" + this.ckblResults.Text + "'";
            sQuery += ", @startdate ='" + this.txtStartDate.Text + "'";
            sQuery += ", @enddate ='" + this.txtEndDate.Text + "'";
            sQuery += ", @SubjectOfAssessementExamplesMatch ='" + this.txtSubjectofAssessmentExamplesSearch.Text + "'";
            sQuery += ", @AssessmentNameMatch ='" + this.txtAssessmentNameSearch.Text + "'";
            sQuery += ", @StrengthsMatch ='" + this.txtStrengthsSearch.Text + "'";
            sQuery += ", @InsightsMatch ='" + this.txtInsightsSearch.Text + "'";
            sQuery += ", @AreasforImprovementMatch ='" + this.txtAreasForImprovementSearch.Text + "'";
            sQuery += ", @PlanMatch ='" + this.txtPlanSearch.Text + "'";
            sQuery += ", @DoMatch ='" + this.txtDoSearch.Text + "'";
            sQuery += ", @CheckMatch ='" + this.txtCheckSearch.Text + "'";
            sQuery += ", @AdditionalCommentsMatch ='" + this.txtAdditionalCommentsSearch.Text + "'";
            sQuery += ", @ReportMustBeConveyedMatch ='" + this.txtReportMustBeConveyedSearch.Text + "'";

            GetAccreditationCheckboxesLists();  // sets the value of the following three parameters
            sQuery += ", @ACPEaccreditationstandards  ='" + ACPEAccreditation + "'";
            sQuery += ", @COCAaccreditationstandards  ='" + COCAAccreditation + "'";
            sQuery += ", @WCUSCaccreditationstandards ='" + WCUSCAccreditation + "'";
            //sQuery += ", @@paSurvey ='" + this.ckSurveyResults.Checked.ToString() + "'";
            //sQuery += ", @@paFocus ='" + this.ckFocusGroupResults.Checked.ToString() + "'";
            //sQuery += ", @@paFormative ='" + this.ckFormative.Checked.ToString() + "'";
            //sQuery += ", @@paProgram ='" + this.ckProgramOutcome.Checked.ToString() + "'";
            //sQuery += ", @@paInput ='" + this.ckInputData.Checked.ToString() + "'";
            //sQuery += ", @@paExternal ='" + this.ckExternalReview.Checked.ToString() + "'";
            //sQuery += ", @@paTests ='" + this.ckTests.Checked.ToString() + "'";
            //sQuery += ", @@paReview ='" + this.ckReview.Checked.ToString() + "'";
            //sQuery += ", @@paCLO ='" + this.ckCLO.Checked.ToString() + "'";
            //sQuery += ", @@paPlan ='" + this.ckPlan.Checked.ToString() + "'";
            //sQuery += ", @@@paOther ='" + this.ckPeerReview.Checked.ToString() + "'";
            //sQuery += ", @DoMatch ='" + this.ckOther.Checked.ToString() + "'";


            dataTable = GetData(sQuery);

        }

        private DataTable GetData(string query)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                con.ConnectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        con.ConnectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;

                        cmd.CommandText = query;

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

        protected void BindGrid()
        {

            gvPDCAList.DataSource = dataTable;
            gvPDCAList.DataBind();
        }

        public void GetAccreditationCheckboxesLists()
        {

            WCUSCAccreditation = getCBString("ckWCUSCAccreditation");
            COCAAccreditation = getCBString("ckCOCAAccreditation");
            ACPEAccreditation = getCBString("ckACPEStandards");
        }



        public void SetCBChecked(string startsWith, string checkBoxSettings)
        {

            string[] cbCheckedlist = checkBoxSettings.Split('|');

            List<CheckBox> allControls = new List<CheckBox>();
            GetControlList<CheckBox>(Page.Controls, allControls);
            foreach (var childControl in allControls)
            {
                if (childControl.ID.StartsWith(startsWith))
                {
                    CheckBox cb1 = (CheckBox)childControl;
                    cb1.Checked = cbCheckedlist.Contains(cb1.Text);
                }
                //     call for all controls of the page
            }

        }

        public string getCBString(string startsWith)
        {
            string sReturn = "";
            List<CheckBox> allControls = new List<CheckBox>();
            GetControlList<CheckBox>(Page.Controls, allControls);
            foreach (var childControl in allControls)
            {
                if (childControl.ID.StartsWith(startsWith))
                {
                    CheckBox cb1 = (CheckBox)childControl;
                    if (cb1.Checked)
                    {
                        sReturn += "|" + cb1.Text;
                    }
                }
                //     call for all controls of the page
            }
            return sReturn;
        }
        private void GetControlList<T>(ControlCollection controlCollection, List<T> resultCollection)
where T : Control
        {
            foreach (Control control in controlCollection)
            {
                //if (control.GetType() == typeof(T))
                if (control is T) // This is cleaner
                    resultCollection.Add((T)control);

                if (control.HasControls())
                    GetControlList(control.Controls, resultCollection);
            }
        }


        protected void PDCAGridView_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < gvPDCAList.Rows.Count; i++)
            {
                // Ignore values that cannot be cast as integer.
                try
                {
                    if ((int)gvPDCAList.DataKeys[i].Value == (int)ViewState["SelectedKey"])
                        gvPDCAList.SelectedIndex = i;
                }
                catch { }
            }
        }

        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPDCAList.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void gvPDCAList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvPDCAList.SelectedIndex >= 0)
                ViewState["SelectedKey"] = gvPDCAList.SelectedValue;
            else
                ViewState["SelectedKey"] = null;
            foreach (GridViewRow row1 in gvPDCAList.Rows)
            {
                ImageButton IB2 = row1.FindControl("ClickImage") as ImageButton;
                if (row1 == gvPDCAList.SelectedRow)
                {
                    IB2.ImageUrl = "~/images/btn_check_on_selected.png";
                }
                else
                {
                    //IB2.ImageUrl = "~/images/btn_check_off_selected.png";
                    IB2.ImageUrl = "";
                }
            }

            GridViewRow srow = gvPDCAList.SelectedRow;

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
            BindGrid();
            //Session["SearchView"] = this.ViewState;
            this.tcSearch.ActiveTabIndex = 0;
        }

        protected void btnClearSearch_Click(object sender, EventArgs e)
        {
            this.txtAdditionalCommentsSearch.Text = "";
            this.txtAreasForImprovementSearch.Text = "";
            this.txtAssessmentNameSearch.Text = "";
            this.txtCheckSearch.Text = "";
            this.txtDepartment.Text = "";
            this.txtDescription.Text = "";
            this.txtDoSearch.Text = "";
            this.txtEndDate.Text = "";
            this.txtEnteredBy.Text = "";
            this.txtPlanSearch.Text = "";
            this.txtReportMustBeConveyedSearch.Text = "";
            this.txtStartDate.Text = "";
            this.txtStrengthsSearch.Text = "";
            this.txtSubjectofAssessmentExamplesSearch.Text = "";
            this.txtTitle.Text = "";
            this.ckblEntity.ClearSelection();
            this.ckblSchoolYear.ClearSelection();
            this.ckblStatus.ClearSelection();

            ClearAccreditationCheckBoxes("ckWCUSCAccreditation");
            ClearAccreditationCheckBoxes("ckCOCAAccreditation");
            ClearAccreditationCheckBoxes("ckACPEStandards");
            LoadGridData();
            BindGrid();
        }

        protected void gvPDCAList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        //***************************************************************************************************************
        //******************  Get and set the Accreditation Checkboxes
        //**************************************************************************




        public void ClearAccreditationCheckBoxes(string startsWith)
        {

            List<CheckBox> allControls = new List<CheckBox>();
            GetControlList<CheckBox>(Page.Controls, allControls);
            foreach (var childControl in allControls)
            {
                if (childControl.ID.StartsWith(startsWith))
                {
                    CheckBox cb1 = (CheckBox)childControl;
                    cb1.Checked = false;
                }
                //     call for all controls of the page
            }
        }






    }
}