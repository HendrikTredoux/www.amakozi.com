<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="CssEditor.aspx.cs" Inherits="mojoPortal.Web.AdminUI.CssEditorPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <portal:mojoPanel ID="mp1" runat="server" ArtisteerCssClass="art-Post" RenderArtisteerBlockContentDivs="true">
<div class="breadcrumbs">
            <asp:hyperlink id="lnkAdminMenu" runat="server" navigateurl="~/Admin/AdminMenu.aspx" />&nbsp;&gt;
            <asp:hyperlink id="lnkAdvancedTools" runat="server" />&nbsp;&gt;
            <asp:hyperlink id="lnkDesignerTools" runat="server" />&nbsp;&gt;
            <asp:hyperlink id="lnkSkinList" runat="server" />&nbsp;&gt;
            <asp:hyperlink id="lnkSkin" runat="server" />&nbsp;&gt;
            <asp:hyperlink id="lnkThisPage" runat="server" cssclass="selectedcrumb" />
        </div>
<mp:CornerRounderTop id="ctop1" runat="server" EnableViewState="false"  />
<asp:Panel id="pnl1" runat="server" CssClass="panelwrapper ">
<portal:mojoPanel ID="MojoPanel1" runat="server" ArtisteerCssClass="art-PostContent">
<div class="modulecontent">

 <div class="settingrow">
        <asp:TextBox id="txtCss" runat="server" Rows="20" Columns="140" CssClass="csseditor" TextMode="MultiLine" />
    </div>
    <div class="settingrow">
    <portal:mojoButton id="btnSave" runat="server" />
    </div>

</div>
</portal:mojoPanel>
 <div class="cleared"></div>
</asp:Panel> 
<mp:CornerRounderBottom id="cbottom1" runat="server" EnableViewState="false" />	
</portal:mojoPanel>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" 
    runat="server" >
</asp:Content>
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" 
    runat="server" >
</asp:Content>

