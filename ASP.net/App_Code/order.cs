using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///Class1 的摘要说明
/// </summary>
public class orderItemInfo
{
    public double  price;
    public int booknum;
    public string name;
    public int bookid;
}
public class order
{
    public double totalprice;
    public int totalnum;
    public List<orderItemInfo> a;
    public order()
    {
        a=new List<orderItemInfo>();
    }
}