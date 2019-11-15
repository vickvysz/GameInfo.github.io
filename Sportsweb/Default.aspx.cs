using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class _Default : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
    string str=ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showItem();
            showArti();
        }
    }
    protected void showItem()
    {
        con = new SqlConnection(str);
        con.Open();
        cmd = new SqlCommand("select top 6 * from Items Order By NewID()",con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dlsItems.DataSource = ds;
        dlsItems.DataBind();
        con.Close();
    }
    protected void showArti()
    {
        con = new SqlConnection(str);
        con.Open();
        cmd = new SqlCommand("select top 6 * from Articles Order By NewID()", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dlsCategory.DataSource = ds;
        dlsCategory.DataBind();
        con.Close();
    }
}
