<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 456px;
        }
        .logset
        {
            padding: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table style="width: 100%;" cellspacing="15" cellpadding="5">
        <tr>
            <td class="style1">
                <asp:Panel ID="Panel1" runat="server" BackColor="#bbbbbb">
                    <div class="logset">
                        <h2>
                            Log In
                        </h2>
                        <p style="color: #FFFFFF">
                            Please enter your username and password.
                            <asp:HyperLink ID="RegisterHyperLink" runat="server" ForeColor="BlueViolet" Font-Size="Large" EnableViewState="false">Register</asp:HyperLink>
                            if you don't have an account.
                        </p>
                        <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false">
                            <LayoutTemplate>
                                <span class="failureNotification">
                                    <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                </span>
                                <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                                    ValidationGroup="LoginUserValidationGroup" />
                                <div class="accountInfo">
                                    <fieldset class="login">
                                        <legend>Account Information</legend>
                                        <p>
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                                            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"
                                                Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                                        </p>
                                        <p>
                                            <asp:CheckBox ID="RememberMe" runat="server" />
                                            <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                                        </p>
                                    </fieldset>
                                    <p class="submitButton">
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                            ValidationGroup="LoginUserValidationGroup"  />
                                    </p>
                                </div>
                            </LayoutTemplate>
                        </asp:Login>
                    </div>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel1"
                    Radius="12">
                </asp:RoundedCornersExtender>
            </td>
            <td style="margin-left: 20px;">
                <asp:Panel ID="Panel2" runat="server" BackColor="#BBBBBB" Height="200px" Width="292px">
                    <div id="regset" style="padding-left: 2px; padding-top: -5px;">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:Image ID="regLogo" runat="server" ImageUrl="~/Images/logos.png" />
                                </td>
                            </tr>
                            <tr>
                            <td align="center" style="color:#FFFFFF;font-size:large" >
                            New To My Sport
                            </td>
                            </tr>
                            <tr>
                            <td align="center">
                              <br />
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/register.gif" 
                                    CausesValidation="false" PostBackUrl="~/Account/Register.aspx" />
                            </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" TargetControlID="Panel2" Radius="12">
                </asp:RoundedCornersExtender>
            </td>
        </tr>
    </table>
</asp:Content>
