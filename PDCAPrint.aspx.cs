using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using PDCA_ASPX.Data;
namespace PDCA_ASPX
{
    public partial class PDCAPrint : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection();
        public string strConnectionstring = "";
        protected PDCAUser PDCATempUser = new PDCAUser();

        protected void Page_Load(object sender, EventArgs e)
        {
            PDCATempUser = (PDCAUser)Session["PDCAUser"];
            strConnectionstring = PDCATempUser.strConnectionstring;
            OpenConnection();
            if (!String.IsNullOrEmpty(Request.QueryString["PDCAID"]))
            {
                this.lblPDCAID.Text = Request.QueryString["PDCAID"];
            }
            else
            {
            }

            LoadData();
        }

        private void LoadData()
        {
            OpenConnection();
            string sQuery = "PDCA_select @pdcaid =" + this.lblPDCAID.Text + " ";

            //sQuery += "@pdcaid =" + this.lblPDCAID.Text + " ";

            using (connection)
            {
                SqlCommand command = new SqlCommand(sQuery, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        this.lblPDCAID.Text = reader.GetInt32(0).ToString();

                        this.lblDatePrinted.Text = System.DateTime.Now.ToString();

                        this.lblName.Text = reader.GetString(3);
                        this.lblDepartment.Text = reader.GetString(5);
                        this.lblTitle.Text = reader.GetString(6);
                        this.litDescription.Text = reader.GetString(7);

                        this.lblSchoolYear.Text = reader.GetInt32(8).ToString();
                        this.lblSchoolYearId.Text = reader.GetInt32(9).ToString();
                        this.lblStatus.Text = reader.GetString(10);

                        //-- submissionteam
                        //this.lblSurveyResults.Visible = Convert.ToBoolean(reader.GetString(12));
                        //this.lblFocusGroupResults.Visible = Convert.ToBoolean(reader.GetString(13));
                        //this.lblFormative.Visible = Convert.ToBoolean(reader.GetString(14));
                        //this.lblProgramOutcome.Visible = Convert.ToBoolean(reader.GetString(15));
                        //this.lblInputData.Visible = Convert.ToBoolean(reader.GetString(16));
                        //this.lblExternalReview.Visible = Convert.ToBoolean(reader.GetString(17));
                        //this.lblTests.Visible = Convert.ToBoolean(reader.GetString(18));
                        //this.lblReviewofMinutes.Visible = Convert.ToBoolean(reader.GetString(19));
                        //this.lblCLO.Visible = Convert.ToBoolean(reader.GetString(20));
                        //this.lblPlan.Visible = Convert.ToBoolean(reader.GetString(21));
                        //this.lblPeerReview.Visible = Convert.ToBoolean(reader.GetString(22));
                        //this.lblOther.Visible = Convert.ToBoolean(reader.GetString(23));
                       
                        this.lblEntity.Text = reader.GetString(24);

                        this.lblWCUSCAccreditationStandards.Text = reader.GetString(25);
                        this.lblCOCAAccreditationStandards.Text = reader.GetString(26);
                        this.lblACPEAccreditationStandards.Text = reader.GetString(27);
                        this.lblEntity.Text = this.lblEntity.Text.Replace("|", " -- ");
                        this.lblACPEAccreditationStandards.Text = this.lblACPEAccreditationStandards.Text.Replace("|", " -- ");
                        this.lblCOCAAccreditationStandards.Text = this.lblCOCAAccreditationStandards.Text.Replace("|", " -- ");
                        this.lblWCUSCAccreditationStandards.Text = this.lblWCUSCAccreditationStandards.Text.Replace("|", " -- ");
                    }
                }
                else
                {
                    Console.WriteLine("No rows found.");
                }
                reader.Close();
                this.txtAssessmentTools.Text = GetAssessmentTools();
                LoadNoteFields();
            }
        }

        private void LoadNoteFields()
        {
            this.txtSubjectofAssessment.Text = GetNote(1);
            this.txtAssessments.Text = GetNote(2);
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
            string sQuery = "PDCANotes_select @pdcaid=" + lblPDCAID.Text;
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

        private string GetAssessmentTools()
        {
            OpenConnection();
            string sReturn = "";
            SqlCommand commanda = new SqlCommand("", connection);
            string sQuery = "PDCAAssessment_select @pdcaid=" + lblPDCAID.Text;
            sQuery += " ,@Checked='True'";
            commanda.CommandText = sQuery;
            SqlDataReader readera = commanda.ExecuteReader();

            if (readera.HasRows)
            {
                while (readera.Read())
                {
                   
                    sReturn += readera.GetString(3)+"<br />";
                }
            }
            readera.Close();
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