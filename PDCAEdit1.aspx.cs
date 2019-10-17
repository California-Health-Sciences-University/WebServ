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


namespace PDCA_ASPX
{
    public partial class PDCAEdit1 : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection();

        //public string strConnectionstring = "Data Source = 4QLJWK2; Initial Catalog = PDCAFS; Integrated Security = True";
        public string strConnectionstring = "";

        private string userName = System.Web.HttpContext.Current.User.Identity.Name;
        private List<TextBox> _TextBoxes;

        private List<CheckBox> _CheckBoxes;
        private string WCUSCAccreditation = "";
        private string COCAAccreditation = "";
        private string ACPEAccreditation = "";
        private string PDCAFile = "";

        private DataSet ds;
        private DataTable dataTable;
        private System.Web.UI.WebControls.Image sortImage = new System.Web.UI.WebControls.Image();
        private string sortDirection = "ASC";
        private Boolean NotesExpansion=false;

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] WCUSCAccreditationList = WCUSCAccreditation.Split('|');
            string[] COCAAccreditationList = COCAAccreditation.Split('|');
            string[] ACPEAccreditationList = ACPEAccreditation.Split('|');
            _CheckBoxes = new List<CheckBox>();
            _TextBoxes = new List<TextBox>();
            strConnectionstring = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            OpenConnection();
            if (IsPostBack)
            {
                SetNotesExpansion(NotesExpansion);
            }
            else
            {
                if (!String.IsNullOrEmpty(Request.QueryString["PDCAID"]))
                {
                    this.txtPDCAID.Text = Request.QueryString["PDCAID"];
                }
                else
                {
                    this.txtPDCAID.Text = "0";
                    this.ddSchoolYear.SelectedValue = DateTime.Now.Year.ToString();
                    this.btnSaveSubmit.Visible = false;
                    this.pnlDocuments.Visible = false;
                    this.lblDocumentsError.Text = "Cannot add documents until the SII PDCA is saved.";
                    this.gvDocuments.Visible = false;
                }
                if (this.txtPDCAID.Text != "0")
                {
                    LoadData();
                    this.ddSchoolYear.Enabled = false;
                    this.pnlDocuments.Visible = true;
                    this.gvDocuments.Visible = true;
                    this.lblDocumentsError.Text = "";
                }
                LoadNoteFieldDescriptions();
                LoadGridData();
                BindGrid();
                NotesExpansion = false;                
                //SetNotesExpansion(NotesExpansion);
            }
        }

        private void ClearErrors()
        {
            this.lblDocumentsError.Visible = false;
            this.lblErrorAdditionalComments.Visible = false;
            this.lblErrorAreasForImprovement.Visible = false;
            this.lblErrorAssessments.Visible = false;
            this.lblErrorAssessmentTools.Visible = false;
            this.lblErrorCheck.Visible = false;
            this.lblErrorDo.Visible = false;
            this.lblErrorHeader.Visible = false;
            this.lblErrorInsights.Visible = false;
            this.lblErrorPlan.Visible = false;
            this.lblErrorReport.Visible = false;
            this.lblErrorStrengths.Visible = false;
            this.lblErrorSubjectofAssessment.Visible = false;
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

        private void LoadData()
        {
            OpenConnection();
            string sQuery = "PDCA_select ";

            sQuery += "@pdcaid =" + this.txtPDCAID.Text + " ";

            using (connection)
            {
                SqlCommand command = new SqlCommand(sQuery, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        this.txtPDCAID.Text = reader.GetInt32(0).ToString();
                        this.lblPCDAID.Text = reader.GetInt32(0).ToString();
                        this.lblDate.Text = reader.GetDateTime(1).ToString();

                        this.txtOriginatorName.Text = reader.GetString(3);
                        this.txtDepartment.Text = reader.GetString(5);
                        this.txtTitle.Text = reader.GetString(6);
                        this.txtDescription.Text = reader.GetString(7);

                        this.ddSchoolYear.SelectedValue = reader.GetInt32(8).ToString();
                        this.lblSchoolYearID.Text = reader.GetInt32(9).ToString();
                        this.lblStatus.Text = reader.GetString(10);

                        //-- submissionteam
                        this.ckSurveyResults.Checked = Convert.ToBoolean(reader.GetString(12));
                        this.ckFocusGroupResults.Checked = Convert.ToBoolean(reader.GetString(13));
                        this.ckFormative.Checked = Convert.ToBoolean(reader.GetString(14));
                        this.ckProgramOutcome.Checked = Convert.ToBoolean(reader.GetString(15));
                        this.ckInputData.Checked = Convert.ToBoolean(reader.GetString(16));
                        this.ckExternalReview.Checked = Convert.ToBoolean(reader.GetString(17));
                        this.ckTests.Checked = Convert.ToBoolean(reader.GetString(18));
                        this.ckReview.Checked = Convert.ToBoolean(reader.GetString(19));
                        this.ckCLO.Checked = Convert.ToBoolean(reader.GetString(20));
                        this.ckPlan.Checked = Convert.ToBoolean(reader.GetString(21));
                        this.ckPeerReview.Checked = Convert.ToBoolean(reader.GetString(22));
                        this.ckOther.Checked = Convert.ToBoolean(reader.GetString(23));
                        if (reader.GetString(24).Contains("CHSU"))
                        {
                            this.ckCHSU.Checked = true;
                        }
                        if (reader.GetString(24).Contains("COP"))
                        {
                            this.ckCOP.Checked = true;
                        }
                        if (reader.GetString(24).Contains("COM"))
                        {
                            this.ckCOM.Checked = true;
                        }
                        if (reader.GetString(24).Contains("Unsure"))
                        {
                            this.ckUnsure.Checked = true;
                        }
                        WCUSCAccreditation = reader.GetString(25);
                        COCAAccreditation = reader.GetString(26);
                        ACPEAccreditation = reader.GetString(27);
                        SetAccreditationCheckboxes();
                        if (lblStatus.Text == "Submitted")
                        {
                            btnSaveContinue.Enabled = false;
                            if (Session["UserType"].ToString() == "Approver")
                            {
                                btnSaveSubmit.Text = "Save as Complete";
                            }
                        }
                        if (lblStatus.Text == "Complete")
                        {
                            LockAllControls();
                        }
                    }
                }
                else
                {
                    Console.WriteLine("No rows found.");
                }
                reader.Close();
                LoadNoteFieldDescriptions();
                LoadNoteFields();
            }
        }

        private void LockAllControls()
        {
            this.txtPDCAID.Enabled = false;
            this.lblPCDAID.Enabled = false;
            this.lblDate.Enabled = false;

            this.txtOriginatorName.Enabled = false;
            this.txtDepartment.Enabled = false;
            this.txtTitle.Enabled = false;
            this.txtDescription.Enabled = false;

            this.ddSchoolYear.Enabled = false;
            this.lblSchoolYearID.Enabled = false;
            this.lblStatus.Enabled = false;
            //-- submissionteam
            this.ckSurveyResults.Enabled = false;
            this.ckFocusGroupResults.Enabled = false;
            this.ckFormative.Enabled = false;
            this.ckProgramOutcome.Enabled = false;
            this.ckInputData.Enabled = false;
            this.ckExternalReview.Enabled = false;
            this.ckTests.Enabled = false;
            this.ckReview.Enabled = false;
            this.ckCLO.Enabled = false;
            this.ckPlan.Enabled = false;
            this.ckPeerReview.Enabled = false;
            this.ckOther.Enabled = false;
            this.ckCHSU.Enabled = false;
            this.ckCOP.Enabled = false;
            this.ckCOM.Enabled = false;
            //ckblACPE.Enabled = false;
            //ckblCOCA1.Enabled = false;
            //ckblCOCA2.Enabled = false;
            //ckblCOCA3.Enabled = false;
            //ckblCOCA4.Enabled = false;
            //ckblCOCA5.Enabled = false;
            //ckblWCUSC1.Enabled = false;
            //ckblWCUSC2.Enabled = false;
            //ckblWCUSC3.Enabled = false;
            //ckblWCUSC4.Enabled = false;
            this.btnSaveContinue.Visible = false;
            if (this.lblStatus.Text == "Complete")
            {
                this.btnSaveSubmit.Visible = false;
            }
        }

        private void LoadNoteFieldDescriptions()
        {
            OpenConnection();
            SqlCommand commanda = new SqlCommand("", connection);
            for (int i = 1; i <= 10; i++)
            {
                string sQuery = "PDCAFields_select @pdcafieldid= " + i.ToString();
                commanda.CommandText = sQuery;

                SqlDataReader readera = commanda.ExecuteReader();
                if (readera.HasRows)
                {
                    while (readera.Read())
                    {
                        if (i == 1)
                        {
                            this.litSubjectofAssessmentDescription.Text = readera.GetString(2);
                        }
                        if (i == 2)
                        {
                            this.litAssessmentNameDescription.Text = readera.GetString(2);
                        }
                        if (i == 3)
                        {
                            this.litStrengthsDescription.Text = readera.GetString(2);
                        }
                        if (i == 4)
                        {
                            this.litInsightsDescription.Text = readera.GetString(2);
                        }
                        if (i == 5)
                        {
                            this.litAreasForImprovementDescription.Text = readera.GetString(2);
                        }
                        if (i == 6)
                        {
                            this.litPlanDescription.Text = readera.GetString(2);
                        }
                        if (i == 7)
                        {
                            this.litDoDescription.Text = readera.GetString(2);
                        }
                        if (i == 8)
                        {
                            this.litCheckDescription.Text = readera.GetString(2);
                        }
                        if (i == 9)
                        {
                            this.litAdditionalCommentsDescription.Text = readera.GetString(2);
                        }
                        if (i == 10)
                        {
                            this.litReportDescription.Text = readera.GetString(2);
                        }
                    }
                }
                readera.Close();
            }
            //connection.Close();
        }

        public struct vPage
        {
            public string controlname;
            public string fieldtitle;
            public string errormessage;
        }

        public int ValidatePage()
        {
            string sreturn = "";

            List<vPage> errors = new List<vPage>();
            lblErrorAdditionalComments.Text = "";
            lblErrorAreasForImprovement.Text = "";
            lblErrorAssessments.Text = "";
            lblErrorCheck.Text = "";
            lblErrorDo.Text = "";
            lblErrorHeader.Text = "";
            lblErrorInsights.Text = "";
            lblErrorPlan.Text = "";
            lblErrorReport.Text = "";
            lblErrorStrengths.Text = "";
            lblErrorSubjectofAssessment.Text = "";
            this.lblErrorAssessmentTools.Text = "";

            if (this.ckAdditionalCommentsNotApplicable.Checked == true && this.txtAdditionalComments.Text.Trim() != "")
            {
                errors.Add(new vPage() { controlname = "txtAdditionalComments", fieldtitle = "Additional Comments", errormessage = "Additional Comments must be blank if N/A is checked." });
                this.lblErrorAdditionalComments.Text = "Additional Comments must be blank if N/A is checked.";
            }
            if (this.ckAreasForImprovementNotApplicable.Checked == true && this.txtAreasForImprovement.Text.Trim() != "")
            {
                errors.Add(new vPage() { controlname = "txtAreasforImprovement", fieldtitle = "Areas for Improvement", errormessage = "Areas for Improvement must be blank if N/A is checked." });
                this.lblErrorAreasForImprovement.Text = "Areas for Improvement must be blank if N/A is checked.";
            }
            if (this.ckAssessmentsNotApplicable.Checked == true && this.txtAssessmentName.Text.Trim() != "")
            {
                errors.Add(new vPage() { controlname = "txtAssessmentName", fieldtitle = "AssessmentName", errormessage = "Assessment Name must be blank if N/A is checked." });
                this.lblErrorAssessments.Text = "Assessment Name must be blank if N/A is checked.";
            }
            if (this.ckCheckNotApplicable.Checked == true && this.txtCheck.Text.Trim() != "")
            {
                errors.Add(new vPage() { controlname = "txtCheck", fieldtitle = "Check", errormessage = "Check  must be blank if N/A is checked." });
                lblErrorCheck.Text = "Check  must be blank if N/A is checked.";
            }
            if (this.ckDoNotApplicable.Checked == true && this.txtDo.Text.Trim() != "")
            {
                errors.Add(new vPage() { controlname = "txtDo", fieldtitle = "Do", errormessage = "Do must be blank if N/A is checked." });
                lblErrorDo.Text = "Do must be blank if N/A is checked.";
            }
            if (this.ckInsightsNotApplicable.Checked == true && this.txtInsights.Text.Trim() != "")
            {
                errors.Add(new vPage() { controlname = "txtInsights", fieldtitle = "Insights", errormessage = "Insights must be blank if N/A is checked." });
                lblErrorInsights.Text = "Insights must be blank if N/A is checked.";
            }
            if (this.ckPlanNotApplicable.Checked == true && this.txtPlan.Text.Trim() != "")
            {
                errors.Add(new vPage() { controlname = "txtPlan", fieldtitle = "Plan", errormessage = "Plan must be blank if N/A is checked." });
                lblErrorPlan.Text = "Plan must be blank if N/A is checked.";
            }
            if (this.ckReportNotApplicable.Checked == true && this.txtReport.Text.Trim() != "")
            {
                errors.Add(new vPage() { controlname = "txtReport", fieldtitle = "Report", errormessage = "Report must be blank if N/A is checked." });
                lblErrorReport.Text = "Report must be blank if N/A is checked.";
            }
            if (this.ckStrengthsNotApplicable.Checked == true && this.txtStrengths.Text.Trim() != "")
            {
                errors.Add(new vPage() { controlname = "txtStrengths", fieldtitle = "Strengths", errormessage = "Strengths must be blank if N/A is checked." });
            }

            if (this.ckSubjectNotApplicable.Checked == true && this.txtSubjectOfAssessmentExamples.Text.Trim() != "")
            {
                errors.Add(new vPage() { controlname = "txtSubjectOfAssessmentExamples", fieldtitle = "Subject Of Assessment Examples", errormessage = "Subject of Assessment Examples must be blank if N/A is checked." });
                lblErrorSubjectofAssessment.Text = "Subject of Assessment Examples must be blank if N/A is checked.";
            }

            if (this.ckAdditionalCommentsNotApplicable.Checked == false && this.txtAdditionalComments.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtAdditionalComments", fieldtitle = "Additional Comments", errormessage = "Additional Comments must be entered or N/A must be checked." });
                lblErrorAdditionalComments.Text = "Additional Comments must be entered or N/A must be checked.";
            }
            if (this.ckAreasForImprovementNotApplicable.Checked == false && this.txtAreasForImprovement.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtAreasforImprovement", fieldtitle = "Areas for Improvement", errormessage = "Areas for Improvement must be entered or N/A must be checked." });
                lblErrorAreasForImprovement.Text = "Areas for Improvement must be entered or N/A must be checked.";
            }
            if (this.ckAssessmentsNotApplicable.Checked == false && this.txtAssessmentName.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtAssessmentName", fieldtitle = "AssessmentName", errormessage = "Assessment Name must be entered or N/A must be checked." });
                lblErrorAssessments.Text = "Assessment Name must be entered or N/A must be checked.";
            }
            if (this.ckCheckNotApplicable.Checked == false && this.txtCheck.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtCheck", fieldtitle = "Check", errormessage = "Check must be entered or N/A must be checked." });
                lblErrorCheck.Text = "Check must be entered or N/A must be checked.";
            }
            if (this.ckDoNotApplicable.Checked == false && this.txtDo.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtDo", fieldtitle = "Do", errormessage = "Do must be entered or N/A must be checked." });
                lblErrorDo.Text = "Do must be entered or N/A must be checked.";
            }
            if (this.ckInsightsNotApplicable.Checked == false && this.txtInsights.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtInsights", fieldtitle = "Insights", errormessage = "Insights must be entered or N/A must be checked." });
                lblErrorInsights.Text = "Insights must be entered or N/A must be checked.";
            }
            if (this.ckPlanNotApplicable.Checked == false && this.txtPlan.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtPlan", fieldtitle = "Plan", errormessage = "Plan must be entered or N/A must be checked." });
                lblErrorPlan.Text = "Plan must be entered or N/A must be checked.";
            }
            if (this.ckReportNotApplicable.Checked == false && this.txtReport.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtReport", fieldtitle = "Report", errormessage = "Report Must be Submitted must be entered or N/A must be checked." });
                lblErrorReport.Text = "Report Must be Submitted must be entered or N/A must be checked.";
            }
            if (this.ckStrengthsNotApplicable.Checked == false && this.txtStrengths.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtStrengths", fieldtitle = "Strengths", errormessage = "Strengths must be entered or N/A must be checked." });
                lblErrorStrengths.Text = "Strengths must be entered or N/A must be checked.";
            }

            if (this.ckSubjectNotApplicable.Checked == false && this.txtSubjectOfAssessmentExamples.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtSubjectOfAssessmentExamples", fieldtitle = "Subject Of Assessment Examples", errormessage = "Subject of Assessment Examples must be entered or N/A must be checked." });
                lblErrorSubjectofAssessment.Text = "Subject of Assessment Examples must be entered or N/A must be checked.";
            }

            if (this.txtTitle.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtTitle", fieldtitle = "Title", errormessage = "Title must be entered." });
                lblErrorHeader.Text = "Title must be entered.";
            }
            if (this.txtDescription.Text.Trim() == "")
            {
                errors.Add(new vPage() { controlname = "txtDescription", fieldtitle = "Description", errormessage = "Description must be entered." });
                lblErrorHeader.Text = "Description must be entered.";
            }
            //if ((this.ckCHSU.Checked == false) && this.ckCOM.Checked == false && ckCOP.Checked = false && ckUnsure.Checked == false)
            if ((this.ckCHSU.Checked == false) && (this.ckCOM.Checked == false) && (ckCOP.Checked = false) && (ckUnsure.Checked == false))
            {
                errors.Add(new vPage() { controlname = "Entity", fieldtitle = "Entity", errormessage = "Entity must be selected." });
                lblErrorHeader.Text = "Entity must be selected.";
            }

            return errors.Count;
        }

        private void LoadNoteFields()
        {
            this.txtSubjectOfAssessmentExamples.Text = GetNote(1);
            this.txtAssessmentName.Text = GetNote(2);
            this.txtStrengths.Text = GetNote(3);
            this.txtInsights.Text = GetNote(4);
            this.txtAreasForImprovement.Text = GetNote(5);
            this.txtPlan.Text = GetNote(6);
            this.txtDo.Text = GetNote(7);
            this.txtCheck.Text = GetNote(8);
            this.txtAdditionalComments.Text = GetNote(9);
            this.txtReport.Text = GetNote(10);
        }

        private string GetNote(Int32 fieldID)
        {
            OpenConnection();
            string sReturn = "";
            SqlCommand commanda = new SqlCommand("", connection);
            string sQuery = "PDCANotes_select @pdcaid=" + txtPDCAID.Text;
            string sQuery2 = sQuery + " ,@pdcafieldid= " + fieldID.ToString();
            commanda.CommandText = sQuery2;
            SqlDataReader readera = commanda.ExecuteReader();
            if (readera.HasRows)
            {
                while (readera.Read())
                {
                    sReturn = readera.GetString(12);
                }
            }
            readera.Close();
            return sReturn;
        }

        private void SaveData(string strStatus)
        {
            OpenConnection();
            string SQLQuery = "";
            string SQLQueryNotes = "";            
            //connection.Open();
            if (this.txtPDCAID.Text == "0")
            {
                SQLQuery = "PDCA_Insert ";
                SQLQuery += " @username= '" + Session["UserName"].ToString() + "'";
                SQLQuery += ", @schoolyear=" + this.ddSchoolYear.SelectedValue;
                SQLQueryNotes = "PDCANotes_insert ";
            }
            else
            {
                SQLQuery = "PDCA_Update @pdcaid =" + this.txtPDCAID.Text;
                SQLQuery += " ,@username= '" + Session["UserName"].ToString() + "'";
                SQLQuery += " ,@status='" + strStatus + "' ";
                SQLQueryNotes = "PDCANotes_update ";
            }
            SQLQuery += ", @Department= '" + this.txtDepartment.Text.Replace("'", "''") + "'";
            SQLQuery += ", @Title= '" + this.txtTitle.Text.Replace("'", "''") + "'";
            string Ent = "";
            if (this.ckCHSU.Checked)
            {
                Ent += "|CHSU";
            }
            if (this.ckCOM.Checked)
            {
                Ent += "|COM";
            }
            if (this.ckCOP.Checked)
            {
                Ent += "|COP";
            }
            if (this.ckUnsure.Checked)
            {
                Ent += "|Unsure";
            }
            SQLQuery += ", @entity= '" + Ent + "'";
            SQLQuery += ", @Description= '" + this.txtDescription.Text.Replace("'", "''") + "'";

            SQLQuery += ", @ckCHSU= '" + this.ckCHSU.Checked + "'";
            SQLQuery += ", @ckCOM= '" + this.ckCOM.Checked.ToString() + "'";
            SQLQuery += ", @ckCOP= '" + this.ckCOP.Checked.ToString() + "'";
            SQLQuery += ", @ckUnsure= '" + this.ckUnsure.Checked.ToString() + "'";

            SQLQuery += ", @ckExternalReview= '" + this.ckReview.Checked.ToString() + "'";
            SQLQuery += ", @ckFocusGroupResults= '" + this.ckFocusGroupResults.Checked.ToString() + "'";

            SQLQuery += ", @ckFormative= '" + this.ckFormative.Checked.ToString() + "'";
            SQLQuery += ", @ckInputData= '" + this.ckInputData.Checked.ToString() + "'";

            SQLQuery += ", @ckOther= '" + this.ckOther.Checked.ToString() + "'";
            SQLQuery += ", @ckPeerReview= '" + this.ckPeerReview.Checked.ToString() + "'";

            SQLQuery += ", @ckPlan= '" + this.ckPlan.Checked.ToString() + "'";
            SQLQuery += ", @ckProgramOutcome= '" + this.ckProgramOutcome.Checked.ToString() + "'";

            SQLQuery += ", @ckReview= '" + this.ckReview.Checked.ToString() + "'";
            SQLQuery += ", @ckSurveyResults= '" + this.ckSurveyResults.Checked.ToString() + "'";
            SQLQuery += ", @ckCLO= '" + this.ckCLO.Checked.ToString() + "'";
            SQLQuery += ", @ckTests= '" + this.ckTests.Checked.ToString() + "'";
            GetAccreditationCheckboxesLists();
            SQLQuery += ", @WCUSCAccreditation='" + WCUSCAccreditation + "'";
            SQLQuery += ", @COCAAccreditation='" + COCAAccreditation + "'";
            SQLQuery += ", @ACPEAccreditation='" + ACPEAccreditation + "'";

            SqlCommand commanda = new SqlCommand("", connection);
            commanda.CommandText = SQLQuery;
            SqlDataReader readera = commanda.ExecuteReader();
            if (readera.HasRows)
            {
                while (readera.Read())
                {
                    this.txtPDCAID.Text = readera.GetInt32(0).ToString();
                    this.lblPCDAID.Text = readera.GetInt32(0).ToString();
                    this.lblSchoolYearID.Text = readera.GetInt32(1).ToString();
                }
            }
            readera.Close();

            SaveNotes(1, SQLQueryNotes, this.txtSubjectOfAssessmentExamples.Text);
            SaveNotes(2, SQLQueryNotes, this.txtAssessmentName.Text);
            SaveNotes(3, SQLQueryNotes, this.txtStrengths.Text);
            SaveNotes(4, SQLQueryNotes, this.txtInsights.Text);
            SaveNotes(5, SQLQueryNotes, this.txtAreasForImprovement.Text);
            SaveNotes(6, SQLQueryNotes, this.txtPlan.Text);
            SaveNotes(7, SQLQueryNotes, this.txtDo.Text);
            SaveNotes(8, SQLQueryNotes, this.txtCheck.Text);
            SaveNotes(9, SQLQueryNotes, this.txtAdditionalComments.Text);
            SaveNotes(10, SQLQueryNotes, this.txtReport.Text);
            //connection.Close();
            ClearErrors();
        }

        private void SaveNotes(Int32 fieldID, string Qry, string Notes)
        {
            string SQLQueryNotesFull = Qry + " @pdcaid = " + this.txtPDCAID.Text + " ";
            SQLQueryNotesFull += ", @PDCAFieldID=" + fieldID;
            SQLQueryNotesFull += ", @Note='" + Notes.Replace("'", "''") + "'";
            SqlCommand command10 = new SqlCommand(
                 SQLQueryNotesFull,
                 connection);
            command10.ExecuteNonQuery();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (FirstSaveValidation() == "")
            {
                SaveData(this.lblStatus.Text);
            }
        }

        private string FirstSaveValidation()
        {
            string sReturn = "";
            this.lblErrorHeader.Text = "";
            if (this.txtTitle.Text.Trim().Length <= 5 || this.txtDescription.Text.Trim() == "")
            {
                this.lblErrorHeader.Text = "Title and Description must be entered.";
                sReturn = "Fail";
            }
            if (this.ddSchoolYear.SelectedValue == "")
            {
                this.lblErrorHeader.Text = "School Year must be selected.";
                sReturn = "Fail";
            }

            return sReturn;
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            // print the pdca
            //PrintPDCA();
            Response.Redirect("PDCAPrint.aspx?txtPDCAID=" + this.txtPDCAID.Text);
        }

        protected void btnSaveSubmit_Click(object sender, EventArgs e)
        {
            if (ValidatePage() == 0)
            {
                if (btnSaveSubmit.Text == "Save and Submit")
                {
                    SaveData("Submitted");
                }
                if (btnSaveSubmit.Text == "Save as Complete")
                {
                    SaveData("Complete");
                }
            }  // end of validate page test
        }

        //**************************  Checkboxes code  *************************************************
        //**************************************************************************************

        public void SetAccreditationCheckboxes()
        {
            SetCBChecked( "ckWCUSCAccreditation", WCUSCAccreditation);
            SetCBChecked( "ckCOCAAccreditation", COCAAccreditation);
            SetCBChecked( "ckACPEStandards", ACPEAccreditation);
        }

        public void GetAccreditationCheckboxesLists()
        {
               WCUSCAccreditation = getCBString("ckWCUSCAccreditation");
            COCAAccreditation = getCBString("ckCOCAAccreditation");
            ACPEAccreditation = getCBString("ckACPEStandards");
        }

                public void SetCBChecked(string startsWith, string checkBoxSettings )
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
       


        //******************** gvDocuments Code ************************************************
        protected void gvDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }

        protected void gvDocuments_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }

        protected void btnAddDocument_Click(object sender, EventArgs e)
        {
        }

        protected void gvDocuments_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < this.gvDocuments.Rows.Count; i++)
            {
                // Ignore values that cannot be cast as integer.
                try
                {
                    if ((int)gvDocuments.DataKeys[i].Value == (int)ViewState["SelectedKey"])
                        gvDocuments.SelectedIndex = i;
                }
                catch { }
            }
        }

        protected void gvDocuments_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDocuments.PageIndex = e.NewPageIndex;
            LoadGridData();
        }

        protected void gvDocuments_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvDocuments.SelectedIndex >= 0)
                ViewState["SelectedKey"] = gvDocuments.SelectedValue;
            else
                ViewState["SelectedKey"] = null;
            foreach (GridViewRow row1 in gvDocuments.Rows)
            {
                ImageButton IB2 = row1.FindControl("ClickImage") as ImageButton;
                if (row1 == gvDocuments.SelectedRow)
                {
                    IB2.ImageUrl = "~/images/btn_check_on_selected.png";
                }
                else
                {
                    //IB2.ImageUrl = "~/images/btn_check_off_selected.png";
                    IB2.ImageUrl = "";
                }
            }

            GridViewRow srow = gvDocuments.SelectedRow;
            //ImageButton IB1 = srow.FindControl("ClickImage") as ImageButton;
            //IB1.ImageUrl = "~/images/btn_check_on_selected.png";
            //string customerId = gvSONISPDCAs.DataKeys[e.Row.RowIndex].Value.ToString();
            //GridView gvEducation = this.Master.FindControl("MainContent").FindControl("grdEducation") as GridView;
            //gvEducation.DataSource = GetData(string.Format("select * from vwPharmCASCollegesAttendedETL where cas_id='{0}'", ViewState["SelectedKey"]));
            //gvEducation.DataBind();

            //GridView gAddress = this.Master.FindControl("MainContent").FindControl("grdAddress") as GridView;
            //gAddress.DataSource = GetData(string.Format("select * from vwPharmCASApplicantAddresses where cas_id='{0}'", ViewState["SelectedKey"]));
            //gAddress.DataBind();
        }

        private void LoadGridData()
        {
            string sQuery = "PDCADocuments_select ";
            sQuery += "@pdcaid ='" + this.txtPDCAID.Text + "' ";
            dataTable = GetDocumentData(sQuery);
        }

        private  DataTable GetDocumentData(string query)
        {
            //string strConnString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //string strConnString = "Data Source = 4QLJWK2; Initial Catalog = PDCAFS; Integrated Security = True";
            string strConnString = Session["Connstr"].ToString();
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

        protected void BindGrid()
        {
            gvDocuments.DataSource = dataTable;
            gvDocuments.DataBind();
        }

        protected void gvDocuments_Sorting(object sender, GridViewSortEventArgs e)
        {
            SetSortDirection(SortDirectiona);
            LoadGridData();
            if (dataTable != null)
            {
                //Sort the data.
                dataTable.DefaultView.Sort = e.SortExpression + " " + _sortDirection;
                gvDocuments.DataSource = dataTable;
                gvDocuments.DataBind();
                SortDirectiona = _sortDirection;
                int columnIndex = 0;
                foreach (DataControlFieldHeaderCell headerCell in gvDocuments.HeaderRow.Cells)
                {
                    if (headerCell.ContainingField.SortExpression == e.SortExpression)
                    {
                        columnIndex = gvDocuments.HeaderRow.Cells.GetCellIndex(headerCell);
                    }
                }
                sortImage.BackColor = System.Drawing.Color.Maroon;

                gvDocuments.HeaderRow.Cells[columnIndex].Controls.Add(sortImage);
                gvDocuments.SelectedIndex = -1;
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

        // The id parameter name should match the DataKeyNames value set on the control
        public void gvDocuments_DeleteItem(int PDCADocumentID)
        {
            string insertQuery2 = @"PDCADocuments_Delete ";
            SqlCommand insertCommand2 = new SqlCommand(insertQuery2, connection);
            insertCommand2.CommandType = CommandType.StoredProcedure;
            insertCommand2.Parameters.Add("PDCAID", SqlDbType.Int).Value = PDCADocumentID.ToString();
            insertCommand2.ExecuteNonQuery();
            LoadGridData();
            BindGrid();
        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {
            string errormessage1 = "";
            if (fuPDCADocument.HasFile)
            {
                try
                {
                    if (this.txtDocumentTitle.Text == "" || this.txtDocumentDescription.Text == "")
                    {
                        this.lblDocumentsError.Text = "Document Title and Document Description must be entered.";
                    }
                    else
                    {
                        string filename = Path.GetFileName(fuPDCADocument.FileName);
                        PDCAFile = Server.MapPath("~/") + filename;

                        //lblFileName.Text = Server.MapPath("~/") + filename;
                        //fuPDCADocument.SaveAs(Server.MapPath("~/") + filename);
                        //FileStream fs = new FileStream(Server.MapPath("~/") + filename, FileMode.Open, FileAccess.Read);
                        //BinaryReader br = new BinaryReader(fs);
                        //int numBytes = (int)new FileInfo(Server.MapPath("~/") + filename).Length;
                        //byte[] buff = br.ReadBytes(numBytes);

                        lblFileName.Text = PDCAFile;
                        fuPDCADocument.SaveAs(PDCAFile);
                        string PDCAFileExtension = Path.GetExtension(fuPDCADocument.FileName);

                        // check whether or not the uploaded file is an image:
                        var contentType = MimeTypes.GetContentType(fuPDCADocument.PostedFile.FileName);
                        //if (contentType.StartsWith("image"))
                        //{
                        //    // do something with the image ...
                        //}
                        FileStream fs = new FileStream(PDCAFile, FileMode.Open, FileAccess.Read);
                        BinaryReader br = new BinaryReader(fs);
                        int numBytes = (int)new FileInfo(PDCAFile).Length;
                        byte[] buff = br.ReadBytes(numBytes);
                        //byte[] fileData = File.ReadAllBytes(PDCAFile);

                        try
                        {
                            string insertQuery2 = @"PDCADocuments_Insert ";
                            SqlCommand insertCommand2 = new SqlCommand(insertQuery2, connection);
                            insertCommand2.CommandType = CommandType.StoredProcedure;
                            insertCommand2.Parameters.Add("PDCAID", SqlDbType.Int).Value = this.txtPDCAID.Text;
                            insertCommand2.Parameters.Add("@DocumentName", SqlDbType.VarChar, 1000).Value = filename;
                            insertCommand2.Parameters.Add("@FileExtension", SqlDbType.VarChar, 50).Value = PDCAFileExtension;
                            insertCommand2.Parameters.Add("@DocumentType", SqlDbType.VarChar, 50).Value = contentType;
                            insertCommand2.Parameters.Add("@Title", SqlDbType.VarChar, 2000).Value = this.txtDocumentTitle.Text;
                            insertCommand2.Parameters.Add("@Description", SqlDbType.VarChar, 2000).Value = this.txtDocumentDescription.Text;
                            insertCommand2.Parameters.Add("@DocumentFS", SqlDbType.VarBinary).Value = buff;

                            insertCommand2.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            errormessage1 = ex.Message.ToString();
                            errormessage1 += "";
                            //lblResults.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                        }

                        //lblResults.Text = "Upload status: File uploaded!";
                        this.txtDocumentTitle.Text = "";
                        this.txtDocumentDescription.Text = "";
                        //this.fuPDCADocument. = "";
                        LoadGridData();
                        BindGrid();
                    }
                }
                catch (Exception ex)
                {
                    errormessage1 = ex.Message.ToString();
                    errormessage1 += "";
                    //lblResults.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }

        protected void DownloadDocumentFile(object sender, EventArgs e)
        {
            //int PDCADocumentid = Convert.ToInt32(e.ToString());
            int PDCADocumentid = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string constr = strConnectionstring;
            //string PDCADocumentid = e.ToString();
            using (SqlConnection con = new SqlConnection(strConnectionstring))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "PDCADocumentsFS_Select ";
                    cmd.Parameters.AddWithValue("@PDCADocumentId", PDCADocumentid);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["DocumentFS"];
                        contentType = sdr["DocumentType"].ToString();
                        fileName = sdr["DocumentName"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void PrintPDCA()
        {
            Response.Redirect("PrintPDCA.aspx?txtPDCAID=" + this.txtPDCAID.Text);
        }

        protected void PrintPDCAtxt()
        {
            //int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;

            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string constr = strConnectionstring;
            string strPDCA = "";
            using (SqlConnection con = new SqlConnection(strConnectionstring))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "PrintPDCA_text ";
                    cmd.Parameters.AddWithValue("@PDCAId", this.txtPDCAID.Text);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        contentType = "application/octet-stream";
                        strPDCA = sdr[0].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "");
            //Response.BinaryWrite(bytes);
            Response.Write(strPDCA);
            Response.Flush();
            Response.End();
        }

        protected void lbtnDeleteDocument_Click(object sender, EventArgs e)
        {
            int PDCADocumentid = int.Parse((sender as LinkButton).CommandArgument);
            string insertQuery2 = @"PDCADocuments_Delete ";
            SqlCommand insertCommand2 = new SqlCommand(insertQuery2, connection);
            insertCommand2.CommandType = CommandType.StoredProcedure;
            insertCommand2.Parameters.Add("PDCADocumentID", SqlDbType.Int).Value = PDCADocumentid.ToString();
            insertCommand2.ExecuteNonQuery();
            LoadGridData();
            BindGrid();
        }

        private void SetNotesExpansion (Boolean xsetting)
        {
            this.CollapsiblePanelExtenderAreasForImprovement.Collapsed = xsetting;
            this.CollapsiblePanelExtenderAssessments.Collapsed = xsetting;
            this.CollapsiblePanelExtenderAssessmentTools.Collapsed = xsetting;
            this.CollapsiblePanelExtenderCheck.Collapsed = xsetting;
            this.CollapsiblePanelExtenderInsights.Collapsed = xsetting;
            this.CollapsiblePanelExtenderPlan.Collapsed = xsetting;
            this.CollapsiblePanelExtenderReport.Collapsed = xsetting;
            this.CollapsiblePanelExtenderStrengths.Collapsed = xsetting;
            this.CollapsiblePanelExtenderSubjectofAssessment.Collapsed = xsetting;

        }
        protected void btnExpandNotes_Click(object sender, EventArgs e)
        {
            NotesExpansion = true;
            SetNotesExpansion(NotesExpansion);

        }
    }
}