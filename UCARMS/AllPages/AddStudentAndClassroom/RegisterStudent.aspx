<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterStudent.aspx.cs" Inherits="UCRMS.RegisterStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" Width="550px" BackColor="#BDC3C7" GroupingText="Register Student" runat="server">
            <table>
                <tr>
                    <td>Name</td>
                    <td>
                        <asp:TextBox ID="txtName" Width="250px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*" ForeColor="red" ControlToValidate="txtName" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtEmail" Width="250px" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="*" ForeColor="red"
                                                        ControlToValidate="txtEmail" runat="server"
                                                        ErrorMessage="Email i not currect formate"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is Required" ForeColor="red" Text="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Contact No.</td>
                    <td>
                        <asp:TextBox ID="txtContactNo" Width="250px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="*" ControlToValidate="txtContactNo" ForeColor="red" ErrorMessage="Contact No is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr> 
                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox ID="txtAddress" Width="250px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*" ForeColor="red" ControlToValidate="txtAddress" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" DataValueField="Id" DataTextField="Name"
                                          AutoPostBack="True" Width="250px" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                                    runat="server" Text="*" InitialValue="-1"
                                                    ControlToValidate="ddlDepartment" ForeColor="red" ErrorMessage="Department is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                  <tr>
                    <td>Date</td>
                    <td>
                        <asp:TextBox ID="txtDate" Width="250px" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/DatePicker.gif" OnClick="ImageButton1_Click"/>
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="True" Width="220px">
                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px"/>
                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC"/>
                            <OtherMonthDayStyle ForeColor="#CC9966"/>
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True"/>
                            <SelectorStyle BackColor="#FFCC66"/>
                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC"/>
                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White"/>
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSave" style="float: right;margin-top: 20px" runat="server" Width="150px" Text="Register" OnClick="btnSave_Click"/></td>
                </tr>

            </table>
            <br/>
            <br/>
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" ForeColor="red" runat="server" />
        </asp:Panel>
    </form>
</body>
</html>
