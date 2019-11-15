using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Articles_List : System.Web.UI.Page
{
    LoginView lv;
    SqlConnection con;
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showListArt();
        }
    }
    protected void showListArt()
    {
        con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Articles order by NewID()",con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataList1.DataSource = ds;
        DataList1.DataBind();
        con.Close();
    }
}