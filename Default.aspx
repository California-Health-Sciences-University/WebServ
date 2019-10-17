<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/PDCAField.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PDCA_ASPX._Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Table Width="100%" BorderColor="Black" BorderStyle="Solid" Font-Bold="true" runat="server" CellPadding="10" BackColor="lightgrey">
        <asp:TableRow>
            <asp:TableCell BorderColor="Black" BorderStyle="Solid" Font-Bold="true" HorizontalAlign="Center">
                <asp:Label ID="Label6" runat="server" Text="Department" Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell BorderColor="Black" BorderStyle="Solid" Font-Bold="true" HorizontalAlign="Center" BackColor="White">
                <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell BorderColor="Black" BorderStyle="Solid" Font-Bold="true" HorizontalAlign="Center">
                <asp:Label ID="Label8" runat="server" Text="Title" Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell BorderColor="Black" BorderStyle="Solid" Font-Bold="true" HorizontalAlign="Center" BackColor="White">
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell BorderColor="Black" BorderStyle="Solid" Font-Bold="true" HorizontalAlign="Center">
                <asp:Label ID="Label10" runat="server" Text="Description" Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell BorderColor="Black" BorderStyle="Solid" Font-Bold="true" HorizontalAlign="Center" BackColor="White">
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell BorderColor="Black" BorderStyle="Solid" Font-Bold="true" HorizontalAlign="Center">
                <asp:Label ID="Label12" runat="server" Text="Entered By" Font-Bold="true"></asp:Label>
            </asp:TableCell>
            <asp:TableCell BorderColor="Black" BorderStyle="Solid" Font-Bold="true" HorizontalAlign="Center" BackColor="White">
                <asp:TextBox ID="txtEnteredBy" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell BorderColor="Black" BorderStyle="Solid" Font-Bold="true" HorizontalAlign="Center">
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </asp:TableCell>
            <asp:TableCell BorderColor="Black" BorderStyle="Solid" Font-Bold="true" HorizontalAlign="Center">
                <asp:Button ID="btnClearSearch" runat="server" Text="Clear Search Terms" OnClick="btnClearSearch_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <ajaxToolkit:TabContainer ID="tcSearch" runat="server" ActiveTabIndex="0">

        <ajaxToolkit:TabPanel ID="tpResults" runat="server" HeaderText="Results">
            <ContentTemplate>
                <asp:GridView AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BorderWidth="2px"
                    BorderStyle="Solid" BorderColor="Black" CellPadding="3" runat="server"
                    ID="gvPDCAList" DataKeyNames="pdcaid"
                    OnRowDataBound="gvPDCAList_RowDataBound"
                    OnPageIndexChanging="grdData_PageIndexChanging"
                    OnSelectedIndexChanged="gvPDCAList_SelectedIndexChanged"
                    OnDataBound="PDCAGridView_DataBound"
                    OnSorting="PDCAGridView_Sorting"
                    PageSize="25"
                    Width="100%">
                    <HeaderStyle BackColor="Maroon" ForeColor="White" BorderColor="Black" Font-Bold="true" Font-Size="Larger" BorderWidth="2" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="Black" BorderColor="Black" BorderWidth="1" HorizontalAlign="Left" Font-Size="Medium" />
                    <AlternatingRowStyle BackColor="lightgrey" ForeColor="Black" BorderColor="Black" BorderWidth="1" HorizontalAlign="Left" Font-Size="Medium"></AlternatingRowStyle>
                    <Columns>
                        <asp:TemplateField HeaderText="Title" SortExpression="Title" HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server"
                                    NavigateUrl='<%# Eval("PDCAID", @"~/PDCAEdit1.aspx?pdcaid={0}") %>'
                                    Text='<%# Eval("Title")%>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" HeaderStyle-Width="30%">
                            <ItemStyle Width="650px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" HeaderStyle-Width="15%">
                            <ItemStyle Width="100px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="status" HeaderStyle-Width="10%">
                            <ItemStyle Width="50px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="LastUpdate" HeaderText="Last Update" SortExpression="LastUpdate" HeaderStyle-Width="15%">
                            <ItemStyle Width="50px"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tpContents" runat="server" HeaderText="Search Contents">
            <ContentTemplate>
                <asp:Table ID="Table1" runat="server" Width="100%" CellPadding="5" CellSpacing="5">

                    <asp:TableRow>
                        <asp:TableCell BorderColor="Black" BorderStyle="Solid">
                            <asp:Label ID="Label14" runat="server" Text="Status" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell BorderColor="Black" BorderStyle="Solid">
                            <asp:CheckBoxList ID="ckblStatus" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="New" Value="New"></asp:ListItem>
                                <asp:ListItem Text="Submitted" Value="Submitted"></asp:ListItem>
                                <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                            </asp:CheckBoxList>
                        </asp:TableCell><asp:TableCell BorderColor="Black" BorderStyle="Solid">
                            <asp:Label ID="Label15" runat="server" Text="Entity" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell BorderColor="Black" BorderStyle="Solid">
                            <asp:CheckBoxList ID="ckblEntity" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="CHSU" Value="CHSU"></asp:ListItem>
                                <asp:ListItem Text="COP" Value="COP"></asp:ListItem>
                                <asp:ListItem Text="COM" Value="COM"></asp:ListItem>
                                <asp:ListItem Text="Unsure" Value="Unsure"></asp:ListItem>
                            </asp:CheckBoxList>
                        </asp:TableCell><asp:TableCell BorderColor="Black" BorderStyle="Solid">
                            <asp:Label ID="Label16" runat="server" Text="School Year" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell BorderColor="Black" BorderStyle="Solid">
                            <asp:CheckBoxList ID="ckblSchoolYear" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
                                <asp:ListItem Text="2019" Value="2019"></asp:ListItem>
                                <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                                <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
                                <asp:ListItem Text="2022" Value="2022"></asp:ListItem>
                                <asp:ListItem Text="2023" Value="2023"></asp:ListItem>
                                <asp:ListItem Text="2024" Value="2024"></asp:ListItem>
                                <asp:ListItem Text="2025" Value="2025"></asp:ListItem>
                            </asp:CheckBoxList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table ID="Table2" runat="server" Width="100%" CellPadding="5" CellSpacing="5">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label18" runat="server" Text="Start Date" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                        </asp:TableCell><asp:TableCell>
                            <asp:Label ID="Label19" runat="server" Text="End Date" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                        </asp:TableCell><asp:TableCell>
                            <asp:Label ID="lblFieldDescription" runat="server" Text="Subject of Assessment Examples:" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtSubjectofAssessmentExamplesSearch" runat="server"></asp:TextBox>
                        </asp:TableCell><asp:TableCell>
                            <asp:Label ID="Label1" runat="server" Text="Assessment Name:" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtAssessmentNameSearch" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label2" runat="server" Text="Strengths" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtStrengthsSearch" runat="server"></asp:TextBox>
                        </asp:TableCell><asp:TableCell>
                            <asp:Label ID="Label3" runat="server" Text="Insights" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtInsightsSearch" runat="server"></asp:TextBox>
                        </asp:TableCell><asp:TableCell>
                            <asp:Label ID="Label4" runat="server" Text="Areas for Improvement" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtAreasForImprovementSearch" runat="server"></asp:TextBox>
                        </asp:TableCell><asp:TableCell>
                            <asp:Label ID="Label5" runat="server" Text="Plan" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtPlanSearch" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label7" runat="server" Text="Do" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtDoSearch" runat="server"></asp:TextBox>
                        </asp:TableCell><asp:TableCell>
                            <asp:Label ID="Label9" runat="server" Text="Check" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtCheckSearch" runat="server"></asp:TextBox>
                        </asp:TableCell><asp:TableCell>
                            <asp:Label ID="Label11" runat="server" Text="Additional Comments" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtAdditionalCommentsSearch" runat="server"></asp:TextBox>
                        </asp:TableCell><asp:TableCell>
                            <asp:Label ID="Label13" runat="server" Text="Report Must Be Conveyed" Font-Bold="true"></asp:Label>
                        </asp:TableCell><asp:TableCell>
                            <asp:TextBox ID="txtReportMustBeConveyedSearch" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tpACPEAccreditationStandards" runat="server" HeaderText="Search ACPE Accreditation Standards">
            <ContentTemplate>
                <%--  ********************************************    ACPE Standards ********************************************  --%>
                <%--  ********************************************    Header ********************************************  --%>

                <asp:Table ID="Table12" runat="server" Width="1200px">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" HorizontalAlign="Center" BackColor="Maroon" ForeColor="White">
                            <asp:Label ID="Label76" runat="server" Text="ACPE Accreditation Standards" ForeColor="White" Font-Size="X-Large"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <%--  ********************************************     Section 1: Educational Outcomes ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel10" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblACPESection1" ForeColor="White" Text="Section 1: Educational Outcomes" />
                                    </asp:TableCell><asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="lblErrorReport" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell><asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgACPESection1" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlACPESection1" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="tblACPE1Contents" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" Width="76px">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards0" Text="1" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label17" runat="server" Text="Foundational Knowledge" Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label20" runat="server" Text="The professional program leading to the Doctor of Pharmacy degree (hereinafter “the program”) develops in the graduate the knowledge, skills, abilities, behaviors, and attitudes necessary to apply the foundational sciences to the provision of patient-centered care"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards1" Text="2" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label55" runat="server" Text="Essentials for Practice and Care" Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label21" runat="server" Text="The program imparts to the graduate the knowledge, skills, abilities, behaviors, and attitudes necessary to provide patient-centered care, manage medication use systems, promote health and wellness, and describe the influence of population-based care on patient-centered care."></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards2" Text="3" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label57" runat="server" Text="Approach to Practice and Care" Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label22" runat="server" Text="The program imparts to the graduate the knowledge, skills, abilities, behaviors, and attitudes necessary to solve problems; educate, advocate, and collaborate, working with a broad range of people; recognize social determinants of health; and effectively communicate verbally and nonverbally. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards3" Text="4" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label59" runat="server" Text="Personal and Professional Development" Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label23" runat="server" Text="The program imparts to the graduate the knowledge, skills, abilities, behaviors, and attitudes necessary to demonstrate self-awareness, leadership, innovation and entrepreneurship, and professionalism."></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="pnlACPESection1"
                        CollapsedSize="0" ExpandedSize="280"
                        ExpandedText="Section I: Educational Outcomes"
                        CollapsedText="Section I: Educational Outcomes" TextLabelID="lblACPESection1" ImageControlID="imgACPESection1"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgACPESection1"
                        CollapseControlID="imgACPESection1"
                        Collapsed="true" SuppressPostBack="false" />
                    <hr />
                </div>
                <%--  ******************************************** ACPE Accreditation Section II Structure and Process to Promote Achievement of Educational Outcomes********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel2" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblACPE103" ForeColor="White" Text="Section II: Structure and Process to Promote Achievement of Educational Outcomes" />
                                    </asp:TableCell><asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label24" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell><asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="img103" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlACPE103" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="tblACPE103Contents" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" Width="76px">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards1031" Text="5" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label25" runat="server" Text="Eligibility and Reporting Requirements" Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label26" runat="server" Text="The program meets all stated degree-granting eligibility and reporting requirements."></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards9" Text="6" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label66" runat="server" Text="College or School Vision, Mission, and Goals " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label27" runat="server" Text="The college or school publishes statements of its vision, mission, and goals."></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards10" Text="7" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label67" runat="server" Text="Strategic Plan " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label28" runat="server" Text="The college or school develops, utilizes, assesses, and revises on an ongoing basis a strategic plan that includes tactics to advance its vision, mission, and goals. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards11" Text="8" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label68" runat="server" Text=" Organization and Governance " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label29" runat="server" Text="The college or school is organized and staffed to advance its vision and facilitate the accomplishment of its mission and goals."></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" Width="76px">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards1051" Text="9" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label30" runat="server" Text="Organizational Culture " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label31" runat="server" Text="The college or school provides an environment and culture that promotes self-directed lifelong learning, professional behavior, leadership, collegial relationships, and collaboration within and across academic units, disciplines, and professions. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards13" Text="10" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label70" runat="server" Text="Curriculum Design, Delivery, and Oversight " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label32" runat="server" Text="The curriculum is designed, delivered, and monitored by faculty to ensure breadth and depth of requisite knowledge and skills, the maturation of professional attitudes and behaviors, and the

6

opportunity to explore professional areas of interest. The curriculum also emphasizes active learning pedagogy, content integration, knowledge acquisition, skill development, and the application of knowledge and skills to therapeutic decision-making. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards14" Text="11" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label71" runat="server" Text="Interprofessional Education (IPE) " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label33" runat="server" Text="The curriculum prepares all students to provide entry-level, patient-centered care in a variety of practice settings as a contributing member of an interprofessional team. In the aggregate, team exposure includes prescribers as well as other healthcare professionals. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards15" Text="12" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label72" runat="server" Text="Pre-Advanced Pharmacy Practice Experiences (Pre-APPE) Curriculum " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label34" runat="server" Text="The Pre-APPE curriculum provides a rigorous foundation in the biomedical, pharmaceutical, social/administrative/behavioral, and clinical sciences, incorporates Introductory Pharmacy Practice Experience (IPPE), and inculcates habits of self-directed lifelong learning to prepare students for Advanced Pharmacy Practice Experience (APPE). "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards16" Text="13" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label73" runat="server" Text="Advanced Pharmacy Practice Experiences (APPE) Curriculum " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label35" runat="server" Text="A continuum of required and elective APPEs is of the scope, intensity, and duration required to support the achievement of the Educational Outcomes articulated in Standards 1–4 and within Appendix 2 to prepare practice-ready graduates. APPEs integrate, apply, reinforce, and advance the knowledge, skills, attitudes, abilities, and behaviors developed in the Pre-APPE curriculum and in co-curricular activities."></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" Width="76px">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards3121" Text="14" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label36" runat="server" Text="Student Services " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label37" runat="server" Text="The college or school has an appropriately staffed and resourced organizational element dedicated to providing a comprehensive range of services that promote student success and well-being. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards76" Text="15" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label133" runat="server" Text="Academic Environment " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label38" runat="server" Text="The college or school develops, implements, and assesses its policies and procedures that promote student success and well-being. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards77" Text="16" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label134" runat="server" Text="Admissions" Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label39" runat="server" Text="The college or school develops, implements, and assesses its admission criteria, policies, and procedures to ensure the selection of a qualified and diverse student body into the professional degree program. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards78" Text="17" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label135" runat="server" Text="Progression" Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label40" runat="server" Text="The college or school develops, implements, and assesses its policies and procedures related to student progression through the PharmD program. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards79" Text="18" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label136" runat="server" Text="Faculty and Staff—Quantitative Factors  " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label41" runat="server" Text="The college or school has a cohort of faculty and staff with the qualifications and experience needed to effectively deliver and evaluate the professional degree program. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards80" Text="19" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label137" runat="server" Text="Faculty and Staff – Qualitative Factors " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label42" runat="server" Text="Faculty and staff have academic and professional credentials and expertise commensurate with their responsibilities to the professional program and their academic rank. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards81" Text="20" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label138" runat="server" Text="Preceptors " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label43" runat="server" Text="The college or school has a sufficient number of preceptors (practice faculty or external practitioners) to effectively deliver and evaluate students in the experiential component of the curriculum. Preceptors have professional credentials and expertise commensurate with their responsibilities to the professional program.  "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards82" Text="21" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label139" runat="server" Text="Physical Facilities and Educational Resources " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label44" runat="server" Text="The college or school has adequate and appropriately equipped physical and educational facilities to achieve its mission and goals."></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards96" Text="22" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label153" runat="server" Text="Practice Facilities " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label45" runat="server" Text="The college or school has the appropriate number and mix of facilities in which required and elective practice experiences are conducted to accommodate all students. Practice sites are appropriately licensed and selected based on quality criteria to ensure the effective and timely delivery of the experiential component of the curriculum.  "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards97" Text="23" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label154" runat="server" Text="Financial Resources " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label46" runat="server" Text="The college or school has current and anticipated financial resources to support the stability of the educational program and accomplish its mission, goals, and strategic plan. "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" TargetControlID="pnlACPE103"
                        CollapsedSize="0" ExpandedSize="1080"
                        ExpandedText="Section II: Structure and Process to Promote Achievement of Educational Outcomes"
                        CollapsedText="Section II: Structure and Process to Promote Achievement of Educational Outcomes" TextLabelID="lblACPE103" ImageControlID="img103"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="img103"
                        CollapseControlID="img103"
                        Collapsed="true" SuppressPostBack="false" />
                    <hr />
                </div>
                <%--  ******************************************** ACPE   SECTION III: ASSESSMENT OF STANDARDS AND KEY ELEMENTS  ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel3" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblACPE104" ForeColor="White" Text="Section III: Assessment of Key Standards and Issues" />
                                    </asp:TableCell><asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label47" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell><asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="img104" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlACPE104" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="tblACPE104Contents" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" Width="76px">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards1041" Text="24" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label48" runat="server" Text="Assessment Elements for Section I: Educational Outcomes " Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label49" runat="server" Text="The college or school develops, resources, and implements a plan to assess attainment of educational outcomes to ensure that graduates are prepared to enter practice."></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckACPEStandards12" Text="25" runat="server" />
                                </asp:TableCell><asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label69" runat="server" Text="Assessment Elements for Section II: Structure and Process " Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label50" runat="server" Text="The college or school develops, resources, and implements a plan to assess attainment of the Key Elements within Standards 5–23"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="server" TargetControlID="pnlACPE104"
                        CollapsedSize="0" ExpandedSize="100"
                        ExpandedText="Section III: Assessment of Key Standards and Issues"
                        CollapsedText="Section III: Assessment of Key Standards and Issues" TextLabelID="lblACPE104" ImageControlID="img104"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="img104"
                        CollapseControlID="img104"
                        Collapsed="true" SuppressPostBack="false" />
                    <hr />
                </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tpCOCAAccreditationStandards" runat="server" HeaderText="Search COCA Accreditation Standards">
            <ContentTemplate>

                <%--  ********************************************    COCA Standards ********************************************  --%>
                <%--  ********************************************    Header ********************************************  --%>

                <asp:Table ID="Table3" runat="server" Width="1200px">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" HorizontalAlign="Center" BackColor="Maroon" ForeColor="White">
                            <asp:Label ID="Label177" runat="server" Text="COCA Accreditation Standards" ForeColor="White" Font-Size="X-Large"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <%--  ********************************************    COCA Standard 1 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel34" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA1_1" ForeColor="White" Text="Standard 1: Mission and Governance" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label178" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA1_1" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA1_1" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="tblCOCA1_1Contents" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation0" Text="1.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label179" runat="server" Text="Program Mission"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation1" Text="1.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label180" runat="server" Text="Strategic Plan"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation2" Text="1.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label181" runat="server" Text="Licensing and Regional/Institutional Accreditation"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation3" Text="1.4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label182" runat="server" Text="Governance and Program Policies"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation4" Text="1.5" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label183" runat="server" Text="Non-Discrimination"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation5" Text="1.6" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label184" runat="server" Text="Degree-Granting Body"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation6" Text="1.7" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label185" runat="server" Text="Clinical Education Affiliation Agreements"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender34" runat="server" TargetControlID="pnlCOCA1_1"
                        CollapsedSize="0" ExpandedSize="200"
                        ExpandedText="Standard 1: Mission and Governance"
                        CollapsedText="Standard 1: Mission and Governance" TextLabelID="lblCOCA1_1" ImageControlID="imgCOCA1_1"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA1_1"
                        CollapseControlID="imgCOCA1_1"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 2 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel35" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA2" ForeColor="White" Text="Standard 2: Leadership and Administration" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label186" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA2" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA2" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table4" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation7" Text="2.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label187" runat="server" Text="Dean Qualifications"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation8" Text="2.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label188" runat="server" Text="Full-Time Dean"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation9" Text="2.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label189" runat="server" Text="Academic and Administrative Leadership"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation10" Text="2.4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label190" runat="server" Text="Accreditation Standards Compliance and Procedures"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender35" runat="server" TargetControlID="pnlCOCA2"
                        CollapsedSize="0" ExpandedSize="125"
                        ExpandedText="Standard 2: Leadership and Administration"
                        CollapsedText="Standard 2: Leadership and Administration" TextLabelID="lblCOCA2" ImageControlID="imgCOCA2"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA2"
                        CollapseControlID="imgCOCA2"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 3 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel36" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA3" ForeColor="White" Text="Standard 3: Finances" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label191" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA3" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA3" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table5" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation11" Text="3.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label192" runat="server" Text="Financial Resources"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation12" Text="3.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label193" runat="server" Text="Financial Planning and Budgeting"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation13" Text="3.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label194" runat="server" Text="Budgetary Authority"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation14" Text="3.4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label195" runat="server" Text="Financial Audit"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender36" runat="server" TargetControlID="pnlCOCA3"
                        CollapsedSize="0" ExpandedSize="120"
                        ExpandedText="Standard 3: Finances"
                        CollapsedText="Standard 3: Finances" TextLabelID="lblCOCA3" ImageControlID="imgCOCA3"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA3"
                        CollapseControlID="imgCOCA3"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 4 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel37" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA4" ForeColor="White" Text="Standard 4: Facilities" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label196" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA4" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA4" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table6" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation15" Text="4.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label197" runat="server" Text="Facilities"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation16" Text="4.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label198" runat="server" Text="Security and Public Safety"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation17" Text="4.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label199" runat="server" Text="Information Technology"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation18" Text="4.4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label200" runat="server" Text="Learning Resources"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender37" runat="server" TargetControlID="pnlCOCA4"
                        CollapsedSize="0" ExpandedSize="120"
                        ExpandedText="Standard 4: Facilities"
                        CollapsedText="Standard 4: Facilities" TextLabelID="lblCOCA4" ImageControlID="imgCOCA4"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA4"
                        CollapseControlID="imgCOCA4"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 5 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel38" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA5" ForeColor="White" Text="Standard 5: Learning Environment" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label201" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA5" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA5" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table7" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation19" Text="5.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label202" runat="server" Text="Professionalism"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation20" Text="5.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label203" runat="server" Text="Diversity"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation21" Text="5.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label204" runat="server" Text="Safety, Health, and Wellness"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation22" Text="5.4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label205" runat="server" Text="Patient Care Supervision"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender38" runat="server" TargetControlID="pnlCOCA5"
                        CollapsedSize="0" ExpandedSize="120"
                        ExpandedText="Standard 5: Learning Environment"
                        CollapsedText="Standard 5: Learning Environment" TextLabelID="lblCOCA5" ImageControlID="imgCOCA5"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA5"
                        CollapseControlID="imgCOCA5"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 6 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel39" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA6" ForeColor="White" Text="Standard 6: Curriculum" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label206" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA6" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA6" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table8" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation23" Text="6.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label207" runat="server" Text="Curriculum Design and Management"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation24" Text="6.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label208" runat="server" Text="Programmatic Level Educational Objectives"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation25" Text="6.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label209" runat="server" Text="Maximum Length of Completion"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation26" Text="6.4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label210" runat="server" Text="Osteopathic Core Competencies"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation27" Text="6.5" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label211" runat="server" Text="Scientific Method"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation28" Text="6.6" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label212" runat="server" Text="Principles of Osteopathic Medicine"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation29" Text="6.7" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label213" runat="server" Text="Directed Learning"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation30" Text="6.8" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label214" runat="server" Text="Interprofessional Education for Collaborative Practice"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation31" Text="6.9" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label215" runat="server" Text="Clinical Education"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation32" Text="6.10" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label216" runat="server" Text="Clinical Experience"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation33" Text="6.11" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label217" runat="server" Text="Comparability across Clinical Education Sites"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation34" Text="6.12" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label218" runat="server" Text="COMLEX-USA"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender39" runat="server" TargetControlID="pnlCOCA6"
                        CollapsedSize="0" ExpandedSize="300"
                        ExpandedText="Standard 6: Curriculum"
                        CollapsedText="Standard 6: Curriculum" TextLabelID="lblCOCA6" ImageControlID="imgCOCA6"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA6"
                        CollapseControlID="imgCOCA6"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 7 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel40" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA7" ForeColor="White" Text="Standard 7: Faculty and Staff" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label219" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA7" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA7" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table9" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation35" Text="7.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label220" runat="server" Text="Faculty and Staff Resources and Qualifications"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation36" Text="7.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label221" runat="server" Text="Faculty Approvals at All Teaching Sites"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation37" Text="7.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label222" runat="server" Text="Department Chair Qualifications"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation38" Text="7.4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label223" runat="server" Text="Primary Care Leadership"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation39" Text="7.5" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label224" runat="server" Text="OMM/OPP Leadership"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation40" Text="7.6" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label225" runat="server" Text="Faculty Development"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation41" Text="7.7" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label226" runat="server" Text="Faculty Association"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>

                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation42" Text="7.8" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label227" runat="server" Text="Faculty Appointment and Advancement"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender40" runat="server" TargetControlID="pnlCOCA7"
                        CollapsedSize="0" ExpandedSize="220"
                        ExpandedText="Standard 7: Faculty and Staff"
                        CollapsedText="Standard 7: Faculty and Staff" TextLabelID="lblCOCA7" ImageControlID="imgCOCA7"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA7"
                        CollapseControlID="imgCOCA7"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 8 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel41" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA8" ForeColor="White" Text="Standard 8: Scholarly Activity" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label228" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA8" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA8" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table10" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation43" Text="8.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label229" runat="server" Text="Research and Scholarly Activity Strategic Plan"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation44" Text="8.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label230" runat="server" Text="Research and Scholarly Activity Budget"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender41" runat="server" TargetControlID="pnlCOCA8"
                        CollapsedSize="0" ExpandedSize="60"
                        ExpandedText="Standard 8: Scholarly Activity"
                        CollapsedText="Standard 8: Scholarly Activity" TextLabelID="lblCOCA8" ImageControlID="imgCOCA8"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA8"
                        CollapseControlID="imgCOCA8"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 9 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel42" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA9" ForeColor="White" Text="Standard 9: Students" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label231" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA9" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA9" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table11" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation45" Text="9.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label232" runat="server" Text="Admissions Policy"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation46" Text="9.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label233" runat="server" Text="Academic Standards"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>

                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation47" Text="9.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label234" runat="server" Text="Transfer Policies"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation48" Text="9.4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label235" runat="server" Text="Secure Student Recordkeeping"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation49" Text="9.5" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label236" runat="server" Text="Academic Counseling"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation50" Text="9.6" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label237" runat="server" Text="Career Counseling"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation51" Text="9.7" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label238" runat="server" Text="Financial Aid and Debt Management Counseling"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation52" Text="9.8" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label239" runat="server" Text="Mental Health Services"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation53" Text="9.9" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label240" runat="server" Text="Physical Health Services"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation54" Text="9.10" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label241" runat="server" Text="Non-Academic Health Professionals"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation55" Text="9.11" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label242" runat="server" Text="Health Insurance"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender42" runat="server" TargetControlID="pnlCOCA9"
                        CollapsedSize="0" ExpandedSize="300"
                        ExpandedText="Standard 9: Students"
                        CollapsedText="Standard 9: Students" TextLabelID="lblCOCA9" ImageControlID="imgCOCA9"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA9"
                        CollapseControlID="imgCOCA9"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 10 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel43" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA10" ForeColor="White" Text="Standard 10: Graduate Medical Education (GME)" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label243" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA10" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA10" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table13" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation57" Text="10.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label244" runat="server" Text="Osteopathic Educational Continuum"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation58" Text="10.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label245" runat="server" Text="ACGME Accredited GME"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation59" Text="10.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label246" runat="server" Text="Osteopathic Recognition of GME"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender43" runat="server" TargetControlID="pnlCOCA10"
                        CollapsedSize="0" ExpandedSize="100"
                        ExpandedText="Standard 10: Graduate Medical Education (GME)"
                        CollapsedText="Standard 10: Graduate Medical Education (GME)" TextLabelID="lblCOCA10" ImageControlID="imgCOCA10"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA10"
                        CollapseControlID="imgCOCA10"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 11 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel44" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA11" ForeColor="White" Text="Standard 11: Program and Student Assessment and Outcomes" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label247" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA11" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA11" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table14" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation60" Text="11.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label248" runat="server" Text="Program Assessment"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation61" Text="11.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label249" runat="server" Text="Student Evaluation of Instruction"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation62" Text="11.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label250" runat="server" Text="Student Debt Outcomes"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation63" Text="11.4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label251" runat="server" Text="Student Survey"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation64" Text="11.5" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label252" runat="server" Text="Progam and Student Outcomes - Annual and Mid-Cycle Reports"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender44" runat="server" TargetControlID="pnlCOCA11"
                        CollapsedSize="0" ExpandedSize="150"
                        ExpandedText="Standard 11: Program and Student Assessment and Outcomes"
                        CollapsedText="Standard 11: Program and Student Assessment and Outcomes" TextLabelID="lblCOCA11" ImageControlID="imgCOCA11"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA11"
                        CollapseControlID="imgCOCA11"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    COCA Standard 12 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel45" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblCOCA12" ForeColor="White" Text="Standard 12: Institutional Accreditation" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label253" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgCOCA12" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlCOCA12" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table15" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation65" Text="12.1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label254" runat="server" Text="Incorporation of the Institution"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation66" Text="12.2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label255" runat="server" Text="Degree and Other Educational Offerings"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation67" Text="12.3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label256" runat="server" Text="Chief Executive Officer"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation68" Text="12.4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label257" runat="server" Text="Chief Financial Officer"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation69" Text="12.5" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label258" runat="server" Text="Course Credit Hours"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" ID="ckCOCAAccreditation70" Text="12.6" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Label ID="Label259" runat="server" Text="Public Information"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender45" runat="server" TargetControlID="pnlCOCA12"
                        CollapsedSize="0" ExpandedSize="170"
                        ExpandedText="Standard 12: Institutional Accreditation"
                        CollapsedText="Standard 12: Institutional Accreditation" TextLabelID="lblCOCA12" ImageControlID="imgCOCA12"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgCOCA12"
                        CollapseControlID="imgCOCA12"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel ID="tpWCUSCAccreditationStandards" runat="server" HeaderText="Search WCUSC Accreditation Standards">
            <ContentTemplate>
                <%--  ********************************************    WCUSC Standards ********************************************  --%>
                <%--  ********************************************    Header ********************************************  --%>

                <asp:Table ID="Table16" runat="server" Width="1200px">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server" HorizontalAlign="Center" BackColor="Maroon" ForeColor="White">
                            <asp:Label ID="Label260" runat="server" Text="WCUSC Accreditation Standards" ForeColor="White" Font-Size="X-Large"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <%--  ********************************************    WCUSC Standard 1 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel46" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblWCUSC1" ForeColor="White" Text="Standard 1: Defining Institutional Purposes and Ensuring Educational Objectives" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label261" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgWCUSC1" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlWCUSC1" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table17" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" Width="80px">
                                    <asp:CheckBox Font-Bold="true" Text="1.1" ID="ckWCUSCAccreditation1" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC1" runat="server" Text="1.1- The institution’s formally approved statements of purpose are appropriate for an institution of higher education and clearly define its essential values and character and ways in which it contributes to the public good. ">
                                    </asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="1.2" ID="ckWCUSCAccreditation2" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC2" runat="server" Text="1.2 -Educational objectives are widely recognized throughout the institution, are consistent with stated purposes, and are demonstrably achieved. The institution regularly generates, evaluates, and makes public data about student achievement, including measures of retention and graduation, and evidence of student learning. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="1.3" ID="ckWCUSCAccreditation3" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC3" runat="server" Text="1.3 -The institution publicly states its commitment to academic freedom for faculty, staff, and students, and acts accordingly. This commitment affirms that those in the academy are free to share their convictions and responsible conclusions with their colleagues and students in their teaching and writing. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="1.4" ID="ckWCUSCAccreditation4" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC4" runat="server" Text="1.4 -Consistent with its purposes and character, the institution demonstrates an appropriate response to the increasing diversity in society through its policies, its educational and co-curricular programs, its hiring and admissions criteria, and its administrative and organizational practices. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="1.5" ID="ckWCUSCAccreditation5" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC5" runat="server" Text="1.5 -Even when supported by or affiliated with governmental, corporate, or religious organizations, the institution has education as its primary purpose and operates as an academic institution with appropriate autonomy. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="1.6" ID="ckWCUSCAccreditation6" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC6" runat="server" Text="1.6 -The institution truthfully represents its academic goals, programs, services, and costs to students and to the larger public. The institution demonstrates that its academic programs can be completed in a timely fashion. The institution treats students fairly and equitably through established policies and procedures addressing student conduct, grievances, human subjects in research, disability, and financial matters, including refunds and financial aid "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="1.7" ID="ckWCUSCAccreditation7" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC7" runat="server" Text="1.7 -The institution exhibits integrity and transparency in its operations, as demonstrated by the adoption and implementation of appropriate policies and procedures, sound business practices, timely and fair responses to complaints and grievances, and regular evaluation of its performance in these areas. The institution’s finances are regularly audited by qualified independent auditors. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="1.8" ID="ckWCUSCAccreditation8" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC8" runat="server" Text="1.8 -The institution is committed to honest and open communication with the Accrediting Commission; to undertaking the accreditation review process with seriousness and candor; to informing the Commission promptly of any matter that could materially affect the accreditation status of the institution; and to abiding by Commission policies and procedures, including all substantive change policies. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender46" runat="server" TargetControlID="pnlWCUSC1"
                        CollapsedSize="0" ExpandedSize="450"
                        ExpandedText="Standard 1: Defining Institutional Purposes and Ensuring Educational Objectives"
                        CollapsedText="Standard 1: Defining Institutional Purposes and Ensuring Educational Objectives" TextLabelID="lblWCUSC1" ImageControlID="imgWCUSC1"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgWCUSC1"
                        CollapseControlID="imgWCUSC1"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    WCUSC Standard 2 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel47" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblWCUSC2" ForeColor="White" Text="Standard 2: Achieving Educational Objectives through Core Functions" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label262" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgWCUSC2" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlWCUSC2" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table18" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" Width="80px">
                                    <asp:CheckBox Font-Bold="true" Text="2.1" ID="ckWCUSCAccreditation9" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC9" runat="server" Text="2.1 -The institution’s educational programs are appropriate in content, standards of performance, rigor, and nomenclature for the degree level awarded, regardless of mode of delivery. They are staffed by sufficient numbers of faculty qualified for the type and level of curriculum offered. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.2" ID="ckWCUSCAccreditation10" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC10" runat="server" Text="2.2 -All degrees awarded by the institution are clearly defined in terms of entry-level requirements and levels of student achievement necessary for graduation that represent more than simply an accumulation of courses or credits. The institution has both a coherent philosophy, expressive of its mission, which guides the meaning of its degrees and processes that ensure the quality and integrity of its degrees. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.3" ID="ckWCUSCAccreditation11" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC11" runat="server" Text="2.3 -The institution’s student learning outcomes and standards of performance are clearly stated at the course, program, and, as appropriate, institutional level. These outcomes and standards are reflected in academic programs, policies, and curricula, and are aligned with advisement, library, and information and technology resources, and the wider learning environment. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.4" ID="ckWCUSCAccreditation12" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC12" runat="server" Text="2.4 -The institution’s student learning outcomes and standards of performance are developed by faculty and widely shared among faculty, students, staff, and (where appropriate) external stakeholders. The institution’s faculty take collective responsibility for establishing appropriate standards of performance and demonstrating through assessment the achievement of these standards. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.5" ID="ckWCUSCAccreditation13" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC13" runat="server" Text="2.5 -The institution’s academic programs actively involve students in learning, take into account students’ prior knowledge of the subject matter, challenge students to meet high standards of performance, offer opportunities for them to practice, generalize, and apply what they have learned, and provide them with appropriate and ongoing feedback about their performance and how it can be improved. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.6" ID="ckWCUSCAccreditation14" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC14" runat="server" Text="2.6 -The institution demonstrates that its graduates consistently achieve its stated learning out- comes and established standards of performance. The institution ensures that its expectations for student learning are embedded in the standards that faculty use to evaluate student work. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.7" ID="ckWCUSCAccreditation15" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC15" runat="server" Text="2.7 -All programs offered by the institution are subject to systematic program review. The program review process includes, but is not limited to, analyses of student achievement of the program’s learning outcomes; retention and graduation rates; and, where appropriate, results of licensing examination and placement, and evidence from external constituencies such as employers and professional organizations. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.8" ID="ckWCUSCAccreditation16" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC16" runat="server" Text="2.8 -The institution clearly defines expectations for research, scholarship, and creative activity for its students and all categories of faculty. The institution actively values and promotes scholarship, creative activity, and curricular and instructional innovation, and their dissemination appropriate to the institution’s purposes and character. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.9" ID="ckWCUSCAccreditation17" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC17" runat="server" Text="2.9 -The institution recognizes and promotes appropriate linkages among scholarship, teaching, assessment, student learning, and service. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.10" ID="ckWCUSCAccreditation18" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC18" runat="server" Text="2.10 -The institution demonstrates that students make timely progress toward the completion of their degrees and that an acceptable proportion of students complete their degrees in a timely fashion, given the institution’s mission, the nature of the students it serves, and the kinds of programs it offers. The institution collects and analyzes student data, disaggregated by appropriate demographic categories and areas of study. It tracks achievement, satisfaction, and the extent to which the campus climate supports student success. The institution regularly identifies the characteristics of its students; assesses their preparation, needs, and experiences; and uses these data to improve student achievement. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.11" ID="ckWCUSCAccreditation19" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC19" runat="server" Text="2.11 -Consistent with its purposes, the institution offers co-curricular programs that are aligned with its academic goals, integrated with academic programs, and designed to support all students’ personal and professional development. The institution assesses the effectiveness of its co-curricular programs and uses the results for improvement. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.12" ID="ckWCUSCAccreditation20" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC20" runat="server" Text="2.12 -The institution ensures that all students understand the requirements of their academic programs and receive timely, useful, and complete information and advising about relevant academic requirements. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.13" ID="ckWCUSCAccreditation21" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC21" runat="server" Text="2.13 -The institution provides academic and other student support services such as tutoring, services for students with disabilities, financial aid counseling, career counseling and placement, residential life, athletics, and other services and programs as appropriate, which meet the needs of the specific types of students that the institution serves and the programs it offers. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="2.14" ID="ckWCUSCAccreditation22" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC22" runat="server" Text="2.14 -Institutions that serve transfer students provide clear, accurate, and timely information, ensure equitable treatment under academic policies, provide such students access to student services, and ensure that they are not unduly disadvantaged by the transfer process. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender47" runat="server" TargetControlID="pnlWCUSC2"
                        CollapsedSize="0" ExpandedSize="800"
                        ExpandedText="Standard 2: Achieving Educational Objectives through Core Functions"
                        CollapsedText="Standard 2: Achieving Educational Objectives through Core Functions" TextLabelID="lblWCUSC2" ImageControlID="imgWCUSC2"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgWCUSC2"
                        CollapseControlID="imgWCUSC2"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    WCUSC Standard 3 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel48" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblWCUSC3" ForeColor="White" Text="Standard 3: Developing and Applying Resources and Organizational Structures to Ensure Quality and Sustainability" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label263" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgWCUSC3" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlWCUSC3" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table19" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" Width="80px">
                                    <asp:CheckBox Font-Bold="true" Text="3.1 " ID="ckWCUSCAccreditation23" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC23" runat="server" Text="3.1 -The institution employs faculty and staff with substantial and continuing commitment to the institution. The faculty and staff are sufficient in number, professional qualification, and diversity to achieve the institution’s educational objectives, establish and oversee academic policies, and ensure the integrity and continuity of its academic and co-curricular programs wherever and however delivered. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="3.2" ID="ckWCUSCAccreditation24" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC24" runat="server" Text="3.2 -Faculty and staff recruitment, hiring, orientation, workload, incentives, and evaluation practices are aligned with institutional purposes and educational objectives. Evaluation is consistent with best practices in performance appraisal, including multisource feedback and appropriate peer review. Faculty evaluation processes are systematic and are used to improve teaching and learning. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="3.3" ID="ckWCUSCAccreditation25" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC25" runat="server" Text="3.3 -The institution maintains appropriate and sufficiently supported faculty and staff development activities designed to improve teaching, learning, and assessment of learning outcomes. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="3.4" ID="ckWCUSCAccreditation26" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC26" runat="server" Text="3.4 -The institution is financially stable and has unqualified independent financial audits and resources sufficient to ensure long-term viability. Resource planning and development include realistic budgeting, enrollment management, and diversification of revenue sources. Resource planning is integrated with all other institutional planning. Resources are aligned with educational purposes and objectives. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="3.5" ID="ckWCUSCAccreditation27" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC27" runat="server" Text="3.5 -The institution provides access to information and technology resources sufficient in scope, quality, currency, and kind at physical sites and online, as appropriate, to support its academic offerings and the research and scholarship of its faculty, staff, and students. These information resources, services, and facilities are consistent with the institution’s educational objectives and are aligned with student learning outcomes. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="3.6" ID="ckWCUSCAccreditation28" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC28" runat="server" Text="3.6 -The institution’s leadership, at all levels, is characterized by integrity, high performance, appropriate responsibility, and accountability. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="3.7" ID="ckWCUSCAccreditation29" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC29" runat="server" Text="3.7 -The institution’s organizational structures and decision-making processes are clear and consistent with its purposes, support effective decision making, and place priority on sustaining institutional capacity and educational effectiveness. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="3.8 " ID="ckWCUSCAccreditation30" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC30" runat="server" Text="3.8 -The institution has a full-time chief executive officer and a chief financial officer whose primary or full-time responsibilities are to the institution. In addition, the institution has a sufficient number of other qualified administrators to provide effective educational leadership and management. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="3.9" ID="ckWCUSCAccreditation31" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC31" runat="server" Text="3.9 -The institution has an independent governing board or similar authority that, consistent with its legal and fiduciary authority, exercises appropriate oversight over institutional integrity, policies, and ongoing operations, including hiring and evaluating the chief executive officer. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="3.10 " ID="ckWCUSCAccreditation32" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC32" runat="server" Text="3.10 -The institution’s faculty exercises effective academic leadership and acts consistently to ensure that both academic quality and the institution’s educational purposes and character are sustained. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender48" runat="server" TargetControlID="pnlWCUSC3"
                        CollapsedSize="0" ExpandedSize="550"
                        ExpandedText="Standard 3: Developing and Applying Resources and Organizational Structures to Ensure Quality and Sustainability"
                        CollapsedText="Standard 3: Developing and Applying Resources and Organizational Structures to Ensure Quality and Sustainability" TextLabelID="lblWCUSC3" ImageControlID="imgWCUSC3"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgWCUSC3"
                        CollapseControlID="imgWCUSC3"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>

                <%--  ********************************************    WCUSC Standard 4 ********************************************  --%>
                <div style="width: 1200px; background-color: lightgrey;">
                    <asp:Panel runat="server" ID="panel49" HorizontalAlign="Center">
                        <div style="font-weight: bold; background-color: maroon;">
                            <asp:Table runat="server"
                                Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell runat="server" Font-Size="Larger" align="left">

                                        <asp:Label runat="server" ID="lblWCUSC4" ForeColor="White" Text="Standard 4: Creating an Organization Committed to Quality Assurance, Institutional Learning, and Improvement" />
                                    </asp:TableCell>
                                    <asp:TableCell runat="server" align="center">
                                        <asp:Label runat="server" ID="Label264" BackColor="White" ForeColor="Red" Text="" />
                                    </asp:TableCell>

                                    <asp:TableCell align="right" Width="10px" runat="server">
                                        <asp:Image ID="imgWCUSC4" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlWCUSC4" runat="server" BorderWidth="1" BorderColor="Black" HorizontalAlign="Left">

                        <asp:Table ID="Table20" runat="server" Width="100%" CellPadding="0" CellSpacing="5">
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1" Width="80px">
                                    <asp:CheckBox Font-Bold="true" Text="4.1" ID="ckWCUSCAccreditation33" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC33" runat="server" Text="4.1 -The institution employs a deliberate set of quality-assurance processes in both academic and non-academic areas, including new curriculum and program approval processes, periodic program review, assessment of student learning, and other forms of ongoing evaluation. These processes include: collecting, analyzing, and interpreting data; tracking learning results over time; using comparative data from external sources; and improving structures, services, processes, curricula, pedagogy, and learning results. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="4.2" ID="ckWCUSCAccreditation34" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC34" runat="server" Text="Replace4.2 -The institution has institutional research capacity consistent with its purposes and characteristics. Data are disseminated internally and externally in a timely manner, and analyzed, interpreted, and incorporated in institutional review, planning, and decision-making. Periodic reviews are conducted to ensure the effectiveness of the institutional research function and the suitability and usefulness of the data generated. Text"></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="4.3" ID="ckWCUSCAccreditation35" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC35" runat="server" Text="4.3 -Leadership at all levels, including faculty, staff, and administration, is committed to improvement based on the results of inquiry, evidence, and evaluation. Assessment of teaching, learning, and the campus environment – in support of academic and co-curricular objectives – is undertaken, used for improvement, and incorporated into institutional planning processes. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="4.4" ID="ckWCUSCAccreditation36" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC36" runat="server" Text="4.4 -The institution, with significant faculty involvement, engages in ongoing inquiry into the processes of teaching and learning, and the conditions and practices that ensure that the standards of performance established by the institution are being achieved. The faculty and other educators take responsibility for evaluating the effectiveness of teaching and learning processes and uses the results for improvement of student learning and success. The findings from such inquiries are applied to the design and improvement of curricula, pedagogy, and assessment methodology. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="4.5" ID="ckWCUSCAccreditation37" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC37" runat="server" Text="4.5 -Appropriate stakeholders, including alumni, employers, practitioners, students, and others designated by the institution, are regularly involved in the assessment and alignment of educational programs. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="4.6" ID="ckWCUSCAccreditation38" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC38" runat="server" Text="4.6 -The institution periodically engages its multiple constituencies, including the governing board, faculty, staff, and others, in institutional reflection and planning processes that are based on the examination of data and evidence. These processes assess the institution’s strategic position, articulate priorities, examine the alignment of its purposes, core functions, and resources, and define the future direction of the institution. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:CheckBox Font-Bold="true" Text="4.7" ID="ckWCUSCAccreditation39" runat="server" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                                    <asp:Literal ID="litWCUSC39" runat="server" Text="4.7 -Within the context of its mission and structural and financial realities, the institution considers changes that are currently taking place and are anticipated to take place within the institution and higher education environment as part of its planning, new program development, and resource allocation. "></asp:Literal>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender49" runat="server" TargetControlID="pnlWCUSC4"
                        CollapsedSize="0" ExpandedSize="450"
                        ExpandedText="Standard 4: Creating an Organization Committed to Quality Assurance, Institutional Learning, and Improvement"
                        CollapsedText="Standard 4: Creating an Organization Committed to Quality Assurance, Institutional Learning, and Improvement" TextLabelID="lblWCUSC4" ImageControlID="imgWCUSC4"
                        ExpandedImage="~/images/collapse.jpg" CollapsedImage="~/images/expand_blue.jpg"
                        ExpandControlID="imgWCUSC4"
                        CollapseControlID="imgWCUSC4"
                        Collapsed="true" SuppressPostBack="false" />

                    <hr />
                </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
    <br />
</asp:Content>