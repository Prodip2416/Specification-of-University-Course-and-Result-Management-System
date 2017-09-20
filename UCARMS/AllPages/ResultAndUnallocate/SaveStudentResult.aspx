<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveStudentResult.aspx.cs" Inherits="UCRMS.SaveStudentResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" GroupingText="Save Student Result" Width="550px" BackColor="#D6DBDF" runat="server">
            <table>
                <tr>
                    <td>Student Reg. No.</td>
                    <td>
                        <asp:DropDownList ID="ddlStudentRegistration"
                                          AutoPostBack="True" DataValueField="Id" DataTextField="Id" Width="200px" runat="server" OnSelectedIndexChanged="ddlStudentRegistration_SelectedIndexChanged"></asp:DropDownList></td>
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
                        <asp:DropDownList ID="ddlCourse" AutoPostBack="True" Width="200px"
                                          DataTextField="Course" runat="server"></asp:DropDownList>
                        
                    </td>
                </tr>
                <tr>
                    <td>Grade Letter</td>
                    <td>
                        <asp:DropDownList ID="ddlGrade" Width="200px" runat="server">
                            <asp:ListItem>Select Grade</asp:ListItem>
                            <asp:ListItem>A+</asp:ListItem>
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>A-</asp:ListItem>
                            <asp:ListItem>B+</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>B-</asp:ListItem>
                            <asp:ListItem>C+</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>C-</asp:ListItem>
                            <asp:ListItem>D+</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>D-</asp:ListItem>
                            <asp:ListItem>F</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>

                    <td colspan="2">
                        <asp:Button ID="btnSave" Width="150px" style="float: right; margin-top: 20px" runat="server" Text="Save" OnClick="btnSave_Click"/></td>
                </tr>

            </table>
        </asp:Panel>
        <br/>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
