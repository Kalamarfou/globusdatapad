
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 06/03/2010 15:46:12
-- Generated from EDMX file: C:\Users\V\Desktop\M1GroupProject\DAL\GDP.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GlobusDataPad];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CursusStudyPeriod]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudyPeriods] DROP CONSTRAINT [FK_CursusStudyPeriod];
GO
IF OBJECT_ID(N'[dbo].[FK_CampusAddress]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Campuses] DROP CONSTRAINT [FK_CampusAddress];
GO
IF OBJECT_ID(N'[dbo].[FK_VenueAddress]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Addresses] DROP CONSTRAINT [FK_VenueAddress];
GO
IF OBJECT_ID(N'[dbo].[FK_EventVenue]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Venues] DROP CONSTRAINT [FK_EventVenue];
GO
IF OBJECT_ID(N'[dbo].[FK_ClassStudyPeriod]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StudyPeriods] DROP CONSTRAINT [FK_ClassStudyPeriod];
GO
IF OBJECT_ID(N'[dbo].[FK_BaseCourseDiscipline]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events_BaseCourse] DROP CONSTRAINT [FK_BaseCourseDiscipline];
GO
IF OBJECT_ID(N'[dbo].[FK_EvaluationEvaluationType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events_Evaluation] DROP CONSTRAINT [FK_EvaluationEvaluationType];
GO
IF OBJECT_ID(N'[dbo].[FK_CourseCourseType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events_Course] DROP CONSTRAINT [FK_CourseCourseType];
GO
IF OBJECT_ID(N'[dbo].[FK_ClassBaseCourse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events_BaseCourse] DROP CONSTRAINT [FK_ClassBaseCourse];
GO
IF OBJECT_ID(N'[dbo].[FK_DisciplineStudyPeriod]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Disciplines] DROP CONSTRAINT [FK_DisciplineStudyPeriod];
GO
IF OBJECT_ID(N'[dbo].[FK_DisciplineCourseType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BaseTypes_CourseType] DROP CONSTRAINT [FK_DisciplineCourseType];
GO
IF OBJECT_ID(N'[dbo].[FK_DisciplineEvaluationType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BaseTypes_EvaluationType] DROP CONSTRAINT [FK_DisciplineEvaluationType];
GO
IF OBJECT_ID(N'[dbo].[FK_UserRole_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserRole_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRole] DROP CONSTRAINT [FK_UserRole_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_VenueCampus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Venues] DROP CONSTRAINT [FK_VenueCampus];
GO
IF OBJECT_ID(N'[dbo].[FK_CampusEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_CampusEvent];
GO
IF OBJECT_ID(N'[dbo].[FK_ClassCampus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Classes] DROP CONSTRAINT [FK_ClassCampus];
GO
IF OBJECT_ID(N'[dbo].[FK_UserClass]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_UserClass];
GO
IF OBJECT_ID(N'[dbo].[FK_UserClassPast_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserClassPast] DROP CONSTRAINT [FK_UserClassPast_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserClassPast_Class]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserClassPast] DROP CONSTRAINT [FK_UserClassPast_Class];
GO
IF OBJECT_ID(N'[dbo].[FK_UserAvailability]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Availabilities] DROP CONSTRAINT [FK_UserAvailability];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCampus_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserCampus] DROP CONSTRAINT [FK_UserCampus_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCampus_Campus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserCampus] DROP CONSTRAINT [FK_UserCampus_Campus];
GO
IF OBJECT_ID(N'[dbo].[FK_UserEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_UserEvent];
GO
IF OBJECT_ID(N'[dbo].[FK_UserBaseCourse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events_BaseCourse] DROP CONSTRAINT [FK_UserBaseCourse];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCampus1_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserCampus1] DROP CONSTRAINT [FK_UserCampus1_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCampus1_Campus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserCampus1] DROP CONSTRAINT [FK_UserCampus1_Campus];
GO
IF OBJECT_ID(N'[dbo].[FK_BaseCourse_inherits_Event]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events_BaseCourse] DROP CONSTRAINT [FK_BaseCourse_inherits_Event];
GO
IF OBJECT_ID(N'[dbo].[FK_Evaluation_inherits_BaseCourse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events_Evaluation] DROP CONSTRAINT [FK_Evaluation_inherits_BaseCourse];
GO
IF OBJECT_ID(N'[dbo].[FK_EvaluationType_inherits_BaseType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BaseTypes_EvaluationType] DROP CONSTRAINT [FK_EvaluationType_inherits_BaseType];
GO
IF OBJECT_ID(N'[dbo].[FK_Course_inherits_BaseCourse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events_Course] DROP CONSTRAINT [FK_Course_inherits_BaseCourse];
GO
IF OBJECT_ID(N'[dbo].[FK_CourseType_inherits_BaseType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BaseTypes_CourseType] DROP CONSTRAINT [FK_CourseType_inherits_BaseType];
GO
IF OBJECT_ID(N'[dbo].[FK_WorldWideEvent_inherits_Event]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events_WorldWideEvent] DROP CONSTRAINT [FK_WorldWideEvent_inherits_Event];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cursuses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cursuses];
GO
IF OBJECT_ID(N'[dbo].[StudyPeriods]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudyPeriods];
GO
IF OBJECT_ID(N'[dbo].[Campuses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Campuses];
GO
IF OBJECT_ID(N'[dbo].[Addresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Addresses];
GO
IF OBJECT_ID(N'[dbo].[Classes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Classes];
GO
IF OBJECT_ID(N'[dbo].[Venues]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Venues];
GO
IF OBJECT_ID(N'[dbo].[Events]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Events];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Availabilities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Availabilities];
GO
IF OBJECT_ID(N'[dbo].[Disciplines]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Disciplines];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[BaseTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BaseTypes];
GO
IF OBJECT_ID(N'[dbo].[Events_BaseCourse]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Events_BaseCourse];
GO
IF OBJECT_ID(N'[dbo].[Events_Evaluation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Events_Evaluation];
GO
IF OBJECT_ID(N'[dbo].[BaseTypes_EvaluationType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BaseTypes_EvaluationType];
GO
IF OBJECT_ID(N'[dbo].[Events_Course]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Events_Course];
GO
IF OBJECT_ID(N'[dbo].[BaseTypes_CourseType]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BaseTypes_CourseType];
GO
IF OBJECT_ID(N'[dbo].[Events_WorldWideEvent]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Events_WorldWideEvent];
GO
IF OBJECT_ID(N'[dbo].[UserRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRole];
GO
IF OBJECT_ID(N'[dbo].[UserClassPast]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserClassPast];
GO
IF OBJECT_ID(N'[dbo].[UserCampus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserCampus];
GO
IF OBJECT_ID(N'[dbo].[UserCampus1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserCampus1];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cursuses'
CREATE TABLE [dbo].[Cursuses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'StudyPeriods'
CREATE TABLE [dbo].[StudyPeriods] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [StartDate] datetime2  NOT NULL,
    [EndDate] datetime2  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL,
    [CursusId] int  NOT NULL,
    [ClassId] int  NOT NULL
);
GO

-- Creating table 'Campuses'
CREATE TABLE [dbo].[Campuses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL,
    [Address_Id] int  NOT NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Street] nvarchar(max)  NOT NULL,
    [PostalCode] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL,
    [VenueAddress_Address_Id] int  NULL
);
GO

-- Creating table 'Classes'
CREATE TABLE [dbo].[Classes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL,
    [Campus_Id] int  NOT NULL
);
GO

-- Creating table 'Venues'
CREATE TABLE [dbo].[Venues] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL,
    [CampusId] int  NOT NULL,
    [EventVenue_Venue_Id] int  NOT NULL,
    [Campus_Id] int  NULL
);
GO

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [StartDate] datetime2  NOT NULL,
    [EndDate] datetime2  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL,
    [IsMandatory] bit  NOT NULL,
    [Campus_Id] int  NULL,
    [User_Id] int  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [IsApproved] bit  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [PasswordQuestion] nvarchar(max)  NOT NULL,
    [PasswordAnswer] nvarchar(max)  NOT NULL,
    [LastActivityDate] datetime2  NOT NULL,
    [LastLoginDate] datetime2  NOT NULL,
    [LastPasswordChangedDate] datetime2  NOT NULL,
    [IsOnline] bit  NOT NULL,
    [IsLockedOut] bit  NOT NULL,
    [LastLockedOutDate] datetime2  NOT NULL,
    [FailedPasswordAttemptCount] int  NOT NULL,
    [FailedPasswordAttemptWindowStart] datetime2  NOT NULL,
    [FailedPasswordAnswerAttemptCount] int  NOT NULL,
    [FailedPasswordAnswerAttemptWindowStart] datetime2  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [CurrentClass_Id] int  NULL
);
GO

-- Creating table 'Availabilities'
CREATE TABLE [dbo].[Availabilities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartDate] datetime2  NOT NULL,
    [EndDate] datetime2  NOT NULL,
    [PersonId] int  NOT NULL,
    [UserId] int  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Disciplines'
CREATE TABLE [dbo].[Disciplines] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL,
    [StudyPeriod_Id] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ShortName] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BaseTypes'
CREATE TABLE [dbo].[BaseTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Volume] int  NOT NULL,
    [Common_ConcurrencyToken] binary(8)  NULL,
    [Common_IsDeleted] bit  NOT NULL,
    [Common_Audit_CreatedAt] datetime2  NOT NULL,
    [Common_Audit_LastModifiedAt] datetime2  NOT NULL,
    [Common_Audit_CreatedBy] nvarchar(max)  NOT NULL,
    [Common_Audit_LastModifiedBy] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Events_BaseCourse'
CREATE TABLE [dbo].[Events_BaseCourse] (
    [ClassId1] int  NOT NULL,
    [UserId] int  NOT NULL,
    [Id] int  NOT NULL,
    [Discipline_Id] int  NOT NULL
);
GO

-- Creating table 'Events_Evaluation'
CREATE TABLE [dbo].[Events_Evaluation] (
    [ClassId] int  NOT NULL,
    [Id] int  NOT NULL,
    [EvaluationType_Id] int  NOT NULL
);
GO

-- Creating table 'BaseTypes_EvaluationType'
CREATE TABLE [dbo].[BaseTypes_EvaluationType] (
    [DisciplineId] int  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Events_Course'
CREATE TABLE [dbo].[Events_Course] (
    [ClassId] int  NOT NULL,
    [Id] int  NOT NULL,
    [CourseType_Id] int  NOT NULL
);
GO

-- Creating table 'BaseTypes_CourseType'
CREATE TABLE [dbo].[BaseTypes_CourseType] (
    [DisciplineId] int  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Events_WorldWideEvent'
CREATE TABLE [dbo].[Events_WorldWideEvent] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'UserRole'
CREATE TABLE [dbo].[UserRole] (
    [Users_Id] int  NOT NULL,
    [Roles_Id] int  NOT NULL
);
GO

-- Creating table 'UserClassPast'
CREATE TABLE [dbo].[UserClassPast] (
    [PreviousUsers_Id] int  NOT NULL,
    [PreviousClasses_Id] int  NOT NULL
);
GO

-- Creating table 'UserCampus'
CREATE TABLE [dbo].[UserCampus] (
    [Managers_Id] int  NOT NULL,
    [ManagedCampuses_Id] int  NOT NULL
);
GO

-- Creating table 'UserCampus1'
CREATE TABLE [dbo].[UserCampus1] (
    [Stakeholders_Id] int  NOT NULL,
    [StakeholderCampuses_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Cursuses'
ALTER TABLE [dbo].[Cursuses]
ADD CONSTRAINT [PK_Cursuses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StudyPeriods'
ALTER TABLE [dbo].[StudyPeriods]
ADD CONSTRAINT [PK_StudyPeriods]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Campuses'
ALTER TABLE [dbo].[Campuses]
ADD CONSTRAINT [PK_Campuses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Classes'
ALTER TABLE [dbo].[Classes]
ADD CONSTRAINT [PK_Classes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Venues'
ALTER TABLE [dbo].[Venues]
ADD CONSTRAINT [PK_Venues]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Availabilities'
ALTER TABLE [dbo].[Availabilities]
ADD CONSTRAINT [PK_Availabilities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Disciplines'
ALTER TABLE [dbo].[Disciplines]
ADD CONSTRAINT [PK_Disciplines]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BaseTypes'
ALTER TABLE [dbo].[BaseTypes]
ADD CONSTRAINT [PK_BaseTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Events_BaseCourse'
ALTER TABLE [dbo].[Events_BaseCourse]
ADD CONSTRAINT [PK_Events_BaseCourse]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Events_Evaluation'
ALTER TABLE [dbo].[Events_Evaluation]
ADD CONSTRAINT [PK_Events_Evaluation]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BaseTypes_EvaluationType'
ALTER TABLE [dbo].[BaseTypes_EvaluationType]
ADD CONSTRAINT [PK_BaseTypes_EvaluationType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Events_Course'
ALTER TABLE [dbo].[Events_Course]
ADD CONSTRAINT [PK_Events_Course]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BaseTypes_CourseType'
ALTER TABLE [dbo].[BaseTypes_CourseType]
ADD CONSTRAINT [PK_BaseTypes_CourseType]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Events_WorldWideEvent'
ALTER TABLE [dbo].[Events_WorldWideEvent]
ADD CONSTRAINT [PK_Events_WorldWideEvent]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Users_Id], [Roles_Id] in table 'UserRole'
ALTER TABLE [dbo].[UserRole]
ADD CONSTRAINT [PK_UserRole]
    PRIMARY KEY NONCLUSTERED ([Users_Id], [Roles_Id] ASC);
GO

-- Creating primary key on [PreviousUsers_Id], [PreviousClasses_Id] in table 'UserClassPast'
ALTER TABLE [dbo].[UserClassPast]
ADD CONSTRAINT [PK_UserClassPast]
    PRIMARY KEY NONCLUSTERED ([PreviousUsers_Id], [PreviousClasses_Id] ASC);
GO

-- Creating primary key on [Managers_Id], [ManagedCampuses_Id] in table 'UserCampus'
ALTER TABLE [dbo].[UserCampus]
ADD CONSTRAINT [PK_UserCampus]
    PRIMARY KEY NONCLUSTERED ([Managers_Id], [ManagedCampuses_Id] ASC);
GO

-- Creating primary key on [Stakeholders_Id], [StakeholderCampuses_Id] in table 'UserCampus1'
ALTER TABLE [dbo].[UserCampus1]
ADD CONSTRAINT [PK_UserCampus1]
    PRIMARY KEY NONCLUSTERED ([Stakeholders_Id], [StakeholderCampuses_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CursusId] in table 'StudyPeriods'
ALTER TABLE [dbo].[StudyPeriods]
ADD CONSTRAINT [FK_CursusStudyPeriod]
    FOREIGN KEY ([CursusId])
    REFERENCES [dbo].[Cursuses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CursusStudyPeriod'
CREATE INDEX [IX_FK_CursusStudyPeriod]
ON [dbo].[StudyPeriods]
    ([CursusId]);
GO

-- Creating foreign key on [Address_Id] in table 'Campuses'
ALTER TABLE [dbo].[Campuses]
ADD CONSTRAINT [FK_CampusAddress]
    FOREIGN KEY ([Address_Id])
    REFERENCES [dbo].[Addresses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CampusAddress'
CREATE INDEX [IX_FK_CampusAddress]
ON [dbo].[Campuses]
    ([Address_Id]);
GO

-- Creating foreign key on [VenueAddress_Address_Id] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [FK_VenueAddress]
    FOREIGN KEY ([VenueAddress_Address_Id])
    REFERENCES [dbo].[Venues]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VenueAddress'
CREATE INDEX [IX_FK_VenueAddress]
ON [dbo].[Addresses]
    ([VenueAddress_Address_Id]);
GO

-- Creating foreign key on [EventVenue_Venue_Id] in table 'Venues'
ALTER TABLE [dbo].[Venues]
ADD CONSTRAINT [FK_EventVenue]
    FOREIGN KEY ([EventVenue_Venue_Id])
    REFERENCES [dbo].[Events]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventVenue'
CREATE INDEX [IX_FK_EventVenue]
ON [dbo].[Venues]
    ([EventVenue_Venue_Id]);
GO

-- Creating foreign key on [ClassId] in table 'StudyPeriods'
ALTER TABLE [dbo].[StudyPeriods]
ADD CONSTRAINT [FK_ClassStudyPeriod]
    FOREIGN KEY ([ClassId])
    REFERENCES [dbo].[Classes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClassStudyPeriod'
CREATE INDEX [IX_FK_ClassStudyPeriod]
ON [dbo].[StudyPeriods]
    ([ClassId]);
GO

-- Creating foreign key on [Discipline_Id] in table 'Events_BaseCourse'
ALTER TABLE [dbo].[Events_BaseCourse]
ADD CONSTRAINT [FK_BaseCourseDiscipline]
    FOREIGN KEY ([Discipline_Id])
    REFERENCES [dbo].[Disciplines]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BaseCourseDiscipline'
CREATE INDEX [IX_FK_BaseCourseDiscipline]
ON [dbo].[Events_BaseCourse]
    ([Discipline_Id]);
GO

-- Creating foreign key on [EvaluationType_Id] in table 'Events_Evaluation'
ALTER TABLE [dbo].[Events_Evaluation]
ADD CONSTRAINT [FK_EvaluationEvaluationType]
    FOREIGN KEY ([EvaluationType_Id])
    REFERENCES [dbo].[BaseTypes_EvaluationType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EvaluationEvaluationType'
CREATE INDEX [IX_FK_EvaluationEvaluationType]
ON [dbo].[Events_Evaluation]
    ([EvaluationType_Id]);
GO

-- Creating foreign key on [CourseType_Id] in table 'Events_Course'
ALTER TABLE [dbo].[Events_Course]
ADD CONSTRAINT [FK_CourseCourseType]
    FOREIGN KEY ([CourseType_Id])
    REFERENCES [dbo].[BaseTypes_CourseType]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseCourseType'
CREATE INDEX [IX_FK_CourseCourseType]
ON [dbo].[Events_Course]
    ([CourseType_Id]);
GO

-- Creating foreign key on [ClassId1] in table 'Events_BaseCourse'
ALTER TABLE [dbo].[Events_BaseCourse]
ADD CONSTRAINT [FK_ClassBaseCourse]
    FOREIGN KEY ([ClassId1])
    REFERENCES [dbo].[Classes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClassBaseCourse'
CREATE INDEX [IX_FK_ClassBaseCourse]
ON [dbo].[Events_BaseCourse]
    ([ClassId1]);
GO

-- Creating foreign key on [StudyPeriod_Id] in table 'Disciplines'
ALTER TABLE [dbo].[Disciplines]
ADD CONSTRAINT [FK_DisciplineStudyPeriod]
    FOREIGN KEY ([StudyPeriod_Id])
    REFERENCES [dbo].[StudyPeriods]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DisciplineStudyPeriod'
CREATE INDEX [IX_FK_DisciplineStudyPeriod]
ON [dbo].[Disciplines]
    ([StudyPeriod_Id]);
GO

-- Creating foreign key on [DisciplineId] in table 'BaseTypes_CourseType'
ALTER TABLE [dbo].[BaseTypes_CourseType]
ADD CONSTRAINT [FK_DisciplineCourseType]
    FOREIGN KEY ([DisciplineId])
    REFERENCES [dbo].[Disciplines]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DisciplineCourseType'
CREATE INDEX [IX_FK_DisciplineCourseType]
ON [dbo].[BaseTypes_CourseType]
    ([DisciplineId]);
GO

-- Creating foreign key on [DisciplineId] in table 'BaseTypes_EvaluationType'
ALTER TABLE [dbo].[BaseTypes_EvaluationType]
ADD CONSTRAINT [FK_DisciplineEvaluationType]
    FOREIGN KEY ([DisciplineId])
    REFERENCES [dbo].[Disciplines]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DisciplineEvaluationType'
CREATE INDEX [IX_FK_DisciplineEvaluationType]
ON [dbo].[BaseTypes_EvaluationType]
    ([DisciplineId]);
GO

-- Creating foreign key on [Users_Id] in table 'UserRole'
ALTER TABLE [dbo].[UserRole]
ADD CONSTRAINT [FK_UserRole_User]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Roles_Id] in table 'UserRole'
ALTER TABLE [dbo].[UserRole]
ADD CONSTRAINT [FK_UserRole_Role]
    FOREIGN KEY ([Roles_Id])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRole_Role'
CREATE INDEX [IX_FK_UserRole_Role]
ON [dbo].[UserRole]
    ([Roles_Id]);
GO

-- Creating foreign key on [Campus_Id] in table 'Venues'
ALTER TABLE [dbo].[Venues]
ADD CONSTRAINT [FK_VenueCampus]
    FOREIGN KEY ([Campus_Id])
    REFERENCES [dbo].[Campuses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_VenueCampus'
CREATE INDEX [IX_FK_VenueCampus]
ON [dbo].[Venues]
    ([Campus_Id]);
GO

-- Creating foreign key on [Campus_Id] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_CampusEvent]
    FOREIGN KEY ([Campus_Id])
    REFERENCES [dbo].[Campuses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CampusEvent'
CREATE INDEX [IX_FK_CampusEvent]
ON [dbo].[Events]
    ([Campus_Id]);
GO

-- Creating foreign key on [Campus_Id] in table 'Classes'
ALTER TABLE [dbo].[Classes]
ADD CONSTRAINT [FK_ClassCampus]
    FOREIGN KEY ([Campus_Id])
    REFERENCES [dbo].[Campuses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClassCampus'
CREATE INDEX [IX_FK_ClassCampus]
ON [dbo].[Classes]
    ([Campus_Id]);
GO

-- Creating foreign key on [CurrentClass_Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserClass]
    FOREIGN KEY ([CurrentClass_Id])
    REFERENCES [dbo].[Classes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserClass'
CREATE INDEX [IX_FK_UserClass]
ON [dbo].[Users]
    ([CurrentClass_Id]);
GO

-- Creating foreign key on [PreviousUsers_Id] in table 'UserClassPast'
ALTER TABLE [dbo].[UserClassPast]
ADD CONSTRAINT [FK_UserClassPast_User]
    FOREIGN KEY ([PreviousUsers_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [PreviousClasses_Id] in table 'UserClassPast'
ALTER TABLE [dbo].[UserClassPast]
ADD CONSTRAINT [FK_UserClassPast_Class]
    FOREIGN KEY ([PreviousClasses_Id])
    REFERENCES [dbo].[Classes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserClassPast_Class'
CREATE INDEX [IX_FK_UserClassPast_Class]
ON [dbo].[UserClassPast]
    ([PreviousClasses_Id]);
GO

-- Creating foreign key on [UserId] in table 'Availabilities'
ALTER TABLE [dbo].[Availabilities]
ADD CONSTRAINT [FK_UserAvailability]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserAvailability'
CREATE INDEX [IX_FK_UserAvailability]
ON [dbo].[Availabilities]
    ([UserId]);
GO

-- Creating foreign key on [Managers_Id] in table 'UserCampus'
ALTER TABLE [dbo].[UserCampus]
ADD CONSTRAINT [FK_UserCampus_User]
    FOREIGN KEY ([Managers_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ManagedCampuses_Id] in table 'UserCampus'
ALTER TABLE [dbo].[UserCampus]
ADD CONSTRAINT [FK_UserCampus_Campus]
    FOREIGN KEY ([ManagedCampuses_Id])
    REFERENCES [dbo].[Campuses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCampus_Campus'
CREATE INDEX [IX_FK_UserCampus_Campus]
ON [dbo].[UserCampus]
    ([ManagedCampuses_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_UserEvent]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserEvent'
CREATE INDEX [IX_FK_UserEvent]
ON [dbo].[Events]
    ([User_Id]);
GO

-- Creating foreign key on [UserId] in table 'Events_BaseCourse'
ALTER TABLE [dbo].[Events_BaseCourse]
ADD CONSTRAINT [FK_UserBaseCourse]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserBaseCourse'
CREATE INDEX [IX_FK_UserBaseCourse]
ON [dbo].[Events_BaseCourse]
    ([UserId]);
GO

-- Creating foreign key on [Stakeholders_Id] in table 'UserCampus1'
ALTER TABLE [dbo].[UserCampus1]
ADD CONSTRAINT [FK_UserCampus1_User]
    FOREIGN KEY ([Stakeholders_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [StakeholderCampuses_Id] in table 'UserCampus1'
ALTER TABLE [dbo].[UserCampus1]
ADD CONSTRAINT [FK_UserCampus1_Campus]
    FOREIGN KEY ([StakeholderCampuses_Id])
    REFERENCES [dbo].[Campuses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCampus1_Campus'
CREATE INDEX [IX_FK_UserCampus1_Campus]
ON [dbo].[UserCampus1]
    ([StakeholderCampuses_Id]);
GO

-- Creating foreign key on [Id] in table 'Events_BaseCourse'
ALTER TABLE [dbo].[Events_BaseCourse]
ADD CONSTRAINT [FK_BaseCourse_inherits_Event]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Events]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Events_Evaluation'
ALTER TABLE [dbo].[Events_Evaluation]
ADD CONSTRAINT [FK_Evaluation_inherits_BaseCourse]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Events_BaseCourse]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'BaseTypes_EvaluationType'
ALTER TABLE [dbo].[BaseTypes_EvaluationType]
ADD CONSTRAINT [FK_EvaluationType_inherits_BaseType]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[BaseTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Events_Course'
ALTER TABLE [dbo].[Events_Course]
ADD CONSTRAINT [FK_Course_inherits_BaseCourse]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Events_BaseCourse]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'BaseTypes_CourseType'
ALTER TABLE [dbo].[BaseTypes_CourseType]
ADD CONSTRAINT [FK_CourseType_inherits_BaseType]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[BaseTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Events_WorldWideEvent'
ALTER TABLE [dbo].[Events_WorldWideEvent]
ADD CONSTRAINT [FK_WorldWideEvent_inherits_Event]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Events]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------