<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="UCRMS.AllPages.AddStudentAndClassroom.StudentDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Student Details</h2>
            <table>
                <tr><td>Your Registration Id:</td>
                    <td>
                        <asp:Label ID="lblRegistrationId" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:Label ID="lblName" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td> <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>ContactNo:</td>
                    <td> <asp:Label ID="lblContactNo" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>DateTime:</td>
                    <td> <asp:Label ID="lblDate" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td> <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>Department:</td>
                    <td> <asp:Label ID="lblDepartment" runat="server"></asp:Label></td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
