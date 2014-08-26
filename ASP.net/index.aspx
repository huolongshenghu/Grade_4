<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>图书管理系统</title>
    <link rel="Stylesheet" href="StyleSheet.css" type="text/css"/>
    </head>
<body>  
      <form id="form1" runat="server">
          <div class="head">
        <div id="menu_left">
        <img alt="" src="images/2.png" width="130px" height="500px"/>
        </div>
        <div id="menu">
        <ul>
        <li><a href="index.aspx"><span>首页</span></a></li>
        <li><a href="bookshow.aspx"><span>书目列表</span></a></li>
        <li><a href="searchmap.aspx"><span>订单查询<font color="blue" size="5px">
            </font></span></a></li>
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

        <div id="show_main">
            <div id="lleft">
                <asp:Image ID="Image1" runat="server" Height="173px" ImageUrl="~/demoimg/2.jpg" 
                    Width="600px" />
                <br />
                <strong><font face="华文行楷" size="40px" color="#ff99ff">心灵的旅程</font></strong>
                <br />
                <font color="blue" size="5px">心灵的店铺欢迎大家前来选~!!></font></div>
            <div id="lright">
             <strong><font face="华文行楷" size="40px" color="#ff99ff">心灵公告</font></strong>
            <pre>   心灵书店内有各种书籍

供大家选购，全部都是新书，

充实自己的好地方，多买多</pre>
                <pre>送好处多多</pre>
            </div>
           <div style="clear:both"></div>
       
          </div>
            <div style="clear:both"></div>
           
     </div>      
           </form>
</body>
</html>
