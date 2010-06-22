USE [GlobusDataPad]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[PasswordQuestion] [nvarchar](max) NOT NULL,
	[PasswordAnswer] [nvarchar](max) NOT NULL,
	[LastActivityDate] [datetime2](7) NOT NULL,
	[LastLoginDate] [datetime2](7) NOT NULL,
	[LastPasswordChangedDate] [datetime2](7) NOT NULL,
	[IsOnline] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[LastLockedOutDate] [datetime2](7) NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime2](7) NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime2](7) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[CurrentClass_Id] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_UserClass] ON [dbo].[Users] 
(
	[CurrentClass_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([Id], [Password], [IsApproved], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [Username], [PasswordQuestion], [PasswordAnswer], [LastActivityDate], [LastLoginDate], [LastPasswordChangedDate], [IsOnline], [IsLockedOut], [LastLockedOutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [FirstName], [LastName], [Email], [Title], [CurrentClass_Id]) VALUES (1, N'lmJyjSoXdWfN9qm2lA8lvhSrwok=', 1, 0, CAST(0x077D8207F287F8320B AS DateTime2), CAST(0x072FD976468DF8320B AS DateTime2), N'System', N'System', N'admin', N'Admin?', N'Yes?', CAST(0x072ABF06F287F8320B AS DateTime2), CAST(0x072FD976468DF8320B AS DateTime2), CAST(0x072ABF06F287F8320B AS DateTime2), 0, 0, CAST(0x072ABF06F287F8320B AS DateTime2), 0, CAST(0x072ABF06F287F8320B AS DateTime2), 0, CAST(0x072ABF06F287F8320B AS DateTime2), N'', N'', N'admin@globus.com', N'', NULL)
INSERT [dbo].[Users] ([Id], [Password], [IsApproved], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [Username], [PasswordQuestion], [PasswordAnswer], [LastActivityDate], [LastLoginDate], [LastPasswordChangedDate], [IsOnline], [IsLockedOut], [LastLockedOutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [FirstName], [LastName], [Email], [Title], [CurrentClass_Id]) VALUES (3, N'avl+2O3xl5VyplpZWc0hjwQdtQs=', 1, 0, CAST(0x07884AB9FB89F8320B AS DateTime2), CAST(0x070DD8DBF98EF8320B AS DateTime2), N'System', N'System', N'sammy.chen', N'pourquoi?', N'42', CAST(0x07884AB9FB89F8320B AS DateTime2), CAST(0x070DD8DBF98EF8320B AS DateTime2), CAST(0x07884AB9FB89F8320B AS DateTime2), 0, 0, CAST(0x07884AB9FB89F8320B AS DateTime2), 0, CAST(0x07884AB9FB89F8320B AS DateTime2), 0, CAST(0x07884AB9FB89F8320B AS DateTime2), N'Sammy', N'CHEN', N'sammy.chen@globus.com', N'Professeur', NULL)
INSERT [dbo].[Users] ([Id], [Password], [IsApproved], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [Username], [PasswordQuestion], [PasswordAnswer], [LastActivityDate], [LastLoginDate], [LastPasswordChangedDate], [IsOnline], [IsLockedOut], [LastLockedOutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [FirstName], [LastName], [Email], [Title], [CurrentClass_Id]) VALUES (4, N'avl+2O3xl5VyplpZWc0hjwQdtQs=', 1, 0, CAST(0x07782B0B538AF8320B AS DateTime2), CAST(0x07E6B832788EF8320B AS DateTime2), N'System', N'System', N'sacha.ketchum', N'pourquoi?', N'42', CAST(0x07782B0B538AF8320B AS DateTime2), CAST(0x07E6B832788EF8320B AS DateTime2), CAST(0x07782B0B538AF8320B AS DateTime2), 0, 0, CAST(0x07782B0B538AF8320B AS DateTime2), 0, CAST(0x07782B0B538AF8320B AS DateTime2), 0, CAST(0x07782B0B538AF8320B AS DateTime2), N'Sacha', N'KETCHUM', N'sacha.ketchum@globus.com', N'Dresseur Pokemon', NULL)
INSERT [dbo].[Users] ([Id], [Password], [IsApproved], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [Username], [PasswordQuestion], [PasswordAnswer], [LastActivityDate], [LastLoginDate], [LastPasswordChangedDate], [IsOnline], [IsLockedOut], [LastLockedOutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [FirstName], [LastName], [Email], [Title], [CurrentClass_Id]) VALUES (5, N'avl+2O3xl5VyplpZWc0hjwQdtQs=', 1, 0, CAST(0x077BF069CE8AF8320B AS DateTime2), CAST(0x0771C0F7178BF8320B AS DateTime2), N'System', N'admin', N'jacky.brandon', N'pourquoi?', N'42', CAST(0x076AC969CE8AF8320B AS DateTime2), CAST(0x077BF069CE8AF8320B AS DateTime2), CAST(0x076AC969CE8AF8320B AS DateTime2), 0, 0, CAST(0x076AC969CE8AF8320B AS DateTime2), 0, CAST(0x076AC969CE8AF8320B AS DateTime2), 0, CAST(0x076AC969CE8AF8320B AS DateTime2), N'Jacky', N'BRANDON', N'jacky.brandon@globus.com', N'Campus manager', NULL)
INSERT [dbo].[Users] ([Id], [Password], [IsApproved], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [Username], [PasswordQuestion], [PasswordAnswer], [LastActivityDate], [LastLoginDate], [LastPasswordChangedDate], [IsOnline], [IsLockedOut], [LastLockedOutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [FirstName], [LastName], [Email], [Title], [CurrentClass_Id]) VALUES (6, N'avl+2O3xl5VyplpZWc0hjwQdtQs=', 1, 0, CAST(0x07B5B2C83F8DF8320B AS DateTime2), CAST(0x072950555C8DF8320B AS DateTime2), N'System', N'admin', N'ginette.michu', N'pourquoi?', N'42', CAST(0x07B5B2C83F8DF8320B AS DateTime2), CAST(0x07B5B2C83F8DF8320B AS DateTime2), CAST(0x07B5B2C83F8DF8320B AS DateTime2), 0, 0, CAST(0x07B5B2C83F8DF8320B AS DateTime2), 0, CAST(0x07B5B2C83F8DF8320B AS DateTime2), 0, CAST(0x07B5B2C83F8DF8320B AS DateTime2), N'Ginette', N'MICHU', N'ginette.michu@globus.com', N'Campus manager', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[UserClassPast]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClassPast](
	[PreviousUsers_Id] [int] NOT NULL,
	[PreviousClasses_Id] [int] NOT NULL,
 CONSTRAINT [PK_UserClassPast] PRIMARY KEY NONCLUSTERED 
(
	[PreviousUsers_Id] ASC,
	[PreviousClasses_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_UserClassPast_Class] ON [dbo].[UserClassPast] 
(
	[PreviousClasses_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCampus1]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCampus1](
	[Stakeholders_Id] [int] NOT NULL,
	[StakeholderCampuses_Id] [int] NOT NULL,
 CONSTRAINT [PK_UserCampus1] PRIMARY KEY NONCLUSTERED 
(
	[Stakeholders_Id] ASC,
	[StakeholderCampuses_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_UserCampus1_Campus] ON [dbo].[UserCampus1] 
(
	[StakeholderCampuses_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCampus]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCampus](
	[Managers_Id] [int] NOT NULL,
	[ManagedCampuses_Id] [int] NOT NULL,
 CONSTRAINT [PK_UserCampus] PRIMARY KEY NONCLUSTERED 
(
	[Managers_Id] ASC,
	[ManagedCampuses_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_UserCampus_Campus] ON [dbo].[UserCampus] 
(
	[ManagedCampuses_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[UserCampus] ([Managers_Id], [ManagedCampuses_Id]) VALUES (5, 2)
INSERT [dbo].[UserCampus] ([Managers_Id], [ManagedCampuses_Id]) VALUES (5, 3)
INSERT [dbo].[UserCampus] ([Managers_Id], [ManagedCampuses_Id]) VALUES (6, 1)
INSERT [dbo].[UserCampus] ([Managers_Id], [ManagedCampuses_Id]) VALUES (6, 2)
/****** Object:  Table [dbo].[Classes]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
	[Campus_Id] [int] NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_ClassCampus] ON [dbo].[Classes] 
(
	[Campus_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Classes] ON
INSERT [dbo].[Classes] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [Campus_Id]) VALUES (1, N'Classe 1', 0, CAST(0x078495258A8DF8320B AS DateTime2), CAST(0x078495258A8DF8320B AS DateTime2), N'admin', N'admin', 3)
SET IDENTITY_INSERT [dbo].[Classes] OFF
/****** Object:  Table [dbo].[Venues]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
	[EventVenue_Venue_Id] [int] NULL,
	[Campus_Id] [int] NULL,
 CONSTRAINT [PK_Venues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_EventVenue] ON [dbo].[Venues] 
(
	[EventVenue_Venue_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_VenueCampus] ON [dbo].[Venues] 
(
	[Campus_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Venues] ON
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (1, N'Salle 1', 0, CAST(0x07239E89838CF8320B AS DateTime2), CAST(0x07239E89838CF8320B AS DateTime2), N'admin', N'admin', NULL, 3)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (2, N'SQa', 1, CAST(0x0760AF1E898CF8320B AS DateTime2), CAST(0x076EEA56958CF8320B AS DateTime2), N'admin', N'admin', NULL, 3)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (3, N'Salle de conference', 0, CAST(0x07E0F678908CF8320B AS DateTime2), CAST(0x07E0F678908CF8320B AS DateTime2), N'admin', N'admin', NULL, 3)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (4, N'Salle 1', 0, CAST(0x0724376FA38CF8320B AS DateTime2), CAST(0x0724376FA38CF8320B AS DateTime2), N'admin', N'admin', NULL, 1)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (5, N'Salle de conference', 0, CAST(0x07B5038AAA8CF8320B AS DateTime2), CAST(0x07B5038AAA8CF8320B AS DateTime2), N'admin', N'admin', NULL, 1)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (6, N'Salle 2', 0, CAST(0x07A2DD78B18CF8320B AS DateTime2), CAST(0x07A2DD78B18CF8320B AS DateTime2), N'admin', N'admin', NULL, 1)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (7, N'Salle 3', 0, CAST(0x07074FD4B78CF8320B AS DateTime2), CAST(0x07074FD4B78CF8320B AS DateTime2), N'admin', N'admin', NULL, 1)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (8, N'Labo', 0, CAST(0x07AA7678C28CF8320B AS DateTime2), CAST(0x07AA7678C28CF8320B AS DateTime2), N'admin', N'admin', NULL, 1)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (9, N'Salle 1', 0, CAST(0x07A4873CD08CF8320B AS DateTime2), CAST(0x07A4873CD08CF8320B AS DateTime2), N'admin', N'admin', NULL, 2)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (10, N'Salle 2', 0, CAST(0x07DCC407D68CF8320B AS DateTime2), CAST(0x07DCC407D68CF8320B AS DateTime2), N'admin', N'admin', NULL, 2)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (11, N'Salle de conference', 0, CAST(0x073486E8DB8CF8320B AS DateTime2), CAST(0x073486E8DB8CF8320B AS DateTime2), N'admin', N'admin', NULL, 2)
INSERT [dbo].[Venues] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [EventVenue_Venue_Id], [Campus_Id]) VALUES (12, N'Labo', 0, CAST(0x07AFE327E28CF8320B AS DateTime2), CAST(0x07AFE327E28CF8320B AS DateTime2), N'admin', N'admin', NULL, 2)
SET IDENTITY_INSERT [dbo].[Venues] OFF
/****** Object:  Table [dbo].[Events_WorldWideEvent]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events_WorldWideEvent](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_Events_WorldWideEvent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Events_WorldWideEvent] ([Id]) VALUES (1)
INSERT [dbo].[Events_WorldWideEvent] ([Id]) VALUES (2)
INSERT [dbo].[Events_WorldWideEvent] ([Id]) VALUES (3)
/****** Object:  Table [dbo].[Events]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
	[IsMandatory] [bit] NOT NULL,
	[Campus_Id] [int] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_CampusEvent] ON [dbo].[Events] 
(
	[Campus_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_UserEvent] ON [dbo].[Events] 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Events] ON
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [IsMandatory], [Campus_Id], [User_Id]) VALUES (1, N'Conference JAVA', N'Conference géniale à propos des technologies JAVA', CAST(0x0700B0BD5875FB320B AS DateTime2), CAST(0x070050CFDF96FB320B AS DateTime2), 0, CAST(0x0780AAE26C8BF8320B AS DateTime2), CAST(0x0780AAE26C8BF8320B AS DateTime2), N'admin', N'admin', 0, NULL, NULL)
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [IsMandatory], [Campus_Id], [User_Id]) VALUES (2, N'Conference .Net', N'Conference géniale à propos des nouveautés du framework .NET 4.0', CAST(0x0700B0BD5875FF320B AS DateTime2), CAST(0x0700E80A7E8EFF320B AS DateTime2), 0, CAST(0x073C9B3B9A8BF8320B AS DateTime2), CAST(0x073C9B3B9A8BF8320B AS DateTime2), N'admin', N'admin', 0, NULL, NULL)
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [IsMandatory], [Campus_Id], [User_Id]) VALUES (3, N'Evenement mondial obligatoire', N'il est obligatoire', CAST(0x070040230E43FE320B AS DateTime2), CAST(0x070010ACD153FE320B AS DateTime2), 0, CAST(0x07619E6ADD8BF8320B AS DateTime2), CAST(0x07619E6ADD8BF8320B AS DateTime2), N'admin', N'admin', 1, NULL, NULL)
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [IsMandatory], [Campus_Id], [User_Id]) VALUES (4, N'Piscine', N'Je vais a la piscine avec mes amis.', CAST(0x0700A8E76F4BFA320B AS DateTime2), CAST(0x0700448E0258FA320B AS DateTime2), 0, CAST(0x07F83567A88EF8320B AS DateTime2), CAST(0x07F83567A88EF8320B AS DateTime2), N'sacha.ketchum', N'sacha.ketchum', 0, NULL, 4)
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [IsMandatory], [Campus_Id], [User_Id]) VALUES (5, N'Entrainement pokemon', N'Je vais entrainer mes pokemons dans la foret.', CAST(0x0700B0BD5875FD320B AS DateTime2), CAST(0x07002058A3A7F8320B AS DateTime2), 0, CAST(0x077B4941CC8EF8320B AS DateTime2), CAST(0x077B4941CC8EF8320B AS DateTime2), N'sacha.ketchum', N'sacha.ketchum', 0, NULL, 4)
INSERT [dbo].[Events] ([Id], [Name], [Description], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [IsMandatory], [Campus_Id], [User_Id]) VALUES (6, N'combat de pokemon', N'Combats de pokemons aux arènes de Nîmes.', CAST(0x07002058A3A7FC320B AS DateTime2), CAST(0x070058A5C8C0FC320B AS DateTime2), 0, CAST(0x073095C4588FF8320B AS DateTime2), CAST(0x073095C4588FF8320B AS DateTime2), N'sammy.chen', N'sammy.chen', 0, NULL, 3)
SET IDENTITY_INSERT [dbo].[Events] OFF
/****** Object:  Table [dbo].[Availabilities]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availabilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
	[User_Id] [int] NOT NULL,
 CONSTRAINT [PK_Availabilities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_UserAvailability] ON [dbo].[Availabilities] 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Availabilities] ON
INSERT [dbo].[Availabilities] ([Id], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [User_Id]) VALUES (1, CAST(0x070040230E43F7320B AS DateTime2), CAST(0x0700E80A7E8E02330B AS DateTime2), 0, CAST(0x0782B07D118FF8320B AS DateTime2), CAST(0x0782B07D118FF8320B AS DateTime2), N'sammy.chen', N'sammy.chen', 3)
SET IDENTITY_INSERT [dbo].[Availabilities] OFF
/****** Object:  Table [dbo].[Campuses]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
	[Address_Id] [int] NOT NULL,
 CONSTRAINT [PK_Campuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_CampusAddress] ON [dbo].[Campuses] 
(
	[Address_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Campuses] ON
INSERT [dbo].[Campuses] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [Address_Id]) VALUES (1, N'Montpellier', 0, CAST(0x07DA81352D8CF8320B AS DateTime2), CAST(0x07FF453F2D8CF8320B AS DateTime2), N'admin', N'admin', 1)
INSERT [dbo].[Campuses] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [Address_Id]) VALUES (2, N'Paris', 0, CAST(0x07EA44A7218CF8320B AS DateTime2), CAST(0x07EA44A7218CF8320B AS DateTime2), N'wam', N'wam', 2)
INSERT [dbo].[Campuses] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [Address_Id]) VALUES (3, N'Londre', 0, CAST(0x07DA95A7748CF8320B AS DateTime2), CAST(0x07DA95A7748CF8320B AS DateTime2), N'wam', N'wam', 3)
SET IDENTITY_INSERT [dbo].[Campuses] OFF
/****** Object:  Table [dbo].[Addresses]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
	[PostalCode] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
	[VenueAddress_Address_Id] [int] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_VenueAddress] ON [dbo].[Addresses] 
(
	[VenueAddress_Address_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [City], [Country], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [VenueAddress_Address_Id]) VALUES (1, N'1337, La rue trop bien', N'34000', N'Montpellier', N'France', 0, CAST(0x07DA81352D8CF8320B AS DateTime2), CAST(0x07FF453F2D8CF8320B AS DateTime2), N'admin', N'admin', NULL)
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [City], [Country], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [VenueAddress_Address_Id]) VALUES (2, N'1337, La rue amusante', N'75000', N'Paris', N'France', 0, CAST(0x07EA44A7218CF8320B AS DateTime2), CAST(0x07EA44A7218CF8320B AS DateTime2), N'wam', N'wam', NULL)
INSERT [dbo].[Addresses] ([Id], [Street], [PostalCode], [City], [Country], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [VenueAddress_Address_Id]) VALUES (3, N'1337, Great Street', N'00000', N'Londre', N'Angleterre', 0, CAST(0x07DA95A7748CF8320B AS DateTime2), CAST(0x07DA95A7748CF8320B AS DateTime2), N'wam', N'wam', NULL)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
/****** Object:  Table [dbo].[UserRole]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Users_Id] [int] NOT NULL,
	[Roles_Id] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY NONCLUSTERED 
(
	[Users_Id] ASC,
	[Roles_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_UserRole_Role] ON [dbo].[UserRole] 
(
	[Roles_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[UserRole] ([Users_Id], [Roles_Id]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([Users_Id], [Roles_Id]) VALUES (3, 4)
INSERT [dbo].[UserRole] ([Users_Id], [Roles_Id]) VALUES (4, 3)
INSERT [dbo].[UserRole] ([Users_Id], [Roles_Id]) VALUES (5, 2)
INSERT [dbo].[UserRole] ([Users_Id], [Roles_Id]) VALUES (6, 2)
/****** Object:  Table [dbo].[Roles]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShortName] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([Id], [ShortName], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy]) VALUES (1, N'Admin', N'Administrator', 0, CAST(0x0720CA90F187F8320B AS DateTime2), CAST(0x0720CA90F187F8320B AS DateTime2), N'System', N'System')
INSERT [dbo].[Roles] ([Id], [ShortName], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy]) VALUES (2, N'CampusManager', N'Campus Manager', 0, CAST(0x074366EFF187F8320B AS DateTime2), CAST(0x074366EFF187F8320B AS DateTime2), N'System', N'System')
INSERT [dbo].[Roles] ([Id], [ShortName], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy]) VALUES (3, N'Student', N'Student', 0, CAST(0x07F25DF3F187F8320B AS DateTime2), CAST(0x07F25DF3F187F8320B AS DateTime2), N'System', N'System')
INSERT [dbo].[Roles] ([Id], [ShortName], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy]) VALUES (4, N'Stakeholder', N'Stakeholder', 0, CAST(0x073D6BF6F187F8320B AS DateTime2), CAST(0x073D6BF6F187F8320B AS DateTime2), N'System', N'System')
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[Cursuses]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
 CONSTRAINT [PK_Cursuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cursuses] ON
INSERT [dbo].[Cursuses] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy]) VALUES (1, N'MBA - Finances 2012', 0, CAST(0x07837BDF4B88F8320B AS DateTime2), CAST(0x07837BDF4B88F8320B AS DateTime2), N'admin', N'admin')
INSERT [dbo].[Cursuses] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy]) VALUES (2, N'MBA - Management 2012', 0, CAST(0x072DB5495788F8320B AS DateTime2), CAST(0x072DB5495788F8320B AS DateTime2), N'admin', N'admin')
INSERT [dbo].[Cursuses] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy]) VALUES (3, N'MBA - Informatique 2012', 0, CAST(0x07C68A336188F8320B AS DateTime2), CAST(0x07C68A336188F8320B AS DateTime2), N'admin', N'admin')
INSERT [dbo].[Cursuses] ([Id], [Name], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy]) VALUES (4, N'MBA - Finances 2011', 0, CAST(0x07A2D3417888F8320B AS DateTime2), CAST(0x07A2D3417888F8320B AS DateTime2), N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Cursuses] OFF
/****** Object:  Table [dbo].[BaseTypes]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Volume] [int] NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
 CONSTRAINT [PK_BaseTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassStudyPeriod]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassStudyPeriod](
	[Classes_Id] [int] NOT NULL,
	[StudyPeriods_Id] [int] NOT NULL,
 CONSTRAINT [PK_ClassStudyPeriod] PRIMARY KEY NONCLUSTERED 
(
	[Classes_Id] ASC,
	[StudyPeriods_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_ClassStudyPeriod_StudyPeriod] ON [dbo].[ClassStudyPeriod] 
(
	[StudyPeriods_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudyPeriods]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudyPeriods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
	[CursusId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_StudyPeriods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_CursusStudyPeriod] ON [dbo].[StudyPeriods] 
(
	[CursusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[StudyPeriods] ON
INSERT [dbo].[StudyPeriods] ([Id], [Name], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [CursusId], [ClassId]) VALUES (1, N'Study period 1', CAST(0x07000000000061320B AS DateTime2), CAST(0x070000000000F8320B AS DateTime2), 0, CAST(0x07484FD0A288F8320B AS DateTime2), CAST(0x07484FD0A288F8320B AS DateTime2), N'admin', N'admin', 4, 0)
INSERT [dbo].[StudyPeriods] ([Id], [Name], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [CursusId], [ClassId]) VALUES (2, N'Study period 2', CAST(0x070000000000F9320B AS DateTime2), CAST(0x070000000000AA330B AS DateTime2), 0, CAST(0x07EAC5A0BE88F8320B AS DateTime2), CAST(0x07EAC5A0BE88F8320B AS DateTime2), N'admin', N'admin', 4, 0)
INSERT [dbo].[StudyPeriods] ([Id], [Name], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [CursusId], [ClassId]) VALUES (3, N'Study period 3', CAST(0x070000000000BB330B AS DateTime2), CAST(0x07000000000065340B AS DateTime2), 0, CAST(0x07244126D988F8320B AS DateTime2), CAST(0x07244126D988F8320B AS DateTime2), N'admin', N'admin', 4, 0)
INSERT [dbo].[StudyPeriods] ([Id], [Name], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [CursusId], [ClassId]) VALUES (4, N'Study period 1', CAST(0x07000000000054330B AS DateTime2), CAST(0x070000000000E2330B AS DateTime2), 0, CAST(0x07122412C98DF8320B AS DateTime2), CAST(0x07122412C98DF8320B AS DateTime2), N'admin', N'admin', 1, 0)
INSERT [dbo].[StudyPeriods] ([Id], [Name], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [CursusId], [ClassId]) VALUES (5, N'Semestre 1', CAST(0x07000000000010320B AS DateTime2), CAST(0x0700000000009C320B AS DateTime2), 0, CAST(0x078566A4F58DF8320B AS DateTime2), CAST(0x078566A4F58DF8320B AS DateTime2), N'admin', N'admin', 3, 0)
INSERT [dbo].[StudyPeriods] ([Id], [Name], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [CursusId], [ClassId]) VALUES (6, N'Semestre 2', CAST(0x0700000000009D320B AS DateTime2), CAST(0x070000000000FF320B AS DateTime2), 0, CAST(0x0777F16F0B8EF8320B AS DateTime2), CAST(0x0777F16F0B8EF8320B AS DateTime2), N'admin', N'admin', 3, 0)
INSERT [dbo].[StudyPeriods] ([Id], [Name], [StartDate], [EndDate], [Common_IsDeleted], [Common_Audit_CreatedAt], [Common_Audit_LastModifiedAt], [Common_Audit_CreatedBy], [Common_Audit_LastModifiedBy], [CursusId], [ClassId]) VALUES (7, N'Trimestre 3', CAST(0x070000000000A9320B AS DateTime2), CAST(0x070000000000FA320B AS DateTime2), 0, CAST(0x07F4DF3A298EF8320B AS DateTime2), CAST(0x07F4DF3A298EF8320B AS DateTime2), N'admin', N'admin', 2, 0)
SET IDENTITY_INSERT [dbo].[StudyPeriods] OFF
/****** Object:  Table [dbo].[Events_BaseCourse]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events_BaseCourse](
	[ClassId1] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[Discipline_Id] [int] NOT NULL,
 CONSTRAINT [PK_Events_BaseCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_BaseCourseDiscipline] ON [dbo].[Events_BaseCourse] 
(
	[Discipline_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_ClassBaseCourse] ON [dbo].[Events_BaseCourse] 
(
	[ClassId1] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_UserBaseCourse] ON [dbo].[Events_BaseCourse] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disciplines]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disciplines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Common_IsDeleted] [bit] NOT NULL,
	[Common_Audit_CreatedAt] [datetime2](7) NOT NULL,
	[Common_Audit_LastModifiedAt] [datetime2](7) NOT NULL,
	[Common_Audit_CreatedBy] [nvarchar](max) NOT NULL,
	[Common_Audit_LastModifiedBy] [nvarchar](max) NOT NULL,
	[Common_ConcurrencyToken] [timestamp] NOT NULL,
	[StudyPeriod_Id] [int] NOT NULL,
 CONSTRAINT [PK_Disciplines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_DisciplineStudyPeriod] ON [dbo].[Disciplines] 
(
	[StudyPeriod_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events_Evaluation]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events_Evaluation](
	[ClassId] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[EvaluationType_Id] [int] NOT NULL,
 CONSTRAINT [PK_Events_Evaluation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_EvaluationEvaluationType] ON [dbo].[Events_Evaluation] 
(
	[EvaluationType_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaseTypes_EvaluationType]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseTypes_EvaluationType](
	[DisciplineId] [int] NOT NULL,
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_BaseTypes_EvaluationType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_DisciplineEvaluationType] ON [dbo].[BaseTypes_EvaluationType] 
(
	[DisciplineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events_Course]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events_Course](
	[ClassId] [int] NOT NULL,
	[Id] [int] NOT NULL,
	[CourseType_Id] [int] NOT NULL,
 CONSTRAINT [PK_Events_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_CourseCourseType] ON [dbo].[Events_Course] 
(
	[CourseType_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaseTypes_CourseType]    Script Date: 06/22/2010 17:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseTypes_CourseType](
	[DisciplineId] [int] NOT NULL,
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_BaseTypes_CourseType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_FK_DisciplineCourseType] ON [dbo].[BaseTypes_CourseType] 
(
	[DisciplineId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_UserClass]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_UserClass] FOREIGN KEY([CurrentClass_Id])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_UserClass]
GO
/****** Object:  ForeignKey [FK_UserClassPast_Class]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[UserClassPast]  WITH CHECK ADD  CONSTRAINT [FK_UserClassPast_Class] FOREIGN KEY([PreviousClasses_Id])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[UserClassPast] CHECK CONSTRAINT [FK_UserClassPast_Class]
GO
/****** Object:  ForeignKey [FK_UserClassPast_User]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[UserClassPast]  WITH CHECK ADD  CONSTRAINT [FK_UserClassPast_User] FOREIGN KEY([PreviousUsers_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserClassPast] CHECK CONSTRAINT [FK_UserClassPast_User]
GO
/****** Object:  ForeignKey [FK_UserCampus1_Campus]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[UserCampus1]  WITH CHECK ADD  CONSTRAINT [FK_UserCampus1_Campus] FOREIGN KEY([StakeholderCampuses_Id])
REFERENCES [dbo].[Campuses] ([Id])
GO
ALTER TABLE [dbo].[UserCampus1] CHECK CONSTRAINT [FK_UserCampus1_Campus]
GO
/****** Object:  ForeignKey [FK_UserCampus1_User]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[UserCampus1]  WITH CHECK ADD  CONSTRAINT [FK_UserCampus1_User] FOREIGN KEY([Stakeholders_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserCampus1] CHECK CONSTRAINT [FK_UserCampus1_User]
GO
/****** Object:  ForeignKey [FK_UserCampus_Campus]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[UserCampus]  WITH CHECK ADD  CONSTRAINT [FK_UserCampus_Campus] FOREIGN KEY([ManagedCampuses_Id])
REFERENCES [dbo].[Campuses] ([Id])
GO
ALTER TABLE [dbo].[UserCampus] CHECK CONSTRAINT [FK_UserCampus_Campus]
GO
/****** Object:  ForeignKey [FK_UserCampus_User]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[UserCampus]  WITH CHECK ADD  CONSTRAINT [FK_UserCampus_User] FOREIGN KEY([Managers_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserCampus] CHECK CONSTRAINT [FK_UserCampus_User]
GO
/****** Object:  ForeignKey [FK_ClassCampus]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_ClassCampus] FOREIGN KEY([Campus_Id])
REFERENCES [dbo].[Campuses] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_ClassCampus]
GO
/****** Object:  ForeignKey [FK_EventVenue]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Venues]  WITH CHECK ADD  CONSTRAINT [FK_EventVenue] FOREIGN KEY([EventVenue_Venue_Id])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Venues] CHECK CONSTRAINT [FK_EventVenue]
GO
/****** Object:  ForeignKey [FK_VenueCampus]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Venues]  WITH CHECK ADD  CONSTRAINT [FK_VenueCampus] FOREIGN KEY([Campus_Id])
REFERENCES [dbo].[Campuses] ([Id])
GO
ALTER TABLE [dbo].[Venues] CHECK CONSTRAINT [FK_VenueCampus]
GO
/****** Object:  ForeignKey [FK_WorldWideEvent_inherits_Event]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events_WorldWideEvent]  WITH CHECK ADD  CONSTRAINT [FK_WorldWideEvent_inherits_Event] FOREIGN KEY([Id])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Events_WorldWideEvent] CHECK CONSTRAINT [FK_WorldWideEvent_inherits_Event]
GO
/****** Object:  ForeignKey [FK_CampusEvent]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_CampusEvent] FOREIGN KEY([Campus_Id])
REFERENCES [dbo].[Campuses] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_CampusEvent]
GO
/****** Object:  ForeignKey [FK_UserEvent]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_UserEvent] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_UserEvent]
GO
/****** Object:  ForeignKey [FK_UserAvailability]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Availabilities]  WITH CHECK ADD  CONSTRAINT [FK_UserAvailability] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Availabilities] CHECK CONSTRAINT [FK_UserAvailability]
GO
/****** Object:  ForeignKey [FK_CampusAddress]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Campuses]  WITH CHECK ADD  CONSTRAINT [FK_CampusAddress] FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[Campuses] CHECK CONSTRAINT [FK_CampusAddress]
GO
/****** Object:  ForeignKey [FK_VenueAddress]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_VenueAddress] FOREIGN KEY([VenueAddress_Address_Id])
REFERENCES [dbo].[Venues] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_VenueAddress]
GO
/****** Object:  ForeignKey [FK_UserRole_Role]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([Roles_Id])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
/****** Object:  ForeignKey [FK_UserRole_User]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([Users_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
/****** Object:  ForeignKey [FK_ClassStudyPeriod_Class]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[ClassStudyPeriod]  WITH CHECK ADD  CONSTRAINT [FK_ClassStudyPeriod_Class] FOREIGN KEY([Classes_Id])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[ClassStudyPeriod] CHECK CONSTRAINT [FK_ClassStudyPeriod_Class]
GO
/****** Object:  ForeignKey [FK_ClassStudyPeriod_StudyPeriod]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[ClassStudyPeriod]  WITH CHECK ADD  CONSTRAINT [FK_ClassStudyPeriod_StudyPeriod] FOREIGN KEY([StudyPeriods_Id])
REFERENCES [dbo].[StudyPeriods] ([Id])
GO
ALTER TABLE [dbo].[ClassStudyPeriod] CHECK CONSTRAINT [FK_ClassStudyPeriod_StudyPeriod]
GO
/****** Object:  ForeignKey [FK_CursusStudyPeriod]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[StudyPeriods]  WITH CHECK ADD  CONSTRAINT [FK_CursusStudyPeriod] FOREIGN KEY([CursusId])
REFERENCES [dbo].[Cursuses] ([Id])
GO
ALTER TABLE [dbo].[StudyPeriods] CHECK CONSTRAINT [FK_CursusStudyPeriod]
GO
/****** Object:  ForeignKey [FK_BaseCourse_inherits_Event]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events_BaseCourse]  WITH CHECK ADD  CONSTRAINT [FK_BaseCourse_inherits_Event] FOREIGN KEY([Id])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Events_BaseCourse] CHECK CONSTRAINT [FK_BaseCourse_inherits_Event]
GO
/****** Object:  ForeignKey [FK_BaseCourseDiscipline]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events_BaseCourse]  WITH CHECK ADD  CONSTRAINT [FK_BaseCourseDiscipline] FOREIGN KEY([Discipline_Id])
REFERENCES [dbo].[Disciplines] ([Id])
GO
ALTER TABLE [dbo].[Events_BaseCourse] CHECK CONSTRAINT [FK_BaseCourseDiscipline]
GO
/****** Object:  ForeignKey [FK_ClassBaseCourse]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events_BaseCourse]  WITH CHECK ADD  CONSTRAINT [FK_ClassBaseCourse] FOREIGN KEY([ClassId1])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Events_BaseCourse] CHECK CONSTRAINT [FK_ClassBaseCourse]
GO
/****** Object:  ForeignKey [FK_UserBaseCourse]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events_BaseCourse]  WITH CHECK ADD  CONSTRAINT [FK_UserBaseCourse] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Events_BaseCourse] CHECK CONSTRAINT [FK_UserBaseCourse]
GO
/****** Object:  ForeignKey [FK_DisciplineStudyPeriod]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Disciplines]  WITH CHECK ADD  CONSTRAINT [FK_DisciplineStudyPeriod] FOREIGN KEY([StudyPeriod_Id])
REFERENCES [dbo].[StudyPeriods] ([Id])
GO
ALTER TABLE [dbo].[Disciplines] CHECK CONSTRAINT [FK_DisciplineStudyPeriod]
GO
/****** Object:  ForeignKey [FK_Evaluation_inherits_BaseCourse]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events_Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_inherits_BaseCourse] FOREIGN KEY([Id])
REFERENCES [dbo].[Events_BaseCourse] ([Id])
GO
ALTER TABLE [dbo].[Events_Evaluation] CHECK CONSTRAINT [FK_Evaluation_inherits_BaseCourse]
GO
/****** Object:  ForeignKey [FK_EvaluationEvaluationType]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events_Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationEvaluationType] FOREIGN KEY([EvaluationType_Id])
REFERENCES [dbo].[BaseTypes_EvaluationType] ([Id])
GO
ALTER TABLE [dbo].[Events_Evaluation] CHECK CONSTRAINT [FK_EvaluationEvaluationType]
GO
/****** Object:  ForeignKey [FK_DisciplineEvaluationType]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[BaseTypes_EvaluationType]  WITH CHECK ADD  CONSTRAINT [FK_DisciplineEvaluationType] FOREIGN KEY([DisciplineId])
REFERENCES [dbo].[Disciplines] ([Id])
GO
ALTER TABLE [dbo].[BaseTypes_EvaluationType] CHECK CONSTRAINT [FK_DisciplineEvaluationType]
GO
/****** Object:  ForeignKey [FK_EvaluationType_inherits_BaseType]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[BaseTypes_EvaluationType]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationType_inherits_BaseType] FOREIGN KEY([Id])
REFERENCES [dbo].[BaseTypes] ([Id])
GO
ALTER TABLE [dbo].[BaseTypes_EvaluationType] CHECK CONSTRAINT [FK_EvaluationType_inherits_BaseType]
GO
/****** Object:  ForeignKey [FK_Course_inherits_BaseCourse]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events_Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_inherits_BaseCourse] FOREIGN KEY([Id])
REFERENCES [dbo].[Events_BaseCourse] ([Id])
GO
ALTER TABLE [dbo].[Events_Course] CHECK CONSTRAINT [FK_Course_inherits_BaseCourse]
GO
/****** Object:  ForeignKey [FK_CourseCourseType]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[Events_Course]  WITH CHECK ADD  CONSTRAINT [FK_CourseCourseType] FOREIGN KEY([CourseType_Id])
REFERENCES [dbo].[BaseTypes_CourseType] ([Id])
GO
ALTER TABLE [dbo].[Events_Course] CHECK CONSTRAINT [FK_CourseCourseType]
GO
/****** Object:  ForeignKey [FK_CourseType_inherits_BaseType]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[BaseTypes_CourseType]  WITH CHECK ADD  CONSTRAINT [FK_CourseType_inherits_BaseType] FOREIGN KEY([Id])
REFERENCES [dbo].[BaseTypes] ([Id])
GO
ALTER TABLE [dbo].[BaseTypes_CourseType] CHECK CONSTRAINT [FK_CourseType_inherits_BaseType]
GO
/****** Object:  ForeignKey [FK_DisciplineCourseType]    Script Date: 06/22/2010 17:08:21 ******/
ALTER TABLE [dbo].[BaseTypes_CourseType]  WITH CHECK ADD  CONSTRAINT [FK_DisciplineCourseType] FOREIGN KEY([DisciplineId])
REFERENCES [dbo].[Disciplines] ([Id])
GO
ALTER TABLE [dbo].[BaseTypes_CourseType] CHECK CONSTRAINT [FK_DisciplineCourseType]
GO
