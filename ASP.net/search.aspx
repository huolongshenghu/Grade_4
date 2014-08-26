<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="show_main">
        <div>
        <a href="bookshow.aspx">返回</a>
    </div>
    <center><p>
        <asp:Label ID="text" runat="server" Text="没有符合的书目"></asp:Label>
        </p></center>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4"  AutoGenerateColumns="False" 
            ForeColor="#333333" GridLines="None" PageSize="3" Width="800px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div style="text-align: left">
                         <table border="0" cellpadding="0" cellspacing="0" style="width: 600px; height: 86px ;align:center" >
                         <tr>
                         <td rowspan="4" style="width: 49px; text-align: center">
                          <asp:Image ID="Image2" runat="server" ImageUrl='<%# "./picture/"+Eval("imageurl") %>' /></td>
                          <td style="width: 49px; height: 21px">
                          书名:</td>
                                                    <td style="height: 21px">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>' Width="231px"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 49px; height: 20px;">
                                                        作者:</td>
                                                    <td style="height: 20px">
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("author") %>' Width="230px"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 49px; height: 24px;">
                                                        价格:</td>
                                                    <td style="height: 24px">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("price") %>' Width="234px"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 49px ">
                                                        <asp:HyperLink style="text-decoration:none;color:green" ID="HyperLink2" runat="server" Width="49px" NavigateUrl='<%# "bookinfo.aspx?bid="+Eval("bookid").ToString() %>'>详情</asp:HyperLink></td>
                                                    <td>
                              
                                                        &nbsp; &nbsp;
                                                        <asp:Button ID="Button1" runat="server" Text="加进购物车" CommandName="add" 
                                                            CommandArgument='<%# Eval("bookid") %>' onclick="Button1_Click"/></td>
                                                </tr>
                                            </table>
                                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
