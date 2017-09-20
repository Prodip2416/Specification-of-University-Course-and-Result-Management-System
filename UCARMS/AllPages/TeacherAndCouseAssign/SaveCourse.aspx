<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveCourse.aspx.cs" Inherits="UCRMS.SaveCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" GroupingText="Save Course" BackColor="#BDC3C7" Width="550px" runat="server">
            <table>
                <tr>
                    <td>Code:</td>
                    <td>
                        <asp:TextBox ID="txtCode" Width="250px" runat="server" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server" Text="*" ForeColor="red" ControlToValidate="txtCode" ErrorMessage="Code is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txtName" Width="250px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Name is Required" ForeColor="red" Text="*" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Credit</td>
                    <td>
                        <asp:DropDownList ID="ddlCredit" Width="250px" runat="server">
                            <asp:ListItem>Select Credit</asp:ListItem>
                            <asp:ListItem>0.5</asp:ListItem>
                            <asp:ListItem>1.0</asp:ListItem>
                            <asp:ListItem>1.5</asp:ListItem>
                            <asp:ListItem>2.0</asp:ListItem>
                            <asp:ListItem>2.5</asp:ListItem>
                            <asp:ListItem>3.0</asp:ListItem>
                            <asp:ListItem>3.5</asp:ListItem>
                            <asp:ListItem>4.0</asp:ListItem>
                            <asp:ListItem>4.5</asp:ListItem>
                            <asp:ListItem>5.0</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" Text="*" ForeColor="red" ControlToValidate="ddlCredit" InitialValue="Select Credit"
                            ErrorMessage="Credit is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>
                        <asp:TextBox ID="txtDescription" Width="250px" runat="server"
                            Rows="4" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="red" ErrorMessage="Description is Required"
                            ControlToValidate="txtDescription" Text="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment"
                                          DataValueField="Id" DataTextField="Name" AutoPostBack="True"
                                          Width="250px" runat="server">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                                    Text="*" ForeColor="red" ControlToValidate="ddlDepartment"
                                                    InitialValue="-1" runat="server" ErrorMessage="Department is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Semester</td>
                    <td>
                        <asp:DropDownList ID="ddlSemester" Width="250px" runat="server">
                            <asp:ListItem>Select Semester</asp:ListItem>
                            <asp:ListItem>1st</asp:ListItem>
                            <asp:ListItem>2nd</asp:ListItem>
                            <asp:ListItem>3rd</asp:ListItem>
                            <asp:ListItem>4th</asp:ListItem>
                            <asp:ListItem>5th</asp:ListItem>
                            <asp:ListItem>6th</asp:ListItem>
                            <asp:ListItem>7th</asp:ListItem>
                            <asp:ListItem>8th</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                            runat="server" Text="*" ControlToValidate="ddlSemester"
                            ErrorMessage="-1" ForeColor="red" InitialValue="Select Semester"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSaveCouse" style="float: right;margin-top: 20px" Width="150px" runat="server" Text="Save Course" OnClick="btnSaveCouse_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="red" runat="server" />
    </form>
</body>
</html>
