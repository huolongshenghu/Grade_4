using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class bookinfo : System.Web.UI.Page
{
    public SqlConnection GetConn()
    {

        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["sqlconnstr"].ConnectionString;
        SqlConnection conn = new SqlConnection(constr);
        conn.Open();
        return conn;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn1 = GetConn();
        string strr1 = Request.QueryString["bid"].ToString();
        string strsql1 = "select * from Content where bookid='" + strr1 + "'";
        SqlCommand cmd1 = new SqlCommand(strsql1, conn1);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        string html ="";
        int a = 0;
        while(dr1.Read())
        {
            html += "<div";
            if(a%2==0)
            {
                html+=" style='background:pink'>";
            }
            else
            {
                html += ">";
            }
            a++;
            html += "<label align='center' style='color:green'>";
            html += dr1["people"].ToString();
            html += "</label>";
            html += "<p align='left'>";
            html+=dr1["main"].ToString();
            html += "</p>";
            html += "<hr/>";
            html += "</div>";
        }
        context.Text = html;
        if (!Page.IsPostBack)
        {
            SqlConnection conn = GetConn();
            string strr=Request.QueryString["bid"].ToString();
            string strsql = "select * from Book where bookid='" +strr+ "'";
            SqlCommand cmd = new SqlCommand(strsql, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Image1.ImageUrl = @"~\picture\"+dr["imageurl"].ToString();
                name.Text = dr["name"].ToString();
                author.Text = dr["author"].ToString();
                price.Text = dr["price"].ToString();
                brief.Text = dr["brief"].ToString();

            }
            conn.Close();
        }
        conn1.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
 //       Response.Write("<script type='text/javascript'>alert('添加失败！')</script>");
        if (Session["user"] == null)
        {
            Response.Write("<script type='text/javascript'>alert('请先登录！')</script>");
        }
        else
        {
            SqlConnection conn = GetConn();
            string bidd = Request.QueryString["bid"].ToString();
            string text = TextBox1.Text;
            string strsql = "INSERT INTO Content VALUES('" + bidd + "','" + Session["user"].ToString() + "','" + text + "')";
            SqlCommand cmd = new SqlCommand(strsql, conn);
            if (cmd.ExecuteNonQuery() > 0)
            {
                Response.Redirect("bookinfo.aspx?bid="+bidd);
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('添加失败！')</script>");
            }
            conn.Close();
        }
    }
   
}