<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户登录</title>
     <link rel="Stylesheet" href="StyleSheet.css" type="text/css" />
</head>
<body>
    <div id="main">
    <form id="form1" runat="server">
    <div id="login">
        <div id="login_a">
            <font size="6px" color="white">登录</font>
        </div>
        <div id="login_main">
            <p>
            <asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label> 
            &nbsp;&nbsp; 
            <asp:TextBox ID="TextBox1" runat="server" BorderColor="#009999" 
                BorderStyle="Solid" BorderWidth="2px" ForeColor="#FF99CC"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="用户名为空!"></asp:RequiredFieldValidator>
             </p>
            <p>
            <asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" BorderColor="#009999" 
                BorderStyle="Solid" BorderWidth="2px" TextMode="Password" 
           ></asp:TextBox>
            </p>

        </div>
        <div id="login_bottom">

            <p>&nbsp;</p>

            <asp:Button ID="Button1" runat="server" Height="37px" Text="登录" 
                Width="79px" onclick="Button1_Click" />

        </div>
    </div>
    </form>
    </div>
</body>
</html>
