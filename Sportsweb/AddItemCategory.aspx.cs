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
using System.Web.Security;
public partial class AddItemCategory : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand ecmd,acmd;
    string str=ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    LoginView lv;
    protected void Page_Load(object sender, EventArgs e)
    {
        lv = (LoginView)Master.FindControl("HeadLoginView");
        if (!lv.Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx?ReturnUrl=~/AddItemCategory.aspx");
        }
        else
        {
            string lname = lv.Page.User.Identity.Name;
            if (!lname.Equals("amit"))
            {
                Response.Redirect("Default.aspx");
            }
        }
        if (!IsPostBack)
        {
            show();
        }
    }
    protected void show()
    {
        con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Items_Categories",con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvDetails.DataSource = ds;
        gvDetails.DataBind();
        con.Close();

    }
    protected void gvDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDetails.PageIndex = e.NewPageIndex;
        show();
    }
    protected void gvDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvDetails.EditIndex = -1;
        show();
    }
    protected void gvDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            lblMsg.Text = "";
            con = new SqlConnection(str);
            con.Open();
            string addName = ((TextBox)gvDetails.FooterRow.FindControl("txtfname")).Text;
            string addDesc = ((TextBox)gvDetails.FooterRow.FindControl("txtfDescription")).Text;
            FileUpload addImg =(FileUpload) gvDetails.FooterRow.FindControl("fuAddImg");
            if (addImg.HasFile)
            {
                
                addImg.SaveAs(Server.MapPath("~/Images/Items/") + addImg.FileName);
                acmd = new SqlCommand("insert into Items_Categories(Name,Description,ImageUrl) values (@a,@b,@c)", con);
                acmd.Parameters.AddWithValue("@a", addName);
                acmd.Parameters.AddWithValue("@b", addDesc);
                acmd.Parameters.AddWithValue("@c", "~/Images/Items/" + addImg.FileName);
                acmd.ExecuteNonQuery();
                con.Close();

            }
            else
            {
                lblMsg.Text = "Item category requires an Image";
                lblMsg.ForeColor = Color.Red;
            }
            show();
        }
    }
    protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int icID=  Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Values["CategoryID"].ToString());
        string icNamE = gvDetails.DataKeys[e.RowIndex].Values["Name"].ToString();
        con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from Items_Categories where CategoryID=@a",con);
        cmd.Parameters.AddWithValue("@a",icID);
      int flag=  cmd.ExecuteNonQuery();
      if (flag == 1)
      {
          lblMsg.Text = icNamE + " Has been deleted Successfully";
          lblMsg.ForeColor = Color.Green;
      }
      show();
    }
    protected void gvDetails_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvDetails.EditIndex = e.NewEditIndex;
        show();
    }
    protected void gvDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        con = new SqlConnection(str);
        con.Open();
        
        int icID = Convert.ToInt32(gvDetails.DataKeys[e.RowIndex].Values["CategoryID"].ToString());
      string editName=((TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtName")).Text;
      string editDesc = ((TextBox)gvDetails.Rows[e.RowIndex].FindControl("txtDescription")).Text;
      FileUpload editImg = (FileUpload)gvDetails.Rows[e.RowIndex].FindControl("fuEditImage");
      if (editImg.HasFile)
      {
          editImg.SaveAs(Server.MapPath("~/Images/Items/") + editImg.FileName);
          ecmd = new SqlCommand("update Items_Categories set Name=@a,Description=@b,ImageUrl=@c where CategoryID=@d", con);
          ecmd.Parameters.AddWithValue("@a", editName);
          ecmd.Parameters.AddWithValue("@b", editDesc);
          ecmd.Parameters.AddWithValue("@c", "~/Images/Items/" + editImg.FileName);
          ecmd.Parameters.AddWithValue("@d", icID);
          ecmd.ExecuteNonQuery();
          con.Close();
          
      }
      else
      {
          ecmd = new SqlCommand("update Items_Categories set Name=@a,Description=@b where CategoryID=@d", con);
          ecmd.Parameters.AddWithValue("@a", editName);
          ecmd.Parameters.AddWithValue("@b", editDesc);
          ecmd.Parameters.AddWithValue("@d", icID);
          ecmd.ExecuteNonQuery();
          con.Close();
          
      }
      gvDetails.EditIndex = -1;
      show();
      lblMsg.Text = "Updation Is Successful";
      lblMsg.ForeColor = Color.Green;
    }
}