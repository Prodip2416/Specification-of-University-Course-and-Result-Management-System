<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewClassScheduleAndRoomInformation.aspx.cs" Inherits="UCRMS.ViewClassScheduleAndRoomInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UCARMS</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" BackColor="#BDC3C7" GroupingText="ViewClassScheduleAndRoomInformation" Width="550px" runat="server">
                Department:
                <asp:DropDownList ID="ddlDepartment"
                    AutoPostBack="True" DataTextField="Name" DataValueField="Id"
                    Width="200px" runat="server" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server"
                    BackColor="White" BorderColor="#999999"
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False">

                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Code" HeaderText="Course Code" SortExpression="Code" />
                        <asp:BoundField DataField="Name" HeaderText="Course Name" SortExpression="Name" />
                        <asp:TemplateField HeaderText="Schedule Info">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# "R. No: " + Eval("RoomNo") + ", " + Eval("Day") + ", " + Eval("FromTime") + " - " + Eval("ToTime") + ";" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:BoundField DataField="UnAssign" HeaderText="UnAssign" SortExpression="UnAssign"/>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />

                </asp:GridView>
                <br/>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
