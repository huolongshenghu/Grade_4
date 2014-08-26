<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookinfo.aspx.cs" Inherits="bookinfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>书目详情</title>
    <link rel="Stylesheet" type="text/css" href="StyleSheet.css" />
</head>
<body>
            
      <form id="form1" runat="server">
    <div style="margin-top:120px;">
    <div id="show_book">
        <div id="showbookleft">
            <asp:Image ID="Image1" runat="server" Height="193px" Width="193px" />
        </div>
        <div id="showbookright">
            <asp:Label ID="Label1" runat="server" Text="书名："></asp:Label>

            <asp:Label ID="name" runat="server" Text="Label"></asp:Label>
            <p>
            <asp:Label ID="Label2" runat="server" Text="作者:"></asp:Label>
            <asp:Label ID="author" runat="server" Text="Label"></asp:Label>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="出版社："></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </p>
            <p>
                <asp:Label ID="Label5" runat="server" Text="价格："></asp:Label>
                <asp:Label ID="price" runat="server" Text="Label"></asp:Label>
            </p>
            <p>
                <asp:Label ID="Label6" runat="server" Text="简介："></asp:Label>
                <asp:Label ID="brief" runat="server" Text="Label"></asp:Label>
            </p>

            <p>
                <h1>评论 </h1>
                <asp:Label ID="context" runat="server" Text="Label"></asp:Label>
                <br/>
                <p>
                    <asp:TextBox ID="TextBox1" runat="server" Height="85px" Width="458px"></asp:TextBox>
                               <asp:Button ID="Button1" runat="server" onclick="Button1_Click" style="float:right"
                Text="添加评论" />
                </p>
                </p>
            <div>

            </div>
        </div>
            <div style="clear:both"></div>
    </div>
    </div>
        </form>
     <div>
        <% Server.Execute("bottom.aspx");%>
    </div>

 
</body>
</html>
