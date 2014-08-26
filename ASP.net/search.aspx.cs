using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class search : System.Web.UI.Page
{
    public SqlConnection GetConn()
    {

        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["sqlconnstr"].ConnectionString;
        SqlConnection conn = new SqlConnection(constr);
        conn.Open();
        return conn;
    }
    public DataTable ExecSel(string sql)
    {
        SqlConnection conn = GetConn();
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataAdapter oda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        oda.SelectCommand = cmd;
        oda.Fill(ds);
        conn.Close();
        return ds.Tables[0];

    }
    public void bookinfo()
    {
        string str = Session["bookname"].ToString();
        string sql = "select * from Book where name='" +str + "'";
        GridView1.DataSource = ExecSel(sql);
        GridView1.DataBind();
        if (GridView1.Rows.Count == 0)
        {
            text.Visible = true;
        }
        else
        {
            text.Visible = false;
        }
        Session["bookname"] = null;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            bookinfo();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Write("<script type='text/javascript'>alert('请先登录！')</script>");
        }
    }
}