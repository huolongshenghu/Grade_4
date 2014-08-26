using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Class1 的摘要说明
/// </summary>
public class Class1
{
    public Class1()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public static SqlConnection DBconnection()
    {
        return new SqlConnection("Data Source=(local);Initial Catalog=Book;");

    }
    public static DataTable ExecSel(string sql)
    {
        //建立连接
        SqlConnection con = Class1.DBconnection();
        con.Open();
        //查询命令
        SqlCommand com = new SqlCommand(sql, con);
        //建立适配器
        SqlDataAdapter oda = new SqlDataAdapter();
        //建立dataset
        DataSet ds = new DataSet();
        oda.SelectCommand = com;
        //传递查询结果
        oda.Fill(ds);
        con.Close();
        return ds.Tables[0];

    }
    public static void ExecSql(string sql)//执行增，删，改
    {
        SqlConnection con = Class1.DBconnection();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        com.ExecuteNonQuery();
        con.Close();

    }
    public static string SelOne(string sql)//返回记录为一个值
    {
        SqlConnection con = Class1.DBconnection();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        return com.ExecuteScalar().ToString();
        con.Close();
    }
}
