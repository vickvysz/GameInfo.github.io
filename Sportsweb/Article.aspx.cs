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
public partial class Article : System.Web.UI.Page
{


    LoginView lv;
    public static string articleid;
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ArticleID"] != null)
        {
            DataSet ds = new DataSet();
            articleid = Request.QueryString["ArticleID"];
            lv = (LoginView)Master.FindControl("HeadLoginView");
            if (!lv.Page.User.Identity.IsAuthenticated)
            {
                pnlComments.Visible = false;
                hplreq.Visible = true;
            }
            else
            {
                pnlComments.Visible = true;
                hplreq.Visible = false;
            }

            // displaying selected article 
            using (SqlConnection con = new SqlConnection(str))
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from Articles where ArticleID = @aid", con);
                cmd1.Parameters.AddWithValue("@aid", articleid);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                ds.Clear();
                da1.Fill(ds, "Article");
                imgArticle.ImageUrl = ds.Tables["Article"].Rows[0]["ImageUrl"].ToString();
                lblBody.Text = ds.Tables["Article"].Rows[0]["Body"].ToString();
                lblTitle.Text = ds.Tables["Article"].Rows[0]["Title"].ToString();
                lblAddedBy.Text =ds.Tables["Article"].Rows[0]["AddedBy"].ToString();
                lblAddedDate.Text =ds.Tables["Article"].Rows[0]["AddedDate"].ToString();

                // displaying others articles 
                SqlCommand cmd = new SqlCommand("select * from Articles where NOT  ArticleID = @ai", con);
                cmd.Parameters.AddWithValue("@ai", articleid);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd);
                DataSet dso = new DataSet();
                da2.Fill(dso, "Articles");
                lstArticle.DataSource = dso;
                lstArticle.DataBind();
                HyperLink hplread = (HyperLink)lstArticle.FindControl("HyperLink1");
               hplreq.NavigateUrl = "~/Account/Login.aspx?ReturnUrl=~/Article.aspx?ArticleID=" + articleid;
                con.Close();
            }
        }
        if (!IsPostBack)
        {
            cmntShow();
        }

    }
    protected void cmntShow()
    {
        SqlConnection concmnt = new SqlConnection(str);
        concmnt.Open();
        SqlCommand cmdCmnt = new SqlCommand("select * from Comments where ArticleID=@a",concmnt);
        cmdCmnt.Parameters.AddWithValue("@a", articleid);
        SqlDataAdapter da = new SqlDataAdapter(cmdCmnt);
        DataSet ds = new DataSet();
        da.Fill(ds);
        dlComments.DataSource = ds;
        dlComments.DataBind();
        concmnt.Close();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (SqlConnection con2 = new SqlConnection(str))
        {
            if (Request.QueryString["ArticleID"] != null)
            {
                con2.Open();
                string name = lv.Page.User.Identity.Name;
                SqlCommand insertcol = new SqlCommand("insert into Comments(AddedDate,AddedBy,ArticleID,Body) values (@a,@b,@c,@d)", con2);
                insertcol.Parameters.AddWithValue("@a", DateTime.Now);
                insertcol.Parameters.AddWithValue("@b", name);
                insertcol.Parameters.AddWithValue("@c", articleid);
                insertcol.Parameters.AddWithValue("@d", txtComment.Text);
                insertcol.ExecuteNonQuery();
                dlComments.DataBind();
                txtComment.Text = null;
                Response.Redirect("Article.aspx?ArticleID="+articleid);
            }
        }
    }
}


