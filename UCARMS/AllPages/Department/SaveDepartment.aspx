<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaveDepartment.aspx.cs" Inherits="UCRMS.SaveDepartment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1"  runat="server">
        <asp:Panel ID="Panel1" BackColor="#BDC3C7"  Width="450px"  GroupingText="Save Department" runat="server">
            <table>
                <tr>
                    <td>Code:</td>
                    <td>
                        <asp:TextBox ID="txtCode" Width="250px" runat="server" MaxLength="7"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                    runat="server" Text="*" ForeColor="red"
                                                    ControlToValidate="txtCode" ErrorMessage="Code is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:TextBox ID="txtName" Width="250px" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                                    runat="server" Text="*" ForeColor="red" 
                            ControlToValidate="txtName" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSaveDepartment"  style="float: right;margin-top: 20px" Width="150px" runat="server" Text="Save" OnClick="btnSaveDepartment_Click" /></td>
                </tr>
            </table>
        </asp:Panel>
        <br/><br/>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" ForeColor="red" runat="server" />
    </form>
</body>
</html>
