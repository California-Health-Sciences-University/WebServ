USE [PDCAFS_Test]
GO
SET IDENTITY_INSERT [dbo].[AccreditationOrganization] ON 
GO
INSERT [dbo].[AccreditationOrganization] ([AccreditationOrganizationID], [Name], [Description]) VALUES (1, N'ACPE', N'Accreditation Council for Pharmacy Education ')
GO
INSERT [dbo].[AccreditationOrganization] ([AccreditationOrganizationID], [Name], [Description]) VALUES (2, N'COCA', N'Commission on Osteopathic College Accreditation.')
GO
INSERT [dbo].[AccreditationOrganization] ([AccreditationOrganizationID], [Name], [Description]) VALUES (3, N'WSCUC', N'WASC Senior College and University Commission ')
GO
SET IDENTITY_INSERT [dbo].[AccreditationOrganization] OFF
GO
SET IDENTITY_INSERT [dbo].[AccreditationStandardCategory] ON 
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (1, 3, 1, 0, N'Standard 1: Defining Institutional Purposes and Ensuring Educational Objectives', N'The institution defines its purposes and establishes educational objectives aligned with those purposes. The institution has a clear and explicit sense of its essential values and character, its distinctive elements, its place in both the higher education community and society, and its contribution to the public good. It functions with integrity, transparency, and autonomy.', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (2, 3, 2, 1, N'Institutional Purposes', N'Institutional Purposes', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (3, 3, 3, 1, N'Integrity and Transparency', N'Integrity and Transparency', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (4, 3, 4, 0, N'Standard 2: Achieving Educational Objectives through Core Functions', N'The institution achieves its purposes and attains its educational objectives at the institutional and program level through the core functions of teaching and learning, scholarship and creative activity, and support for student learning and success. The institution demonstrates that these core functions are performed effectively by evaluating valid and reliable evidence of learning and by supporting the success of every student.', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (5, 3, 5, 4, N'Teaching and Learning', N'Teaching and Learning', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (6, 3, 6, 4, N'Scholarship and Creative Activity', N'Scholarship and Creative Activity', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (7, 3, 7, 4, N'Student Learning and Success', N'Student Learning and Success', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (8, 3, 8, 0, N'Standard 3: Developing and Applying Resources and Organizational Structures to Ensure Quality and Sustainability', N'The institution sustains its operations and supports the achievement of its educational objectives through investments in human, physical, fiscal, technological, and information resources and through an appropriate and effective set of organizational and decision-making structures. These key resources and organizational structures promote the achievement of institutional purposes and educational objectives and create a high-quality environment for learning.', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (9, 3, 9, 8, N'Faculty and Staff', N'Faculty and Staff', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (10, 3, 10, 8, N'Fiscal, Physical, and Information Resources', N'Fiscal, Physical, and Information Resources', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (11, 3, 11, 8, N'Organizational Structures and Decision-Making Processes', N'Organizational Structures and Decision-Making Processes', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (12, 3, 12, 0, N'Standard 4: Creating an Organization Committed to Quality Assurance, Institutional Learning, and Improvement', N'Standard 4: Creating an Organization Committed to Quality Assurance, Institutional Learning, and Improvement', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (13, 3, 13, 12, N'Quality Assurance Processes', N'Quality Assurance Processes', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (14, 3, 14, 12, N'Institutional Learning and Improvement', N'Institutional Learning and Improvement', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (15, 2, 15, 0, N'1: Mission and Governance', N'Mission and Governance', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (16, 2, 16, 0, N'2: Leadership and Administration', N'Leadership and Administration', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (17, 2, 17, 0, N'3: Finances', N'Finances', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (18, 2, 18, 0, N'4: Facilities', N'4: Facilities', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (19, 2, 19, 0, N'5: Learning Environment', N'5: Learning Environment', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (20, 2, 20, 0, N'6: Curriculum', N'6: Curriculum', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (21, 2, 21, 0, N'7: Faculty and Staff', N'7: Faculty and Staff', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (22, 2, 22, 0, N'8: Scholarly Activity', N'8: Scholarly Activity', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (23, 2, 23, 0, N'9: Students', N'9: Students', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (24, 2, 24, 0, N'10: Graduate Medical Education', N'10: Graduate Medical Education', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (25, 2, 25, 0, N'11: Program and Student Assessment and Outcomes', N'11: Program and Student Assessment and Outcomes', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (39, 2, 26, 0, N'12: Institutional Accreditation', N'12: Institutional Accreditation', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (40, 1, 27, 0, N'100 Standards—Code of Professional Ethics for ACPE Members ', N'100 Standards—Code of Professional Ethics for ACPE Members ', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (41, 1, 28, 0, N'200 Standards—Complaints ', N'200 Standards—Complaints ', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (42, 1, 29, 0, N'300 Standards—Accreditation ', N'300 Standards—Accreditation ', NULL)
GO
INSERT [dbo].[AccreditationStandardCategory] ([AccreditationStandardCategoryID], [AccreditationOrganizationID], [CategoryID], [ParentCategoryID], [Title], [Description], [Active]) VALUES (43, 1, 30, 0, N'300 Standards—Accreditation ', N'300 Standards—Accreditation ', NULL)
GO
SET IDENTITY_INSERT [dbo].[AccreditationStandardCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[AccreditationStandards] ON 
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (1, 2, 15, N'1.1', N'Program Mission', N'Program Mission', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (2, 2, 15, N'1.2', N'Strategic Plan', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (3, 2, 15, N'1.3', N'Licensing and Regional/Institutional Accreditation', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (4, 2, 15, N'1.4', N'Governance and Program Policies', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (5, 2, 15, N'1.5', N'Non-Discrimination', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (6, 2, 15, N'1.6', N'Degree-Granting Body', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (7, 2, 15, N'1.7', N'Clinical Education Affiliation Agreements', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (8, 2, 16, N'2.1', N'Dean Qualifications', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (9, 2, 16, N'2.2', N'Full-Time Dean', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (10, 2, 16, N'2.3', N'Academic and Administrative Leadership', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (11, 2, 16, N'2.4', N'Accreditation Standards Compliance and Procedures', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (12, 2, 17, N'3.1', N'Financial Resources', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (13, 2, 17, N'3.2', N'Financial Planning and Budgeting', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (14, 2, 17, N'3.3', N'Budgetary Authority', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (15, 2, 17, N'3.4', N'Financial Audit', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (16, 2, 18, N'4.1', N'Facilities', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (17, 2, 18, N'4.2', N'Security and Public Safety', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (18, 2, 18, N'4.3', N'Information Technology', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (19, 2, 18, N'4.4', N'Learning Resources', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (20, 2, 19, N'5.1', N'Professionalism', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (21, 2, 19, N'5.2', N'Diversity', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (22, 2, 19, N'5.3', N'Safety, Health, and Wellness', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (23, 2, 19, N'5.4', N'Patient Care Supervision', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (24, 2, 20, N'6.1', N'Curriculum Design and Management', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (25, 2, 20, N'6.2', N'Programmatic Level Educational Objectives', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (26, 2, 20, N'6.3', N'Maximum Length of Completion', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (27, 2, 20, N'6.4', N'Osteopathic Core Competencies', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (28, 2, 20, N'6.5', N'Scientific Method', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (29, 2, 20, N'6.6', N'Principles of Osteopathic Medicine', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (30, 2, 20, N'6.7', N'Directed Learning', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (31, 2, 20, N'6.8', N'Interprofessional Education for Collaborative Practice', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (32, 2, 20, N'6.9', N'Clinilcal Education', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (33, 2, 20, N'6.10', N'Clinical Experience', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (34, 2, 20, N'6.11', N'Comparability across Clinical Education Sites', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (35, 2, 20, N'6.12', N'COMLEX-USA', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (36, 2, 21, N'7.1', N'Faculty and Staff Resources and Qualifications', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (37, 2, 21, N'7.2', N'Faculty Approvals at All Teaching Sites', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (38, 2, 21, N'7.3', N'Department Chair Qualifications', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (39, 2, 21, N'7.4', N'Primary Care Leadership', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (40, 2, 21, N'7.5', N'OMM/OPP Leadership', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (41, 2, 21, N'7.6', N'Faculty Development', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (42, 2, 21, N'7.7', N'Faculty Association', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (43, 2, 21, N'7.8', N'Faculty Appointment and Advancement', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (44, 2, 22, N'8.1', N'Research and Scholarly Activity Strategic Plan', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (45, 2, 22, N'8.2', N'Research and Scholarly Activity Budget', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (46, 2, 23, N'9.1', N'Admissions Policy', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (47, 2, 23, N'9.2', N'Academic Standards', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (48, 2, 23, N'9.3', N'Transfer Policies', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (49, 2, 23, N'9.4', N'Secure Student Recordkeeping', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (50, 2, 23, N'9.5', N'Academic Counseling', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (51, 2, 23, N'9.6', N'Career Counseling', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (52, 2, 23, N'9.7', N'Financial Aid and Debt Management Counseling', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (53, 2, 23, N'9.8', N'Mental Health Services', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (54, 2, 23, N'9.9', N'Physical Health Services', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (55, 2, 23, N'9.10', N'Non-Academic Health Professionals', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (56, 2, 23, N'9.11', N'Health Insurance', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (57, 2, 24, N'10.1', N'Osteopathic Educational Continuum', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (58, 2, 24, N'10.2', N'ACGME Accredited GME', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (59, 2, 24, N'10.3', N'Osteopathic Recognition of GME', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (60, 2, 25, N'11.1', N'Program Assessment', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (61, 2, 25, N'11.2', N'Student Evaluation of Instruction', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (62, 2, 25, N'11.3', N'Student Debt Outcomes', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (63, 2, 25, N'11.4', N'Student Survey', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (64, 2, 25, N'11.5', N'Progam and Student Outcomes - Annual and Mid-Cycle Reports', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (65, 2, 26, N'12.1', N'Incorporation of the Institution', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (66, 2, 26, N'12.2', N'Degree and Other Educational Offerings', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (67, 2, 26, N'12.3', N'Chief Executive Officer', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (68, 2, 26, N'12.4', N'Chief Financial Officer', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (69, 2, 26, N'12.5', N'Course Credit Hours', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (70, 2, 26, N'12.6', N'Public Information', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (71, 3, 2, N'1.1', N'The institution’s formally approved statements of purpose are appropriate for an institution of higher education and clearly define its essential values and character and ways in which it contributes to the public good. ', N'The institution’s formally approved statements of purpose are appropriate for an institution of higher education and clearly define its essential values and character and ways in which it contributes to the public good. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (72, 3, 2, N'1.2', N'Educational objectives are widely recognized throughout the institution, are consistent with stated purposes, and are demonstrably achieved. The institution regularly generates, evaluates, and makes public data about student achievement, including measures of retention and graduation, and evidence of student learning. ', N'Educational objectives are widely recognized throughout the institution, are consistent with stated purposes, and are demonstrably achieved. The institution regularly generates, evaluates, and makes public data about student achievement, including measures of retention and graduation, and evidence of student learning. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (73, 3, 2, N'1.3', N'The institution publicly states its commitment to academic freedom for faculty, staff, and students, and acts accordingly. This commitment affirms that those in the academy are free to share their convictions and responsible conclusions with their colleagues and students in their teaching and writing. ', N'The institution publicly states its commitment to academic freedom for faculty, staff, and students, and acts accordingly. This commitment affirms that those in the academy are free to share their convictions and responsible conclusions with their colleagues and students in their teaching and writing. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (74, 3, 2, N'1.4', N'Consistent with its purposes and character, the institution demonstrates an appropriate response to the increasing diversity in society through its policies, its educational and co-curricular programs, its hiring and admissions criteria, and its administrative and organizational practices. ', N'Consistent with its purposes and character, the institution demonstrates an appropriate response to the increasing diversity in society through its policies, its educational and co-curricular programs, its hiring and admissions criteria, and its administrative and organizational practices. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (75, 3, 3, N'1.5', N'Even when supported by or affiliated with governmental, corporate, or religious organizations, the institution has education as its primary purpose and operates as an academic institution with appropriate autonomy. ', N'Even when supported by or affiliated with governmental, corporate, or religious organizations, the institution has education as its primary purpose and operates as an academic institution with appropriate autonomy. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (76, 3, 3, N'1.6', N'The institution truthfully represents its academic goals, programs, services, and costs to students and to the larger public. The institution demonstrates that its academic programs can be completed in a timely fashion. The institution treats students fairly and equitably through established policies and procedures addressing student conduct, grievances, human subjects in research, disability, and financial matters, including refunds and financial aid ', N'The institution truthfully represents its academic goals, programs, services, and costs to students and to the larger public. The institution demonstrates that its academic programs can be completed in a timely fashion. The institution treats students fairly and equitably through established policies and procedures addressing student conduct, grievances, human subjects in research, disability, and financial matters, including refunds and financial aid ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (77, 3, 3, N'1.7', N'The institution exhibits integrity and transparency in its operations, as demonstrated by the adoption and implementation of appropriate policies and procedures, sound business practices, timely and fair responses to complaints and grievances, and regular evaluation of its performance in these areas. The institution’s finances are regularly audited by qualified independent auditors. ', N'The institution exhibits integrity and transparency in its operations, as demonstrated by the adoption and implementation of appropriate policies and procedures, sound business practices, timely and fair responses to complaints and grievances, and regular evaluation of its performance in these areas. The institution’s finances are regularly audited by qualified independent auditors. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (78, 3, 3, N'1.8', N'The institution is committed to honest and open communication with the Accrediting Commission; to undertaking the accreditation review process with seriousness and candor; to informing the Commission promptly of any matter that could materially affect the accreditation status of the institution; and to abiding by Commission policies and procedures, including all substantive change policies. ', N'The institution is committed to honest and open communication with the Accrediting Commission; to undertaking the accreditation review process with seriousness and candor; to informing the Commission promptly of any matter that could materially affect the accreditation status of the institution; and to abiding by Commission policies and procedures, including all substantive change policies. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (79, 3, 5, N'2.1', N'The institution’s educational programs are appropriate in content, standards of performance, rigor, and nomenclature for the degree level awarded, regardless of mode of delivery. They are staffed by sufficient numbers of faculty qualified for the type and level of curriculum offered. ', N'The institution’s educational programs are appropriate in content, standards of performance, rigor, and nomenclature for the degree level awarded, regardless of mode of delivery. They are staffed by sufficient numbers of faculty qualified for the type and level of curriculum offered. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (80, 3, 5, N'2.2', N'All degrees awarded by the institution are clearly defined in terms of entry-level requirements and levels of student achievement necessary for graduation that represent more than simply an accumulation of courses or credits. The institution has both a coherent philosophy, expressive of its mission, which guides the meaning of its degrees and processes that ensure the quality and integrity of its degrees. ', N'All degrees awarded by the institution are clearly defined in terms of entry-level requirements and levels of student achievement necessary for graduation that represent more than simply an accumulation of courses or credits. The institution has both a coherent philosophy, expressive of its mission, which guides the meaning of its degrees and processes that ensure the quality and integrity of its degrees. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (81, 3, 5, N'2.3', N'The institution’s student learning outcomes and standards of performance are clearly stated at the course, program, and, as appropriate, institutional level. These outcomes and standards are reflected in academic programs, policies, and curricula, and are aligned with advisement, library, and information and technology resources, and the wider learning environment. ', N'The institution’s student learning outcomes and standards of performance are clearly stated at the course, program, and, as appropriate, institutional level. These outcomes and standards are reflected in academic programs, policies, and curricula, and are aligned with advisement, library, and information and technology resources, and the wider learning environment. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (82, 3, 5, N'2.4', N'The institution’s student learning outcomes and standards of performance are developed by faculty and widely shared among faculty, students, staff, and (where appropriate) external stakeholders. The institution’s faculty take collective responsibility for establishing appropriate standards of performance and demonstrating through assessment the achievement of these standards. ', N'The institution’s student learning outcomes and standards of performance are developed by faculty and widely shared among faculty, students, staff, and (where appropriate) external stakeholders. The institution’s faculty take collective responsibility for establishing appropriate standards of performance and demonstrating through assessment the achievement of these standards. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (83, 3, 5, N'2.5', N'The institution’s academic programs actively involve students in learning, take into account students’ prior knowledge of the subject matter, challenge students to meet high standards of performance, offer opportunities for them to practice, generalize, and apply what they have learned, and provide them with appropriate and ongoing feedback about their performance and how it can be improved. ', N'The institution’s academic programs actively involve students in learning, take into account students’ prior knowledge of the subject matter, challenge students to meet high standards of performance, offer opportunities for them to practice, generalize, and apply what they have learned, and provide them with appropriate and ongoing feedback about their performance and how it can be improved. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (84, 3, 5, N'2.6', N'The institution demonstrates that its graduates consistently achieve its stated learning out- comes and established standards of performance. The institution ensures that its expectations for student learning are embedded in the standards that faculty use to evaluate student work. ', N'The institution demonstrates that its graduates consistently achieve its stated learning out- comes and established standards of performance. The institution ensures that its expectations for student learning are embedded in the standards that faculty use to evaluate student work. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (85, 3, 5, N'2.7', N'All programs offered by the institution are subject to systematic program review. The program review process includes, but is not limited to, analyses of student achievement of the program’s learning outcomes; retention and graduation rates; and, where appropriate, results of licensing examination and placement, and evidence from external constituencies such as employers and professional organizations. ', N'All programs offered by the institution are subject to systematic program review. The program review process includes, but is not limited to, analyses of student achievement of the program’s learning outcomes; retention and graduation rates; and, where appropriate, results of licensing examination and placement, and evidence from external constituencies such as employers and professional organizations. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (86, 3, 6, N'2.8', N'The institution clearly defines expectations for research, scholarship, and creative activity for its students and all categories of faculty. The institution actively values and promotes scholarship, creative activity, and curricular and instructional innovation, and their dissemination appropriate to the institution’s purposes and character. ', N'The institution clearly defines expectations for research, scholarship, and creative activity for its students and all categories of faculty. The institution actively values and promotes scholarship, creative activity, and curricular and instructional innovation, and their dissemination appropriate to the institution’s purposes and character. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (87, 3, 6, N'2.9', N'The institution recognizes and promotes appropriate linkages among scholarship, teaching, assessment, student learning, and service. ', N'The institution recognizes and promotes appropriate linkages among scholarship, teaching, assessment, student learning, and service. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (88, 3, 7, N'2.10', N'The institution demonstrates that students make timely progress toward the completion of their degrees and that an acceptable proportion of students complete their degrees in a timely fashion, given the institution’s mission, the nature of the students it serves, and the kinds of programs it offers. The institution collects and analyzes student data, disaggregated by appropriate demographic categories and areas of study. It tracks achievement, satisfaction, and the extent to which the campus climate supports student success. The institution regularly identifies the characteristics of its students; assesses their preparation, needs, and experiences; and uses these data to improve student achievement. ', N'The institution demonstrates that students make timely progress toward the completion of their degrees and that an acceptable proportion of students complete their degrees in a timely fashion, given the institution’s mission, the nature of the students it serves, and the kinds of programs it offers. The institution collects and analyzes student data, disaggregated by appropriate demographic categories and areas of study. It tracks achievement, satisfaction, and the extent to which the campus climate supports student success. The institution regularly identifies the characteristics of its students; assesses their preparation, needs, and experiences; and uses these data to improve student achievement. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (89, 3, 7, N'2.11', N'Consistent with its purposes, the institution offers co-curricular programs that are aligned with its academic goals, integrated with academic programs, and designed to support all students’ personal and professional development. The institution assesses the effectiveness of its co-curricular programs and uses the results for improvement. ', N'Consistent with its purposes, the institution offers co-curricular programs that are aligned with its academic goals, integrated with academic programs, and designed to support all students’ personal and professional development. The institution assesses the effectiveness of its co-curricular programs and uses the results for improvement. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (90, 3, 7, N'2.12', N'The institution ensures that all students understand the requirements of their academic programs and receive timely, useful, and complete information and advising about relevant academic requirements. ', N'The institution ensures that all students understand the requirements of their academic programs and receive timely, useful, and complete information and advising about relevant academic requirements. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (91, 3, 7, N'2.13', N'The institution provides academic and other student support services such as tutoring, services for students with disabilities, financial aid counseling, career counseling and placement, residential life, athletics, and other services and programs as appropriate, which meet the needs of the specific types of students that the institution serves and the programs it offers. ', N'The institution provides academic and other student support services such as tutoring, services for students with disabilities, financial aid counseling, career counseling and placement, residential life, athletics, and other services and programs as appropriate, which meet the needs of the specific types of students that the institution serves and the programs it offers. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (92, 3, 7, N'2.14', N'Institutions that serve transfer students provide clear, accurate, and timely information, ensure equitable treatment under academic policies, provide such students access to student services, and ensure that they are not unduly disadvantaged by the transfer process. ', N'Institutions that serve transfer students provide clear, accurate, and timely information, ensure equitable treatment under academic policies, provide such students access to student services, and ensure that they are not unduly disadvantaged by the transfer process. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (93, 3, 9, N'3.1', N'The institution employs faculty and staff with substantial and continuing commitment to the institution. The faculty and staff are sufficient in number, professional qualification, and diversity to achieve the institution’s educational objectives, establish and oversee academic policies, and ensure the integrity and continuity of its academic and co-curricular programs wherever and however delivered. ', N'The institution employs faculty and staff with substantial and continuing commitment to the institution. The faculty and staff are sufficient in number, professional qualification, and diversity to achieve the institution’s educational objectives, establish and oversee academic policies, and ensure the integrity and continuity of its academic and co-curricular programs wherever and however delivered. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (94, 3, 9, N'3.2', N'Faculty and staff recruitment, hiring, orientation, workload, incentives, and evaluation practices are aligned with institutional purposes and educational objectives. Evaluation is consistent with best practices in performance appraisal, including multisource feedback and appropriate peer review. Faculty evaluation processes are systematic and are used to improve teaching and learning. ', N'Faculty and staff recruitment, hiring, orientation, workload, incentives, and evaluation practices are aligned with institutional purposes and educational objectives. Evaluation is consistent with best practices in performance appraisal, including multisource feedback and appropriate peer review. Faculty evaluation processes are systematic and are used to improve teaching and learning. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (95, 3, 9, N'3.3', N'The institution maintains appropriate and sufficiently supported faculty and staff development activities designed to improve teaching, learning, and assessment of learning outcomes. ', N'The institution maintains appropriate and sufficiently supported faculty and staff development activities designed to improve teaching, learning, and assessment of learning outcomes. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (96, 3, 10, N'3.4', N'The institution is financially stable and has unqualified independent financial audits and resources sufficient to ensure long-term viability. Resource planning and development include realistic budgeting, enrollment management, and diversification of revenue sources. Resource planning is integrated with all other institutional planning. Resources are aligned with educational purposes and objectives. ', N'The institution is financially stable and has unqualified independent financial audits and resources sufficient to ensure long-term viability. Resource planning and development include realistic budgeting, enrollment management, and diversification of revenue sources. Resource planning is integrated with all other institutional planning. Resources are aligned with educational purposes and objectives. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (97, 3, 10, N'3.5', N'The institution provides access to information and technology resources sufficient in scope, quality, currency, and kind at physical sites and online, as appropriate, to support its academic offerings and the research and scholarship of its faculty, staff, and students. These information resources, services, and facilities are consistent with the institution’s educational objectives and are aligned with student learning outcomes. ', N'The institution provides access to information and technology resources sufficient in scope, quality, currency, and kind at physical sites and online, as appropriate, to support its academic offerings and the research and scholarship of its faculty, staff, and students. These information resources, services, and facilities are consistent with the institution’s educational objectives and are aligned with student learning outcomes. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (98, 3, 11, N'3.6', N'The institution’s leadership, at all levels, is characterized by integrity, high performance, appropriate responsibility, and accountability. ', N'The institution’s leadership, at all levels, is characterized by integrity, high performance, appropriate responsibility, and accountability. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (99, 3, 11, N'3.7', N'The institution’s organizational structures and decision-making processes are clear and consistent with its purposes, support effective decision making, and place priority on sustaining institutional capacity and educational effectiveness. ', N'The institution’s organizational structures and decision-making processes are clear and consistent with its purposes, support effective decision making, and place priority on sustaining institutional capacity and educational effectiveness. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (100, 3, 11, N'3.8', N'The institution has a full-time chief executive officer and a chief financial officer whose primary or full-time responsibilities are to the institution. In addition, the institution has a sufficient number of other qualified administrators to provide effective educational leadership and management. ', N'The institution has a full-time chief executive officer and a chief financial officer whose primary or full-time responsibilities are to the institution. In addition, the institution has a sufficient number of other qualified administrators to provide effective educational leadership and management. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (101, 3, 11, N'3.9', N'The institution has an independent governing board or similar authority that, consistent with its legal and fiduciary authority, exercises appropriate oversight over institutional integrity, policies, and ongoing operations, including hiring and evaluating the chief executive officer. ', N'The institution has an independent governing board or similar authority that, consistent with its legal and fiduciary authority, exercises appropriate oversight over institutional integrity, policies, and ongoing operations, including hiring and evaluating the chief executive officer. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (102, 3, 11, N'3.10', N'The institution’s faculty exercises effective academic leadership and acts consistently to ensure that both academic quality and the institution’s educational purposes and character are sustained. ', N'The institution’s faculty exercises effective academic leadership and acts consistently to ensure that both academic quality and the institution’s educational purposes and character are sustained. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (103, 3, 13, N'4.1', N'The institution employs a deliberate set of quality-assurance processes in both academic and non-academic areas, including new curriculum and program approval processes, periodic program review, assessment of student learning, and other forms of ongoing evaluation. These processes include: collecting, analyzing, and interpreting data; tracking learning results over time; using comparative data from external sources; and improving structures, services, processes, curricula, pedagogy, and learning results. ', N'The institution employs a deliberate set of quality-assurance processes in both academic and non-academic areas, including new curriculum and program approval processes, periodic program review, assessment of student learning, and other forms of ongoing evaluation. These processes include: collecting, analyzing, and interpreting data; tracking learning results over time; using comparative data from external sources; and improving structures, services, processes, curricula, pedagogy, and learning results. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (104, 3, 14, N'4.2', N'The institution has institutional research capacity consistent with its purposes and characteristics. Data are disseminated internally and externally in a timely manner, and analyzed, interpreted, and incorporated in institutional review, planning, and decision-making. Periodic reviews are conducted to ensure the effectiveness of the institutional research function and the suitability and usefulness of the data generated. ', N'The institution has institutional research capacity consistent with its purposes and characteristics. Data are disseminated internally and externally in a timely manner, and analyzed, interpreted, and incorporated in institutional review, planning, and decision-making. Periodic reviews are conducted to ensure the effectiveness of the institutional research function and the suitability and usefulness of the data generated. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (105, 3, 14, N'4.3', N'Leadership at all levels, including faculty, staff, and administration, is committed to improvement based on the results of inquiry, evidence, and evaluation. Assessment of teaching, learning, and the campus environment – in support of academic and co-curricular objectives – is undertaken, used for improvement, and incorporated into institutional planning processes. ', N'Leadership at all levels, including faculty, staff, and administration, is committed to improvement based on the results of inquiry, evidence, and evaluation. Assessment of teaching, learning, and the campus environment – in support of academic and co-curricular objectives – is undertaken, used for improvement, and incorporated into institutional planning processes. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (106, 3, 14, N'4.4', N'The institution, with significant faculty involvement, engages in ongoing inquiry into the processes of teaching and learning, and the conditions and practices that ensure that the standards of performance established by the institution are being achieved. The faculty and other educators take responsibility for evaluating the effectiveness of teaching and learning processes and uses the results for improvement of student learning and success. The findings from such inquiries are applied to the design and improvement of curricula, pedagogy, and assessment methodology. ', N'The institution, with significant faculty involvement, engages in ongoing inquiry into the processes of teaching and learning, and the conditions and practices that ensure that the standards of performance established by the institution are being achieved. The faculty and other educators take responsibility for evaluating the effectiveness of teaching and learning processes and uses the results for improvement of student learning and success. The findings from such inquiries are applied to the design and improvement of curricula, pedagogy, and assessment methodology. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (107, 3, 14, N'4.5', N'Appropriate stakeholders, including alumni, employers, practitioners, students, and others designated by the institution, are regularly involved in the assessment and alignment of educational programs. ', N'Appropriate stakeholders, including alumni, employers, practitioners, students, and others designated by the institution, are regularly involved in the assessment and alignment of educational programs. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (108, 3, 14, N'4.6', N'The institution periodically engages its multiple constituencies, including the governing board, faculty, staff, and others, in institutional reflection and planning processes that are based on the examination of data and evidence. These processes assess the institution’s strategic position, articulate priorities, examine the alignment of its purposes, core functions, and resources, and define the future direction of the institution. ', N'The institution periodically engages its multiple constituencies, including the governing board, faculty, staff, and others, in institutional reflection and planning processes that are based on the examination of data and evidence. These processes assess the institution’s strategic position, articulate priorities, examine the alignment of its purposes, core functions, and resources, and define the future direction of the institution. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (109, 3, 14, N'4.7', N'Within the context of its mission and structural and financial realities, the institution considers changes that are currently taking place and are anticipated to take place within the institution and higher education environment as part of its planning, new program development, and resource allocation. ', N'Within the context of its mission and structural and financial realities, the institution considers changes that are currently taking place and are anticipated to take place within the institution and higher education environment as part of its planning, new program development, and resource allocation. ', NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (110, 1, 27, N'101.1', N'affirm and respect the human dignity and individual worth of each person.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (111, 1, 27, N'101.2', N'do not discriminate against anyone because of race, ethnicity, religious/spiritual tradition, sexual orientation, gender identity, gender expression, age, disability.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (112, 1, 27, N'101.3', N'respect the integrity and welfare of those served or supervised, refraining from disparagement and avoiding emotional exploitation, sexual exploitation, or any other kind of exploitation.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (113, 1, 27, N'101.4', N'approach the religious convictions of a person, group and/or CPE student with respect and sensitivity; avoid the imposition of their theology or cultural values on those served or supervised.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (114, 1, 27, N'101.5', N' respect confidentiality to the extent permitted by law, regulations or other applicable rules.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (115, 1, 27, N'101.6', N'follow nationally established guidelines in the design of research involving human subjects and gain approval from a recognized institutional review board before conducting such research.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (116, 1, 27, N'102.1', N' maintain good standing in their faith group.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (117, 1, 27, N'102.2', N'abide by the professional practice and/or teaching standards of the state, the community and the institution in which they are employed. If for any reason they are not free to practice or teach according to conscience, they shall notify the employer and the Executive Director of ACPE.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (118, 1, 27, N'102.3', N'maintain professional relationships with other persons in the ACPE center, institution in which employed and/or the community.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (119, 1, 27, N'102.4', N'do not directly or by implication claim professional qualifications that exceed actual qualifications or misrepresent their affiliation with any institution, organization or individual; are responsible for correcting the misrepresentation or misunderstanding of their professional qualifications or affiliations.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (120, 1, 27, N'103.1', N'continue professional education and growth, including participation in the meetings and affairs of ACPE.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (121, 1, 27, N'103.2', N'avoid using knowledge, position or professional association to secure unfair personal advantage; do not knowingly permit their services to be used by others for purposes inconsistent with the ethical standards of ACPE; or use affiliation with ACPE for purposes that are not consistent with ACPE standards.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (122, 1, 27, N'103.3', N'speak on behalf of ACPE or represent the official position of ACPE only as authorized by the ACPE governing body.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (123, 1, 27, N'103.4', N'do not make intentionally false, misleading or incomplete statements about their work or ethical behavior.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (124, 1, 27, N'104.1', N'respect the integrity and welfare of colleagues; maintain professional relationships on a professional basis, refraining from disparagement and avoiding emotional, sexual or any other kind of exploitation.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (125, 1, 27, N'104.2', N'take collegial and responsible action when concerns about incompetence, impairment or misconduct arise.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (126, 1, 27, N'105.1', N'carry out administrative responsibilities in a timely and professional manner.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (127, 1, 27, N'105.2', N'implement sound fiscal practices, maintain accurate financial records and protect the integrity of funds entrusted to their care.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (128, 1, 27, N'105.3', N'distinguish private opinions from those of ACPE, their faith group or profession in all publicity, public announcements or publications.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (129, 1, 27, N'105.4', N'accurately describe the ACPE center, its pastoral services and educational programs. All statements in advertising, catalogs, publications, recruiting, and academic calendars shall be accurate at the time of publication. Publications advertising a center’s programs shall include the type(s) and level(s) of education offered and the ACPE address, telephone number and website address.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (130, 1, 27, N'105.5', N'accurately describe program expectations, including time requirements, in the admissions process for CPE programs.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (131, 1, 28, N'200', N'Complaints ', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (132, 1, 29, N'301.1', N'describes the administrative structure and lines of authority within the center.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (133, 1, 29, N'301.2', N' provides for compliance with ACPE standards.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (134, 1, 29, N'301.3', N'describes how commitments to students will be met in the event of substantial change within the institution or center.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (135, 1, 29, N'302.1', N' financial, human and physical resources sufficient to support the units of CPE offered by the center.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (136, 1, 29, N'302.3', N'a population that provides students with opportunities for ministry and clinical pastoral education.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (137, 1, 29, N'302.3', N'whenever a center uses CPE program elements external to itself, a written agreement that specifies the relationship and operational details is required.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (138, 1, 29, N'303.1', N'a faculty of sufficient size to fulfill program goals and comprised of persons authorized by ACPE.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (139, 1, 29, N'303.2', N'a faculty development plan.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (140, 1, 29, N'303.3', N'interdisciplinary consultation and teaching within the program(s) provided by adjunct faculty and/or guest lecturers.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (141, 1, 29, N'303.4', N' individual and group supervision by a person authorized by ACPE.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (142, 1, 29, N'303.5', N'a peer group of at least three CPE Level I/Level II students engaged in small group process and committed to fulfilling the requirements of the educational program.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (143, 1, 29, N'303.6', N'access to library and educational facilities adequate to meet the ACPE standards.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (144, 1, 29, N'303.7', N'access to current ACPE standards, commissions’ manuals, the ACPE Policy for Complaints Alleging Violation of ACPE Education Standards and the ACPE Policy for Complaints Against the Accreditation Commission', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (145, 1, 29, N'303.8', N' student support services including, but not limited to, orientation, a process for educational guidance and recommendations for counseling resources, resume preparation and employment search.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (146, 1, 29, N'304.1', N'an admission policy that clearly states the ACPE accredited center does not discriminate against persons because of race, gender, age, faith group, national origin, sexual orientation, or disability.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (147, 1, 29, N'304.2', N'a financial policy that clearly states fees, payment schedules, refunds, stipends, and benefits.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (148, 1, 29, N'304.3', N'a complaint procedure consistent with ACPE Standards the ACPE Manual 2016 Processing Complaints of Ethics Violations that addresses an alleged violation of the ACPE ethics standards.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (149, 1, 29, N'304.4', N'a procedure for maintaining student records for ten years, which addresses confidentiality, access, content, and custody of student records should the center be without a supervisor and/or accreditation. (See Guide for Student Records, Appendix 7B)', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (150, 1, 29, N'304.5', N'a procedure for providing consultation for CPE students.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (151, 1, 29, N'304.6', N' a procedure for discipline, dismissal, and withdrawal of students.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (152, 1, 29, N'304.7', N'a policy for the ethical conduct of students and program staff consistent with the ACPE Code of Ethics.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (153, 1, 29, N'304.8', N'a statement of student rights and responsibilities. Centers using video conferencing methodology must include a statement of students’ and supervisors’ rights and responsibilities related to the use of the technology.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (154, 1, 29, N'304.9', N'an agreement for training at the ministry site that includes, but is not limited to:', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (155, 1, 29, N'304.10', N'a policy and procedure that details how the accredited center will provide for completion of a unit or program in process if the Certified Educator is unable to continue.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (156, 1, 29, N'304.11', N'supervision and program management by a person authorized by ACPE.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (157, 1, 29, N'305.1', N'an ongoing process of consultation with a designated professional advisory group.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (158, 1, 29, N'305.2', N'ongoing program evaluation sufficient to promote the continuous quality improvement of the educational program(s) including:', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (159, 1, 29, N'306', N'accurately describe the center, its pastoral services, and educational programs.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (160, 1, 29, N'307.1', N'a completed ACPE application.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (161, 1, 29, N'307.2', N'an admission interview with a qualified interviewer, for persons applying for an initial unit of CPE, to determine readiness for clinical learning.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (162, 1, 29, N'307.3', N' either graduation from high school/completion of a GED or ordination by a faith community or commission to function in ministry by an appropriate religious authority as determined by ACPE.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (163, 1, 29, N'307.4', N'fulfillment of education or experience requirements established by the ACPE accredited center.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (164, 1, 29, N'307.5', N'acceptance by an ACPE center accredited for appropriate program type.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (165, 1, 29, N'307.6', N'Additional requirements for admission to Certified Educator CPE include, but are not limited to:', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (166, 1, 29, N'308.1', N'a specific time period for a program unit of clinical pastoral education or a half unit of clinical pastoral education.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (167, 1, 29, N'308.2', N' supervised clinical practice of ministry to persons and the detailed reporting and evaluation of that ministry.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (168, 1, 29, N'308.3', N'supervision and program management by a person authorized by ACPE.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (169, 1, 29, N'308.4', N' an individual contract for learning developed collaboratively by the student and Certfied Educator.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (170, 1, 29, N'308.5', N'a relational learning environment that fosters growth in pastoral formation, pastoral reflection and pastoral competence; such an environment involves mutual trust, respect, openness, challenge, conflict, and confrontation.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (171, 1, 29, N'308.6', N' an instructional plan that employs a process model of education and clinical method of learning including:', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (172, 1, 29, N'308.7', N'presentation and use of literature and instruction appropriate to the students’ learning goals and needs.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (173, 1, 29, N'308.8', N'final evaluations written by the student and Certified Educator.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (174, 1, 29, N'308.9', N'Additional program standards for Certified Educator CPE include, but are not limited to:', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (175, 1, 29, N'308.10', N'Over a ten year accreditation period, 75% of students entering units of CPE Level I/Level II or Certified Educator CPE receive credit for those units.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (176, 1, 29, N'308.11', N'When there is geographic distance between the CPE Certified Educator and students, electronic presence, i.e., video conferencing, is allowed as an alternative to physical presence.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (177, 1, 29, N'309.1', N'to develop students’ awareness of themselves as ministers and of the ways their ministry affects persons.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (178, 1, 29, N'309.2', N'to develop students’ awareness of how their attitudes, values, assumptions, strengths, and weaknesses affect their pastoral care.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (179, 1, 29, N'309.3', N'to develop students’ ability to engage and apply the support, confrontation, and clarification of the peer group for the integration of personal attributes and pastoral functioning.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (180, 1, 29, N'309.4', N' to develop students’ awareness and understanding of how persons, social conditions, systems, and structures affect their lives and the lives of others and how to address effectively these issues through their ministry.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (181, 1, 29, N'309.5', N' to develop students’ skills in providing intensive and extensive pastoral care and counseling to persons.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (182, 1, 29, N'309.6', N' to develop students’ ability to make effective use of their religious/spiritual heritage, theological understanding, and knowledge of the behavioral sciences and applied clinical ethics in their pastoral care of persons and groups.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (183, 1, 29, N'309.7', N'to teach students the pastoral role in professional relationships and how to work effectively as a pastoral member of a multidisciplinary team.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (184, 1, 29, N'309.8', N'to develop students’ capacity to use one’s pastoral and prophetic perspectives in preaching, teaching, leadership, management, pastoral care, and pastoral counseling.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (185, 1, 29, N'309.9', N' to develop students’ understanding and ability to apply the clinical method of learning.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (186, 1, 29, N'309.10', N' to develop students’ abilities to use both individual and group supervision for personal and professional growth, including the capacity to evaluate one’s ministry.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (187, 1, 29, N'310.1', N'to afford students opportunities to become familiar with and apply relevant theories and methodologies to their ministry specialty.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (188, 1, 29, N'310.2', N'to provide students opportunities to formulate and apply their philosophy and methodology for the ministry specialty.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (189, 1, 29, N'310.3', N'to provide students opportunities to demonstrate pastoral competence in the practice of the specialty.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (190, 1, 29, N'311.1', N'articulate the central themes and core values of one’s religious/spiritual heritage and the theological understanding that informs one’s ministry.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (191, 1, 29, N'311.2', N' identify and discuss major life events, relationships, social location, cultural contexts, and social realities that impact personal identity as expressed in pastoral functioning.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (192, 1, 29, N'311.3', N'initiate peer group and supervisory consultation and receive critique about one’s ministry practice.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (193, 1, 29, N'311.4', N' risk offering appropriate and timely critique with peers and supervisors.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (194, 1, 29, N'311.5', N'recognize relational dynamics within group contexts.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (195, 1, 29, N'311.6', N'demonstrate the integration of conceptual understandings presented in the curriculum into pastoral practice.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (196, 1, 29, N'311.7', N'initiate helping relationships within and across diverse populations.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (197, 1, 29, N'311.8', N'use the clinical methods of learning to achieve one’s educational goals.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (198, 1, 29, N'311.9', N'formulate clear and specific goals for continuing pastoral formation with reference to one’s strengths and weaknesses as identified through self-reflection, supervision, and feedback.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (199, 1, 29, N'312.1', N'articulate an understanding of the pastoral role that is congruent with one’s personal and cultural values, basic assumptions and personhood.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (200, 1, 29, N'312.2', N'provide pastoral ministry with diverse people, taking into consideration multiple elements of cultural and ethnic differences, social conditions, systems, justice issues, and applied clinical ethics without imposing one’s own perspectives.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (201, 1, 29, N'312.3', N'demonstrate a range of pastoral skills, including listening/attending, empathic reflection, conflict resolution/ transformation, confrontation, crisis management, and appropriate use of religious/spiritual resources.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (202, 1, 29, N'312.4', N'assess the strengths and needs of those served, grounded in theology and using an understanding of the behavioral sciences.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (203, 1, 29, N'312.5', N' manage ministry and administrative function in terms of accountability, productivity, self-direction, and clear, accurate professional communication.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (204, 1, 29, N'312.6', N'demonstrate competent use of self in ministry and administrative function which includes: emotional availability, cultural humility, appropriate self- disclosure, positive use of power and authority, a non-anxious and non- judgmental presence, and clear and responsible boundaries.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (205, 1, 29, N'312.7', N' establish collaboration and dialogue with peers, authorities and other professionals.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (206, 1, 29, N'312.8', N'demonstrate awareness of the Common Qualifications and Competencies for Professional Chaplains. Note: The ACPE Standards and Code of Ethics supersede these standards.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (207, 1, 29, N'312.9', N'demonstrate self-supervision through realistic self-evaluation of pastoral functioning.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (208, 1, 29, N'313.1', N'to develop supervisory students’ knowledge in theories and methodologies related to CPE supervision drawn from theology; professional, applied clinical and organizational ethics; the behavioral sciences; and adult education.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (209, 1, 29, N'313.2', N'to provide students practice in the supervision of CPE under the supervision of an ACPE Certified Educator.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (210, 1, 29, N'313.3', N'to facilitate students’ integration of the theory and practice of CPE supervision in their identity as a person, pastor, and educator.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (211, 1, 29, N'314', N' Outcomes achieved by Certified Educator CPE students accrue in six areas of competency derived from the Certified Educator CPE objectives. A successful candidate for certification as ACPE Associate Certified Educator demonstrates the following:', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (212, 1, 29, N'315.1', N'maintains personal integrity and a deepening pastoral identity.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (213, 1, 29, N'315.2', N'demonstrates emotional and spiritual maturity.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (214, 1, 29, N'315.3', N'forms meaningful pastoral relationships.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (215, 1, 29, N'315.4', N'self-supervises own on-going pastoral practice.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (216, 1, 29, N'315.5', N' refines one’s professional identity as a clinical pastoral educator.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (217, 1, 29, N'315.6', N' ability to explicate how one’s personal history and culture affect professional and personal identity, pastoral practice, the supervisory relationship, and student learning.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (218, 1, 29, N'316.1', N' articulates understanding of and methodology for clinical pastoral supervision based on a critical grasp of the professional literature relating to the field of clinical supervision.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (219, 1, 29, N'316.2', N'articulates and implements a philosophy of CPE based on an educational model integrating the theory and practice of CPE, which is based on and congruent with one’s theology.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (220, 1, 29, N'316.3', N'articulates rationale for multicultural competence, integrating the theory and practice of CPE, which is based on and congruent with one’s theology.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (221, 1, 29, N'317.1', N'individual supervision', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (222, 1, 29, N'317.2', N'group CPE supervision', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (223, 1, 29, N'318.1', N'develops and organizes programs of CPE based on program educational principles appropriate to experiential learning.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (224, 1, 29, N'318.2', N'manages CPE programs effectively.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (225, 1, 29, N'318.3', N'develops a variety of CPE program resources.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (226, 1, 29, N'318.4', N'uses diverse clinical educational methods.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (227, 1, 29, N'318.5', N'works with the theological implications of the ministry context.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (228, 1, 29, N'318.6', N'understands and uses applied clinical ethics as they relate to CPE and pastoral practice.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (229, 1, 29, N'318.7', N' uses appropriate clinical skills and teaching methods that integrate the role of context and culture in pastoral practice and education.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (230, 1, 29, N'318.8', N' advocates for students based on awareness of how persons’ social locations, systems, and structures affect one’s ministry, learning, and the educational context.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (231, 1, 29, N'319.9', N'considers cultural factors in the use of learning assessments, educational strategies, curriculum resources, and evaluation procedures.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (232, 1, 29, N'319.1', N' integrates educational theory; knowledge of behavioral science, applied clinical ethics, theology, and pastoral identity into supervisory function.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (233, 1, 29, N'319.2', N'demonstrates awareness of the cultural contexts of diverse student groups and clinical populations that integrates and articulates ethnic identity development and its implications for pastoral practice and supervisory relationships.', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (234, 1, 29, N'320.1', N' The procedures for filing an appeal, designed to ensure the right of due process as defined by the U.S. Department of Education, are found in the ACPE 2016 Accreditation Manual Appendix 9 Appeal of Adverse Accreditation Decision(s).', NULL, NULL)
GO
INSERT [dbo].[AccreditationStandards] ([AccreditationStandardID], [AccreditationOrganizationID], [CategoryID], [Standard], [Description], [ToolTip], [Active]) VALUES (235, 1, 29, N'320.2', N'An appeal must be based on the grounds that such decision was:
• arbitrary, capricious or otherwise in violation of ACPE standards or the ACPE Accreditation Manual;
OR
• not supported by substantial evidence in the record on which the adverse decision was based.', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[AccreditationStandards] OFF
GO
SET IDENTITY_INSERT [dbo].[Assessments] ON 
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (1, N'Survey Results', N'Survey Results')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (2, N'Focus Group Results', N'Focus Group Results')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (3, N'Formative student understanding', N'Formative student understanding within the course (e.g. Minute Paper, Muddiest Point, Student-Generated Test Questions, Classroom Opinion Polls)')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (4, N'Program outcome data', N'Program outcome data (e.g., licensing examinations, PCOA, event attendance, scholarly productivity)')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (5, N'Input data', N'Input data (e.g., admission data, faculty/staff credentials on hire, student performance in prerequisite courses)')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (6, N'External review (e.g. accreditor visit', N'External review (e.g. accreditor visit')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (7, N'Tests/exam', N'Tests/exam item analysis/student performance (required for courses)')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (8, N'Review of minutes ', N'Review of minutes or other ongoing record or reflection, e.g., “red book” for courses (name)')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (9, N'CLO/PLO/GLO rubrics', N'CLO/PLO/GLO rubrics and learning outcome data')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (10, N'Plan ', N'Plan (e.g. strategic plan, earlier SII-PDCA forms, budgets, faculty adequacy model)')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (11, N'Peer review', N'Peer review')
GO
INSERT [dbo].[Assessments] ([AssessmentID], [Name], [Description]) VALUES (12, N'Other', N'Other')
GO
SET IDENTITY_INSERT [dbo].[Assessments] OFF
GO
SET IDENTITY_INSERT [dbo].[PDCAFields] ON 
GO
INSERT [dbo].[PDCAFields] ([PDCAFieldID], [FieldName], [Title], [Description], [ToolTip], [DisplayOrder]) VALUES (1, N'SubjectOfAssessement', N'Subject of Assessment', N'<ul><li>Course (<b>number</b>), Committee (<b>name</b>), Event (<b>name</b>), Process (name), </li><li>Curriculum (program name), Initiative (name), Plan (name), Project (name), </li><li>Performance / Presentation / Paper / Poster (name), Past SII-PDCA (name/date), Other (describe) </li></ul>', NULL, CAST(1.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PDCAFields] ([PDCAFieldID], [FieldName], [Title], [Description], [ToolTip], [DisplayOrder]) VALUES (2, N'AssessmentName', N'Assessment Name', N'Assessment Name, Date, Who Was Assessed, Description of Assessments:', NULL, CAST(2.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PDCAFields] ([PDCAFieldID], [FieldName], [Title], [Description], [ToolTip], [DisplayOrder]) VALUES (3, N'Strengths', N'Strengths', N'And why are these strengths? How can you leverage these strengths?', NULL, CAST(3.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PDCAFields] ([PDCAFieldID], [FieldName], [Title], [Description], [ToolTip], [DisplayOrder]) VALUES (4, N'Insights', N'Insights', N'What did you learn? What surprised you?', NULL, CAST(4.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PDCAFields] ([PDCAFieldID], [FieldName], [Title], [Description], [ToolTip], [DisplayOrder]) VALUES (5, N'AreasforImprovement', N'Areas for Improvement', N'What problems did you experience?
What are the root causes of this problem?
What are your assumptions?', NULL, CAST(5.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PDCAFields] ([PDCAFieldID], [FieldName], [Title], [Description], [ToolTip], [DisplayOrder]) VALUES (6, N'Plan', N'Plan', N'What change is needed?
What literature addresses this problem?', NULL, CAST(6.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PDCAFields] ([PDCAFieldID], [FieldName], [Title], [Description], [ToolTip], [DisplayOrder]) VALUES (7, N'Do', N'Do', N'What concrete steps will be taken? Is a pilot needed? Who will be impacted? Who needs to buy-in? Who should you communicate with? Who is responsible for doing what?', NULL, CAST(7.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PDCAFields] ([PDCAFieldID], [FieldName], [Title], [Description], [ToolTip], [DisplayOrder]) VALUES (8, N'Check', N'Check', N'<b>What data will you collect </b>and analyze to assess? Who will do the work? When will this be done?
Adjust: Any changes implicated by assessment can be added to the original report or completed in a new SII-PDCA form ', NULL, CAST(8.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PDCAFields] ([PDCAFieldID], [FieldName], [Title], [Description], [ToolTip], [DisplayOrder]) VALUES (9, N'AdditionalComments', N'Additional Comments', N'Enter any additional comments that might be helpful. ', NULL, CAST(9.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[PDCAFields] ([PDCAFieldID], [FieldName], [Title], [Description], [ToolTip], [DisplayOrder]) VALUES (10, N'ReportMustBeConveyed', N'Report Must Be Conveyed', N'Report must be conveyed to (Admin/ Faculty or Chair /Committee) Please specify:', NULL, CAST(10.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[PDCAFields] OFF
GO
SET IDENTITY_INSERT [dbo].[PDCAUsers] ON 
GO
INSERT [dbo].[PDCAUsers] ([PDCAUserID], [NetworkUserID], [FiratName], [LastName], [UserRole]) VALUES (1, N'CCHSU\cschaffer', N'Cliff', N'Schaffer', N'Approver')
GO
INSERT [dbo].[PDCAUsers] ([PDCAUserID], [NetworkUserID], [FiratName], [LastName], [UserRole]) VALUES (2, N'CCHSU\swragg', N'Stephanie', N'Wragg', N'Approver')
GO
INSERT [dbo].[PDCAUsers] ([PDCAUserID], [NetworkUserID], [FiratName], [LastName], [UserRole]) VALUES (3, N'CCHSU\mansong', N'Miriam', N'Ansong', N'Approver')
GO
INSERT [dbo].[PDCAUsers] ([PDCAUserID], [NetworkUserID], [FiratName], [LastName], [UserRole]) VALUES (4, N'CCHSU\jbriar', N'John', N'Briar', N'Approver')
GO
SET IDENTITY_INSERT [dbo].[PDCAUsers] OFF
GO
