<%@ Page Title="Items Details" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ItemDetails.aspx.cs" Inherits="ItemDetails" %>

<%@ Register Assembly="GCheckout" Namespace="GCheckout.Checkout" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 440px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <table style="width: 100%">
            <tr>
                <td>
                    &nbsp;
                </td>
                <td class="style1">
                    <asp:Label ID="lblItemName" runat="server" Text="Label" Font-Size="Medium" ForeColor="#ffcb00"></asp:Label>
                </td>
                <td align="right">
                    <asp:HyperLink ID="hlMoreItem" runat="server" NavigateUrl="~/ItemsCategory.aspx"
                        ForeColor="#87cfe6" Font-Size="Large" Style="text-decoration: none">More Items &gt; &gt; </asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td class="style1">
                    <asp:Image ID="imgItems" runat="server" Height="299px" Width="355px" />
                </td>
                <td>
                    <asp:Label ID="lblDescription" runat="server"  ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td class="style1">
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Price: " ForeColor="White"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblPrice" runat="server" Text="Label" ForeColor="White"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Available" ForeColor="White"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblStatus" runat="server" Text="Label" ForeColor="White"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Enter the Quantity you want" ForeColor="White"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtQuantity" runat="server" Width="81px"></asp:TextBox>&nbsp;
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtQuantity"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                                    Font-Bold="true" ForeColor="Red" ControlToValidate="txtQuantity">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td align="center" class="style1">
                    <cc1:GCheckoutButton ID="GCheckoutButton1" runat="server" 
                        AlternateText="Buy this" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
        <asp:Image ID="Image1" runat="server" style="padding-left:50px" ImageUrl="~/Images/WRONG.png" Height="480px"/>
    </asp:Panel>
    <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="Panel1" Radius="10">
    </asp:RoundedCornersExtender>
</asp:Content>
