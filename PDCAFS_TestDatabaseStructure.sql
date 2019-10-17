USE [master]
GO
/****** Object:  Database [PDCAFS_Test]    Script Date: 10/17/2019 10:32:29 AM ******/
CREATE DATABASE [PDCAFS_Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PDCAFS_Test1', FILENAME = N's:\Test\PDCA\PDCAFS_Testdat1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [FileStreamGroup1] CONTAINS FILESTREAM  DEFAULT
( NAME = N'PDCAFS_TestArch3', FILENAME = N's:\Test\PDCA\Test_filestream1' , MAXSIZE = UNLIMITED)
 LOG ON 
( NAME = N'PDCAFS_TestArchlog1', FILENAME = N's:\Test\PDCAFS_Testarchlog1.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PDCAFS_Test] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PDCAFS_Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PDCAFS_Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PDCAFS_Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PDCAFS_Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PDCAFS_Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PDCAFS_Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET RECOVERY FULL 
GO
ALTER DATABASE [PDCAFS_Test] SET  MULTI_USER 
GO
ALTER DATABASE [PDCAFS_Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PDCAFS_Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PDCAFS_Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PDCAFS_Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PDCAFS_Test] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PDCAFS_Test', N'ON'
GO
ALTER DATABASE [PDCAFS_Test] SET QUERY_STORE = OFF
GO
USE [PDCAFS_Test]
GO
/****** Object:  User [PDCAUsers]    Script Date: 10/17/2019 10:32:31 AM ******/
CREATE USER [PDCAUsers] FOR LOGIN [PDCAUsers] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CCHSU\swragg]    Script Date: 10/17/2019 10:32:31 AM ******/
CREATE USER [CCHSU\swragg] FOR LOGIN [CCHSU\swragg] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[PDCAHasThisAccreditationStandard]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>

--drop function dbo.PDCAHasThisAccreditationStandard

-- =============================================
CREATE FUNCTION [dbo].[PDCAHasThisAccreditationStandard] 
(
	-- Add the parameters for the function here
	@pdcaid int = null,
	@accreditationstring varchar(500)=null,
	@organizationid int = null
	
)
RETURNS varchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar varchar(50)
    declare @standard varchar(50)
	select @ResultVar='false'
	
	declare c1 cursor for 
	   select standard from AccreditationStandards
	         where AccreditationOrganizationID=@organizationid

 open c1
     fetch next from c1 into @standard
	 while @@FETCH_STATUS =0 
	 begin
	   if (@standard in (select value from string_split(@accreditationstring,'|')))
	    select @ResultVar='true'
	   fetch next from c1 into @standard
	 end
close c1
deallocate c1

	-- Return the result of the function
	RETURN @ResultVar

END
GO
/****** Object:  Table [dbo].[Assessments]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessments](
	[AssessmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Assessments] PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDCAAssessments]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDCAAssessments](
	[PDCAAssessmentID] [int] IDENTITY(1,1) NOT NULL,
	[PDCAID] [int] NULL,
	[AssessmentID] [int] NULL,
	[Checked] [nvarchar](50) NULL,
 CONSTRAINT [PK_PDCAAssessments] PRIMARY KEY CLUSTERED 
(
	[PDCAAssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwPDCAAssessmentTools]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwPDCAAssessmentTools]
AS
SELECT        PDCAID, a.AssessmentID, Checked, a.Name, a.Description
FROM            dbo.PDCAAssessments p
join Assessments a on a.AssessmentID=p.AssessmentID

GO
/****** Object:  Table [dbo].[AccreditationStandards]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccreditationStandards](
	[AccreditationStandardID] [int] IDENTITY(1,1) NOT NULL,
	[AccreditationOrganizationID] [int] NULL,
	[CategoryID] [int] NULL,
	[Standard] [nvarchar](50) NULL,
	[Description] [nvarchar](4000) NULL,
	[ToolTip] [nvarchar](2000) NULL,
	[Active] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccreditationStandards] PRIMARY KEY CLUSTERED 
(
	[AccreditationStandardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwAccreditationStandards]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAccreditationStandards]
AS
SELECT        AccreditationStandardID, AccreditationOrganizationID, CategoryID, Standard, Description, ToolTip, Active
FROM            dbo.AccreditationStandards
WHERE        (AccreditationOrganizationID = 1)
GO
/****** Object:  Table [dbo].[PDCA]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDCA](
	[PDCAID] [int] IDENTITY(1,1) NOT NULL,
	[DateEntered] [datetime] NULL,
	[LastUpdate] [datetime] NULL,
	[DateSubmitted] [datetime] NULL,
	[EnteredBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[Submittedby] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[SubmissionTeam] [nvarchar](500) NULL,
	[Status] [nvarchar](50) NULL,
	[Entity] [nvarchar](50) NULL,
	[SchoolYear] [int] NULL,
	[SchoolYearID] [int] NULL,
	[WCUSCAccreditation] [nvarchar](500) NULL,
	[COCAAccreditation] [nvarchar](500) NULL,
	[ACPEAccreditation] [nvarchar](500) NULL,
 CONSTRAINT [PK_PDCA] PRIMARY KEY CLUSTERED 
(
	[PDCAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDCANotes]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDCANotes](
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[PDCAID] [int] NULL,
	[PDCAFieldID] [int] NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_PDCANotes] PRIMARY KEY CLUSTERED 
(
	[NoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwPDCAs]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create view [dbo].[vwPDCAs] 
as 

SELECT p.PDCAID
      ,DateEntered
      ,LastUpdate
      ,isnull(EnteredBy,'') as enteredby
      ,isnull(UpdatedBy,'') as UpdatedBy
      ,isnull(Department,'Department not entered') as Department
      ,isnull(Title,'Title not entered') as Title
      ,isnull(Description,'Description not entered') as Description
	  ,isnull(SchoolYear,year(getdate())) as SchoolYear
	  ,isnull(SchoolYearID,0) as SchoolYearID
	  ,isnull(Status,'New') as Status
	  ,isnull(Submissionteam,'') as SubmissionTeam
	  ,isnull(paSurvey.Checked,0) as 'paSurvey'
  	  ,isnull(paFocus.Checked,0) as 'paFocus'
	  ,isnull(paFormative.Checked,0) as 'paFormative'
	  ,isnull(paProgram.Checked,0) as 'paProgram'
	  ,isnull(paInput.Checked,0) as 'paInput'
	  ,isnull(paExternal.Checked,0) as 'paExternal'
	  ,isnull(paTests.Checked,0) as 'paTests'
	  ,isnull(paReview.Checked,0) as 'paReview'
	  ,isnull(paCLO.Checked,0) as 'paCLO'
	  ,isnull(paPlan.Checked,0) as 'paPlan'
	  ,isnull(paPeerReview.Checked,0) as 'paPeerReview'
	  ,isnull(paOther.Checked,0) as 'paOther'
	  ,isnull(entity,'') as entity
	  ,isnull(WCUSCAccreditation,'') as WCUSCAccreditation
	  ,isnull(COCAAccreditation,'') as COCAAccreditation
	  ,isnull(ACPEAccreditation,'') as ACPEAccreditation
	  ,datesubmitted
      ,submittedby
	  ,pdcan1.Note as 'Subject of Assessment'
	  ,pdcan2.Note as 'Assessment Name'
	  ,pdcan3.Note as 'Strengths'
	  ,pdcan4.Note as 'Insights'
	  ,pdcan5.Note as 'Areas for Improvement'

	  ,pdcan6.Note as 'Plan'
	  ,pdcan7.Note as 'Do'
	  ,pdcan8.Note as 'Check'
	  ,pdcan9.Note as 'Additional Comments'
	  ,pdcan10.Note as 'Report Must Be Conveyed'
	  
  FROM dbo.PDCA p
  left join PDCAAssessments paSurvey on paSurvey.PDCAID=p.PDCAID and paSurvey.AssessmentID  =1
  left join PDCAAssessments paFocus on paFocus.PDCAID=p.PDCAID and paFocus.AssessmentID  =2
  left join PDCAAssessments paFormative on paFormative.PDCAID=p.PDCAID and paFormative.AssessmentID  =3
  left join PDCAAssessments paProgram on paProgram.PDCAID=p.PDCAID and paProgram.AssessmentID  =4
  left join PDCAAssessments paInput on paInput.PDCAID=p.PDCAID and paInput.AssessmentID  =5
  left join PDCAAssessments paExternal on paExternal.PDCAID=p.PDCAID and paExternal.AssessmentID  =6
  left join PDCAAssessments paTests on paTests.PDCAID=p.PDCAID and paTests.AssessmentID  =7
  left join PDCAAssessments paReview on paReview.PDCAID=p.PDCAID and paReview.AssessmentID  =8
  left join PDCAAssessments paCLO on paCLO.PDCAID=p.PDCAID and paCLO.AssessmentID  =9
  left join PDCAAssessments paPlan on paPlan.PDCAID=p.PDCAID and paPlan.AssessmentID  =10
  left join PDCAAssessments paPeerReview on paPeerReview.PDCAID=p.PDCAID and paPeerReview.AssessmentID  =11
  left join PDCAAssessments paOther on paOther.PDCAID=p.PDCAID and paOther.AssessmentID  =12

  left join pdcanotes pdcan1 on pdcan1.PDCAID=p.PDCAID and pdcan1.PDCAFieldID=1
  left join pdcanotes pdcan2 on pdcan2.PDCAID=p.PDCAID and pdcan2.PDCAFieldID=2
  left join pdcanotes pdcan3 on pdcan3.PDCAID=p.PDCAID and pdcan3.PDCAFieldID=3
  left join pdcanotes pdcan4 on pdcan4.PDCAID=p.PDCAID and pdcan4.PDCAFieldID=4
  left join pdcanotes pdcan5 on pdcan5.PDCAID=p.PDCAID and pdcan5.PDCAFieldID=5

  left join pdcanotes pdcan6 on pdcan6.PDCAID=p.PDCAID and pdcan6.PDCAFieldID=6
  left join pdcanotes pdcan7 on pdcan7.PDCAID=p.PDCAID and pdcan7.PDCAFieldID=7
  left join pdcanotes pdcan8 on pdcan8.PDCAID=p.PDCAID and pdcan8.PDCAFieldID=8
  left join pdcanotes pdcan9 on pdcan9.PDCAID=p.PDCAID and pdcan9.PDCAFieldID=9
  left join pdcanotes pdcan10 on pdcan10.PDCAID=p.PDCAID and pdcan10.PDCAFieldID=10

GO
/****** Object:  Table [dbo].[AccreditationOrganization]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccreditationOrganization](
	[AccreditationOrganizationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_AccreditationOrganization] PRIMARY KEY CLUSTERED 
(
	[AccreditationOrganizationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccreditationStandardCategory]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccreditationStandardCategory](
	[AccreditationStandardCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[AccreditationOrganizationID] [int] NULL,
	[CategoryID] [int] NULL,
	[ParentCategoryID] [int] NULL,
	[Title] [nvarchar](1000) NULL,
	[Description] [nvarchar](4000) NULL,
	[Active] [nvarchar](50) NULL,
 CONSTRAINT [PK_AccreditationStandardCategory] PRIMARY KEY CLUSTERED 
(
	[AccreditationStandardCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity](
	[EntityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDCAAccreditationStandards]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDCAAccreditationStandards](
	[PDCAAccreditationStandardD] [int] IDENTITY(1,1) NOT NULL,
	[PDCAID] [int] NULL,
	[AccreditationStandardID] [int] NULL,
 CONSTRAINT [PK_PDCAAccreditationStandards] PRIMARY KEY CLUSTERED 
(
	[PDCAAccreditationStandardD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDCADocuments]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDCADocuments](
	[DocumentID] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[PDCADocumentID] [int] IDENTITY(1,1) NOT NULL,
	[PDCAID] [int] NULL,
	[DocumentName] [varchar](1000) NULL,
	[DocumentType] [varchar](50) NULL,
	[FileExtension] [nvarchar](50) NULL,
	[Title] [nvarchar](2000) NULL,
	[Description] [nvarchar](2000) NULL,
	[InsertDate] [datetime] NULL,
	[InsertedBy] [nvarchar](50) NULL,
	[DocumentFS] [varbinary](max) FILESTREAM  NULL,
 CONSTRAINT [PK_PDCADocuments] PRIMARY KEY CLUSTERED 
(
	[PDCADocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY] FILESTREAM_ON [FileStreamGroup1],
 CONSTRAINT [UQ__PDCADocu__1ABEEF6ED097702E] UNIQUE NONCLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] FILESTREAM_ON [FileStreamGroup1]
GO
/****** Object:  Table [dbo].[PDCAFields]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDCAFields](
	[PDCAFieldID] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [nvarchar](50) NULL,
	[Title] [nvarchar](1000) NULL,
	[Description] [nvarchar](2000) NULL,
	[ToolTip] [nvarchar](500) NULL,
	[DisplayOrder] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PDCAFields] PRIMARY KEY CLUSTERED 
(
	[PDCAFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDCATeam]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDCATeam](
	[PDCATeamID] [int] IDENTITY(1,1) NOT NULL,
	[PDCAID] [int] NULL,
	[Userid] [nvarchar](50) NULL,
 CONSTRAINT [PK_PDCATeam] PRIMARY KEY CLUSTERED 
(
	[PDCATeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDCAUsers]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDCAUsers](
	[PDCAUserID] [int] IDENTITY(1,1) NOT NULL,
	[NetworkUserID] [varchar](50) NULL,
	[FiratName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[UserRole] [varchar](50) NULL,
 CONSTRAINT [PK_PDCAUsers] PRIMARY KEY CLUSTERED 
(
	[PDCAUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UploadFileType]    Script Date: 10/17/2019 10:32:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadFileType](
	[UploadFileTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FileType] [varchar](50) NULL,
	[FileExtension] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Permitted] [varchar](50) NULL,
 CONSTRAINT [PK_UploadFileType] PRIMARY KEY CLUSTERED 
(
	[UploadFileTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20191009-135757]    Script Date: 10/17/2019 10:32:33 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191009-135757] ON [dbo].[PDCAAccreditationStandards]
(
	[PDCAID] ASC,
	[AccreditationStandardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20191009-135721]    Script Date: 10/17/2019 10:32:33 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191009-135721] ON [dbo].[PDCAAssessments]
(
	[PDCAID] ASC,
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20191009-135544]    Script Date: 10/17/2019 10:32:33 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191009-135544] ON [dbo].[PDCADocuments]
(
	[PDCAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20191009-135442]    Script Date: 10/17/2019 10:32:33 AM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191009-135442] ON [dbo].[PDCANotes]
(
	[PDCAID] ASC,
	[PDCAFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccreditationStandardCategory] ADD  CONSTRAINT [DF_AccreditationStandardCategory_ParentCategoryID]  DEFAULT ((0)) FOR [ParentCategoryID]
GO
ALTER TABLE [dbo].[PDCA] ADD  CONSTRAINT [DF_PDCA_DateEntered]  DEFAULT (getdate()) FOR [DateEntered]
GO
ALTER TABLE [dbo].[PDCADocuments] ADD  CONSTRAINT [DF_PDCADocuments_DocumentID]  DEFAULT (newid()) FOR [DocumentID]
GO
/****** Object:  StoredProcedure [dbo].[AccreditationOrganization_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[AccreditationOrganization_Select] (   	
    @Name nvarchar(50) = null   
)
as
set nocount on 
set ansi_warnings off


SELECT [AccreditationOrganizationID]
      ,[Name]
      ,[Description]
  FROM [dbo].[AccreditationOrganization]
  where name=@name or @name is null








set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[AccreditationStandards_Insert]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[AccreditationStandards_Insert] (
   @AccreditationOrganizationID int = null,
   @Standard nvarchar(50)=null,
   @Description nvarchar(2000)=null,
   @ToolTip nvarchar(2000)=null
)
as
set nocount on
set ansi_warnings off


INSERT INTO [dbo].[AccreditationStandards]
           ([AccreditationOrganizationID]
           ,[Standard]
           ,[Description]
           ,[ToolTip])
     VALUES
           (@AccreditationOrganizationID
           ,@Standard
           ,@Description
           ,@ToolTip)






set nocount off
set ansi_warnings on 
GO
/****** Object:  StoredProcedure [dbo].[AccreditationStandards_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[AccreditationStandards_Select] (   	
   @AccreditationStandardID int = null,
      @AccreditationOrganizationID int=null
)
as
set nocount on 
set ansi_warnings off


SELECT AccreditationStandardID
      ,acs.AccreditationOrganizationID
	  ,oa.Name
	  ,oa.Description
      ,Standard
  FROM dbo.AccreditationStandards acs
  join accreditationorganization oa on oa.AccreditationOrganizationID=acs.AccreditationOrganizationID
  where
    ( @AccreditationStandardID is null or  @AccreditationStandardID =  acs.AccreditationStandardID) and
      (@AccreditationOrganizationID is null or  @AccreditationOrganizationID  =  acs.AccreditationOrganizationID)


 set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[AccreditationStandards_Update]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[AccreditationStandards_Update] (
   @AccreditationStandardID int = null,
   @AccreditationOrganizationID int = null,
   @Standard nvarchar(50)=null,
   @Description nvarchar(2000)=null,
   @ToolTip nvarchar(2000)=null
)
as
set nocount on
set ansi_warnings off




UPDATE [dbo].[AccreditationStandards]
   SET [AccreditationOrganizationID] = @AccreditationOrganizationID
      ,[Standard] = @Standard
      ,[Description] = @Description
      ,[ToolTip] = @ToolTip
 WHERE AccreditationStandardID = @AccreditationStandardID

        


set nocount off
set ansi_warnings on 




















GO
/****** Object:  StoredProcedure [dbo].[Assessments_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[Assessments_Select] (   	
    @Name nvarchar(50) = null   
)
as
set nocount on 
set ansi_warnings off


SELECT [AssessmentID]
      ,[Name]
      ,[Description]
  FROM [dbo].[Assessments]
  where name=@name or @name is null






set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[EnableFileStream]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[EnableFileStream] 
as


EXEC sp_configure filestream_access_level, 2  
RECONFIGURE  
GO
/****** Object:  StoredProcedure [dbo].[PDCA_Insert]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PDCA_Insert] (
    @username nvarchar(50)= null,
	@submissionteam nvarchar(500)=null,
   @Department nvarchar(50)= null,
   @Title nvarchar(500)= null,
   @entity nvarchar(50)=null,
     @Description nvarchar(500)=null,	 
	 @schoolyear int = null,
	  @ckCHSU nvarchar(10)= null,	 
	 @ckCOM nvarchar(10)= null,
	 @ckCOP nvarchar(10)= null,
 	 @ckUnsure nvarchar(10)= null,

	 @ckExternalReview nvarchar(10)= null,
	 @ckFocusGroupResults nvarchar(10)= null,
	 @ckFormative nvarchar(10)= null,
	 @ckInputData nvarchar(10)= null,
	 @ckOther nvarchar(10)= null,
	 @ckPeerReview nvarchar(10)= null,
	 @ckPlan nvarchar(10)= null, 
	 @ckProgramOutcome nvarchar(10)= null,
	 @ckReview nvarchar(10)= null, 
	 @ckSurveyResults nvarchar(10)= null,
	 @ckTests nvarchar(10)= null,
	 @ckCLO nvarchar(10) = null,
	 @WCUSCAccreditation nvarchar(500)=null,
	 @COCAAccreditation nvarchar(500)=null,
	 @ACPEAccreditation nvarchar(500)=null


	 
)
as
set nocount on 
set ansi_warnings off

declare @pdcaid int
declare @schoolyearid int


INSERT INTO [dbo].[PDCA]
           ([EnteredBy]    
		   ,UpdatedBy
		   ,LastUpdate
           ,[Department]
           ,[Title]
           ,[Description]
		   ,status
		   ,submissionteam
		   ,schoolyear
		   ,schoolyearid
		   ,entity
  		   ,WCUSCAccreditation 
	       ,COCAAccreditation
	       ,ACPEAccreditation
)

     Select           
           @username, 
		   @username,
		   getdate(),
           @Department,
           @Title, 
           @Description,
		   'New',
		   @submissionteam
		   ,@schoolyear
		   ,isnull((select max(isnull(schoolyearid,0)) from pdca where schoolyear=@schoolyear),0) + 1
		   ,@entity
		   ,@WCUSCAccreditation 
	       ,@COCAAccreditation
	       ,@ACPEAccreditation

select @pdcaid =@@IDENTITY

select @schoolyearid=schoolyearid
from pdca 
where PDCAID=@pdcaid

insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	1,
	@ckSurveyResults

insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	2,
	@ckFocusGroupResults

	insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	3,
	@ckFormative

	insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	4,
	@ckProgramOutcome

	insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	5,
	@ckInputData

	insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	6,
	@ckExternalReview

	insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	7,
	@ckTests

	insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	8,
	@ckReview

	insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	9,
	@ckCLO

	insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	10,
	@ckPlan

	insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	11,
	@ckReview

	insert into PDCAAssessments (
    PDCAID,
	AssessmentID,
	Checked
	)
	select 
	@pdcaid,
	12,
	@ckOther


	insert into PDCAAccreditationStandards
	(
	PDCAid, 
	AccreditationStandardID
	)
	select 
	@pdcaid, 
	AccreditationStandardID
	from AccreditationStandards accs
	where 
	accs.AccreditationOrganizationID=1
	and accs.Standard in ( select value from string_split(@ACPEAccreditation,'|'))

		insert into PDCAAccreditationStandards
	(
	PDCAid, 
	AccreditationStandardID
	)
	select 
	@pdcaid, 
	AccreditationStandardID
	from AccreditationStandards accs
	where 
	accs.AccreditationOrganizationID=2
	and accs.Standard in ( select value from string_split(@COCAAccreditation,'|'))

		insert into PDCAAccreditationStandards
	(
	PDCAid, 
	AccreditationStandardID
	)
	select 
	@pdcaid, 
	AccreditationStandardID
	from AccreditationStandards accs
	where 
	accs.AccreditationOrganizationID=3
	and accs.Standard in ( select value from string_split(@WCUSCAccreditation,'|'))


	select @pdcaid as 'PDCAID', 
	    @schoolyearid as 'schoolyearid'

set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCA_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PDCA_Select] (   	
   @department nvarchar(50) = null,
      @pdcaid int=null,
	  @title nvarchar(100)=null,
	  @description nvarchar(100)=null,
	  @enteredby nvarchar(50)=null,
	  @submissionteam nvarchar(100)=null,
	  @entity varchar(50)=null
	  ,@status varchar(50)=null
 	  ,@SchoolYear varchar(100) = null
	  ,@SchoolYearID int = null
	  ,@paSurvey  nvarchar(50) = null
  	  ,@paFocus  nvarchar(50) = null
	  ,@paFormative  nvarchar(50) = null
	  ,@paProgram  nvarchar(50) = null
	  ,@paInput  nvarchar(50) = null
	  ,@paExternal  nvarchar(50) = null
	  ,@paTests  nvarchar(50) = null
	  ,@paReview  nvarchar(50) = null
	  ,@paCLO  nvarchar(50) = null
	  ,@paPlan  nvarchar(50) = null
	  ,@paPeerReview  nvarchar(50) = null
	  ,@paOther  nvarchar(50) = null
	  ,@SubjectOfAssessementExamplesMatch  nvarchar(50) = null
,@AssessmentNameMatch  nvarchar(50) = null
,@StrengthsMatch  nvarchar(50) = null
,@InsightsMatch  nvarchar(50) = null
,@AreasforImprovementMatch  nvarchar(50) = null
,@PlanMatch  nvarchar(50) = null
,@DoMatch  nvarchar(50) = null
,@CheckMatch  nvarchar(50) = null
,@AdditionalCommentsMatch  nvarchar(50) = null
,@ReportMustBeConveyedMatch  nvarchar(50) = null
,@startdate datetime=null
,@enddate datetime=null
,@ACPEaccreditationstandards nvarchar(1000)=null
,@COCAaccreditationstandards nvarchar(1000)=null
,@WCUSCaccreditationstandards nvarchar(1000)=null

)
as
set nocount on 
set ansi_warnings off

/****************************************

	  PDCA_select 
	  @department ='p' ,
	  @title='' , 
	  @description ='',
	  @enteredby ='', 
	  @entity ='', 
	  @status ='', 
	  @SchoolYear ='', 
	  @startdate ='', 
	  @enddate ='', 
	  @SubjectOfAssessementExamplesMatch ='', 
	  @AssessmentNameMatch ='', 
	  @StrengthsMatch ='', 
	  @InsightsMatch ='', 
	  @AreasforImprovementMatch ='', 
	  @PlanMatch ='', 
	  @DoMatch ='', 
	  @CheckMatch ='', 
	  @AdditionalCommentsMatch ='', 
	  @ReportMustBeConveyedMatch =''



*********************************************/

create table #ACPEaccreditationstandards (
    standard varchar(50)
	)
create table #COCAaccreditationstandards (
    standard varchar(50)
	)

	create table #WCUSCaccreditationstandards (
    standard varchar(50)
	)

insert into #ACPEaccreditationstandards (standard)	
SELECT value FROM STRING_SPLIT(@ACPEaccreditationstandards, '|');

insert into #COCAaccreditationstandards (standard)	
SELECT value FROM STRING_SPLIT(@COCAaccreditationstandards, '|');

insert into #WCUSCaccreditationstandards (standard)	
SELECT value FROM STRING_SPLIT(@WCUSCaccreditationstandards, '|');

create table #temp1 (
PDCAID int
      ,DateEntered datetime
      ,LastUpdate datetime
      ,EnteredBy nvarchar(50)
      ,UpdatedBy nvarchar(50)
      ,Department nvarchar(100)
      ,Title nvarchar(1000)
      ,Description nvarchar(1000)
	  ,SchoolYear int
	  ,SchoolYearID int
	  ,paSurvey char(1)
  	  ,paFocus char(1)
	  ,paFormative char(1)
	  ,paProgram char(1)
	  ,paInput char(1)
	  ,paExternal char(1)
	  ,paTests char(1)
	  ,paReview char(1)
	  ,paCLO char(1)
	  ,paPlan char(1)
	  ,paPeerReview char(1)
	  ,paOther char(1)
	  ,entity char(1)
	  ,status varchar(50)
	  ,SubjectOfAssessementExamplesMatch char(1)
,AssessmentNameMatch char(1)
,StrengthsMatch char(1)
,InsightsMatch char(1)
,AreasforImprovementMatch char(1)
,PlanMatch char(1)
,DoMatch char(1)
,CheckMatch char(1)
,AdditionalCommentsMatch char(1)
,ReportMustBeConveyedMatch char(1)

	  )


SELECT p.PDCAID
      ,DateEntered
      ,LastUpdate
      ,isnull(EnteredBy,'') as enteredby
      ,isnull(UpdatedBy,'') as UpdatedBy
      ,isnull(Department,'Department not entered') as Department
      ,isnull(Title,'Title not entered') as Title
      ,isnull(Description,'Description not entered') as Description
	  ,isnull(SchoolYear,year(getdate())) as SchoolYear
	  ,isnull(SchoolYearID,0) as SchoolYearID
	  ,isnull(Status,'New') as Status
	  ,isnull(Submissionteam,'') as SubmissionTeam
	  ,isnull(paSurvey.Checked,0) as 'paSurvey'
  	  ,isnull(paFocus.Checked,0) as 'paFocus'
	  ,isnull(paFormative.Checked,0) as 'paFormative'
	  ,isnull(paProgram.Checked,0) as 'paProgram'
	  ,isnull(paInput.Checked,0) as 'paInput'
	  ,isnull(paExternal.Checked,0) as 'paExternal'
	  ,isnull(paTests.Checked,0) as 'paTests'
	  ,isnull(paReview.Checked,0) as 'paReview'
	  ,isnull(paCLO.Checked,0) as 'paCLO'
	  ,isnull(paPlan.Checked,0) as 'paPlan'
	  ,isnull(paPeerReview.Checked,0) as 'paPeerReview'
	  ,isnull(paOther.Checked,0) as 'paOther'
	  ,isnull(entity,'') as entity
	  ,isnull(WCUSCAccreditation,'') as WCUSCAccreditation
	  ,isnull(COCAAccreditation,'') as COCAAccreditation
	  ,isnull(ACPEAccreditation,'') as ACPEAccreditation
	  ,datesubmitted
      ,submittedby
	  
  FROM dbo.PDCA p
  left join PDCAAssessments paSurvey on paSurvey.PDCAID=p.PDCAID and paSurvey.AssessmentID  =1
  left join PDCAAssessments paFocus on paFocus.PDCAID=p.PDCAID and paFocus.AssessmentID  =2
  left join PDCAAssessments paFormative on paFormative.PDCAID=p.PDCAID and paFormative.AssessmentID  =3
  left join PDCAAssessments paProgram on paProgram.PDCAID=p.PDCAID and paProgram.AssessmentID  =4
  left join PDCAAssessments paInput on paInput.PDCAID=p.PDCAID and paInput.AssessmentID  =5
  left join PDCAAssessments paExternal on paExternal.PDCAID=p.PDCAID and paExternal.AssessmentID  =6
  left join PDCAAssessments paTests on paTests.PDCAID=p.PDCAID and paTests.AssessmentID  =7
  left join PDCAAssessments paReview on paReview.PDCAID=p.PDCAID and paReview.AssessmentID  =8
  left join PDCAAssessments paCLO on paCLO.PDCAID=p.PDCAID and paCLO.AssessmentID  =9
  left join PDCAAssessments paPlan on paPlan.PDCAID=p.PDCAID and paPlan.AssessmentID  =10
  left join PDCAAssessments paPeerReview on paPeerReview.PDCAID=p.PDCAID and paPeerReview.AssessmentID  =11
  left join PDCAAssessments paOther on paOther.PDCAID=p.PDCAID and paOther.AssessmentID  =12
   where
   --(@startdate is null or @startdate <= p.DateEntered) and
   --(@enddate is null or @enddate >= p.DateEntered) and
	(isnull(@pdcaid,0)=0 or @pdcaid = p.PDCAID) and
	(isnull(@entity,'')='' or p.entity like '%' + @entity+ '%') and
	(isnull(@department,'')='' or department like '%' +@Department+'%') and 
	(isnull(@title,'')='' or title like '%'+@title +'%') and 
	(isnull(@description,'')='' or Description like '%'+@description +'%') and 
	(isnull(@enteredby,'')='' or EnteredBy like '%'+@enteredby +'%')  and
	(isnull(@SchoolYear,'')='' or  convert(varchar,schoolyear) like '%'+@schoolYear +'%') and 	
	(isnull(@submissionteam,'')='' or submissionteam like '%' + @submissionteam+'%') and
	(isnull(@status,'')='' or status like '%' + @status+'%') and
	--(isnull(@paSurvey,'') ='' or @paSurvey=paSurvey.Checked) and 
 -- 	 (isnull(@paFocus,'') ='' or @paFocus=pafocus.Checked) and
	--  (isnull(@paFormative,'') ='' or @paFormative =paFormative.Checked) and
	--  (isnull(@paProgram,'') ='' or @paProgram=paProgram.Checked) and
	--  (isnull(@paInput,'') ='' or @paInput=paInput.Checked) and
	--  (isnull(@paExternal,'') ='' or @paExternal = paExternal.Checked) and
	--  (isnull(@paTests,'') ='' or @paTests =paTests.Checked) and
	--  (isnull(@paReview,'') = '' or @paReview = paReview.Checked) and
	--  (isnull(@paCLO,'') = '' or @paCLO = paclo.Checked) and
	--  (isnull(@paPlan,'') ='' or @paPlan =paPlan.Checked) and
	--  (isnull(@paPeerReview,'') ='' or @paPeerReview = paPeerReview.Checked) and
	--  (isnull(@paOther,'') = '' or @paOther = paother.Checked) and 

	(	(isnull(@SubjectOfAssessementExamplesMatch,'')='')	or 	 ((select Note from PDCANotes pn where pn.PDCAID=p.PDCAID and PDCAFieldID = 1) like ('%' + @SubjectOfAssessementExamplesMatch +'%'))) 
		  and 
	(  (isnull(@AssessmentNameMatch,'')='') or  ((select Note from PDCANotes pn where pn.PDCAID=p.PDCAID and PDCAFieldID = 2) like '%' + @AssessmentNameMatch +'%') )
	  and 
	(isnull(@StrengthsMatch,'')='' or ((select Note from PDCANotes pn where pn.PDCAID=p.PDCAID and PDCAFieldID = 3) like '%' + @StrengthsMatch +'%'))
	  and 
	(isnull(@InsightsMatch,'')='' or ((select Note from PDCANotes pn where pn.PDCAID=p.PDCAID and PDCAFieldID = 4) like '%' + @InsightsMatch +'%'))
	  and 
	(isnull(@AreasforImprovementMatch,'')='' or ((select Note from PDCANotes pn where pn.PDCAID=p.PDCAID and PDCAFieldID = 5) like '%' + @AreasforImprovementMatch +'%'))
	  and 
	(isnull(@PlanMatch,'')='' or ((select Note from PDCANotes pn where pn.PDCAID=p.PDCAID and PDCAFieldID = 6) like '%' + @PlanMatch +'%'))
	  and 
	(isnull(@DoMatch,'')='' or ((select Note from PDCANotes pn where pn.PDCAID=p.PDCAID and PDCAFieldID = 7) like '%' + @DoMatch +'%'))
	  and 
	(isnull(@CheckMatch,'')='' or ((select Note from PDCANotes pn where pn.PDCAID=p.PDCAID and PDCAFieldID = 8) like '%' + @CheckMatch +'%'))
	  and 
	(isnull(@AdditionalCommentsMatch,'')='' or ((select Note from PDCANotes pn where pn.PDCAID=p.PDCAID and PDCAFieldID = 9) like '%' + @AdditionalCommentsMatch +'%'))
	  and 
	(isnull(@ReportMustBeConveyedMatch,'')='' or ((select Note from PDCANotes pn where pn.PDCAID=p.PDCAID and PDCAFieldID = 10) like '%' + @ReportMustBeConveyedMatch +'%')) and
	(isnull(@ACPEaccreditationstandards,'')='' or dbo.PDCAHasThisAccreditationStandard (p.pdcaid, @ACPEaccreditationstandards, 1)='true') and
	(isnull(@COCAaccreditationstandards,'')='' or dbo.PDCAHasThisAccreditationStandard (p.pdcaid, @COCAaccreditationstandards, 2)='true') and
	(isnull(@WCUSCaccreditationstandards,'')='' or dbo.PDCAHasThisAccreditationStandard (p.pdcaid, @WCUSCaccreditationstandards, 3)='true') 
	
--,@COCAaccreditationstandards nvarchar(1000)=null
--,@WCUSCaccreditationstandards nvarchar(1000)=null



	--@title nvarchar(100)=null,
	--  @description nvarchar(100)=null,
	--  @enteredby nvarchar(50)=null

 set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCA_Update]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PDCA_Update] (
@pdcaid int = null,
    @username nvarchar(50)= null,
   @Department nvarchar(50)= null,
   @Title nvarchar(500)= null,
   @entity nvarchar(50)=NULL,
   	  @submissionteam nvarchar(100)=null,
     @Description nvarchar(500)=null,		 
	 @status nvarchar(50)=null,
	 @ckCHSU nvarchar(10)= null,	 
	 @ckCOM nvarchar(10)= null,
	 @ckCOP nvarchar(10)= null,
 	 @ckUnsure nvarchar(10)= null,

	 @ckExternalReview nvarchar(10)= null,
	 @ckFocusGroupResults nvarchar(10)= null,
	 @ckFormative nvarchar(10)= null,
	 @ckInputData nvarchar(10)= null,
	 @ckOther nvarchar(10)= null,
	 @ckPeerReview nvarchar(10)= null,
	 @ckPlan nvarchar(10)= null, 
	 @ckProgramOutcome nvarchar(10)= null,
	 @ckReview nvarchar(10)= null, 
	 @ckSurveyResults nvarchar(10)= null,
	 @ckTests nvarchar(10)= null,
	 @ckCLO nvarchar(10) = null,
	 @ACPEAccreditation varchar(1000)=null,
	 @COCAAccreditation varchar(1000)=null,
	 @WCUSCAccreditation varchar(1000)=null
	 
)
as
set nocount on 
set ansi_warnings off

Update PDCA
set Department=@Department,
Description=@Description,
title=@Title,
EnteredBy=@username,
ENTITY=@entity,
Status=@status,
SubmissionTeam=@submissionteam
where pdcaid=@pdcaid

if @status = 'Submitted'
  update pdca set DateSubmitted=getdate(),
    Submittedby =@username
	where pdcaid=@pdcaid

update PDCAAssessments
set Checked = @ckSurveyResults
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=1

update PDCAAssessments
set Checked = @ckFocusGroupResults
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=2

update PDCAAssessments
set Checked = @ckFormative
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=3

update PDCAAssessments
set Checked = @ckProgramOutcome
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=4

update PDCAAssessments
set Checked = @ckInputData
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=5

update PDCAAssessments
set Checked = @ckExternalReview
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=6

update PDCAAssessments
set Checked = @ckTests
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=7

update PDCAAssessments
set Checked = @ckReview
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=8

update PDCAAssessments
set Checked = @ckCLO
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=9

update PDCAAssessments
set Checked = @ckPlan
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=10

update PDCAAssessments
set Checked = @ckReview
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=11

update PDCAAssessments
set Checked = @ckOther
where PDCAAssessments.PDCAID=@pdcaid and AssessmentID=12




begin transaction
   delete from PDCAAccreditationStandards
     where pdcaid=@pdcaid

	insert into PDCAAccreditationStandards
	(
	PDCAid, 
	AccreditationStandardID
	)
	select 
	@pdcaid, 
	AccreditationStandardID
	from AccreditationStandards accs
	where 
	accs.AccreditationOrganizationID=1
	and accs.Standard in ( select value from string_split(@ACPEAccreditation,'|'))

		insert into PDCAAccreditationStandards
	(
	PDCAid, 
	AccreditationStandardID
	)
	select 
	@pdcaid, 
	AccreditationStandardID
	from AccreditationStandards accs
	where 
	accs.AccreditationOrganizationID=2
	and accs.Standard in ( select value from string_split(@COCAAccreditation,'|'))

		insert into PDCAAccreditationStandards
	(
	PDCAid, 
	AccreditationStandardID
	)
	select 
	@pdcaid, 
	AccreditationStandardID
	from AccreditationStandards accs
	where 
	accs.AccreditationOrganizationID=3
	and accs.Standard in ( select value from string_split(@WCUSCAccreditation,'|'))

	commit


select @pdcaid, (select schoolyearid from pdca where pdcaid=@pdcaid)



set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCAAccreditationStandards_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[PDCAAccreditationStandards_Select] (   	
   @AccreditationStandardID int = null,
      @pdcaid int=null
)
as
set nocount on 
set ansi_warnings off



SELECT PDCAAccreditationStandardD
      ,p.PDCAID
      ,AccreditationStandardID
  FROM dbo.PDCAAccreditationStandards pa
  join pdca p on p.PDCAID=pa.PDCAID
   where
    ( @AccreditationStandardID is null or  @AccreditationStandardID =  pa.AccreditationStandardID) and
	(@pdcaid is null or @pdcaid = p.PDCAID)

 set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCAAssessment_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PDCAAssessment_Select] (   	
      @pdcaid int=null,
	  @Checked varchar(50)=null
)
as
set nocount on 
set ansi_warnings off



SELECT PDCAAssessmentID
      ,PDCAID
      ,p.AssessmentID
	  ,amt.Name
	  ,amt.Description
	  ,p.Checked
  FROM dbo.PDCAAssessments p
  join Assessments amt on amt.AssessmentID=p.AssessmentID
where
	( @pdcaid = p.PDCAID) and
	(@checked is null or @checked=p.Checked)

 set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCAAssessments_Insert]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PDCAAssessments_Insert] (   
	@PDCAID int = null,
	@AssessmentID int=null
   
)
as
set nocount on 
set ansi_warnings off


INSERT INTO [dbo].[PDCAAssessments]
           ([PDCAID]
           ,[AssessmentID])
     select 
	     @PDCAID, 
		 @AssessmentID





set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCAAssessments_Update]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PDCAAssessments_Update] (   
	@PDCAID int = null,
	@AssessmentID int=null,
	@checked nvarchar(50)=null
   
)
as
set nocount on 
set ansi_warnings off


INSERT INTO [dbo].[PDCAAssessments]
           ([PDCAID]
           ,[AssessmentID]
		   ,checked)
     select 
	     @PDCAID, 
		 @AssessmentID,
		 @checked





set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCADocuments_Delete]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[PDCADocuments_Delete] (
@pdcadocumentid int= null
)
as
set nocount on
set ansi_warnings off


delete from PDCADocuments 
where PDCADocumentID=@pdcadocumentid



set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCADocuments_Insert]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--drop procedure PDCADocuments_Insert


CREATE procedure [dbo].[PDCADocuments_Insert] (
           @PDCAID int=null,
           @DocumentName varchar(1000)='default document name',
           @DocumentType varchar(50)=null,
		   @FileExtension varchar(50)=null,
           @Title varchar(2000)=null,
           @Description varchar(2000)=null,
           @InsertedBy varchar(50)=null,
           @DocumentFS varbinary(max)=null
)

as
set nocount on
set ansi_warnings off


/***********************************************

[PDCADocuments_Insert] 
           @PDCAID =2,
           @DocumentName ='test1',
           @DocumentType ='xls',
		   @FileExtension ='xls',
           @Title ='some doc',
           @Description= 'some doc',
           @InsertedBy ='cschaffer'  ,
           @DocumentFS =null

select * from pdcadocuments


truncate table pdcadocuments

*********************************************/



INSERT INTO [dbo].[PDCADocuments]
           ([PDCAID]
           ,[DocumentName]
           ,[DocumentType]
		   ,FileExtension
           ,[Title]
           ,[Description]
           ,[InsertDate]
           ,[InsertedBy]
           ,[DocumentFS])
     VALUES
           (@PDCAID
           ,@DocumentName
           ,@DocumentType
		   ,@FileExtension
           ,@Title
           ,@Description
           ,getdate()
           ,@InsertedBy
           ,@DocumentFS)
GO
/****** Object:  StoredProcedure [dbo].[PDCADocuments_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[PDCADocuments_Select] (
@pdcadocumentid int=null,
@pdcaid int=null
)
as 
set nocount on
set ansi_warnings off


SELECT [PDCADocumentID]
      ,[PDCAID]
      ,[DocumentName]
        ,DocumentType
      ,[Title]
      ,[Description]
      ,[InsertDate]
      ,[InsertedBy]
	  ,FileExtension
	  --,DocumentFS
  FROM [dbo].[PDCADocuments]
where 
(isnull(@pdcadocumentid,0)=0 or @pdcadocumentid=pdcadocumentid) and
(isnull(@pdcaid,0)=0 or @pdcaid=pdcaid) 




set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCADocumentsFS_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PDCADocumentsFS_Select] (
@pdcadocumentid int=null,
@pdcaid int=null
)
as 
set nocount on
set ansi_warnings off


SELECT [PDCADocumentID]
      ,[PDCAID]
      ,[DocumentName]
        ,DocumentType
      ,[Title]
      ,[Description]
      ,[InsertDate]
      ,[InsertedBy]
	  ,DocumentFS
  FROM [dbo].[PDCADocuments]
where 
(isnull(@pdcadocumentid,0)=0 or @pdcadocumentid=pdcadocumentid) and
(isnull(@pdcaid,0)=0 or @pdcaid=pdcaid) 




set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCAField_Update]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[PDCAField_Update] (
  @pdcafieldid int = null,
  @Description varchar(2000)=null
  )
  as
  set nocount on
  set ansi_warnings off

  update PDCAFields 
  set Description=@Description
  where PDCAFieldID=@pdcafieldid



  set nocount off
  set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCAFields_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PDCAFields_Select] (   	
      @pdcafieldid int=null
	  
)
as
set nocount on 
set ansi_warnings off


SELECT PDCAFieldID
      ,FieldName
      ,Description
	  ,Title
      ,ToolTip
      ,DisplayOrder
  FROM dbo.PDCAFields
  where 
  (isnull(@pdcafieldid,0)=0 or @pdcafieldid=PDCAFieldID)



 set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCANotes_Insert]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PDCANotes_Insert] (
        @pdcaid int =null,
        @PDCAFieldID int = null        
        ,@Note nvarchar(max)=null
)
as 
set nocount on
set ansi_warnings off

INSERT INTO [dbo].[PDCANotes]
           (PDCAID
		   ,[PDCAFieldID]
           ,[Note])
     VALUES
           (@pdcaid
		   ,@PDCAFieldID
	       ,@Note)


set nocount off
set ansi_warnings on


GO
/****** Object:  StoredProcedure [dbo].[PDCANotes_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PDCANotes_Select] (   	
      @pdcaid int=null,
	  @noteid int=null,
	  @pdcafieldid int =null
)
as
set nocount on 
set ansi_warnings off


--create table #PDCATemp (
-- PDCAID int,
-- NoteID int,
-- Title nvarchar(200),


SELECT NoteID
      ,pn.PDCAID
      ,pn.PDCAFieldID
	  ,FieldName
	  ,f.Description as 'FieldDescription'
	  ,p.Title
	  ,p.Department
	  ,p.Description as 'PDCADescription'
      ,p.DateEntered as 'PDCADateEntered'
      ,p.LastUpdate as 'PDCALastUpdate'
      ,p.Enteredby as 'PDCAEnteredBy'
      ,p.Updatedby as 'PDCAUpdatedby'
      ,Note
  FROM  pdca p
  join dbo.PDCANotes pn on p.PDCAID=pn.PDCAID
  join PDCAFields f on f.PDCAFieldID=pn.PDCAFieldID
  where 
  (@PDCAID is null or @pdcaid = p.pdcaid) and
  (@noteid is null or @noteid =noteid) and
  (@pdcafieldid is null or @pdcafieldid=pn.pdcafieldid)



 set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCANotes_Update]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PDCANotes_Update] (   	
      @pdcaid int=null	,  
       @PDCAFieldID int=null,      
      @Note nvarchar(max)=null
)
as
set nocount on 
set ansi_warnings off

UPDATE dbo.PDCANotes
   SET Note = @Note
  where 
   @pdcaid = pdcaid and PDCAFieldID=@PDCAFieldID

 set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCARPT_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[PDCARPT_Select] (   	
      @pdcaid int=null

)
as
set nocount on 
set ansi_warnings off

/****************************************

	  PDCA_select 
	  @department ='p' ,
	  @title='' , 
	  @description ='',
	  @enteredby ='', 
	  @entity ='', 
	  @status ='', 
	  @SchoolYear ='', 
	  @startdate ='', 
	  @enddate ='', 
	  @SubjectOfAssessementExamplesMatch ='', 
	  @AssessmentNameMatch ='', 
	  @StrengthsMatch ='', 
	  @InsightsMatch ='', 
	  @AreasforImprovementMatch ='', 
	  @PlanMatch ='', 
	  @DoMatch ='', 
	  @CheckMatch ='', 
	  @AdditionalCommentsMatch ='', 
	  @ReportMustBeConveyedMatch =''



*********************************************/


create table #temp1 (
PDCAID int
      ,DateEntered datetime
      ,LastUpdate datetime
      ,EnteredBy nvarchar(50)
      ,UpdatedBy nvarchar(50)
      ,Department nvarchar(100)
      ,Title nvarchar(1000)
      ,Description nvarchar(1000)
	  ,SchoolYear int
	  ,SchoolYearID int
	  ,paSurvey char(1)
  	  ,paFocus char(1)
	  ,paFormative char(1)
	  ,paProgram char(1)
	  ,paInput char(1)
	  ,paExternal char(1)
	  ,paTests char(1)
	  ,paReview char(1)
	  ,paCLO char(1)
	  ,paPlan char(1)
	  ,paPeerReview char(1)
	  ,paOther char(1)
	  ,entity char(1)
	  ,status varchar(50)
	  ,SubjectOfAssessementExamplesMatch char(1)
,AssessmentNameMatch char(1)
,StrengthsMatch char(1)
,InsightsMatch char(1)
,AreasforImprovementMatch char(1)
,PlanMatch char(1)
,DoMatch char(1)
,CheckMatch char(1)
,AdditionalCommentsMatch char(1)
,ReportMustBeConveyedMatch char(1)

	  )


SELECT p.PDCAID
      ,DateEntered
      ,LastUpdate
      ,isnull(EnteredBy,'') as enteredby
      ,isnull(UpdatedBy,'') as UpdatedBy
      ,isnull(Department,'Department not entered') as Department
      ,isnull(Title,'Title not entered') as Title
      ,isnull(Description,'Description not entered') as Description
	  ,isnull(SchoolYear,year(getdate())) as SchoolYear
	  ,isnull(SchoolYearID,0) as SchoolYearID
	  ,isnull(Status,'New') as Status
	  ,isnull(Submissionteam,'') as SubmissionTeam
	  ,isnull(paSurvey.Checked,0) as 'paSurvey'
  	  ,isnull(paFocus.Checked,0) as 'paFocus'
	  ,isnull(paFormative.Checked,0) as 'paFormative'
	  ,isnull(paProgram.Checked,0) as 'paProgram'
	  ,isnull(paInput.Checked,0) as 'paInput'
	  ,isnull(paExternal.Checked,0) as 'paExternal'
	  ,isnull(paTests.Checked,0) as 'paTests'
	  ,isnull(paReview.Checked,0) as 'paReview'
	  ,isnull(paCLO.Checked,0) as 'paCLO'
	  ,isnull(paPlan.Checked,0) as 'paPlan'
	  ,isnull(paPeerReview.Checked,0) as 'paPeerReview'
	  ,isnull(paOther.Checked,0) as 'paOther'
	  ,isnull(entity,'') as entity
	  ,isnull(WCUSCAccreditation,'') as WCUSCAccreditation
	  ,isnull(COCAAccreditation,'') as COCAAccreditation
	  ,isnull(ACPEAccreditation,'') as ACPEAccreditation
	  ,datesubmitted
      ,submittedby
	  ,pnotes1.Note as 'SubjectOfAssessement'
	  ,pnotes2.Note as 'AssessmentName'
	  ,pnotes3.Note as 'Strengths'
	  ,pnotes4.Note as 'Insights'
	  ,pnotes5.Note as 'AreasforImprovement'
	  ,pnotes6.Note as 'Plan'
	  ,pnotes7.Note as 'Do'
	  ,pnotes8.Note as 'Check'
	  ,pnotes9.Note as 'AdditionalComments'
	  ,pnotes10.Note as 'ReportMustBeConveyed'
	  
  FROM dbo.PDCA p
  join PDCANotes pnotes1 on pnotes1.PDCAID=p.PDCAID and pnotes1.PDCAFieldID=1 
  join PDCANotes pnotes2 on pnotes2.PDCAID=p.PDCAID and pnotes2.PDCAFieldID=2 
  join PDCANotes pnotes3 on pnotes3.PDCAID=p.PDCAID and pnotes3.PDCAFieldID=3 
  join PDCANotes pnotes4 on pnotes4.PDCAID=p.PDCAID and pnotes4.PDCAFieldID=4 
  join PDCANotes pnotes5 on pnotes5.PDCAID=p.PDCAID and pnotes5.PDCAFieldID=5 
  join PDCANotes pnotes6 on pnotes6.PDCAID=p.PDCAID and pnotes6.PDCAFieldID=6 
  join PDCANotes pnotes7 on pnotes7.PDCAID=p.PDCAID and pnotes7.PDCAFieldID=7 
  join PDCANotes pnotes8 on pnotes8.PDCAID=p.PDCAID and pnotes8.PDCAFieldID=8 
  join PDCANotes pnotes9 on pnotes9.PDCAID=p.PDCAID and pnotes9.PDCAFieldID=9 
  join PDCANotes pnotes10 on pnotes10.PDCAID=p.PDCAID and pnotes10.PDCAFieldID=10 

  left join PDCAAssessments paSurvey on paSurvey.PDCAID=p.PDCAID and paSurvey.AssessmentID  =1
  left join PDCAAssessments paFocus on paFocus.PDCAID=p.PDCAID and paFocus.AssessmentID  =2
  left join PDCAAssessments paFormative on paFormative.PDCAID=p.PDCAID and paFormative.AssessmentID  =3
  left join PDCAAssessments paProgram on paProgram.PDCAID=p.PDCAID and paProgram.AssessmentID  =4
  left join PDCAAssessments paInput on paInput.PDCAID=p.PDCAID and paInput.AssessmentID  =5
  left join PDCAAssessments paExternal on paExternal.PDCAID=p.PDCAID and paExternal.AssessmentID  =6
  left join PDCAAssessments paTests on paTests.PDCAID=p.PDCAID and paTests.AssessmentID  =7
  left join PDCAAssessments paReview on paReview.PDCAID=p.PDCAID and paReview.AssessmentID  =8
  left join PDCAAssessments paCLO on paCLO.PDCAID=p.PDCAID and paCLO.AssessmentID  =9
  left join PDCAAssessments paPlan on paPlan.PDCAID=p.PDCAID and paPlan.AssessmentID  =10
  left join PDCAAssessments paPeerReview on paPeerReview.PDCAID=p.PDCAID and paPeerReview.AssessmentID  =11
  left join PDCAAssessments paOther on paOther.PDCAID=p.PDCAID and paOther.AssessmentID  =12
   where   
	(isnull(@pdcaid,0)=0 or @pdcaid = p.PDCAID) 
	

 set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCATeam_Delete]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PDCATeam_Delete] (
@PDCAid int = null,
@Userid nvarchar(50)=null
)

as 
set nocount on
set ansi_warnings off

DELETE FROM [dbo].[PDCATeam]
      WHERE @PDCAid =pdcaid and @Userid=Userid


set nocount off
set ansi_warnings on


GO
/****** Object:  StoredProcedure [dbo].[PDCATeam_Insert]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[PDCATeam_Insert] (   
	@PDCAID int = null,
    @Userid nvarchar(50) = null   
)
as
set nocount on 
set ansi_warnings off


INSERT INTO [dbo].[PDCATeam]
           ([PDCAID]
           ,[Userid])
     select
           @PDCAID, 
           @Userid





set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCATeam_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[PDCATeam_Select] (   	
      @pdcaid int=null
)
as
set nocount on 
set ansi_warnings off

SELECT PDCATeamID
      ,PDCAID
      ,Userid
  FROM dbo.PDCATeam
  where 
  (@PDCAID is null or @pdcaid = pdcaid) 

 set nocount off
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[PDCAUser_Select]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PDCAUser_Select] ( 
  	@PDCAUserID int = NULL,
	@NetworkUserID varchar(50)= NULL,
	@FiratName varchar(50)= NULL,
	@LastName varchar(50)= NULL,
	@UserRole varchar(50)= NULL
 )
 as
 set nocount on
 set ansi_warnings off
 


SELECT [PDCAUserID]
      ,[NetworkUserID]
      ,[FiratName]
      ,[LastName]
      ,[UserRole]
  FROM [dbo].[PDCAUsers]
  where 
  @NetworkUserID=NetworkUserID
 -- 	(isnull(@PDCAUserID,0)=0 or @PDCAUserID=PDCAUserID) and
	--(isnull(@NetworkUserID,'')='' or @NetworkUserID=NetworkUserID) and
	--(isnull(@FiratName,'')='' or @FiratName=FiratName) and
	--(isnull(@LastName,'')='' or  @LastName=LastName) and
	--(isnull(@UserRole,'')='' or @UserRole=UserRole)



  set nocount off
  set ansi_warnings on

GO
/****** Object:  StoredProcedure [dbo].[PrintPDCA_text]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PrintPDCA_text] (
   @pdcaid int = null
)

as
set nocount on 
set ansi_warnings off

/**********************************************

PrintPDCA_text 
   @pdcaid =1

*****************************************/


declare @pdca varchar(5000)
declare @DateEntered datetime 
	declare @LastUpdate datetime 
	declare @DateSubmitted datetime 
	declare @EnteredBy nvarchar(50) 
	declare @UpdatedBy nvarchar(50) 
	declare @Submittedby nvarchar(50) 
	declare @Department nvarchar(50) 
	declare @Title nvarchar(500) 
	declare @Description nvarchar(500) 
	declare @SubmissionTeam nvarchar(500) 
	declare @Status nvarchar(50) 
	declare @Entity nvarchar(50) 
	declare @SchoolYear int 
	declare @SchoolYearID int 
	declare @WCUSCAccreditation nvarchar(500) 
	declare @COCAAccreditation nvarchar(500) 
	declare @ACPEAccreditation nvarchar(500) 
	declare @subjectofassessment nvarchar(2000)
	declare @assessmenttools nvarchar(2000)
	declare @Assessments varchar(2000)
	declare @Plan varchar(2000)
	declare @strengths varchar(2000)
	declare @Insights varchar(2000)
	declare @AreasforImprovement varchar(2000)
	declare @Check varchar(2000)
	declare @Do varchar(2000)
	declare @additionalcomments varchar(2000)
	declare @Reportmustbesubmitted varchar(2000)



CREATE TABLE #PDCA(
	[PDCAID] [int] ,
	[DateEntered] [datetime] NULL,
	[LastUpdate] [datetime] NULL,
	[DateSubmitted] [datetime] NULL,
	[EnteredBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[Submittedby] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[SubmissionTeam] [nvarchar](500) NULL,
	[Status] [nvarchar](50) NULL,
	[Entity] [nvarchar](50) NULL,
	[SchoolYear] [int] NULL,
	[SchoolYearID] [int] NULL,
	[WCUSCAccreditation] [nvarchar](500) NULL,
	[COCAAccreditation] [nvarchar](500) NULL,
	[ACPEAccreditation] [nvarchar](500) NULL)



SELECT  @DateEntered = isnull(DateEntered,'1/1/1900'), 
      @LastUpdate = isnull(LastUpdate, '1/1/1900'),
      @DateSubmitted = isnull(DateSubmitted,'1/1/1900'), 
      @EnteredBy = isnull(EnteredBy, ''),
      @UpdatedBy = isnull(UpdatedBy, ''),
      @Submittedby = isnull(Submittedby, ''),
      @Department = isnull(Department, ''),
      @Title = isnull(Title, ''),
      @Description = isnull(Description, ''),
      @SubmissionTeam = isnull(SubmissionTeam,''), 
      @Status = isnull(Status, ''),
      @Entity = isnull(Entity, ''),
      @SchoolYear = isnull(SchoolYear,0),
      @SchoolYearID = isnull(SchoolYearID,0),
      @WCUSCAccreditation = isnull(WCUSCAccreditation, ''),
      @COCAAccreditation = isnull(COCAAccreditation, ''),
      @ACPEAccreditation = isnull(ACPEAccreditation, '')
  FROM [dbo].[PDCA]
where pdcaid = @pdcaid

select  @subjectofassessment =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=1 ),'')
	--select  @assessmenttools =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=1 ),'')
	select  @Assessments =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=2 ),'')
	select  @Plan =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=6 ),'')
	select  @strengths =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=3 ),'')
	select  @Insights =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=4 ),'')
	select  @AreasforImprovement =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=5 ),'')
	select  @Check =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=8 ),'')
	select  @Do =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=7 ),'')
	select  @additionalcomments =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=9 ),'')
	select  @Reportmustbesubmitted =isnull((select note from pdcanotes pn where pn.PDCAID=@pdcaid and PDCAFieldID=10 ),'')


declare @outputstring varchar(max)


SELECT @outputstring= 'SII-PDCA System ID: ' + convert(varchar(50), @pdcaid  )  + '    Status:  ' +       @Status  + '     Date Printed: ' + convert(varchar(50), getdate())
select @outputstring='<BR />' + @outputstring + 'Date Entered: ' + convert(varchar(50), @DateEntered,101) + '   Last Update:  ' + convert(varchar(50), @LastUpdate, 101) + '    Date Submitted: ' +CONVERT(varchar(50),@DateSubmitted , 101)
select  @outputstring='<BR />' + @outputstring + 'Entered by: ' +  @EnteredBy  + '      Updated By:  ' +  @UpdatedBy + '     Submitted By: ' +  @Submittedby  
select  @outputstring='<BR />' + @outputstring + 'SchoolYear: ' +     convert(varchar(50), @SchoolYear) +  '     SchoolYearID: ' +  convert(varchar(50), @SchoolYearID) 
select  @outputstring='<BR />' + @outputstring + 'Department: ' + @Department  
select  @outputstring='<BR />' + @outputstring + 'Title: ' +       @Title  
select  @outputstring='<BR />' + @outputstring + 'Description: ' +       @Description  
select  @outputstring='<BR />' + @outputstring + 'Entity: ' +       @Entity  
select  @outputstring='<BR />' + @outputstring + 'WCUSC Accreditation Standards: ' +       @WCUSCAccreditation  
select  @outputstring='<BR />' + @outputstring + 'COCAA ccreditation Standards: ' +       @COCAAccreditation  
select  @outputstring='<BR />' + @outputstring + 'ACPEA ccreditation Standards: ' +       @ACPEAccreditation  

select  @outputstring='<BR />' + @outputstring + 'Subject of Assessment: ' +        @subjectofassessment
	--select 'assessmenttools: ' +        @assessmenttools
	select  @outputstring='<BR />' + @outputstring + 'Assessments: ' +        @Assessments
	select  @outputstring='<BR />' + @outputstring + 'Strengths: ' +        @strengths
	select  @outputstring='<BR />' + @outputstring + 'Insights: ' +        @Insights
	select  @outputstring='<BR />' + @outputstring + 'Areas for Improvement: ' +        @AreasforImprovement
		select  @outputstring='<BR />' + @outputstring + 'Plan: ' +        @Plan
			select  @outputstring='<BR />' + @outputstring + 'Do: ' +        @Do
	select  @outputstring='<BR />' + @outputstring + 'Check: ' +        @Check
	select  @outputstring='<BR />' + @outputstring + 'Additional Comments: ' +        @additionalcomments
	select  @outputstring='<BR />' + @outputstring + 'Report must be submitted: ' +        @Reportmustbesubmitted

		select  @outputstring


		


set nocount off 
set ansi_warnings on
GO
/****** Object:  StoredProcedure [dbo].[TruncateWorkingTables]    Script Date: 10/17/2019 10:32:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[TruncateWorkingTables] 
as
set nocount on
set ansi_warnings off

truncate table pdca
truncate table pdcadocuments
truncate table pdcaassessments
truncate table pdcanotes
truncate table pdcaAccreditationstandards


set nocount off
set ansi_warnings on
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AccreditationStandards"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 277
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAccreditationStandards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAccreditationStandards'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PDCAAssessments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 187
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPDCAAssessmentTools'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPDCAAssessmentTools'
GO
USE [master]
GO
ALTER DATABASE [PDCAFS_Test] SET  READ_WRITE 
GO
