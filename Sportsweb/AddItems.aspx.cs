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
public partial class AddItems : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand ecmd, acmd, dcmd;
    string str = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    LoginView lv;
    protected void Page_Load(object sender, EventArgs e)
    {
        lv = (LoginView)Master.FindControl("HeadLoginView");
        if (!lv.Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx?ReturnUrl=~/AddItems.aspx");
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
            showDataItem();
        }
       
    }

    protected void showDataItem()
    {
        con = new SqlConnection(str);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Items", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvItems.DataSource = ds;
        gvItems.DataBind();
        con.Close();
    }


    protected void gvItems_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            lblMsg.Text = "";
            con = new SqlConnection(str);
            con.Open();
            int IcatID = Convert.ToInt32(((TextBox)gvItems.FooterRow.FindControl("txtfCategoryID")).Text);
            string Iname = ((TextBox)gvItems.FooterRow.FindControl("txtfname")).Text;
            string Idesc = ((TextBox)gvItems.FooterRow.FindControl("txtfDescription")).Text;
            int IPrice = Convert.ToInt32(((TextBox)gvItems.FooterRow.FindControl("txtfPrice")).Text);
            int IQuantity = Convert.ToInt32(((TextBox)gvItems.FooterRow.FindControl("txtfQuantity")).Text);
            string IStatus = ((TextBox)gvItems.FooterRow.FindControl("txtfStatus")).Text;
            FileUpload IImag = (FileUpload)gvItems.FooterRow.FindControl("fuAddImg");
            if (IImag.HasFile)
            {
                IImag.SaveAs(Server.MapPath("~/Images/Items/") + IImag.FileName);
                acmd = new SqlCommand("insert into Items(CategoryID,Name,Description,Price,Quantity,Status,ImageUrl) values (@a,@b,@c,@d,@e,@f,@g)", con);
                acmd.Parameters.AddWithValue("@a", IcatID);
                acmd.Parameters.AddWithValue("@b", Iname);
                acmd.Parameters.AddWithValue("@c", Idesc);
                acmd.Parameters.AddWithValue("@d", IPrice);
                acmd.Parameters.AddWithValue("@e", IQuantity);
                acmd.Parameters.AddWithValue("@f", IStatus);
                acmd.Parameters.AddWithValue("@g", "~/Images/Items/" + IImag.FileName);
                acmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                lblMsg.Text = "Item category requires an Image";
                lblMsg.ForeColor = Color.Red;
            }
            showDataItem();
        }
        
    }
    protected void gvItems_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        int getItemID = Convert.ToInt32(gvItems.DataKeys[e.RowIndex].Values["ItemID"].ToString());
        con = new SqlConnection(str);
        con.Open();
        dcmd = new SqlCommand("delete from Items where ItemID=@a", con);
        dcmd.Parameters.AddWithValue("@a", getItemID);
        int flag = dcmd.ExecuteNonQuery();
        if (flag == 1)
        {
            lblMsg.Text = "Record Deleted Successfully";
            lblMsg.ForeColor = Color.Green;
        }
        else
        {
            lblMsg.Text = "Deletion UnSuccessfull";
            lblMsg.ForeColor = Color.Red;
        }
        con.Close();
        showDataItem();
    }
    protected void gvItems_RowEditing(object sender, GridViewEditEventArgs e)
    {
       // DataSet tempDs = gvItems.DataSource as DataSet;
        gvItems.EditIndex = e.NewEditIndex;
      

    }
    protected void gvItems_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = gvItems.Rows[e.RowIndex];
        int itemEID=Convert.ToInt32(gvItems.DataKeys[e.RowIndex].Values["ItemID"].ToString());
        TextBox txtCatID = (TextBox)row.FindControl("txtCatID");
        string Iname = ((TextBox)row.FindControl("txtname")).Text;
        string Idesc = ((TextBox)row.FindControl("txtDescription")).Text;
        int IPrice = Convert.ToInt32(((TextBox)row.FindControl("txtPrice")).Text);
        int IQuantity = Convert.ToInt32(((TextBox)row.FindControl("txtQuantity")).Text);
        string IStatus = ((TextBox)row.FindControl("txtStatus")).Text;
        FileUpload Iimg =(FileUpload) row.FindControl("fuEditImage");
        if (Iimg.HasFile)
        {
            Iimg.SaveAs(Server.MapPath("~/Images/Items/") + Iimg.FileName);
            con = new SqlConnection(str);
            con.Open();
            SqlCommand cmdf = new SqlCommand("update Items set CategoryID=@uci,Name=@uname,Description=@udesc,Price=@uprice,Quantity=@uquan,Status=@ustatus,ImageUrl=@uimg where ItemID=@uitem", con);
            cmdf.Parameters.AddWithValue("@uci", txtCatID.Text);
            cmdf.Parameters.AddWithValue("@uname", Iname);
            cmdf.Parameters.AddWithValue("@udesc", Idesc);
            cmdf.Parameters.AddWithValue("@uprice", IPrice);
            cmdf.Parameters.AddWithValue("@uquan", IQuantity);
            cmdf.Parameters.AddWithValue("@ustatus", IStatus);
            cmdf.Parameters.AddWithValue("@uimg", "~/Images/Items/" + Iimg.FileName);
            cmdf.Parameters.AddWithValue("@uitem", itemEID);
            cmdf.ExecuteNonQuery();
            con.Close();
            gvItems.EditIndex = -1;
            showDataItem();
            con.Close();
        }
        else
        {
            con = new SqlConnection(str);
            con.Open();
            SqlCommand cmdnf = new SqlCommand("update Items set CategoryID=@uci,Name=@uname,Description=@udesc,Price=@uprice,Quantity=@uquan,Status=@ustatus where ItemID=@uitem", con);
            cmdnf.Parameters.AddWithValue("@uci", txtCatID.Text);
            cmdnf.Parameters.AddWithValue("@uname",Iname);
            cmdnf.Parameters.AddWithValue("@udesc",Idesc);
            cmdnf.Parameters.AddWithValue("@uprice",IPrice);
            cmdnf.Parameters.AddWithValue("@uquan",IQuantity);
            cmdnf.Parameters.AddWithValue("@ustatus",IStatus);
            cmdnf.Parameters.AddWithValue("@uitem", itemEID);
            cmdnf.ExecuteNonQuery();
            con.Close();
            gvItems.EditIndex = -1;
            showDataItem();
        }
    }
    protected void gvItems_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvItems.EditIndex = -1;
        showDataItem();
    }
    protected void gvItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvItems.PageIndex = e.NewPageIndex;
        showDataItem();
    }
}