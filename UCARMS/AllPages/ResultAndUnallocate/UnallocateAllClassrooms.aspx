<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnallocateAllClassrooms.aspx.cs" Inherits="UCRMS.UnallocateAllClassrooms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" Height="200px" GroupingText="UnallocateAllClassRooms" Width="450px" BackColor="#D6DBDF" runat="server">
            <asp:Button ID="Button1" Height="50px"
                        style="text-align: center; margin-left: 100px; margin-top: 50px" runat="server"
                        Text="Unallocate Rooms" OnClick="Button1_Click"
                 OnClientClick="return confirm('Are you sure you want to Unallocate this record?')" />
        </asp:Panel>
        <br/>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
