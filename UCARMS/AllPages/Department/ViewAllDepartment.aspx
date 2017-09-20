<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAllDepartment.aspx.cs" Inherits="UCRMS.ViewAllDepartment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" BackColor="#BDC3C7" GroupingText="All Department" Width="450px" runat="server">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                GridLines="Vertical" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="#DCDCDC"/>
                <Columns>
                    <asp:BoundField DataField="Code" HeaderText="Department Code" SortExpression="Code" />
                    <asp:BoundField DataField="Name" HeaderText="Department Name" SortExpression="Name" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black"/>
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White"/>
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center"/>
                <RowStyle BackColor="#EEEEEE" ForeColor="Black"/>
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White"/>
                <SortedAscendingCellStyle BackColor="#F1F1F1"/>
                <SortedAscendingHeaderStyle BackColor="#0000A9"/>
                <SortedDescendingCellStyle BackColor="#CAC9C9"/>
                <SortedDescendingHeaderStyle BackColor="#000065"/>

            </asp:GridView>
            
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UCARMSConnectionString %>" SelectCommand="SELECT [Code], [Name] FROM [Department]"></asp:SqlDataSource>
            
        </asp:Panel>
    </div>
    </form>
</body>
</html>
