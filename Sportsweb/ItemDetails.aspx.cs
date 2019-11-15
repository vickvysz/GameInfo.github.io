using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;
using System.Configuration;
public partial class ItemDetails : System.Web.UI.Page
{
    int itemsID;
    LoginView lv;
    SqlConnection con;
    string str=ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        lv = (LoginView)Master.FindControl("HeadLoginView");
        if (Request.QueryString["ItemID"] != null)
        {
            Panel2.Visible = false; 
            itemsID = Convert.ToInt32(Request.QueryString["ItemID"].ToString());
            if (!lv.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Login.aspx?ReturnUrl=~/ItemDetails.aspx?ItemID=" + itemsID);

            }
            else
            {
                HaveID();
            }
        }
        else
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
    }

    private void HaveID()
    {
        con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Items where ItemID=@a", con);
        cmd.Parameters.AddWithValue("@a", itemsID);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Items");
        lblItemName.Text = ds.Tables["Items"].Rows[0]["Name"].ToString();
        imgItems.ImageUrl = ds.Tables["Items"].Rows[0]["ImageUrl"].ToString();
        lblDescription.Text = ds.Tables["Items"].Rows[0]["Description"].ToString();
        lblPrice.Text = ds.Tables["Items"].Rows[0]["Price"].ToString();
        lblStatus.Text = ds.Tables["Items"].Rows[0]["Status"].ToString();
        con.Close();
    }
}