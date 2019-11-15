<%@ Page Title="Itmes Category" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ItemsCategory.aspx.cs" Inherits="ItemsCategory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/ic.png" />
    <table style="margin:10px;margin-bottom:15px;">
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" BackColor="#999999">
                    <asp:DataList ID="dlstItemCategories" runat="server" EnableTheming="false" RepeatColumns="2" Style="width: 900px">
                        <ItemTemplate>
                            <table cellpadding="8" style="width: 100%">
                                <tr>
                                    <td style="width: 1px">
                                        <asp:ImageButton ID="img" runat="server" Height="150px" Width="130px" ImageUrl='<%#Eval("ImageUrl") %>'
                                            PostBackUrl='<%#Eval("CategoryID","Items.aspx?CategoryID={0}") %>' />
                                    </td>
                                    <td>
                                    <div>
                                        <asp:HyperLink ID="hlName" runat="server" ForeColor="#87cfe6" Font-Size="Large" NavigateUrl='<%#Eval("CategoryID","Items.aspx?CategoryID={0}") %>'><%#Eval("Name") %></asp:HyperLink><br />
                                        <asp:Label ID="lblDescription" runat="server" ForeColor="White" Text='<%#Eval("Description") %>'></asp:Label>
                                    </div>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel1" Radius="10">
                </asp:RoundedCornersExtender>
            </td>
        </tr>
    </table>
</asp:Content>
