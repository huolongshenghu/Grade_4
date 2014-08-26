<%@ Page Language="C#" AutoEventWireup="true" CodeFile="head.aspx.cs" Inherits="head" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel=Stylesheet href=StyleSheet.css type="text/css" >
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
        </div>
            <div style="clear:both"></div>
     </div>

    </form>
</body>
</html>
