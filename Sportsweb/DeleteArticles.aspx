<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="DeleteArticles.aspx.cs" Inherits="DeleteArticles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView ID="gvArticles" runat="server" DataKeyNames="ArticleID" HeaderStyle-BackColor="#87cfe6"
                AutoGenerateColumns="false" ForeColor="White" AllowPaging="true" PageSize="10"
                Width="100%" OnPageIndexChanging="gvArticles_PageIndexChanging1" OnRowDeleting="gvArticles_RowDeleting">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDel" runat="server" CommandName="Delete" ImageUrl="~/Images/delete.jpg"
                                Width="20px" Height="20px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title">
                        <ItemTemplate>
                            <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Title")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Added Date">
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%#Eval("AddedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
