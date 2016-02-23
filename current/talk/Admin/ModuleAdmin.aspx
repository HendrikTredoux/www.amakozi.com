<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="ModuleAdmin.aspx.cs" Inherits="mojoPortal.Web.AdminUI.ModuleAdminPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" />
<asp:Panel ID="pnlWrapper" runat="server" CssClass="panelwrapper admin moduleadmin">
<div class="modulecontent">
<fieldset class="moduleadmin">
<legend>
<asp:HyperLink ID="lnkAdminMenu" runat="server" NavigateUrl="~/Admin/AdminMenu.aspx" />&nbsp;&gt;
<asp:HyperLink ID="lnkAdvancedTools" runat="server" />&nbsp;&gt;
<asp:HyperLink ID="lnkFeatureAdmin" runat="server" />
</legend>
<div class="settingrow">
    <portal:mojoDataList id="defsList" DataKeyField="ModuleDefID" runat="server">
		<ItemTemplate>
			<asp:HyperLink ID="HyperLink1" Visible='<%# isServerAdminSite %>' runat="server" Text='<%# Resources.Resource.ModuleAdminEditLink%>' ToolTip='<%# Resources.Resource.ModuleAdminEditLink %>' ImageUrl='<%# GetEditImageUrl() %>' NavigateUrl='<%# SiteRoot + "/Admin/ModuleDefinitions.aspx?defid=" + DataBinder.Eval(Container.DataItem, "ModuleDefID") %>' />
			&nbsp;&nbsp;
			<asp:Label Text='<%# mojoPortal.Web.Framework.ResourceHelper.GetResourceString(DataBinder.Eval(Container.DataItem, "ResourceFile").ToString(),DataBinder.Eval(Container.DataItem, "FeatureName").ToString()) %>' runat="server" ID="Label1" />
			<asp:HyperLink ID="lnkSettings" runat="server" Visible='<%# isServerAdminSite %>' Text='<%# Resources.Resource.ModuleAdminSettingsLink %>' ToolTip='<%# Resources.Resource.ModuleAdminSettingsLink %>' NavigateUrl='<%# SiteRoot + "/Admin/ModuleDefinitionSettings.aspx?defid=" + DataBinder.Eval(Container.DataItem, "ModuleDefID") %>' />
		    <asp:HyperLink ID="lnkPermissions" runat="server" Text='<%# Resources.Resource.FeaturePermissionsLink %>' ToolTip='<%# Resources.Resource.FeaturePermissionsLink %>' NavigateUrl='<%# SiteRoot + "/Admin/FeaturePermissions.aspx?defid=" + DataBinder.Eval(Container.DataItem, "ModuleDefID") %>' />
		
        </ItemTemplate>
	</portal:mojoDataList>
</div>
<div class="settingrow">
    <asp:HyperLink ID="lnkNewModule" runat="server" NavigateUrl="~/Admin/ModuleDefinitions.aspx?defid=-1" />
    <portal:mojoHelpLink ID="MojoHelpLink1" runat="server" HelpKey="moduledefinitionhelp" />
</div>
</fieldset>
</div>
</asp:Panel>
<mp:CornerRounderBottom id="cbottom1" runat="server" />

</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
