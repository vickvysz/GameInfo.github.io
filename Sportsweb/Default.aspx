<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
<link href="Styles/Site.css" type="text/css" rel="Stylesheet" />
    <link href="Styles/orbit/demo-style.css" rel="Stylesheet" type="text/css" />
    <link href="Styles/orbit/orbit-1.2.3.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.orbit-1.2.3.min.js"></script>
    <style type="text/css">
        .style2
        {
            margin-left:10px;
        }
        .style3
        {
            width: 513px;
            height: 476px;
            margin-right: 20px;
        }
        .style4
        {
            height: 476px;
            margin-left: 20px;
        }
    </style>
    <script type="text/javascript">
        $(window).load(function () {
            $('#featured').orbit();
        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   <table style="width: 100%;">
        <tr>
           
            <td class="style4" valign="top" align="center">
                <asp:Panel ID="panel5" runat="server" BackColor="#999999" HorizontalAlign="Center">
                    <asp:Panel ID="Panel7" runat="server" Height="34px" BackColor="Red" BorderWidth="2"
                        BorderStyle="Outset">
                        <asp:Label ID="lbl11" runat="server" Text="ITEMS" Font-Size="Large" Font-Bold="true"
                            ForeColor="White">
                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Small" ForeColor="#87cfe6" style="float:right" PostBackUrl="Items.aspx?CategoryID=1">&lt;&lt More Items</asp:LinkButton>
                            </asp:Label>
                    </asp:Panel>
                    <asp:DataList ID="dlsItems" runat="server" EnableTheming="false" RepeatColumns="2"
                        Height="414px" Width="95%">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="imgItem" runat="server" Height="80px" ImageUrl='<%# Eval("ImageUrl") %>'
                                            PostBackUrl='<%#Eval("ItemID","ItemDetails.aspx?ItemID={0}") %>' Width="100px" />
                                        <br />
                                        <asp:Label ID="lblName" runat="server" Font-Size="Medium" ForeColor="#ffcb00">
                                        <%#Eval("Name") %>
                                        </asp:Label>
                                        <br />
                                        <asp:HyperLink ID="hlbuythis" runat="server" ForeColor="#87cfe6" Font-Size="Large" NavigateUrl='<%#Eval("ItemID","ItemDetails.aspx?ItemID={0}") %>'>Buy This</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="connect"
                        SelectCommand="select top 6 from [Items] order by NewId()"></asp:SqlDataSource>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel5" Radius="10">
                </asp:RoundedCornersExtender>
            </td>
             <td class="style3">
                <div class="container">
                    <div id="featured">
                        <img src="Images/SliderI/1.jpg" alt="bike" />
                        <img src="Images/SliderI/2.jpg" alt="bat">
                        <img src="Images/SliderI/3.jpg" alt="boll" />
                        <img src="Images/SliderI/4.jpg" alt="pad" />
                        <img src="Images/SliderI/5.jpg" alt="cricket" />
                        <img src="Images/SliderI/6.jpg" alt="football" />
                        <img src="Images/SliderI/7.jpg" alt="hockey" />
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top" colspan="2">
                <asp:Panel ID="Panel1" runat="server" BackColor="#999999" Style="margin-right: 0px">
                    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center">
                        <asp:Label ID="Label1" runat="server" ForeColor="White" Font-Size="Large" Font-Overline="false"
                            Text="Article"></asp:Label>
                    </asp:Panel>
                    <div>
                        <asp:DataList ID="dlsCategory" runat="server" EnableTheming="false" RepeatColumns="2"
                            Width="100%" >
                            <ItemTemplate>
                                <table cellpadding="6" width="100%" cellspacing="10" >
                                    <tr>
                                        <td valign="top" style="width: 1px">
                                            <asp:ImageButton ID="imgArct" runat="server" Height="80px" Width="100px" ImageUrl='<%#Eval("ImageUrl") %>'
                                                PostBackUrl='<%#Eval("ArticleID","Article.aspx?ArticleID={0}") %>' />
                                        </td>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTirle" runat="server" Font-Size="Medium" ForeColor="#ffcb00" Text='<%#Eval("Title") %>'></asp:Label>
                                                <br />
                                                <asp:Label ID="lblAbstract" runat="server" ForeColor="White" Text='<%#Eval("Abstract") %>'></asp:Label>
                                                <asp:HyperLink ID="hpl1" runat="server" ForeColor="#87cfe6" Font-Size="Large" NavigateUrl='<%#Eval("ArticleID","Article.aspx?ArticleID={0}") %>'>Read More</asp:HyperLink>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlArticle" runat="server"
                        ConnectionString="connect" SelectCommand="select top 3 * from [Articles]">
                        </asp:SqlDataSource>
                    </div>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" TargetControlID="Panel1"
                    Radius="10">
                </asp:RoundedCornersExtender>
            
        </tr>
    </table>
</asp:Content>
