using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class head : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Label1.Text = "匿名用户";
        }
        else
        {
            Label1.Text="欢迎您"+Session["user"].ToString();
        }
    }
}