USE [master]
GO
/****** Object:  Database [UCARMS]    Script Date: 8/12/2017 5:19:05 PM ******/
CREATE DATABASE [UCARMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UCARMS', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UCARMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UCARMS_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UCARMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UCARMS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UCARMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UCARMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UCARMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UCARMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UCARMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UCARMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [UCARMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UCARMS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UCARMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UCARMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UCARMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UCARMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UCARMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UCARMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UCARMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UCARMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UCARMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UCARMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UCARMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UCARMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UCARMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UCARMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UCARMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UCARMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UCARMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UCARMS] SET  MULTI_USER 
GO
ALTER DATABASE [UCARMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UCARMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UCARMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UCARMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UCARMS]
GO
/****** Object:  StoredProcedure [dbo].[spCheckRoomAndTime]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spCheckRoomAndTime]
@Course int,
@RoomNo nvarchar(50),
@Day nvarchar(50),
@FromTime nvarchar(50),
@ToTime nvarchar(50)
As
Begin
select Course,RoomNo,[Day],FromTime,ToTime from AllocateClassRoom
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCoursesByDepartmentId]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetAllCoursesByDepartmentId] 
@Id int
As
Begin
select Course.Code,Course.Name,Course.Semester
from Course
where Course.Department=@Id
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAllocateClassRomm]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetAllocateClassRomm]
@Department nvarchar(50),
@Course nvarchar(50),
@RoomNo nvarchar(50),
@Day nvarchar(50),
@FromTime nvarchar(50),
@ToTime nvarchar(50)
As
Begin
insert into AllocateClassRoom values(@Department,@Course,@RoomNo,@Day,@FromTime,@ToTime)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllstudentById]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spGetAllstudentById]
As
Begin
select Id from RegisterStudent
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAssignTeacherByDepartmentId]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetAssignTeacherByDepartmentId] 
@Id int
As
Begin
SELECT AssignTeacher.CourseCode,AssignTeacher.CourseName,AssignTeacher.TeacherName
 FROM AssignTeacher
WHERE AssignTeacher.Department=@Id
End
GO
/****** Object:  StoredProcedure [dbo].[spGetAssignTeacherValue]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetAssignTeacherValue]
@Department int,
@TeacherName nvarchar(50), 
@CreditTaken int, 
@CreditRemaining float,
@CourseCode int,
@CourseName nvarchar(50),
@CourseCredit float
As
Begin
insert into AssignTeacher values(@Department,@TeacherName,@CreditTaken,@CreditRemaining,@CourseCode,@CourseName,@CourseCredit)
End
GO
/****** Object:  StoredProcedure [dbo].[spGetClassSchedulaByDepartment]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetClassSchedulaByDepartment]
@Id int
As
Begin
select Course.Code,Course.Name,AllocateClassRoom.RoomNo,AllocateClassRoom.[Day],AllocateClassRoom.FromTime,AllocateClassRoom.ToTime
from Course ,AllocateClassRoom 
where Course.Id=AllocateClassRoom.Course
AND Course.Department=@Id
End
GO
/****** Object:  StoredProcedure [dbo].[spGetCodeById]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetCodeById] 
@Id int
as
Begin
 Select Id, Code  from Course 
 where Department = @Id
End
GO
/****** Object:  StoredProcedure [dbo].[spGetCodeNameAndCredit]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetCodeNameAndCredit]
@Id int
as
begin
select Name , Credit from Course
where @Id=Id
end
GO
/****** Object:  StoredProcedure [dbo].[spGetCourseByDepartment]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetCourseByDepartment] 
@Idd int
As
Begin
Select Name from Course
Where Department=@Idd
End
GO
/****** Object:  StoredProcedure [dbo].[spGetCourseByEnrollStudent]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetCourseByEnrollStudent]
@Id int
As
Begin
select Course from EnrollCourse 
where RegNo=@Id
End
GO
/****** Object:  StoredProcedure [dbo].[spGetCourseGradeByRegNo]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetCourseGradeByRegNo]
@Id int
As
Begin
select Course,CourseGrade
from SaveStudentResult
where RegNo=@Id
End
GO
/****** Object:  StoredProcedure [dbo].[spGetCourseNameByRegistrationStudent]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetCourseNameByRegistrationStudent]
@Id int
As
Begin
select Name from Course,RegisterStudent
where Course.Department=RegisterStudent.Department
And RegisterStudent.Id=@Id
End
GO
/****** Object:  StoredProcedure [dbo].[spGetCourseValue]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetCourseValue]
@Code int,
@Name nvarchar(50),
@Credit nvarchar(50),
@Description nvarchar(50),
@Department nvarchar(50),
@Semester nvarchar(50)
as
begin
insert into Course values(@Code,@Name,@Credit,@Description,@Department,@Semester)
End
GO
/****** Object:  StoredProcedure [dbo].[spGetNameAndCodeFromDepartment]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetNameAndCodeFromDepartment]
@Code nvarchar(7),
@Name nvarchar(50)
as
Begin
insert into Department values (@Code,@Name)
End
GO
/****** Object:  StoredProcedure [dbo].[spGetNameById]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetNameById] 
@Id int
as
Begin
 Select Id, Name  from Teacher 
 where Department = @Id
End
GO
/****** Object:  StoredProcedure [dbo].[spGetNameDepartmentById]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spGetNameDepartmentById]
as
begin
select * from Department
end
GO
/****** Object:  StoredProcedure [dbo].[spGetNameEmailDepartmentByStudentId]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetNameEmailDepartmentByStudentId] 
@Id int
As
Begin
Select RegisterStudent.StudentName,RegisterStudent.Email,Department.Name
 from RegisterStudent,Department
Where RegisterStudent.Department=Department.Id
AND RegisterStudent.Id=@Id
End

GO
/****** Object:  StoredProcedure [dbo].[spGetRemainingCredit]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetRemainingCredit]
@Name nvarchar(10)
As
Begin
select Department,TeacherName,CreditTaken,SUM(CourseCredit)as TotalCredit,CreditTaken -SUM(CourseCredit)as RemainingCredit
from AssignTeacher
where TeacherName=@Name
Group By Department,TeacherName,CreditTaken
Order By Department,TeacherName
End
GO
/****** Object:  StoredProcedure [dbo].[spGetSaveStudentResult]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetSaveStudentResult]
@RegNo int,
@Name nvarchar(50),
@Email nvarchar(50),
@Department nvarchar(50),
@Course nvarchar(50),
@CourseGrade nvarchar(50)
As
Begin
insert into SaveStudentResult values(@RegNo,@Name,@Email,@Department,@Course,@CourseGrade)
End
GO
/****** Object:  StoredProcedure [dbo].[spGetStudentResultPDF]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetStudentResultPDF]
@Reg int
As
Begin
select RegNo,Name,Email,Department,Course,CourseGrade from SaveStudentResult
Where RegNo=@Reg
End
GO
/****** Object:  StoredProcedure [dbo].[spGetTeacherNameByDepartment]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetTeacherNameByDepartment]
@Id int
As
Begin
select AssignTeacher.CourseCode,AssignTeacher.CourseName,AssignTeacher.TeacherName,Course.Semester
from AssignTeacher,Course
where AssignTeacher.CourseCode=Course.Code
AND AssignTeacher.Department=@Id
End
GO
/****** Object:  StoredProcedure [dbo].[spGetTeacherValue]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetTeacherValue]
@Name nvarchar(50),
@Address nvarchar(1000),
@Email nvarchar(50),
@ContactNo nvarchar(20),
@Designation nvarchar(20),
@Department nvarchar(10),
@Credit int
As
begin
insert into Teacher Values (@Name,@Address,@Email,@ContactNo,@Designation,@Department,@Credit)
End
GO
/****** Object:  StoredProcedure [dbo].[spGetvalueEnrollCourse]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetvalueEnrollCourse]
@RegNo int,
@Name nvarchar(50),
@Email nvarchar(50),
@Department nvarchar(50),
@Course nvarchar(50),
@Date nvarchar(50)
As
Begin
insert into EnrollCourse values (@RegNo,@Name,@Email,@Department,@Course,@Date)
End
GO
/****** Object:  StoredProcedure [dbo].[spGetValueRegisterStudent]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[spGetValueRegisterStudent]
@Name nvarchar(50),
@Email nvarchar(50),
@ContactNo nvarchar(50),
@DateTime datetime,
@Address nvarchar(500),
@Department int,
@Id int out
As
Begin
Insert into RegisterStudent values(@Name,@Email,@ContactNo,@DateTime,@Address,@Department)
select @Id=SCOPE_IDENTITY()
End
GO
/****** Object:  Table [dbo].[AllocateClassRoom]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllocateClassRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
	[Course] [int] NOT NULL,
	[RoomNo] [nvarchar](50) NOT NULL,
	[Day] [nvarchar](50) NOT NULL,
	[FromTime] [nvarchar](50) NOT NULL,
	[ToTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AllocateClassRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignTeacher]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
	[TeacherName] [nvarchar](50) NOT NULL,
	[CreditTaken] [int] NOT NULL,
	[CreditRemaining] [float] NOT NULL,
	[CourseCode] [int] NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseCredit] [float] NOT NULL,
 CONSTRAINT [PK_AssignTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Credit] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Department] [int] NOT NULL,
	[Semester] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](7) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Course] [nvarchar](50) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegisterStudent]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterStudent](
	[Id] [int] IDENTITY(100,1) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Department] [int] NOT NULL,
 CONSTRAINT [PK_RegisterStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomNo]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomNo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RoomNop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaveStudentResult]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaveStudentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegNo] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Course] [nvarchar](50) NOT NULL,
	[CourseGrade] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SaveStudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 8/12/2017 5:19:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[Department] [int] NOT NULL,
	[Credit] [int] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AllocateClassRoom] ON 

INSERT [dbo].[AllocateClassRoom] ([Id], [Department], [Course], [RoomNo], [Day], [FromTime], [ToTime]) VALUES (1, 1, 1, N'101AB', N'Sat', N'12 PM', N'2 PM')
INSERT [dbo].[AllocateClassRoom] ([Id], [Department], [Course], [RoomNo], [Day], [FromTime], [ToTime]) VALUES (2, 2, 4, N'102AB', N'Sun', N'12 PM', N'2 PM')
INSERT [dbo].[AllocateClassRoom] ([Id], [Department], [Course], [RoomNo], [Day], [FromTime], [ToTime]) VALUES (3, 3, 7, N'103AB', N'Mon', N'12 PM', N'2 PM')
SET IDENTITY_INSERT [dbo].[AllocateClassRoom] OFF
SET IDENTITY_INSERT [dbo].[AssignTeacher] ON 

INSERT [dbo].[AssignTeacher] ([Id], [Department], [TeacherName], [CreditTaken], [CreditRemaining], [CourseCode], [CourseName], [CourseCredit]) VALUES (1, 1, N'Akash', 9, 0, 100, N'EEE-01', 2)
INSERT [dbo].[AssignTeacher] ([Id], [Department], [TeacherName], [CreditTaken], [CreditRemaining], [CourseCode], [CourseName], [CourseCredit]) VALUES (2, 1, N'joy', 11, 0, 101, N'EEE-02', 2.5)
INSERT [dbo].[AssignTeacher] ([Id], [Department], [TeacherName], [CreditTaken], [CreditRemaining], [CourseCode], [CourseName], [CourseCredit]) VALUES (3, 2, N'Pavel', 9, 0, 200, N'CSE-01', 2)
INSERT [dbo].[AssignTeacher] ([Id], [Department], [TeacherName], [CreditTaken], [CreditRemaining], [CourseCode], [CourseName], [CourseCredit]) VALUES (4, 2, N'Tamjid', 11, 0, 201, N'CSE-02', 2.5)
INSERT [dbo].[AssignTeacher] ([Id], [Department], [TeacherName], [CreditTaken], [CreditRemaining], [CourseCode], [CourseName], [CourseCredit]) VALUES (5, 3, N'Tuhin', 9, 0, 300, N'SWE-01', 2)
INSERT [dbo].[AssignTeacher] ([Id], [Department], [TeacherName], [CreditTaken], [CreditRemaining], [CourseCode], [CourseName], [CourseCredit]) VALUES (6, 3, N'lubna', 11, 0, 301, N'SWE-02', 1.5)
INSERT [dbo].[AssignTeacher] ([Id], [Department], [TeacherName], [CreditTaken], [CreditRemaining], [CourseCode], [CourseName], [CourseCredit]) VALUES (9, 1, N'joy', 11, 8.5, 102, N'EEE-03', 3)
SET IDENTITY_INSERT [dbo].[AssignTeacher] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (1, 100, N'EEE-01', N'2.0', N'fdgdtrt', 1, N'1st')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (2, 101, N'EEE-02', N'2.5', N'fdgdtrt', 1, N'2nd')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (3, 102, N'EEE-03', N'3.0', N'fdgdtrtdd', 1, N'3rd')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (4, 200, N'CSE-01', N'2.0', N'fdgdtrtdd', 2, N'1st')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (5, 201, N'CSE-02', N'2.5', N'fdgdtrtdd', 2, N'2nd')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (6, 202, N'CSE-03', N'3.0', N'fdgdtrtdd', 2, N'3rd')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (7, 300, N'SWE-01', N'2.0', N'fdgdtrtdd', 3, N'1st')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (8, 301, N'SWE-02', N'1.5', N'fdgdtrtdd', 3, N'2nd')
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (9, 302, N'SWE-03', N'3.0', N'fdgdtrtdd', 3, N'3rd')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1, N'111', N'EEE')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'222', N'CSE')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (3, N'333', N'SWE')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourse] ON 

INSERT [dbo].[EnrollCourse] ([Id], [RegNo], [Name], [Email], [Department], [Course], [Date]) VALUES (1, 1, N'Din', N'din@gmail.com', N'EEE', N'EEE-01', N'8/1/2017')
INSERT [dbo].[EnrollCourse] ([Id], [RegNo], [Name], [Email], [Department], [Course], [Date]) VALUES (2, 3, N'Dip', N'Dip@gmail.com', N'SWE', N'SWE-01', N'8/2/2017')
INSERT [dbo].[EnrollCourse] ([Id], [RegNo], [Name], [Email], [Department], [Course], [Date]) VALUES (3, 2, N'Rafi', N'Rafi@gmail.com', N'CSE', N'CSE-01', N'8/2/2017')
INSERT [dbo].[EnrollCourse] ([Id], [RegNo], [Name], [Email], [Department], [Course], [Date]) VALUES (4, 4, N'Niaz', N'niaz@gmail.com', N'EEE', N'EEE-01', N'8/10/2017')
SET IDENTITY_INSERT [dbo].[EnrollCourse] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([Id], [Email], [Password]) VALUES (1, N'prodip2416@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[RegisterStudent] ON 

INSERT [dbo].[RegisterStudent] ([Id], [StudentName], [Email], [ContactNo], [Date], [Address], [Department]) VALUES (1, N'Din', N'din@gmail.com', N'4324', CAST(0x0000A7CD00000000 AS DateTime), N'3r535rfgdgv', 1)
INSERT [dbo].[RegisterStudent] ([Id], [StudentName], [Email], [ContactNo], [Date], [Address], [Department]) VALUES (2, N'Rafi', N'Rafi@gmail.com', N'43242', CAST(0x0000A7CD00000000 AS DateTime), N'3r535rfgdgv233', 2)
INSERT [dbo].[RegisterStudent] ([Id], [StudentName], [Email], [ContactNo], [Date], [Address], [Department]) VALUES (3, N'Dip', N'Dip@gmail.com', N'43242', CAST(0x0000A7CD00000000 AS DateTime), N'3r535rfgdgv233', 3)
INSERT [dbo].[RegisterStudent] ([Id], [StudentName], [Email], [ContactNo], [Date], [Address], [Department]) VALUES (4, N'Niaz', N'niaz@gmail.com', N'242453536', CAST(0x0000A7CD00000000 AS DateTime), N'242355tsdf', 1)
SET IDENTITY_INSERT [dbo].[RegisterStudent] OFF
SET IDENTITY_INSERT [dbo].[RoomNo] ON 

INSERT [dbo].[RoomNo] ([Id], [RoomNo]) VALUES (1, N'101AB')
INSERT [dbo].[RoomNo] ([Id], [RoomNo]) VALUES (2, N'102AB')
INSERT [dbo].[RoomNo] ([Id], [RoomNo]) VALUES (3, N'103AB')
INSERT [dbo].[RoomNo] ([Id], [RoomNo]) VALUES (4, N'104AB')
INSERT [dbo].[RoomNo] ([Id], [RoomNo]) VALUES (5, N'105AB')
INSERT [dbo].[RoomNo] ([Id], [RoomNo]) VALUES (6, N'201AB')
INSERT [dbo].[RoomNo] ([Id], [RoomNo]) VALUES (7, N'202AB')
INSERT [dbo].[RoomNo] ([Id], [RoomNo]) VALUES (8, N'203AB')
INSERT [dbo].[RoomNo] ([Id], [RoomNo]) VALUES (9, N'204AB')
INSERT [dbo].[RoomNo] ([Id], [RoomNo]) VALUES (10, N'205AB')
SET IDENTITY_INSERT [dbo].[RoomNo] OFF
SET IDENTITY_INSERT [dbo].[SaveStudentResult] ON 

INSERT [dbo].[SaveStudentResult] ([Id], [RegNo], [Name], [Email], [Department], [Course], [CourseGrade]) VALUES (1, 1, N'Din', N'din@gmail.com', N'EEE', N'EEE-01', N'A')
INSERT [dbo].[SaveStudentResult] ([Id], [RegNo], [Name], [Email], [Department], [Course], [CourseGrade]) VALUES (2, 3, N'Dip', N'Dip@gmail.com', N'SWE', N'SWE-01', N'A')
INSERT [dbo].[SaveStudentResult] ([Id], [RegNo], [Name], [Email], [Department], [Course], [CourseGrade]) VALUES (3, 2, N'Rafi', N'Rafi@gmail.com', N'CSE', N'CSE-01', N'A')
INSERT [dbo].[SaveStudentResult] ([Id], [RegNo], [Name], [Email], [Department], [Course], [CourseGrade]) VALUES (5, 4, N'Niaz', N'niaz@gmail.com', N'EEE', N'EEE-01', N'A+')
SET IDENTITY_INSERT [dbo].[SaveStudentResult] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [Department], [Credit]) VALUES (1, N'Akash', N'fgghtfhft', N'akash@gmail.com', N'6543', N'Dept. Head', 1, 9)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [Department], [Credit]) VALUES (2, N'Pavel', N'fgghtfhft', N'pavel@gmail.com', N'654334', N'Dept. Head', 2, 9)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [Department], [Credit]) VALUES (3, N'Tuhin', N'fgghtfhft', N'Tuhin@gmail.com', N'654334w', N'Dept. Head', 3, 9)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [Department], [Credit]) VALUES (4, N'joy', N'fgghtfhftdv', N'joy@gmail.com', N'654334343', N'Professor', 1, 11)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [Department], [Credit]) VALUES (5, N'Tamjid', N'fgghtfhftdv', N'Tamjid@gmail.com', N'654334343', N'Professor', 2, 11)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [Designation], [Department], [Credit]) VALUES (6, N'lubna', N'fgghtfhftdv', N'lubna@gmail.com', N'654334343', N'Professor', 3, 11)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
/****** Object:  Index [IX_AllocateClassRoom]    Script Date: 8/12/2017 5:19:06 PM ******/
ALTER TABLE [dbo].[AllocateClassRoom] ADD  CONSTRAINT [IX_AllocateClassRoom] UNIQUE NONCLUSTERED 
(
	[Course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AssignTeacher]    Script Date: 8/12/2017 5:19:06 PM ******/
ALTER TABLE [dbo].[AssignTeacher] ADD  CONSTRAINT [IX_AssignTeacher] UNIQUE NONCLUSTERED 
(
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Course]    Script Date: 8/12/2017 5:19:06 PM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_Course] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course_1]    Script Date: 8/12/2017 5:19:06 PM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_Course_1] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department]    Script Date: 8/12/2017 5:19:06 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_Department] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_1]    Script Date: 8/12/2017 5:19:06 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_Department_1] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RegisterStudent]    Script Date: 8/12/2017 5:19:06 PM ******/
ALTER TABLE [dbo].[RegisterStudent] ADD  CONSTRAINT [IX_RegisterStudent] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Teacher]    Script Date: 8/12/2017 5:19:06 PM ******/
ALTER TABLE [dbo].[Teacher] ADD  CONSTRAINT [IX_Teacher] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_Course] FOREIGN KEY([Course])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_AllocateClassRoom_Course]
GO
ALTER TABLE [dbo].[AllocateClassRoom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassRoom_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassRoom] CHECK CONSTRAINT [FK_AllocateClassRoom_Department]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[RegisterStudent]  WITH CHECK ADD  CONSTRAINT [FK_RegisterStudent_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[RegisterStudent] CHECK CONSTRAINT [FK_RegisterStudent_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
USE [master]
GO
ALTER DATABASE [UCARMS] SET  READ_WRITE 
GO
