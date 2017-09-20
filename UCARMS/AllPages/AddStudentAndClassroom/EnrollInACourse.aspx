<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnrollInACourse.aspx.cs" Inherits="UCRMS.EnrollInACourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" GroupingText="Enroll In A Course" Width="550px" BackColor="#D6DBDF" runat="server">
            <table>
                <tr>
                    <td>Student Reg. No.</td>
                    <td>
                        <asp:DropDownList ID="ddlStudentRegistration"
                                          DataValueField="Id" DataTextField="Id"
                                          AutoPostBack="True" Width="200px" runat="server"
                                          OnSelectedIndexChanged="ddlStudentRegistration_SelectedIndexChanged">

                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtName" Width="200px" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtEmail" Width="200px" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <asp:TextBox ID="txtDeparrtment" Width="200px" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Course</td>
                    <td>
                        <asp:DropDownList ID="ddlCourse" DataValueField="" DataTextField="Name"
                                          AutoPostBack="True" Width="200px" runat="server" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Date</td>
                    <td>
                        <asp:TextBox ID="txtDate" Width="200px" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/DatePicker.gif" OnClick="ImageButton1_Click"/>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" Width="220px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px"/>
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF"/>
                            <OtherMonthDayStyle ForeColor="#999999"/>
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99"/>
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666"/>
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px"/>
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White"/>
                            <WeekendDayStyle BackColor="#CCCCFF"/>
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <asp:Button ID="Button1" Width="150px" style="float: right; margin-top: 20px" runat="server" Text="Enroll" OnClick="Button1_Click"/></td>
                </tr>

            </table>
        </asp:Panel>
        <br/>
        <br/>
        <asp:Label ID="lblMessage" runat="server" ></asp:Label>
    </div>
    </form>
</body>
</html>
