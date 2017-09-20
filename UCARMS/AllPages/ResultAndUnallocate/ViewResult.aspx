<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewResult.aspx.cs" Inherits="UCRMS.ViewResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Panel ID="Panel1" GroupingText="View Result" Width="550px" BackColor="#D6DBDF" runat="server">
         <table>
             <tr>
                 <td>Student Reg. No.</td>
                 <td>
                     <asp:DropDownList ID="ddlStudentRegistration" DataTextField="Id" DataValueField="Id" AutoPostBack="True" Width="200px" runat="server" OnSelectedIndexChanged="ddlStudentRegistration_SelectedIndexChanged"></asp:DropDownList></td>
             </tr>
             <tr>
                 <td>Name</td>
                 <td>
                     <asp:TextBox ID="txtName" Width="200px" runat="server"></asp:TextBox></td>
             </tr>
             <tr>
                 <td>Email</td>
                 <td>
                     <asp:TextBox ID="txtEmail" Width="200px" runat="server"></asp:TextBox></td>
             </tr>
             <tr>
                 <td>Department</td>
                 <td>
                     <asp:TextBox ID="txtDeparrtment" Width="200px" runat="server"></asp:TextBox></td>
             </tr>
             <tr><td colspan="2">
                 <asp:Button ID="btnMakePDF" style="float: right;margin-top: 20px" runat="server" Text="Make PDF" OnClick="btnMakePDF_Click" /></td></tr>
         </table>
         <br/>
         <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="Vertical">
             <AlternatingRowStyle BackColor="#DCDCDC" />
             <Columns>
                 <asp:BoundField DataField="Course" HeaderText="Course Name" SortExpression="Course" />
                 <asp:BoundField DataField="CourseGrade" HeaderText="Grade" SortExpression="CourseGrade" />
             </Columns>
             <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
             <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
             <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
             <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
             <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="#0000A9" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#000065" />
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="spGetCourseGradeByRegNo" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:ControlParameter ControlID="ddlStudentRegistration" Name="Id" PropertyName="SelectedValue" Type="Int32"/>
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:GridView ID="GridView2" runat="server" BackColor="#DEBA84"
              BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False">
             <Columns>
                 <asp:BoundField DataField="RegNo" HeaderText="RegNo" SortExpression="RegNo" />
                 <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                 <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                 <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                 <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                 <asp:BoundField DataField="CourseGrade" HeaderText="Grade" SortExpression="CourseGrade" />
             </Columns>
             <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
             <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
             <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
             <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
             <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#FFF1D4" />
             <SortedAscendingHeaderStyle BackColor="#B95C30" />
             <SortedDescendingCellStyle BackColor="#F1E5CE" />
             <SortedDescendingHeaderStyle BackColor="#93451F" />
         </asp:GridView>
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="spGetStudentResultPDF" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlStudentRegistration" Name="Reg" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
