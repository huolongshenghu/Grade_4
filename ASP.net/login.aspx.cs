using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public SqlConnection GetConn()
    {

        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["sqlconnstr"].ConnectionString;
        SqlConnection conn = new SqlConnection(constr);
        conn.Open();
        return conn;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = GetConn();
        string strsql = "select * from user1 where name='" + TextBox1.Text + "'";
        SqlCommand cmd = new SqlCommand(strsql, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (Session["user"] != null)
        {
            conn.Close();
            Response.Write("<script type='text/javascript'>alert('您已登录！')</script>");
        }
        else
        {
            if (dr.Read())
            {
                string str = TextBox2.Text;
                if (dr["pwd"].ToString().Trim()==TextBox2.Text)
                {
                    Session["user"] = TextBox1.Text;
                    Response.Redirect("index.aspx");
     
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('密码错误！')</script>");
                }
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('用户名不存在！')</script>");
            }
        }
        conn.Close();
    }
}