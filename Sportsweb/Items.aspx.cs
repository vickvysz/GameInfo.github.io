using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Items : System.Web.UI.Page
{
    SqlConnection con;
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlCommand cmd;
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(Request.QueryString["CategoryID"]);
       ListView1.SelectedIndex = id - 1;
        if (!IsPostBack)
        {
            showItemCat();
            showItems();
        }
       
    }
    protected void showItemCat()
    {
        con = new SqlConnection(str);
        con.Open();
        cmd = new SqlCommand("select * from Items_Categories", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ListView1.DataSource = ds;
        ListView1.DataBind();
        con.Close();
    }
    protected void showItems()
    {
        con = new SqlConnection(str);
        con.Open();
        cmd = new SqlCommand("select * from Items where CategoryID=@a", con);
        cmd.Parameters.AddWithValue("@a", id);
        cmd.ExecuteNonQuery();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        //dlItems.DataSource = ds;
        //dlItems.DataBind();
        PagedDataSource opjd = new PagedDataSource();
        opjd.DataSource = ds.Tables[0].DefaultView;
        opjd.AllowPaging = true;
        opjd.PageSize = 4;
      
        opjd.CurrentPageIndex = CurrentPage - 1;
        cmdPrev.Enabled = !opjd.IsFirstPage;
        cmdNext.Enabled = !opjd.IsLastPage;
        dlItems.DataSource = opjd;
    
        dlItems.DataBind();
        con.Close();
    }
    public int CurrentPage
    {
        get
        {
            // look for current page in ViewState
            object o = this.ViewState["_CurrentPage"];
            if (o == null)
                return 1; // default page index of 0
            else
                return (int)o;
        }

        set
        {
            this.ViewState["_CurrentPage"] = value;
        }
    }

    protected void cmdNext_Click(object sender, EventArgs e)
    {
        // Set viewstate variable to the next page
        CurrentPage += 1;

        // Reload control
        showItems();
    }
    protected void cmdPrev_Click(object sender, EventArgs e)
    {
        // Set viewstate variable to the previous page
        CurrentPage -= 1;

        // Reload control
        showItems();
    }

   
}