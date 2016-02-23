<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="CacheTool.aspx.cs" Inherits="mojoPortal.Web.AdminUI.CacheToolPage" %>

<asp:content contentplaceholderid="leftContent" id="MPLeftPane" runat="server" />
<asp:content contentplaceholderid="mainContent" id="MPContent" runat="server">
<div class="breadcrumbs">
        <asp:hyperlink id="lnkAdminMenu" runat="server" navigateurl="~/Admin/AdminMenu.aspx" />&nbsp;&gt;
        <asp:hyperlink id="lnkAdvancedTools" runat="server" />&nbsp;&gt;
        <asp:hyperlink id="lnkDesignerTools" runat="server" />&nbsp;&gt;
        <asp:hyperlink id="lnkThisPage" runat="server" cssclass="selectedcrumb" />
    </div>
    <portal:mojoPanel ID="mp1" runat="server" ArtisteerCssClass="art-Post" RenderArtisteerBlockContentDivs="true">
        <mp:CornerRounderTop ID="ctop1" runat="server" EnableViewState="false" />
        <asp:panel id="pnl1" runat="server" cssclass="panelwrapper ">
            <portal:mojoPanel ID="MojoPanel1" runat="server" ArtisteerCssClass="art-PostContent">
                <div class="modulecontent">
                    <div class="settingrow">
                        <portal:mojoButton id="btnCssCacheToggle" runat="server" />
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="lblCacheInfo" runat="server" CssClass="cssinfo" ConfigKey="CssCacheInfo"
                            ResourceFile="Resource" UseLabelTag="false" />
                    </div>
                    <div class="settingrow">
                        <portal:mojoButton id="btnResetSkinVersionGuid" runat="server" />
                        <asp:Label ID="lblSkinGuid" runat="server" CssClass="skinguid" />
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="SiteLabel1" runat="server" CssClass="cssinfo" ConfigKey="SkinVersionGuidInfo"
                            ResourceFile="Resource" UseLabelTag="false" />
                    </div>
                </div>
            </portal:mojoPanel>
            <div class="cleared">
            </div>
        </asp:panel>
        <mp:CornerRounderBottom ID="cbottom1" runat="server" EnableViewState="false" />
    </portal:mojoPanel>
</asp:content>
<asp:content contentplaceholderid="rightContent" id="MPRightPane" runat="server" />
<asp:content contentplaceholderid="pageEditContent" id="MPPageEdit" runat="server" />
