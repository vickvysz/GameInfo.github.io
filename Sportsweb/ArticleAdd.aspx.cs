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
public partial class ArticleAdd : System.Web.UI.Page
{
    LoginView lv;
    SqlConnection con;
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        lv = (LoginView)Master.FindControl("HeadLoginView");
        if (!lv.Page.User.Identity.IsAuthenticated)
        {
            pnlLogout.Visible = true;
            pnlLogin.Visible = false;
        }
        else
        {
            pnlLogin.Visible = true;
            pnlLogout.Visible = false;
        }
    }
    protected void AddArt()
    {
        string uname = lv.Page.User.Identity.Name;
        DateTime dt = DateTime.Now.Date;
        string artTitle = txtTitle.Text;
        string artAbs = txtAbstract.Text;
        string artBody = txtBody.Text;
        fuImag.SaveAs(Server.MapPath("~/Images/Articles/") + fuImag.FileName);
        con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into Articles (AddedDate,AddedBy,Title,Abstract,Body,ImageUrl) values (@1,@2,@3,@4,@5,@6)",con);
        cmd.Parameters.AddWithValue("@1",dt);
        cmd.Parameters.AddWithValue("@2",uname);
        cmd.Parameters.AddWithValue("@3",artTitle);
        cmd.Parameters.AddWithValue("@4",artAbs);
        cmd.Parameters.AddWithValue("@5",artBody);
        cmd.Parameters.AddWithValue("@6", "~/Images/Articles/" + fuImag.FileName);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        AddArt();
        Response.Redirect("Articles_List.aspx");
    }
}