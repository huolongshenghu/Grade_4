using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class modify : System.Web.UI.Page
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
            SqlConnection conn = GetConn();
            string strsql = "select * from user1 where name='" + Session["user"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(strsql, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Label1.Text = dr["name"].ToString();
                TextBox4.Text = dr["mail"].ToString();
                TextBox5.Text = dr["sex"].ToString();
                DropDownList1.Text = dr["staff"].ToString();
            }
            conn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = GetConn();
        string strsql = "select * from user1 where name='" + Session["user"].ToString() + "'";
        SqlCommand cmd = new SqlCommand(strsql, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (TextBox1.Text.Equals(dr["pwd"].ToString()))
            {
                TextBox1.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                Response.Write("<script type='text/javascript'>alert('原密码错误！')</script>");
            }
            else
            {
                SqlConnection conn2 = GetConn();
                string strsql2 = "UPDATE user1 set pwd='" + TextBox6.Text + "',mail='" + TextBox4.Text + "',sex='" + TextBox5.Text + "',staff='" + DropDownList1.Text + "' WHERE name='" + Session["user"].ToString() + "'";
                SqlCommand cmd1 = new SqlCommand(strsql2, conn2);
                if (cmd1.ExecuteNonQuery() > 0)
                {
                    Label2.Text="更新成功！";
                }
                else
                {
                    Label2.Text="更新失败！";
                }
                conn2.Close();
            }
        }
        conn.Close();
    }
}