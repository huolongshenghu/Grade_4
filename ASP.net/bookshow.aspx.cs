using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class bookshow : System.Web.UI.Page
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
        string sql = "select * from Book";
        GridView1.DataSource = ExecSel(sql);
        GridView1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["user"] == null)
        {
            Label1.Text = "匿名用户";
        }
        else
        {
            Label1.Text = "欢迎您" + Session["user"].ToString();
        }
        if (!Page.IsPostBack)
        {
            bookinfo();
        }
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        string sql = "select * from Book where kind='" + TreeView1.SelectedValue.ToString()+"'";
        GridView1.DataSource = ExecSel(sql);
        GridView1.DataBind();
    }
    protected void search(object sender, EventArgs e)
    {
        string str = TextBox1.Text;
        Session["bookname"] = str;
        Response.Redirect("search.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (Session["user"] != null)
        {
            //添加购物车
            if (e.CommandName.ToLower() == "add")
            {
                order or = null;   //存储购物车信息
                orderItemInfo orderItem = null; // 购买书籍的信息
                string index=e.CommandArgument.ToString();
                SqlConnection conn = GetConn();
                string strsql = "select * from Book where bookid='" +index+ "'";
                SqlCommand cmd = new SqlCommand(strsql, conn);
                SqlDataReader dr = cmd.ExecuteReader(); 
                if(dr.Read())
                {
                        orderItem=new orderItemInfo();
                        orderItem.price=Convert.ToDouble(dr["price"]);
                        orderItem.name=dr["name"].ToString();
                        orderItem.bookid=Convert.ToInt32(dr["bookid"]);
                        orderItem.booknum = 1;
                }
                //判断购物车中是否有书籍
               if (Session["order"] == null)
                {
                   
                    //创建购物车
                    or = new order();
                    or.a.Add(orderItem);  //添加新书到列表  //购买时间
                    or.totalprice=Convert.ToInt32(orderItem.price); //总价格
                    or.totalnum = 1; //总数量
                    Session["order"] = or;//记录订单

                }
                else   //购物车中有书籍
                {
                    or = (order)Session["order"]; //将Session存入到order
                    int i = 0;
                    //判断购物车中是否已经有了此书
                    for (i = 0; i < or.a.Count; i++)
                    {
                        //如果有此书，在此基础上加
                        if (orderItem.bookid == ((orderItemInfo)or.a[i]).bookid)
                        {
                            ((orderItemInfo)or.a[i]).booknum++;  //书籍数量加1
                            ((orderItemInfo)or.a[i]).price += orderItem.price;
                            break;

                        }
                    }
                    if (i == or.a.Count)//购物车中没有此书,就将此书加到购物车
                    {
                        or.a.Add(orderItem);
                    }
                    or.totalnum++;  //总数量加1
                    or.totalprice += orderItem.price; //总价格加1
                    Session["order"] = or;
                }
               order or1 = (order)Session["order"];
             //  Label4.Text = ((orderItemInfo)or.a[0]).price.ToString();
                Response.Write("<script language='javascritp'>alert('添加成功!');</script>");
                conn.Close();
            }
            }
            else
            {
            Response.Write("<script language='javascritp'>alert('清先登录!');</script>");
            }
        }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Write("<script type='text/javascript'>alert('请先登录！')</script>");
        }
        else
        {
            if (Session["user"].ToString().Equals("admin"))
            {
                Response.Redirect("manage.aspx");
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('无此权限！')</script>");
            }
        }
    }
}