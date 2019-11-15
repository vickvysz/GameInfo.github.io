<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="AddItemCategory.aspx.cs" Inherits="AddItemCategory" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
       <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
        <asp:GridView ID="gvDetails" runat="server" DataKeyNames="CategoryID,Name" AutoGenerateColumns="false"
            AllowPaging="true" AllowSorting="true" HeaderStyle-BackColor="#61A6F8" HeaderStyle-ForeColor="White"
            ShowFooter="true" Height="282px" OnRowCancelingEdit="gvDetails_RowCancelingEdit"
            OnRowCommand="gvDetails_RowCommand" OnRowDeleting="gvDetails_RowDeleting" OnRowEditing="gvDetails_RowEditing"
            OnRowUpdating="gvDetails_RowUpdating" Width="600px" PageSize="5" ForeColor="White"
            OnPageIndexChanging="gvDetails_PageIndexChanging">
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg"
                            ToolTip="Update" Height="20px" Width="20px" />
                        <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/Images/Cancel.jpg"
                            ToolTip="Cancel" Height="20px" Width="20px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="~/Images/Edit.jpg"
                            ToolTip="Edit" Height="20px" Width="20px" />
                        <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server"
                            ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Height="20px" Width="20px" />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Images/AddNewitem.jpg"
                            CommandName="AddNew" Width="30px" Height="30px" ToolTip="Add new User" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("Name")%>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDescription" runat="server" Text='<%#Eval("Description")%>' TextMode="MultiLine"
                            Rows="5"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtfDescription" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:FileUpload ID="fuEditImage" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="imgItem" runat="server" ImageUrl='<%#Eval("ImageUrl") %>' />
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:FileUpload ID="fuAddImg" runat="server" />
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblMsg" runat="server" Font-Bold="true"></asp:Label>
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
