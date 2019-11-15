<%@ Page Title="Article" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Article.aspx.cs" Inherits="Article" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/artcl.jpg" />
    <table width="100%">
        <tr>
            <td valign="top" class="style1">
                <asp:Panel ID="Panel1" runat="server" Width="598px" BackColor="#999999" style="padding-left:10px;">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <hr />
                                <br />
                                <asp:Label ID="lblTitle" runat="server" Font-Bold="true" Font-Size="17px"
                                   ForeColor="#87cfe6"></asp:Label>
                                <br /><span style="color:White;"> Added By : </span>
                                <asp:Label ID="lblAddedBy" ForeColor="#ffcb00" Font-Size="Medium" runat="server"></asp:Label>
                                <br /><span style="color:White;"> Date : </span>
                                <asp:Label ID="lblAddedDate" ForeColor="#ffcb00" Font-Size="Medium" runat="server"></asp:Label>
                                <br />
                                <hr />
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Image ID="imgArticle" runat="server" Height="247px" Width="344px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblBody" runat="server" ForeColor="White"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel1"
                    Radius="12">
                </asp:RoundedCornersExtender>
                <hr style="width: 595px" />
                <asp:Panel ID="Panel5" runat="server" BackColor="#999999" Width="594px" style="padding-left:10px; padding-top:5px;">
                    <asp:Label ID="Label1" runat="server" Text="Comments" ForeColor="Aquamarine" Font-Size="Medium"
                        ></asp:Label><br />
                    <asp:DataList ID="dlComments" runat="server">
                        <ItemTemplate>
                          <span style="color:White; font-size:medium"> Commented By : </span>
                            <asp:Label ID="addedbyLabel" runat="server" ForeColor="#ffcb00" Font-Size="Medium" Text='<%#Eval("AddedBy") %>'></asp:Label><br />
                            <asp:Label ID="addedDate" runat="server" ForeColor="#ffcb00" Text='<%#Eval("AddedDate") %>'></asp:Label><br />
                            <br />
                          <span style="color:#87cfe6">  Comment :</span>
                            <asp:Label ID="BodyLabel" runat="server" ForeColor="WhiteSmoke" Text='<%#Eval("Body") %>'></asp:Label><br />
                            <hr />
                        </ItemTemplate>
                    </asp:DataList>
                    
                    <asp:HyperLink ID="hplreq" runat="server" ForeColor="#87cfe6" Font-Size="Medium">You Need Login For Comment</asp:HyperLink>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" TargetControlID="Panel5"
                    Radius="12">
                </asp:RoundedCornersExtender>
                <br />
                <asp:Panel ID="pnlComments" runat="server" Width="594px" BackColor="#999999" BorderColor="White">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:Label ID="lblLeaveCmnt" runat="server" Text="Leave a Comment" Font-Size="12pt"
                                    Font-Bold="true" ForeColor="White"></asp:Label>
                            </td>
                            <td>
                                &nbsp:
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Height="71px" Width="573px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" Height="27px" Width="81px"
                                    OnClick="btnSubmit_Click" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" TargetControlID="pnlComments"
                    Radius="12">
                </asp:RoundedCornersExtender>
            </td>
            <td valign="top">
                
                <asp:Panel ID="PanelArt" runat="server" Width="320px" BackColor="#999999" HorizontalAlign="Center"
                    Style="margin: 0px;">
                    <asp:Panel ID="Panel4" runat="server" Height="34px" Width="316px" HorizontalAlign="Center"
                        BackColor="red">
                        <asp:Label ID="Label2" runat="server" Text="Other Articles" Font-Size="Large" ForeColor="White"
                            Font-Overline="false"></asp:Label>
                    </asp:Panel>
                    <div>
                        <asp:ListView ID="lstArticle" runat="server">
                            <ItemTemplate>
                                <asp:Table ID="Table1" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:ImageButton ID="imglist" runat="server" Height="145px" Width="268px" ImageUrl='<%#Eval("ImageUrl") %>'
                                                PostBackUrl='<%#Eval("ArticleID","Article.aspx?ArticleID={0}") %>' />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Title") %>' Font-Size="Medium" ForeColor="#ffcb00" ></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                <td>
                                                    <asp:Label ID="lblAbstract" runat="server" Text='<%#Eval("Abstract") %>' ForeColor="White"></asp:Label>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#87cfe6" Font-Size="Large" NavigateUrl='<%#Eval("ArticleID","Article.aspx?ArticleID={0}") %>'>Read More</asp:HyperLink>
                                                </td>
                                                </tr>
                                            </table>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <br />
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
