using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
public partial class Account_Register : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
    }

    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {

        FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

        string continueUrl = RegisterUser.ContinueDestinationPageUrl;
        if (String.IsNullOrEmpty(continueUrl))
        {
            continueUrl = "~/";
        }
        Response.Redirect(continueUrl);
    }

    private bool UserExists(string usernameEmail)
    {
        if (Membership.FindUsersByEmail(usernameEmail) != null) 
        { 
            return true; 
        }

        return false;
    }

    protected void RegisterUser_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (e.CurrentStepIndex == 0)
        {
            if (RegisterUser.Email.Trim() == "" || UserExists(RegisterUser.Email))
            {
                lblmsg.Text = "This Email Is already Exist ! Please try Another Email";
                lblmsg.ForeColor = Color.Green;
                e.Cancel = true;
            }
            else
            {
                e.Cancel = false;
            }
        }
    }
}
