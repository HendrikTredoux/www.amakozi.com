<%@ Control Language="c#" AutoEventWireup="False" Codebehind="BreadcrumbsControl.ascx.cs" Inherits="mojoPortal.Web.UI.BreadcrumbsControl" %>

<asp:Panel ID="pnlWrapper" runat="server" EnableViewState="false">
<portal:SiteMapPath ID="breadCrumbsControl" runat="server" Visible="false" EnableViewState="false">
<RootNodeTemplate>
<asp:HyperLink ID="lnkRoot" runat="server" NavigateUrl='<%# siteRoot %>' Text='<%# rootLinkText %>' CssClass='<%# CssClass %>' EnableViewState="false" />
</RootNodeTemplate>
<NodeTemplate>
<asp:HyperLink ID="lnkNode" runat="server" NavigateUrl='<%#  Page.ResolveUrl(Eval("Url").ToString()) %>' Text='<%# Eval("Title") %>' CssClass='<%# CssClass %>' EnableViewState="false" />
</NodeTemplate>
<CurrentNodeTemplate>
<asp:HyperLink ID="lnkCurrent" runat="server" NavigateUrl='<%#  Page.ResolveUrl(Eval("Url").ToString()) %>' Text='<%# Eval("Title") %>' CssClass='<%# CurrentPageCssClass %>' EnableViewState="false" />
</CurrentNodeTemplate>
</portal:SiteMapPath>
<asp:Literal ID="childCrumbs" runat="server" EnableViewState="false" />
</asp:Panel>