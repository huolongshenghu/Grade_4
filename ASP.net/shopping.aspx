
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shopping.aspx.cs" Inherits="shopping" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="show_main">
        <asp:Button ID="Button2" runat="server" Text="返回" onclick="Button2_Click" /><br/>
        <h1>
        
            我的购物车</h1>
        <p>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </p>

        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br/>
        <br/>
        <asp:Label ID="Label3" runat="server" Text="送达地："></asp:Label>

        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="具体地址："></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="购买" style="float:right" 
            onclick="Button1_Click"/>
            <p>
        <asp:Button ID="Button3" runat="server" Text="清空购物车" onclick="Button3_Click" />
    </p>
    </div>

    </form>
    <%Server.Execute("bottom.aspx"); %>
    </body>
</html>
