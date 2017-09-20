<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseAssignToTeacher.aspx.cs" Inherits="UCRMS.CourseAssignToTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" BackColor="#BDC3C7" Width="550px" GroupingText="Course Assign To Teacher" runat="server">
            <table>
                <tr>
                    <td>Department</td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" DataTextField="Name"
                            DataValueField="Id" AutoPostBack="True" Width="250px"
                            runat="server"
                            OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="red" Text="*" ControlToValidate="ddlDepartment"
                            InitialValue="-1" runat="server" ErrorMessage="Department is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Teacher</td>
                    <td>
                        <asp:DropDownList ID="ddlTeacher"
                            DataTextField="Name" DataValueField="Id"
                            AutoPostBack="True" Width="250px" runat="server"
                            OnSelectedIndexChanged="ddlTeacher_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlTeacher" ForeColor="Red" Text="*" ErrorMessage="Teacher is Requerid"
                            InitialValue="-1" runat="server"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Credit To Be Taken</td>
                    <%--<td>
                        <asp:TextBox ID="txtCreditToBeTaken" Width="250px" runat="server"></asp:TextBox></td>--%>
                    <td>
                        <asp:DropDownList ID="ddlCredit" Width="250px" runat="server" AutoPostBack="True">
                            <asp:ListItem>Select Credit</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Remaining Credit</td>
                    <td>
                        <asp:TextBox ID="txtRemainingCredit" Width="250px" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Course Code</td>
                    <td>
                        <asp:DropDownList ID="ddlCourseCode"
                            DataTextField="Code" DataValueField="Id"
                            AutoPostBack="True" Width="250px" runat="server"
                            OnSelectedIndexChanged="ddlCourseCode_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlCourseCode" ForeColor="Red" Text="*"
                            ErrorMessage="Course code is Requerid" InitialValue="-1" runat="server"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtName" Width="250px" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Credit</td>
                    <td>
                        <asp:TextBox ID="txtCredit" Width="250px" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSave" Style="float: right; margin-top: 20px" Width="150px" runat="server" Text="Assign" OnClick="btnSave_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="red" runat="server" />
    </form>
</body>
</html>
