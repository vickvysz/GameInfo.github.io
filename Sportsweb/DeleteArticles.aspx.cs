using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
public partial class DeleteArticles : System.Web.UI.Page
{
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            gvArt();
        }
    }
    protected void gvArt()
    {
        con = new SqlConnection(str);
        con.Open();
        cmd = new SqlCommand("select * from Articles", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvArticles.DataSource = ds;
        gvArticles.DataBind();
        con.Close();
    }
    protected void gvArticles_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void gvArticles_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        gvArticles.PageIndex = e.NewPageIndex;
        gvArt();
    }
    protected void gvArticles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int aID = Convert.ToInt32(gvArticles.DataKeys[e.RowIndex].Values["ArticleID"].ToString());
        con = new SqlConnection(str);
        con.Open();
        cmd = new SqlCommand("Delete from Articles where ArticleID=@aid", con);
        cmd.Parameters.AddWithValue("@aid", aID);
        cmd.ExecuteNonQuery();
        con.Close();
        lblMsg.Text = "Record Deleted";
        lblMsg.ForeColor = Color.Green;
        gvArt();
    }
}