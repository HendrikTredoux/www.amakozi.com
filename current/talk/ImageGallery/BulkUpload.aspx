<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="BulkUpload.aspx.cs" Inherits="mojoPortal.Web.GalleryUI.BulkUploadPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" EnableViewState="false"  />
<asp:Panel id="pnl1" runat="server" CssClass="panelwrapper ">
<div class="modulecontent">
<fieldset class="galleryedit">
<legend>
    <mp:SiteLabel ID="lblGalleryEditImageLabel" runat="server" ConfigKey="BulkUploadHeading"
        ResourceFile="GalleryResources" UseLabelTag="false"></mp:SiteLabel>
</legend>

<div class="settingrow">
    <NeatUpload:MultiFile ID="multiFile" runat="server" UseFlashIfAvailable="true" FlashFilterExtensions="*.jpg;*.gif;*.png">
        <portal:mojoButton ID="btnAddFile"  Enabled="true" runat="server" />
    </NeatUpload:MultiFile>
</div>
<NeatUpload:ProgressBar ID="progressBar" runat="server">
    <mp:SiteLabel ID="progresBarLabel" runat="server" ConfigKey="CheckProgressText">
    </mp:SiteLabel>
</NeatUpload:ProgressBar>
<portal:mojoButton ID="btnUpload" runat="server" /><br />
<asp:RegularExpressionValidator ID="regexUpload" ControlToValidate="multiFile" ValidationExpression="(([^.;]*[.])+(jpg|gif|png|JPG|GIF|PNG); *)*(([^.;]*[.])+(jpg|gif|png|JPG|GIF|PNG))?$"
    Display="Static" ErrorMessage="Only jpg, gif, and png extensions allowed" EnableClientScript="True"
    runat="server" />
                
<div class="settingrow">
<asp:HyperLink ID="lnkCancel" runat="server" CssClass="cancellink" />&nbsp;
<asp:Label ID="lblError" runat="server" CssClass="txterror"></asp:Label>
<asp:HiddenField ID="hdnReturnUrl" runat="server" />
</div>
</fieldset>
</div>
</asp:Panel> 
<mp:CornerRounderBottom id="cbottom1" runat="server" EnableViewState="false" />	
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
