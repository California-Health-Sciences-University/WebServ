<%@ Page Title="" Language="C#" MasterPageFile="~/Report1.Master" AutoEventWireup="true" CodeBehind="PDCAPrint.aspx.cs" Inherits="PDCA_ASPX.PDCAPrint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div>

            <asp:Table ID="Table1" runat="server" Width="100%">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label2" runat="server" Text="PDCAID: " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblPDCAID" runat="server" Text="2" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label3" runat="server" Text="Date Printed: " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblDatePrinted" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label7" runat="server" Text="School Year: " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblSchoolYear" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label4" runat="server" Text="School Year ID: " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblSchoolYearId" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label5" runat="server" Text="Entity: " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblEntity" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label6" runat="server" Text="Status: " Font-Bold="true"></asp:Label>
                        <asp:Label ID="lblStatus" runat="server" Text="" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="Table3" runat="server" Width="100%">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label24" runat="server" Text="Department: " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="lblDepartment" runat="server" Text="" Font-Bold="true" Width="800px"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label8" runat="server" Text="Name: " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="lblName" runat="server" Text="" Font-Bold="true" Width="800px"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label9" runat="server" Text="Title:  " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="lblTitle" runat="server" Text="" Font-Bold="true" Width="800px"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label11" runat="server" Text="Description: " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtDescription" ReadOnly="true" runat="server" Width="800px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <%--             -******************************************  Fields  ***************************--%>

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label10" runat="server" Text="Subject of Assessment:  " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        
                        <asp:Literal ID="txtSubjectofAssessment" runat="server"></asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label20" runat="server" Text="Assessment Tools:  " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="lblSurveyResults" runat="server" Text="Survey Results (End of course student survey results required for courses)"></asp:Label><br />
                        <asp:Label ID="lblFocusGroupResults" runat="server" Text="Focus Group Results"></asp:Label><br />
                        <asp:Label ID="lblFormative" runat="server" Text="Formative student understanding within the course (e.g. Minute Paper, Muddiest Point, Student-Generated Test Questions, Classroom Opinion Polls)"></asp:Label><br />
                        <asp:Label ID="lblProgramOutcome" runat="server" Text="Program outcome data (e.g., licensing examinations, PCOA, event attendance, scholarly productivity)"></asp:Label><br />
                        <asp:Label ID="lblInputData" runat="server" Text="Input data (e.g., admission data, faculty/staff credentials on hire, student performance in prerequisite courses)"></asp:Label><br />
                        <asp:Label ID="lblExternalReview" runat="server" Text="External review (e.g. accreditor visit)"></asp:Label><br />
                        <asp:Label ID="lblTests" runat="server" Text="Tests/exam item analysis/student performance (required for courses)"></asp:Label><br />
                        <asp:Label ID="lblReviewofMinutes" runat="server" Text="Review of minutes or other ongoing record or reflection, e.g., “red book” for courses (name)"></asp:Label><br />
                        <asp:Label ID="lblCLO" runat="server" Text="CLO/PLO/GLO rubrics and learning outcome data"></asp:Label><br />
                        <asp:Label ID="lblPlan" runat="server" Text="Plan (e.g. strategic plan, earlier SII-PDCA forms, budgets, faculty adequacy model)"></asp:Label><br />
                        <asp:Label ID="lblPeerReview" runat="server" Text="Peer review"></asp:Label><br />
                        <asp:Label ID="lblOther" runat="server" Text="Other"></asp:Label><br />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label1" runat="server" Text="Assessments:  " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        
                        <asp:Literal ID="txtAssessments" runat="server"></asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label12" runat="server" Text="Strengths:  " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        
                        <asp:Literal ID="txtStrengths" runat="server"></asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label13" runat="server" Text="Insights:  " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        
                        <asp:Literal ID="txtInsights" runat="server"></asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label14" runat="server" Text="Areas For Improvement" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        
                        <asp:Literal ID="txtAreasForImprovement" runat="server"></asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label15" runat="server" Text="Plan:  " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        
                        <asp:Literal ID="txtPlan" runat="server"></asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label16" runat="server" Text="Do: " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        
                        <asp:Literal ID="txtDo" runat="server"></asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label17" runat="server" Text="Check:  " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        
                        <asp:Literal ID="txtCheck" runat="server"></asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label18" runat="server" Text="Additional Comments:  " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        
                        <asp:Literal ID="txtAdditionalComments" runat="server"></asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label19" runat="server" Text="Report Must Be Conveyed: " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        
                        <asp:Literal ID="txtReport" runat="server"></asp:Literal>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label21" runat="server" Text="ACPE Accreditation Standards: " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtACPEAccreditationStandards" runat="server" Width="800px" ReadOnly="true"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label22" runat="server" Text="COCA Accreditation Standards: " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtCOCAAccreditationStandards" runat="server" Width="800px" ReadOnly="true"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        <asp:Label ID="Label23" runat="server" Text="WCUSC Accreditation Standards: " Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:TextBox ID="txtWCUSCAccreditationStandards" runat="server" Width="800px" ReadOnly="true"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>

        <asp:GridView AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BorderWidth="2px"
            BorderStyle="Solid" BorderColor="Black" CellPadding="3" runat="server"
            ID="gvDocuments" DataKeyNames="PDCADocumentID"
            ShowHeaderWhenEmpty="true"
            Width="100%">
            <HeaderStyle BackColor="Maroon" ForeColor="White" BorderColor="Black" Font-Bold="true" Font-Size="Larger" BorderWidth="2" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="Black" BorderColor="Black" BorderWidth="1" HorizontalAlign="Left" Font-Size="Medium" />
            <AlternatingRowStyle BackColor="lightgrey" ForeColor="Black" BorderColor="Black" BorderWidth="1" HorizontalAlign="Left" Font-Size="Medium"></AlternatingRowStyle>
            <Columns>

                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" HeaderStyle-Width="30%">
                    <ItemStyle Width="350px"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" HeaderStyle-Width="30%">
                    <ItemStyle Width="350px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="InsertDate" HeaderText="Date Inserted" SortExpression="InsertDate" HeaderStyle-Width="20%">
                    <ItemStyle Width="50px"></ItemStyle>
                </asp:BoundField>
            </Columns>
        </asp:GridView>
     
</asp:Content>
