using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class manage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = 0;
    }
    public SqlConnection GetConn()
    {

        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["sqlconnstr"].ConnectionString;
        SqlConnection conn = new SqlConnection(constr);
        conn.Open();
        return conn;
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        string str = DropDownList1.Text;
        Session["select"] = str;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        string name = TextBox1.Text;
        string price = TextBox2.Text;
        string count = TextBox3.Text;
        string brief = TextBox4.Text;
        string filename="";
        string note = TextBox5.Text;
        string savepath="";
        if (FileUpload1.HasFile)
        {
            savepath=  @"E:\大作业\picture\";
            filename = Server.HtmlEncode(FileUpload1.FileName);
            savepath += filename;
            FileUpload1.SaveAs(savepath);
        }
        string author = TextBox6.Text;
        string kind = DropDownList2.Text;
        SqlConnection conn = GetConn();
        string strsql = "INSERT INTO Book(name,price,conut,brief,note,imageurl,author,kind) VAlUES('" + name + "','" +price + "','" +count + "','" + brief + "','" + note + "','"+ filename+"','"+author+"','"+kind+"')";
        SqlCommand cmd = new SqlCommand(strsql, conn);
        if (cmd.ExecuteNonQuery() > 0)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            DropDownList2.Text = "";
            Label1.Text="添加成功！！";
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('添加失败')</script>");
        }
        conn.Close();
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}