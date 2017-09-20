<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveTeacher.aspx.cs" Inherits="UCRMS.SaveTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" GroupingText="Save Teacher" BackColor="#D6DBDF" Width="500px" runat="server">
            <table>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtName" Width="250px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtName" ForeColor="red" Text="*" runat="server" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox ID="txtAddress" Width="250px" runat="server"
                            Rows="4" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server" ControlToValidate="txtAddress" ForeColor="red" Text="*" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtEmail" Width="250px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                             runat="server" Text="*" ForeColor="red" ControlToValidate="txtEmail" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ErrorMessage="Invalid Email"
                            ForeColor="red" Text="*"
                            ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Contact No.</td>
                    <td>
                        <asp:TextBox ID="txtContactNo" Width="250px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            ControlToValidate="txtContactNo" ForeColor="red" Text="*" runat="server" ErrorMessage="Contact is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Designation</td>
                    <td>
                        <asp:DropDownList ID="ddlDesignation" Width="250px" runat="server">
                            <asp:ListItem>Select Designation</asp:ListItem>
                            <asp:ListItem>Dept. Head</asp:ListItem>
                            <asp:ListItem>Professor</asp:ListItem>
                            <asp:ListItem>asst. Professor</asp:ListItem>
                            <asp:ListItem>Seinor Lecturer</asp:ListItem>
                            <asp:ListItem>Lecturer</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            ForeColor="red" Text="*" ControlToValidate="ddlDesignation" InitialValue="Select Designation"
                            runat="server" ErrorMessage="Designation is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" AutoPostBack="True"
                                          DataValueField="Id" DataTextField="Name" Width="250px" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Text="*" ControlToValidate="ddlDepartment" ForeColor="red"
                            InitialValue="-1" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Credit To Be Taken</td>
                    <td>
                        <asp:DropDownList ID="ddlCredit" Width="250px" runat="server">
                            <asp:ListItem>Select Credit</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            runat="server"
                            InitialValue="Select Credit" ControlToValidate="ddlCredit" ForeColor="red" Text="*" ErrorMessage="Credit is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSave" style="float: right;margin-top: 20px" Width="150px" runat="server" Text="Save Teacher" OnClick="btnSave_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="red" runat="server" />
        <br />

        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </form>
</body>
</html>
