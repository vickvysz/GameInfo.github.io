<%@ Page Title="Items" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Items.aspx.cs" Inherits="Items" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .leftside
        {
            width: 135px;
            display: block;
            float: left;
            margin-bottom: 10px;
            margin-right: 30px;
        }
        .rightside
        {
            width: 700px;
            display: block;
            float: left;
            padding-top: 0px;
            margin-top: 5px;
            margin-bottom: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="width: 100%">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/itemse.png" />
    </div>
    <div class="leftside">
        <table width="100%">
            <tr>
                <td valign="top">
                    <asp:Panel ID="Panel2" runat="server" BackColor="#2C2E22" Width="135px" HorizontalAlign="Justify"
                        Style="padding: 8px;" Height="600px">
                        <asp:ListView ID="ListView1" runat="server">
                            <ItemTemplate>
                                <asp:Image ID="imgItems" runat="server" Width="30px" Height="30px" ImageUrl='<%#Eval("ImageUrl") %>' />
                                &nbsp;
                                <asp:HyperLink ID="hplItemlink" runat="server" ForeColor="White" Font-Size="11pt"
                                    NavigateUrl='<%#Eval("CategoryID","Items.aspx?CategoryID={0}") %>'><%#Eval("Name") %></asp:HyperLink>
                                <br />
                            </ItemTemplate>
                            <ItemSeparatorTemplate>
                                <hr />
                            </ItemSeparatorTemplate>
                            <SelectedItemTemplate>
                                <div style="background-color: Red">
                                    <asp:Image ID="imgSelectedItem" runat="server" Height="30px" Width="30px" ImageUrl='<%#Eval("ImageUrl") %>' />
                                    <asp:HyperLink ID="hplItemlink" runat="server" ForeColor="White" Font-Size="13pt"
                                        NavigateUrl='<%#Eval("CategoryID","Items.aspx?CategoryID={0}") %>'><%#Eval("Name") %></asp:HyperLink>
                                </div>
                            </SelectedItemTemplate>
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                            </LayoutTemplate>
                        </asp:ListView>
                    </asp:Panel>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel2"
                        Radius="10">
                    </asp:RoundedCornersExtender>
                </td>
            </tr>
        </table>
    </div>
    <div class="rightside" id="rside">
        <asp:Panel ID="Panel12" runat="server" Style="width: 100%; min-height: 600px;" BackColor="#999999">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <asp:DataList ID="dlItems" runat="server" EnableTheming="false" 
                Width="100%">
                <ItemStyle VerticalAlign="Top" />
                <ItemTemplate>
               
                    <table cellpadding="6" style="width: 100%">
                        <tr>
                            <td style="width: 1px">
                                <asp:ImageButton ID="imgItems" runat="server" Height="180px" ImageUrl='<%#Eval("ImageUrl") %>'
                                    PostBackUrl='<%#Eval("ItemID","ItemDetails.aspx?ItemID={0}") %>' Width="200px" />
                            </td>
                            <td>
                                <div>
                                    <asp:Label ID="lblName" runat="server" Font-Size="Large" ForeColor="#ffcb00" Text='<%#Eval("Name") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="lblPrice" runat="server" Font-Size="Medium" ForeColor="White" Text='<%#"Price : "+Eval("Price") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="lblStatus" runat="server" Font-Size="Medium" ForeColor="White" Text='<%#"Available: "+Eval("Status") %>'></asp:Label>
                                    <br />
                                    <asp:HyperLink ID="hplBuythis" runat="server" ForeColor="#87cfe6" Font-Size="Large"
                                        NavigateUrl='<%#Eval("ItemID","ItemDetails.aspx?ItemID={0}") %>'>Buy This</asp:HyperLink>
                                </div>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <hr />
                </ItemTemplate>
                <AlternatingItemTemplate>
                
                    <table cellpadding="6" style="width: 100%">
                        <tr>
                            <td>
                                <div>
                                    <asp:Label ID="lblName" runat="server" Font-Size="Large" ForeColor="#ffcb00" Text='<%#Eval("Name") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="lblPrice" runat="server" ForeColor="White" Font-Size="Medium" Text='<%#"Price : "+Eval("Price") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="lblStatus" runat="server" ForeColor="White" Font-Size="Medium" Text='<%#"Available: "+ Eval("Status") %>'></asp:Label>
                                    <br />
                                    <asp:HyperLink ID="hplBuythis" ForeColor="#87cfe6" runat="server" Font-Size="Large"
                                        NavigateUrl='<%#Eval("ItemID","ItemDetails.aspx?ItemID={0}") %>'>Buy This</asp:HyperLink>
                                </div>
                                <br />
                            </td>
                            <td>
                                <asp:ImageButton ID="imgItems" runat="server" Height="180px" ImageUrl='<%#Eval("ImageUrl") %>'
                                    PostBackUrl='<%#Eval("ItemID","ItemDetails.aspx?ItemID={0}") %>' Width="200px" />
                            </td>
                        </tr>
                    </table>
                    <hr />
                </AlternatingItemTemplate>
            </asp:DataList>
             <asp:button id="cmdPrev" runat="server" text=" << " onclick="cmdPrev_Click"></asp:button>
          <asp:button id="cmdNext" runat="server" text=" >> " onclick="cmdNext_Click"></asp:button>
            </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
        <asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" TargetControlID="Panel12"
            Radius="10">
        </asp:RoundedCornersExtender>
    </div>
    <br />
</asp:Content>
