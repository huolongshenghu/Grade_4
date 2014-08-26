<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookshow.aspx.cs" Inherits="bookshow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>书目列表</title>
    <link rel="Stylesheet" href="StyleSheet.css" type="text/css" >
    <style type="text/css">
        .style1
        {
            width: 1050px;
            height: 145px;
        }
    </style>
</head>
<body>
 <form id="form1" runat="server">
    <div>
      <div class="head">
        <div id="menu_left">
        <img alt="" src="images/2.png" width="130px" height="500px"/>
        </div>
        <div id="menu">
        <ul>
        <li><a href="index.aspx"><span>首页</span></a></li>
        <li><a href="bookshow.aspx"><span>书目列表</span></a></li>
        <li><a href="searchmap.aspx"><span>订单查询</span></a></li>
        </ul>
        <div id="menu_id">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <%
                if (Session["user"] == null)
                {
                    %>
                    <a href="login.aspx">登录</a>
                    <a href="register.aspx">注册</a>
                    <%
                }
                else
                {
                    %>
                    <a href="modify.aspx">修改</a>
                    <a href="shopping.aspx">我的购物车</a>
                    <a href="work2.aspx">退出</a>
                    <%
                }     
            %>
        </div>
    <div id="book_main">
       <div id="search">    
           <p><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" Text="搜索" onclick="search" />
           </p>
       </div>
       <div id="show_main">
       <div id="show">
       <asp:TreeView ID="TreeView1" runat="server" 
        onselectednodechanged="TreeView1_SelectedNodeChanged" Height="317px" 
               Width="149px" >
        <Nodes>
            <asp:TreeNode Text="文艺" Value="文艺">
                <asp:TreeNode Text="文学" Value="文学"></asp:TreeNode>
                <asp:TreeNode Text="传记" Value="传记"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="科技" Value="科技">
                <asp:TreeNode Text="计算机" Value="计算机"></asp:TreeNode>
                <asp:TreeNode Text="科普" Value="科普"></asp:TreeNode>
                <asp:TreeNode Text="自然科学" Value="自然科学"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="经管" Value="经管">
                <asp:TreeNode Text="经济" Value="经济"></asp:TreeNode>
                <asp:TreeNode Text="管理" Value="管理"></asp:TreeNode>
            </asp:TreeNode>
        </Nodes>
    </asp:TreeView>
    </div>
    <div id="leftshow">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4"  
            AutoGenerateColumns="False" PageSize="3" Width="500px" 
            onrowcommand="GridView1_RowCommand" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" >
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="text-align: left">
                         <table border="0" cellpadding="0" cellspacing="0" style="width: 400px; height: 86px">
                         <tr>
                         <td rowspan="4" style="width: 15px; height:15px;text-align: center">
                          <asp:Image ID="Image2" runat="server" 
                                 ImageUrl='<%# "~\\picture\\"+Eval("imageurl") %>' Height="89px" 
                                 style="margin-top: 0px" Width="69px" /></td>
                          <td style="width: 5px; height: 21px">
                          书名:</td>
                                                    <td style="height: 5px">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' Width="69px" 
                                                            Height="17px"></asp:Label></td>
                                                    <td style="width: 5px; height: 20px;">
                                                        作者:</td>
                                                    <td style="height: 20px">
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("author") %>' Width="65px" 
                                                            Height="16px"></asp:Label></td>

                                                    <td style="width: 15px; height: 24px;">
                                                        价格:</td>
                                                    <td style="height: 24px">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price") %>' Width="80px" 
                                                            Height="16px"></asp:Label></td>
 
                                                    <td style="width: 15px ">
                                                        <asp:HyperLink style="text-decoration:none;color:green" ID="HyperLink2" runat="server" Width="49px" NavigateUrl='<%# "bookinfo.aspx?bid="+Eval("bookid").ToString() %>'>详情</asp:HyperLink></td>
                                                    <td>
                              
                                                        &nbsp; &nbsp;

                                                        <asp:Button ID="Button1" runat="server" Text="加进购物车"  CommandName="add" CommandArgument='<%#Eval("bookid") %>'/></td>
                                                </tr>
                                            </table>
                                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
     <!--   <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>-->
    </div>
    <div style="clear:both"></div>
    </div>
    
    </div>
            </div>
            <div style="clear:both"></div>
     </div>
             </div>
            <div style="clear:both"></div>
     </div>
     <div>
        <div class="head">
        <div>
            <center><p>designed by daerzi</p></center>
        </div>
        <div>
            <center><asp:Button ID="Button2" runat="server" Text="管理登录" 
                    onclick="Button2_Click" /></center>
        </div>
    </div>
        </form>
</body>
</html>
