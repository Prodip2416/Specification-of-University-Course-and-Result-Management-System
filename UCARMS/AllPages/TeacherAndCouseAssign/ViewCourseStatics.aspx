<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCourseStatics.aspx.cs" Inherits="UCRMS.ViewCourseStatics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1"  BackColor="#BDC3C7" GroupingText="View Course Statics"  Width="550px" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Department With AssignTeacher:"></asp:Label>
            <asp:DropDownList ID="ddlDepartment" DataValueField="Id"
                 DataTextField="Name" Width="150px" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged"></asp:DropDownList>
            <br/>
            <br/>
            <asp:Label ID="Label2" runat="server" Text="Course Information:"></asp:Label><br/>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="#DCDCDC"/>

                <Columns>
                    <asp:BoundField DataField="CourseCode" HeaderText="Course Code" SortExpression="CourseCode"/>
                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" SortExpression="CourseName"/>
                    <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester"/>
                    <asp:BoundField DataField="TeacherName" HeaderText="Assigned To" SortExpression="TeacherName"/>
                    <asp:BoundField DataField="Unassign" HeaderText="Unassign" SortExpression="Unassign"/>
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

            <br/>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="spGetTeacherNameByDepartment" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDepartment" Name="Id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br/>
        <br/>
    </form>
</body>
</html>
