<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Articles_List.aspx.cs" Inherits="Articles_List" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/artcl.jpg" />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" BackColor="#999999" Style="margin-right: 0px;
                    width: 931px">
                    <asp:DataList ID="DataList1" runat="server" EnableTheming="false" RepeatColumns="2"
                        Width="100%" Height="549px">
                        <ItemTemplate>
                            <table cellpadding="6" style="width: 100%">
                                <tr>
                                    <td style="width: 50%">
                                        <asp:ImageButton ID="ImageButton2" runat="server" Height="145px" Width="268px" ImageUrl='<%#Eval("ImageUrl") %>'
                                            PostBackUrl='<%#Eval("ArticleID","Article.aspx?ArticleID={0}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%">
                                        <div>
                                            <asp:Label ID="lblTitle" runat="server" Font-Size="Medium" ForeColor="#ffcb00" Text='<%#Eval("Title") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="lblAbstract" runat="server" ForeColor="White" Text='<%#Eval("Abstract") %>'></asp:Label>
                                            <br />
                                            <asp:HyperLink ID="hplAbstract" runat="server" ForeColor="#87cfe6" Font-Size="Large"
                                                NavigateUrl='<%#Eval("ArticleID","Article.aspx?ArticleID={0}")%>'>Read More</asp:HyperLink>
                                        </div>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel1"
                    Radius="12">
                </asp:RoundedCornersExtender>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
