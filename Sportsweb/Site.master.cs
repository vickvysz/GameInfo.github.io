using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class SiteMaster : System.Web.UI.MasterPage
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!HeadLoginView.Page.User.Identity.IsAuthenticated)
        {
            NavigationMenu.Items.RemoveAt(1);  
        }
        else
        {
            string lname = HeadLoginView.Page.User.Identity.Name;
            if (!lname.Equals("amit"))
            {
                NavigationMenu.Items.RemoveAt(1); 
            }
        }
    }
}
