<%@ Page Title="Your Articles" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ArticleAdd.aspx.cs" Inherits="ArticleAdd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        #ArtHead h1
        {
            text-align: center;
            color: #87cfe6;
        }
        #ArtContent
        {
            margin-left: 10px;
            margin-top: 20px;
            width: auto;
            
        }
        #ArtContent h2
        {
            color: #ffcb00;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="pnlLogout" runat="server">
        <asp:LinkButton ID="LinkButton1" ForeColor=" #87cfe6" runat="server" PostBackUrl="~/Account/Login.aspx?ReturnUrl=~/ArticleAdd.aspx">To Add Article You Must Be LoggedIn</asp:LinkButton>
    </asp:Panel>
    <asp:Panel ID="pnlLogin" runat="server">
    <div id="ArtHead">
        
        <h1>
            Add Your Own Article</h1>
    </div>
    <div id="ArtContent">
        <table cellpadding="8" cellspacing="10">
            <tr>
                <td>
                    <h2>
                        Title</h2>
                </td>
                <td valign="bottom">
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                        ControlToValidate="txtTitle" ValidationGroup="ArticleValid">*</asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>
                    <h2>
                        Abstract</h2>
                </td>
                <td valign="bottom">
                    <asp:TextBox ID="txtAbstract" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                        ControlToValidate="txtAbstract" ValidationGroup="ArticleValid">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <h2>
                        Body</h2>
                </td>
                <td valign="bottom">
                    <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                        ControlToValidate="txtBody" ValidationGroup="ArticleValid">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <h2>
                        Image</h2>
                </td>
                <td valign="bottom">
                    <asp:FileUpload ID="fuImag" ForeColor="#ffcb00" runat="server" />
                </td>
                <td>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="*" Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                        ControlToValidate="fuImag" ValidationGroup="ArticleValid">*</asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td colspan="2">
                <asp:Button ID="Button1" runat="server" Text="Submit" 
                        ValidationGroup="ArticleValid" onclick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
    </asp:Panel>
</asp:Content>
