<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="UCRMS.WebForm2" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>UCARMS</title>

    <!-- Bootstrap Core CSS -->
    <link href="CSS/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="CSS/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="CSS/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="CSS/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="CSS/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
    <form runat="server">
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" style="color: saddlebrown; font-family: sans-serif; font-weight: bold" href="#">UCARMS</a>
                </div>

                <ul class="nav navbar-top-links navbar-right" style="margin-top: 10px; color: saddlebrown">
                    <li class="dropdown">
                        <asp:Button ID="Button1" runat="server" Text="Logout" OnClick="Button1_OnClick" />
                    </li>
                </ul>

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="">
                                </div>
                            </li>
                            <li>
                                <a href="#">Dashboard</a>
                            </li>
                            <li>
                                <a href="#">Department   <span class="caret"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="AllPages/Department/SaveDepartment.aspx" target="_blank">Save Department</a>
                                    </li>
                                    <li>
                                        <a href="AllPages/Department/ViewAllDepartment.aspx" target="_blank">View All department</a>
                                    </li>
                                </ul>

                            </li>
                            <li>
                                <a href="#">Course  <span class="caret"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="AllPages/TeacherAndCouseAssign/SaveCourse.aspx" target="_blank">Save Course</a>
                                    </li>
                                    <li>
                                        <a href="AllPages/TeacherAndCouseAssign/CourseAssignToTeacher.aspx" target="_blank">Course Assign To Teacher</a>
                                     
                                    </li>
                                    <li>
                                        <a href="AllPages/TeacherAndCouseAssign/ViewCourseStatics.aspx" target="_blank">View Course Statics</a>
                                       
                                    </li>
                                    <li>
                                        <a href="AllPages/AddStudentAndClassroom/EnrollInACourse.aspx" target="_blank">Enroll In a Course</a>
                                      
                                    </li>
                                    <li><a href="AllPages/ResultAndUnallocate/UnassignAllCourses.aspx" target="_blank">Unassign All Courses</a></li>
                                </ul>

                            </li>
                            <li>
                                <a href="#">Teacher   <span class="caret"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="AllPages/TeacherAndCouseAssign/SaveTeacher.aspx" target="_blank">Save Teacher</a>                      
                                    </li>
                                  
                                </ul>
                            </li>
                            <li>
                                <a href="#">Student <span class="caret"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="AllPages/AddStudentAndClassroom/RegisterStudent.aspx" target="_blank">Register Student</a>                       
                                    </li> 
                                </ul>
                            </li>
                            <li>
                                <a href="#">ClassRoom <span class="caret"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="AllPages/AddStudentAndClassroom/AllocateClassrooms.aspx" target="_blank">Allocate Classrooms</a>
                                    </li>
                                    <li>
                                        <a href="AllPages/AddStudentAndClassroom/ViewClassScheduleAndRoomInformation.aspx" target="_blank">View Class Schedule and Room Information </a>

                                    </li>
                                    <li>
                                        <a href="AllPages/ResultAndUnallocate/UnallocateAllClassrooms.aspx" target="_blank">Unallocate All Classrooms</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Result <span class="caret"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="AllPages/ResultAndUnallocate/SaveStudentResult.aspx" target="_blank">Save Student Result</a>
                                    </li>
                                    <li>
                                        <a href="AllPages/ResultAndUnallocate/ViewResult.aspx" target="_blank">View Result</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </div>
            </nav>
            <div id="page-wrapper">
                <div class="alert alert-success" role="alert">

                    <h2><b><em>Specification of University Course and Result Management System</em></b>
                    </h2>
                    <br>
                </div>
                <h3><b>This web application is only for using one semester only of a university.<br>
                    It will make user happy in a semester :)</b></h3>
                <br />
                <div style="padding-left: 250px;padding-right: 250px">
                    <h4>
                        <marquee direction="right" style="color: saddlebrown">This web application have many several features. :)</marquee>
                    </h4>
                </div>
                <br />
                <h4><b>Let's see :</b></h4>
                <ul>
                    <li style="color: slategray">Save Department</li>
                    <li style="color: slategray">View All Departments</li>
                    <li style="color: slategray">Save Course</li>
                    <li style="color: slategray">Save Teacher</li>
                    <li style="color: slategray">Course Assign to Teacher</li>
                    <li style="color: slategray">View Course Statics</li>
                    <li style="color: slategray">Register Student</li>
                    <li style="color: slategray">Allocate Classrooms</li>
                    <li style="color: slategray">View Class Schedule and Room Allocation Information</li>
                    <li style="color: slategray">Enroll In a Course</li>
                    <li style="color: slategray">Save Student Result</li>
                    <li style="color: slategray">View Result</li>
                    <li style="color: slategray">Unassign All Courses</li>
                    <li style="color: slategray">Unallocate All Classrooms</li>
                </ul>
            </div>


            <!-- /#wrapper -->

            <!-- jQuery -->
            <script src="Script/jquery.min.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="Script/bootstrap.min.js"></script>

            <!-- Metis Menu Plugin JavaScript -->
            <script src="Script/metisMenu.min.js"></script>

            <!-- Morris Charts JavaScript -->
            <script src="Script/raphael.min.js"></script>
            <script src="Script/morris.min.js"></script>
            <script src="Script/morris-data.js"></script>

            <!-- Custom Theme JavaScript -->
            <script src="Script/sb-admin-2.js"></script>
    </div></form>
</body>

</html>
