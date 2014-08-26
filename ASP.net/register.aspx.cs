using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public SqlConnection GetConn()
    {

        string constr =System.Web.Configuration.WebConfigurationManager.ConnectionStrings["sqlconnstr"].ConnectionString;
        SqlConnection conn = new SqlConnection(constr);
        conn.Open();
        return conn;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection conn = GetConn();
        string strsql = "INSERT INTO user1(name,pwd,mail,sex,staff) VAlUES('"+TextBox1.Text+"','"+TextBox6.Text+"','"+TextBox4.Text+"','"+TextBox5.Text+"','"+DropDownList1.Text+"')";
        SqlCommand cmd = new SqlCommand(strsql, conn);
        if (cmd.ExecuteNonQuery() > 0)
        {
            TextBox1.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox5.Text = "";
            TextBox4.Text = "";
            DropDownList1.Text = "";
            Response.Redirect("OK.aspx");
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('注册失败')</script>");
        }
        conn.Close();
    }
}