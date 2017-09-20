<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="UnassignAllCourses.aspx.cs" Inherits="UCRMS.UnassignAllCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" Height="200px" GroupingText="UnallocateAllCourses" Width="450px" BackColor="#D6DBDF" runat="server">
            <asp:Button ID="btnCourses" Height="50px" style="text-align: center; margin-left: 100px; margin-top: 50px"
                        runat="server" Text="Unassign Courses" OnClick="Button1_Click" 
                OnClientClick="return confirm('Are you sure you want to Unallocate this record?')"/>
        </asp:Panel>
        <br/>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
      </div>
    </form>
</body>
</html>
