<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="AvatarUploadDialog.aspx.cs"
    Inherits="mojoPortal.Web.Dialog.AvatarUploadDialog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <portal:StyleSheetCombiner ID="StyleSheetCombiner" runat="server" IncludejCrop="true" />
    <portal:ScriptLoader ID="ScriptInclude" runat="server" IncludeJQuery="true"  />
</head>
<body>
    <form id="form1" runat="server">
    <portal:ImageCropper ID="cropper" runat="server" />
    <asp:label id="lblMaxAvatarSize" runat="server" />
    <neatupload:inputfile id="avatarFile" style="width: 220px; height: 23px" runat="server" />
    <neatupload:progressbar id="progressBar" runat="server">
        <mp:SiteLabel ID="SiteLabel5" runat="server" ConfigKey="CheckProgressText"></mp:SiteLabel>
    </neatupload:progressbar>
    <asp:button id="btnUploadAvatar" runat="server" text="Upload" validationgroup="avatar">
    </asp:button>
    <asp:regularexpressionvalidator id="regexAvatarFile" controltovalidate="avatarFile"
        display="Dynamic" enableclientscript="True" runat="server" validationgroup="avatar" />
    </form>
</body>
</html>
