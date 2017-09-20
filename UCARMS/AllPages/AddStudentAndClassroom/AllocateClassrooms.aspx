<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllocateClassrooms.aspx.cs" Inherits="UCRMS.AllocateClassrooms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" Width="550px" BackColor="#D6DBDF" GroupingText="Allocate Classrooms" runat="server">
                <table>
                    <tr>
                        <td>Department</td>
                        <td>
                            <asp:DropDownList ID="ddlDepartment" AutoPostBack="True" DataTextField="Name"
                                DataValueField="Id" Width="200px" runat="server"
                                OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Text="*" ForeColor="red"
                                InitialValue="-1" ControlToValidate="ddlDepartment" runat="server"
                                ErrorMessage="Department is Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Course</td>
                        <td>
                            <asp:DropDownList ID="ddlCourse" DataValueField="Id" DataTextField="Code"
                                AutoPostBack="True" Width="200px" runat="server"
                                OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Text="*" ForeColor="red"
                                InitialValue="-1" ControlToValidate="ddlCourse" runat="server"
                                ErrorMessage="Course is Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Room No.</td>
                        <td>
                            <asp:DropDownList ID="ddlRoomNo" AutoPostBack="True" Width="200px" runat="server" OnSelectedIndexChanged="ddlRoomNo_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Text="*" ForeColor="red"
                                InitialValue="-1" ControlToValidate="ddlRoomNo" runat="server"
                                ErrorMessage="Room No is Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Day</td>
                        <td>
                            <asp:DropDownList ID="ddlDay" Width="200px" runat="server">
                                <asp:ListItem>Select Day</asp:ListItem>
                                <asp:ListItem>Sat</asp:ListItem>
                                <asp:ListItem>Sun</asp:ListItem>
                                <asp:ListItem>Mon</asp:ListItem>
                                <asp:ListItem>Tue</asp:ListItem>
                                <asp:ListItem>Wed</asp:ListItem>
                                <asp:ListItem>Thu</asp:ListItem>
                                <asp:ListItem>Fri</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Text="*" ForeColor="red"
                                InitialValue="Select Day" ControlToValidate="ddlDay" runat="server"
                                ErrorMessage="Day is Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>From</td>
                        <td>
                            <asp:TextBox ID="txtFrom" Width="100px" runat="server"></asp:TextBox>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem Value="1" Text="AM"></asp:ListItem>
                                <asp:ListItem Value="2" Text="PM"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="red"
                                Text="*" ControlToValidate="txtFrom" ErrorMessage="From Time is Required"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>To</td>
                        <td>
                            <asp:TextBox ID="txtTo" Width="100px" runat="server"></asp:TextBox>
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                <asp:ListItem Value="1" Text="AM"></asp:ListItem>
                                <asp:ListItem Value="2" Text="PM"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="red"
                                Text="*" ControlToValidate="txtTo" ErrorMessage="To Time is Required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnAllocate" Style="float: right; margin-top: 20px" Width="150px" runat="server" Text="Allocate" OnClick="btnAllocate_Click" /></td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" ForeColor="red" runat="server" />
        </div>
    </form>
</body>
</html>
