using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bottom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
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