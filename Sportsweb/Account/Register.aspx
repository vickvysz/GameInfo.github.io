<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:Panel ID="Panel1" runat="server" BackColor="#BBBBBB" Width="720">
        <div style="margin-left:25px;padding-top:15px;padding-bottom:10px">
            <asp:CreateUserWizard ID="RegisterUser" runat="server" EnableViewState="false" OnCreatedUser="RegisterUser_CreatedUser"
                InvalidPasswordErrorMessage="Password length minimum : {0} ." 
                onnextbuttonclick="RegisterUser_NextButtonClick">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="wizardStepPlaceholder" runat="server"></asp:PlaceHolder>
                    <asp:PlaceHolder ID="navigationPlaceholder" runat="server"></asp:PlaceHolder>
                </LayoutTemplate>
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                        <ContentTemplate>
                            <h2>
                                Create a New Account
                            </h2>
                            <p>
                                Use the form below to create a new account.
                            </p>
                            
                            <p>
                                Passwords are required to be a minimum of
                                <%= Membership.MinRequiredPasswordLength %>
                                characters in length.
                            </p>
                            <span class="failureNotification">
                                <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                            </span>
                            <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification"
                                ValidationGroup="RegisterUserValidationGroup" />
                            <div class="accountInfo">
                                <fieldset class="register">
                                    <legend>Account Information</legend>
                                    <p>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"  ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                            CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required."
                                            ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                        <asp:TextBox ID="Email" runat="server" CssClass="textEntry"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                            CssClass="failureNotification" ErrorMessage="E-mail is required." ToolTip="E-mail is required."
                                            ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email"
                                            ControlToValidate="Email" CssClass="failureNotification" ToolTip="E-mail is Invalid."
                                            ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ValidationGroup="RegisterUserValidationGroup"></asp:RegularExpressionValidator>
                                    </p>
                                    <p>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                            CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required."
                                            ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </p>
                                    <p>
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification"
                                            Display="Dynamic" ErrorMessage="Confirm Password is required." ID="ConfirmPasswordRequired"
                                            runat="server" ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                            ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic"
                                            ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                                    </p>
                                </fieldset>
                                <p class="submitButton">
                                    <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="Create User"
                                        ValidationGroup="RegisterUserValidationGroup"/>
                                </p>
                            </div>
                        </ContentTemplate>
                        <CustomNavigationTemplate>
                        </CustomNavigationTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep>
                    </asp:CompleteWizardStep>
                </WizardSteps>
            </asp:CreateUserWizard>
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </div>
       
    </asp:Panel>
    <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel1"
        Radius="12">
    </asp:RoundedCornersExtender>
</asp:Content>
