<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage.aspx.cs" Inherits="manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" type="text/css" href="StyleSheet.css"/>
</head>
<body>
    <form id="form1" runat="server">

    <div id="manage_main">
       <div id="manage_showleft">
           <asp:Image ID="Image1" runat="server" ImageUrl="~/images/manage.png" />
            <br/>
            <br/>
           <asp:Button ID="Button1" runat="server" Text="书籍类别管理" Width="152px" 
                onclick="Button1_Click1" />
           <br/>
            <br/>
           <asp:Button ID="Button2" runat="server" Text="书籍信息添加"  Width="152px" 
                onclick="Button2_Click"/>
            <br />
            <br />
           <asp:Button ID="Button3" runat="server" Text="订单管理"  Width="152px" 
                onclick="Button3_Click"/>

            <br />
            <br />
           <asp:Button ID="Button4" runat="server" Text="用户管理"   Width="152px" 
                onclick="Button4_Click" />
            <br />
            <br />
           <asp:Button ID="Button5" runat="server" Text="评论管理"   Width="152px" 
                onclick="Button5_Click"/>
                  <br/>
            <br/>
           <asp:Button ID="Button8" runat="server" Text="返回" Width="152px" 
                onclick="Button8_Click" />
       </div>
       <div id="manage_showright">
           <asp:MultiView ID="MultiView1" runat="server">
               <asp:View ID="View1" runat="server">
                   <asp:DropDownList ID="DropDownList1" runat="server">
                       <asp:ListItem>文学</asp:ListItem>
                       <asp:ListItem>传记</asp:ListItem>
                       <asp:ListItem>科普</asp:ListItem>
                       <asp:ListItem>自然科学</asp:ListItem>
                       <asp:ListItem>计算机</asp:ListItem>
                       <asp:ListItem>经济</asp:ListItem>
                       <asp:ListItem>管理</asp:ListItem>
                   </asp:DropDownList>
                   <asp:Button ID="Button6" runat="server" Text="选择" onclick="Button6_Click" />
                   <br />
                   <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                       AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                       BorderWidth="1px" CellPadding="2" DataKeyNames="bookid" 
                       DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" 
                       Width="769px" onselectedindexchanged="GridView1_SelectedIndexChanged">
                       <AlternatingRowStyle BackColor="PaleGoldenrod" />
                       <Columns>
                           <asp:BoundField DataField="bookid" HeaderText="bookid" InsertVisible="False" 
                               ReadOnly="True" SortExpression="bookid" />
                           <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                           <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                           <asp:BoundField DataField="conut" HeaderText="conut" SortExpression="conut" />
                           <asp:BoundField DataField="brief" HeaderText="brief" SortExpression="brief" />
                           <asp:BoundField DataField="note" HeaderText="note" SortExpression="note" />
                           <asp:BoundField DataField="imageurl" HeaderText="imageurl" 
                               SortExpression="imageurl" />
                           <asp:BoundField DataField="author" HeaderText="author" 
                               SortExpression="author" />
                           <asp:CommandField />
                           <asp:CommandField ShowDeleteButton="True" />
                           <asp:CommandField ShowEditButton="True" />
                       </Columns>
                       <FooterStyle BackColor="Tan" />
                       <HeaderStyle BackColor="Tan" Font-Bold="True" />
                       <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                           HorizontalAlign="Center" />
                       <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                       <SortedAscendingCellStyle BackColor="#FAFAE7" />
                       <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                       <SortedDescendingCellStyle BackColor="#E1DB9C" />
                       <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                   </asp:GridView>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:libraryConnectionString %>" 
                       
                       SelectCommand="SELECT [bookid], [name], [price], [conut], [brief], [note], [imageurl], [author] FROM [Book] WHERE ([kind] = @kind)" 
                       DeleteCommand="DELETE FROM [Book] WHERE [bookid] = @bookid" 
                       InsertCommand="INSERT INTO [Book] ([name], [price], [conut], [brief], [note], [imageurl], [author]) VALUES (@name, @price, @conut, @brief, @note, @imageurl, @author)" 
                       UpdateCommand="UPDATE [Book] SET [name] = @name, [price] = @price, [conut] = @conut, [brief] = @brief, [note] = @note, [imageurl] = @imageurl, [author] = @author WHERE [bookid] = @bookid">
                       <DeleteParameters>
                           <asp:Parameter Name="bookid" Type="Int32" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="name" Type="String" />
                           <asp:Parameter Name="price" Type="Int32" />
                           <asp:Parameter Name="conut" Type="Int32" />
                           <asp:Parameter Name="brief" Type="String" />
                           <asp:Parameter Name="note" Type="String" />
                           <asp:Parameter Name="imageurl" Type="String" />
                           <asp:Parameter Name="author" Type="String" />
                       </InsertParameters>
                       <SelectParameters>
                           <asp:SessionParameter DefaultValue="null" Name="kind" SessionField="select" 
                               Type="String" />
                       </SelectParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="name" Type="String" />
                           <asp:Parameter Name="price" Type="Int32" />
                           <asp:Parameter Name="conut" Type="Int32" />
                           <asp:Parameter Name="brief" Type="String" />
                           <asp:Parameter Name="note" Type="String" />
                           <asp:Parameter Name="imageurl" Type="String" />
                           <asp:Parameter Name="author" Type="String" />
                           <asp:Parameter Name="bookid" Type="Int32" />
                       </UpdateParameters>
                   </asp:SqlDataSource>
               </asp:View>
               <asp:View ID="View2" runat="server">
                   <br/>
                   <br/>
                   名称：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                   <br />
                   <br />
                   价格：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                   <br />
                   <br />
                   数量：<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                   <br />
                   <br />
                   简介：<asp:TextBox ID="TextBox4" runat="server" Height="67px" Width="393px"></asp:TextBox>
                   <br />
                   <br />
                   备注：<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                   <br />
                   <br />
                   上传图片：<asp:FileUpload ID="FileUpload1" runat="server" />
                   <br />
                   <br />
                   作者：<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                   <br />
                   <br />
                   种类：<asp:DropDownList ID="DropDownList2" runat="server">
                       <asp:ListItem>计算机</asp:ListItem>
                       <asp:ListItem>文学</asp:ListItem>
                       <asp:ListItem>科普</asp:ListItem>
                       <asp:ListItem>自然科学</asp:ListItem>
                       <asp:ListItem>传记</asp:ListItem>
                       <asp:ListItem>管理</asp:ListItem>
                       <asp:ListItem>经济</asp:ListItem>
                   </asp:DropDownList>
                   <br />
                   <br />
                   <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                   <br />
                   <center><asp:Button ID="Button7" runat="server" Text="添加" onclick="Button7_Click" 
                           Width="101px" /></center>
                   <br />
                   
                   </asp:View>
               <asp:View ID="View3" runat="server">
                    <p>订单列表</p>
                   <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                       AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" 
                       BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="id" 
                       DataSourceID="SqlDataSource2" GridLines="Horizontal" Width="780px">
                       <Columns>
                           <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                           <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                               ReadOnly="True" SortExpression="id" />
                           <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
                           <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                           <asp:BoundField DataField="Address" HeaderText="Address" 
                               SortExpression="Address" />
                           <asp:BoundField DataField="destination" HeaderText="destination" 
                               SortExpression="destination" />
                           <asp:BoundField DataField="status" HeaderText="status" 
                               SortExpression="status" />
                       </Columns>
                       <FooterStyle BackColor="White" ForeColor="#333333" />
                       <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                       <RowStyle BackColor="White" ForeColor="#333333" />
                       <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                       <SortedAscendingCellStyle BackColor="#F7F7F7" />
                       <SortedAscendingHeaderStyle BackColor="#487575" />
                       <SortedDescendingCellStyle BackColor="#E5E5E5" />
                       <SortedDescendingHeaderStyle BackColor="#275353" />
                   </asp:GridView>
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:libraryConnectionString %>" 
                       DeleteCommand="DELETE FROM [map] WHERE [id] = @id" 
                       InsertCommand="INSERT INTO [map] ([total], [name], [Address], [destination], [status]) VALUES (@total, @name, @Address, @destination, @status)" 
                       SelectCommand="SELECT [id], [total], [name], [Address], [destination], [status] FROM [map]" 
                       UpdateCommand="UPDATE [map] SET [total] = @total, [name] = @name, [Address] = @Address, [destination] = @destination, [status] = @status WHERE [id] = @id">
                       <DeleteParameters>
                           <asp:Parameter Name="id" Type="Int32" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="total" Type="String" />
                           <asp:Parameter Name="name" Type="String" />
                           <asp:Parameter Name="Address" Type="String" />
                           <asp:Parameter Name="destination" Type="String" />
                           <asp:Parameter Name="status" Type="String" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="total" Type="String" />
                           <asp:Parameter Name="name" Type="String" />
                           <asp:Parameter Name="Address" Type="String" />
                           <asp:Parameter Name="destination" Type="String" />
                           <asp:Parameter Name="status" Type="String" />
                           <asp:Parameter Name="id" Type="Int32" />
                       </UpdateParameters>
                   </asp:SqlDataSource>
               </asp:View>
               <asp:View ID="View4" runat="server">
               <p>用户管理</p>
                   <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                       AutoGenerateColumns="False" DataKeyNames="name" 
                       DataSourceID="SqlDataSource3" BackColor="#DEBA84" BorderColor="#DEBA84" 
                       BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
                       Width="772px">
                       <Columns>
                           <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                           <asp:BoundField DataField="userid" HeaderText="userid" InsertVisible="False" 
                               ReadOnly="True" SortExpression="userid" />
                           <asp:BoundField DataField="name" HeaderText="name" ReadOnly="True" 
                               SortExpression="name" />
                           <asp:BoundField DataField="pwd" HeaderText="pwd" SortExpression="pwd" />
                           <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                           <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                           <asp:BoundField DataField="staff" HeaderText="staff" SortExpression="staff" />
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
                   <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:libraryConnectionString %>" 
                       DeleteCommand="DELETE FROM [user1] WHERE [name] = @name" 
                       InsertCommand="INSERT INTO [user1] ([name], [pwd], [mail], [sex], [staff]) VALUES (@name, @pwd, @mail, @sex, @staff)" 
                       SelectCommand="SELECT [userid], [name], [pwd], [mail], [sex], [staff] FROM [user1]" 
                       UpdateCommand="UPDATE [user1] SET [userid] = @userid, [pwd] = @pwd, [mail] = @mail, [sex] = @sex, [staff] = @staff WHERE [name] = @name">
                       <DeleteParameters>
                           <asp:Parameter Name="name" Type="String" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="name" Type="String" />
                           <asp:Parameter Name="pwd" Type="String" />
                           <asp:Parameter Name="mail" Type="String" />
                           <asp:Parameter Name="sex" Type="String" />
                           <asp:Parameter Name="staff" Type="String" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="userid" Type="Int32" />
                           <asp:Parameter Name="pwd" Type="String" />
                           <asp:Parameter Name="mail" Type="String" />
                           <asp:Parameter Name="sex" Type="String" />
                           <asp:Parameter Name="staff" Type="String" />
                           <asp:Parameter Name="name" Type="String" />
                       </UpdateParameters>
                   </asp:SqlDataSource>
               </asp:View>
               <asp:View ID="View5" runat="server">
               <p>评论管理</p>
                   <asp:GridView ID="GridView4" runat="server" AllowPaging="True" 
                       AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" 
                       DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" 
                       Width="761px">
                       <AlternatingRowStyle BackColor="White" />
                       <Columns>
                           <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                           <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                               ReadOnly="True" SortExpression="id" />
                           <asp:BoundField DataField="main" HeaderText="main" SortExpression="main" />
                           <asp:BoundField DataField="people" HeaderText="people" 
                               SortExpression="people" />
                           <asp:BoundField DataField="bookid" HeaderText="bookid" 
                               SortExpression="bookid" />
                       </Columns>
                       <EditRowStyle BackColor="#2461BF" />
                       <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                       <RowStyle BackColor="#EFF3FB" />
                       <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                       <SortedAscendingCellStyle BackColor="#F5F7FB" />
                       <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                       <SortedDescendingCellStyle BackColor="#E9EBEF" />
                       <SortedDescendingHeaderStyle BackColor="#4870BE" />
                   </asp:GridView>
                   <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:libraryConnectionString %>" 
                       DeleteCommand="DELETE FROM [Content] WHERE [id] = @id" 
                       InsertCommand="INSERT INTO [Content] ([main], [people], [bookid]) VALUES (@main, @people, @bookid)" 
                       SelectCommand="SELECT [id], [main], [people], [bookid] FROM [Content]" 
                       UpdateCommand="UPDATE [Content] SET [main] = @main, [people] = @people, [bookid] = @bookid WHERE [id] = @id">
                       <DeleteParameters>
                           <asp:Parameter Name="id" Type="Int32" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="main" Type="String" />
                           <asp:Parameter Name="people" Type="String" />
                           <asp:Parameter Name="bookid" Type="Int32" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="main" Type="String" />
                           <asp:Parameter Name="people" Type="String" />
                           <asp:Parameter Name="bookid" Type="Int32" />
                           <asp:Parameter Name="id" Type="Int32" />
                       </UpdateParameters>
                   </asp:SqlDataSource>
               </asp:View>
           </asp:MultiView>
       </div>
       <div style="clear:both"></div>
    </div>
    </form>
</body>
</html>
