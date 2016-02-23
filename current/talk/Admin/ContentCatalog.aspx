<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="ContentCatalog.aspx.cs" Inherits="mojoPortal.Web.AdminUI.ContentCatalogPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" />
<asp:Panel ID="pnlWrapper" runat="server"  CssClass="panelwrapper admin contentcatalog">
<div class="modulecontent">
<fieldset>
    <legend>
        <asp:HyperLink ID="lnkAdminMenu" runat="server" NavigateUrl="~/Admin/AdminMenu.aspx" />&nbsp;&gt;
        <asp:HyperLink ID="lnkContentManager" runat="server" />
    </legend>
    <asp:Panel ID="pnlNewContent" runat="server" CssClass="settingrow" DefaultButton="btnCreateNewContent">
        <asp:DropDownList ID="ddModuleType" runat="server" DataValueField="ModuleDefID" DataTextField="FeatureName">
        </asp:DropDownList>
        <asp:TextBox ID="txtModuleTitle" runat="server" Columns="40" Text="" CssClass="mediumtextbox"
            EnableViewState="false"></asp:TextBox>
            <portal:mojoButton ID="btnCreateNewContent" runat="server" Text="" />
    </asp:Panel>
    <asp:Panel ID="pnlFind" runat="server" CssClass="settingrow" DefaultButton="btnFind">
        <mp:SiteLabel ID="lblTitleFilter" runat="server" ConfigKey="ContentManagerTitleFilterLabel" ForControl="txtTitleFilter" />
        <asp:TextBox ID="txtTitleFilter" runat="server" MaxLength="255" CssClass="mediumtextbox" />
        <portal:mojoButton ID="btnFind" runat="server" />
        <asp:CheckBox ID="chkFilterByFeature" runat="server" />
    </asp:Panel>
<div class="settingrow">
<mp:mojoGridView ID="grdContent" runat="server"
     AllowPaging="false"
     AllowSorting="true"
     AutoGenerateColumns="false"
     EnableViewState="false" CellPadding="3"
     DataKeyNames="ModuleID"
     UseAccessibleHeader="true"
     SkinID="plain">
     <Columns>
        <asp:TemplateField SortExpression="ModuleTitle">
            <ItemTemplate>
                <%# Eval("ModuleTitle").ToString().Coalesce(Resources.Resource.ContentNoTitle)%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField SortExpression="FeatureName">
            <ItemTemplate>
                <%# mojoPortal.Web.Framework.ResourceHelper.GetResourceString(DataBinder.Eval(Container.DataItem, "ResourceFile").ToString(),DataBinder.Eval(Container.DataItem, "FeatureName").ToString()) %>
                (<%# Eval("UseCount") %>)
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CreatedBy" ReadOnly="true" SortExpression="CreatedBy" />
        <asp:TemplateField >
            <ItemTemplate>
                <a href='<%# SiteRoot + "/Admin/ContentManagerPreview.aspx?mid=" + DataBinder.Eval(Container.DataItem,"ModuleID") %>'><%# Resources.Resource.ContentManagerViewEditLabel %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField >
            <ItemTemplate>
                <a href='<%# SiteRoot + "/Admin/ContentManager.aspx?mid=" + DataBinder.Eval(Container.DataItem,"ModuleID") %>'><%# Resources.Resource.ContentManagerPublishDeleteLabel%></a>
            </ItemTemplate>
        </asp:TemplateField>
     </Columns>
     <EmptyDataTemplate>
            <p class="nodata"><asp:Literal id="litempty" runat="server" Text="<%$ Resources:Resource, GridViewNoData %>" /></p>
    </EmptyDataTemplate>
</mp:mojoGridView>
</div>
<div class="modulepager gridpager">
    <portal:mojoCutePager ID="pgrContent" runat="server" />
</div>
</fieldset>
</div>
</asp:Panel>
<mp:CornerRounderBottom id="cbottom1" runat="server" />

</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
