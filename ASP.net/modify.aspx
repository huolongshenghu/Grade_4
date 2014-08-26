<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modify.aspx.cs" Inherits="modify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="register">
       <h1>修改个人信息</h1>
        <p>&nbsp;</p>
       <div>
       用户名：
           <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
           <br />
           <br />
           <br />
       旧密码：
           <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br/>
            <br/>
            <br/>
       新密码：
            
            
           <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6"
               ErrorMessage="密码长度在5到20之间" ValidationExpression="^.{5,20}$"></asp:RegularExpressionValidator>
           <br />
           <br />
           <br />
       确认密码：
            
            
           <asp:TextBox ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox>
           <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox7" ControlToCompare="Textbox6"
               ErrorMessage="两次密码输入不一致"></asp:CompareValidator>
           <br />
           <br />
           <br />
       邮箱：
           <asp:TextBox ID="TextBox4" runat="server" name="mail"></asp:TextBox>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4"
               ErrorMessage="邮箱输入不合法" 
               ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
           <br />
           <br />
           <br />
       性别：
           <asp:TextBox ID="TextBox5" runat="server" name="sex"></asp:TextBox>
           <br />
           <br />
           <br />
       职业：
           <asp:DropDownList ID="DropDownList1" runat="server" name="staff" >
               <asp:ListItem Value="学生">学生</asp:ListItem>
               <asp:ListItem Value="老师">老师</asp:ListItem>
               <asp:ListItem Value="社会人士">社会人士</asp:ListItem>
               <asp:ListItem Value="其他">其他</asp:ListItem>
           </asp:DropDownList>
       </div>
       <div>
           <br />
           <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
           <br />
           <br />
           <center>
           <asp:Button ID="Button1" runat="server" Text="更新" BackColor="#FF6699" 
                   BorderStyle="None" Width="100px" onclick="Button1_Click" 
                   style="height: 17px" />
           </center>
           <br />
       </div>
    </div>
    </form>
    <%Server.Execute("bottom.aspx"); %>
</body>
</html>
