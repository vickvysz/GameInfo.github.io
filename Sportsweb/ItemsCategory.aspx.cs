using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class ItemsCategory : System.Web.UI.Page
{
    SqlConnection con;
    string str=ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showDataItem();
        }
    }
    protected void showDataItem()
    {
        con = new SqlConnection(str);
        con.Open();
        cmd = new SqlCommand("select * from Items_Categories",con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dlstItemCategories.DataSource = ds;
        dlstItemCategories.DataBind();
        con.Close();
    }
}