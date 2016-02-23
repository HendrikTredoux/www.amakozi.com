<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="FeaturePermissions.aspx.cs" Inherits="mojoPortal.Web.AdminUI.FeaturePermissionsPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<portal:mojoPanel ID="mp1" runat="server" ArtisteerCssClass="art-Post" RenderArtisteerBlockContentDivs="true">
<mp:CornerRounderTop id="ctop1" runat="server" EnableViewState="false"  />
<asp:Panel id="pnl1" runat="server" CssClass="panelwrapper admin featurepermission">
<portal:mojoPanel ID="MojoPanel1" runat="server" ArtisteerCssClass="art-PostContent">
<div class="modulecontent">
<fieldset id="pnlExistingSettings" runat="server" class="moduledefinitionsettings">
   <legend>
   <asp:HyperLink ID="lnkAdminMenu" runat="server" NavigateUrl="~/Admin/AdminMenu.aspx" />&nbsp;&gt;
    <asp:HyperLink ID="lnkModuleAdmin" runat="server" NavigateUrl="~/Admin/ModuleAdmin.aspx" />&nbsp;&gt;
    <asp:HyperLink ID="lnkModuleDefinition" runat="server"  />&nbsp;&gt;
    <mp:SiteLabel id="lbl1" runat="server" ConfigKey="FeaturePermissionsLink"></mp:SiteLabel>
   </legend>
   <div class="settingrow frinstructions">
   <p>
   <asp:Literal ID="litInfo" runat="server" />
   </p>
   </div>
   <div class="settingrow">
   <asp:CheckBoxList ID="chklAllowedRoles" runat="server"></asp:CheckBoxList>
   </div>
   <div class="settingrow">
   <portal:mojoButton ID="btnSave" runat="server" />
   </div>
   </fieldset>
</div>
</portal:mojoPanel>
 <div class="cleared"></div>
</asp:Panel> 
<mp:CornerRounderBottom id="cbottom1" runat="server" EnableViewState="false" />	
</portal:mojoPanel>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
