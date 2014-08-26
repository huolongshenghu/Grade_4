using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class shopping : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            order a = new order();
            Label2.Text="";
            if (Session["order"] == null)
            {
                Label2.Text = "<p style='margin:0 auto'>购物车为空</p>";
            }
            else
            {
                a = (order)Session["order"];
                if (a.a.Count == 0)
                {
                    Label2.Text = "<p style='margin:0 auto'>购物车为空</p>";
                }
                else
                {
                    
                    Label2.Text="<table border=1 ><table align='center' width='900' border='1' bordercolor='#000000' style='border-collapse:collapse'><tr><th>书名</th><th>价格</th><th>数量</th></tr>";
                    foreach (orderItemInfo cur in a.a)
                    {
                        Label2.Text += "<tr><td>" + cur.name.ToString() + "</td>";
                        Label2.Text += "<td>" + cur.price + "</td>";
                        Label2.Text += "<td>" + cur.booknum + "</td>";
                        Label2.Text += "</tr>";
                    }
                    Label2.Text += "</table>";
                    Label1.Text += "<p style='margin-left:800px'>总价为" + a.totalprice + "</p>";
                }
            }
    }
    public SqlConnection GetConn()
    {

        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["sqlconnstr"].ConnectionString;
        SqlConnection conn = new SqlConnection(constr);
        conn.Open();
        return conn;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("bookshow.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Remove("order");
        Response.Redirect("shopping.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["order"] == null)
        {
            Response.Write("<script type='text/javascript'>alert('请先添加购物车！')</script>");
        }
        else
        {
            SqlConnection conn = GetConn();
            order a = new order();
            a = (order)Session["order"];
            DateTime t = DateTime.Now;
            string ss = "配送中";
            string strsql = "INSERT INTO map VALUES('" + a.totalprice.ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + Session["user"].ToString() + "','" + ss.ToString() + "','" + t.Date + "')";
            SqlCommand cmd = new SqlCommand(strsql, conn);
            if (cmd.ExecuteNonQuery() > 0)
            {
                Session.Remove("order");
                Response.Write("<script type='text/javascript'>alert('购买成功！')</script>");
                Response.Redirect("shopping.aspx");
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('购买失败！')</script>");
            }
            conn.Close();
        }
    }
}