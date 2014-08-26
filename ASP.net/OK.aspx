<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OK.aspx.cs" Inherits="OK" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>注册</title>
    <link rel=Stylesheet href=StyleSheet.css type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <%Server.Execute("head.aspx"); %>
    </div>
    <div id="register">
        <h1>注册成功!!</h1>
        <div>
        <a href="login.aspx">立即登录</a>
        <br />
        <br />
        <a href="index.aspx">返回主页</a>
        </div>
    </div>
    <div>
        <% Server.Execute("bottom.aspx");%>
    </div>
    </form>
</body>
</html>
