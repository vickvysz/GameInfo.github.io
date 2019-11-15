<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="AddItems.aspx.cs" Inherits="AddItems" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="height: 800px;">
       <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        --%>
       
                <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="false" DataKeyNames="ItemID,Name"
                    ShowFooter="true" AllowPaging="true" AllowSorting="true" HeaderStyle-BackColor="#61A6F8" EnableViewState="true"
                    ForeColor="white" HeaderStyle-ForeColor="White" PageSize="4" OnRowCancelingEdit="gvItems_RowCancelingEdit"
                    OnRowCommand="gvItems_RowCommand" OnRowDeleting="gvItems_RowDeleting" OnRowEditing="gvItems_RowEditing"
                    OnRowUpdating="gvItems_RowUpdating" OnPageIndexChanging="gvItems_PageIndexChanging">
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
                        <asp:TemplateField HeaderText="CategoryID">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCatID" runat="server" Text='<%#Eval("CategoryID")%>'></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="Ft1" runat="server" TargetControlID="txtCatID" FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCategoryID" runat="server" Text='<%#Eval("CategoryID") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtfCategoryID" runat="server"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="Ft2" runat="server" TargetControlID="txtfCategoryID"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
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
                        <asp:TemplateField HeaderText="Price">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPrice" runat="server" Text='<%#Eval("Price")%>' Width="43px"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="Ft3" runat="server" TargetControlID="txtPrice" FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtfPrice" runat="server" Width="43px"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="Ft4" runat="server" TargetControlID="txtfPrice"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%#Eval("Quantity")%>' Width="37px"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="Ft5" runat="server" TargetControlID="txtQuantity"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtfQuantity" runat="server" Width="37px"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="Ft5" runat="server" TargetControlID="txtfQuantity"
                                    FilterType="Numbers">
                                </asp:FilteredTextBoxExtender>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtStatus" runat="server" Text='<%#Eval("Status")%>' Width="34px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtfStatus" runat="server" Width="34px"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <EditItemTemplate>
                                <asp:FileUpload ID="fuEditImage" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="imgItem" runat="server" ImageUrl='<%#Eval("ImageUrl") %>' Width="150px"
                                    Height="150px" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:FileUpload ID="fuAddImg" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lblMsg" runat="server" Font-Bold="true"></asp:Label>
          <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
