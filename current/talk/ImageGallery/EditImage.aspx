<%@ Page Language="c#" CodeBehind="EditImage.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="mojoPortal.Web.GalleryUI.GalleryImageEdit" %>

<%@ Register TagPrefix="NeatUpload" Namespace="Brettle.Web.NeatUpload" Assembly="Brettle.Web.NeatUpload" %>
<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <mp:CornerRounderTop ID="ctop1" runat="server" />
    <asp:Panel ID="pnlWrapper" runat="server" CssClass="panelwrapper gallerymodule">
        <asp:Panel ID="pnlEdit" runat="server" CssClass="modulecontent" DefaultButton="btnUpdate">
            <fieldset class="galleryedit">
                <legend>
                    <mp:SiteLabel ID="lblGalleryEditImageLabel" runat="server" ConfigKey="GalleryEditImageLabel"
                        ResourceFile="GalleryResources" UseLabelTag="false"></mp:SiteLabel>
                </legend>
                <div class="settingrow">
                    <mp:SiteLabel ID="Sitelabel2" ForControl="fckDescription" CssClass="settinglabel"
                        runat="server" ConfigKey="GalleryDescriptionLabel" ResourceFile="GalleryResources">
                    </mp:SiteLabel>
                    <br />
                </div>
                <div class="settingrow">
                    <mpe:EditorControl ID="edDescription" runat="server">
                    </mpe:EditorControl>
                </div>
                <div class="settingrow">
                    <mp:SiteLabel ID="Sitelabel1" runat="server" ForControl="txtCaption" CssClass="settinglabel"
                        ConfigKey="GalleryCaptionLabel" ResourceFile="GalleryResources"></mp:SiteLabel>
                    <asp:TextBox ID="txtCaption" runat="server" MaxLength="255" Columns="50" CssClass="widetextbox forminput"></asp:TextBox>
                </div>
                <div class="settingrow">
                    <mp:SiteLabel ID="lblDisplayOrder" runat="server" ForControl="txtDisplayOrder" CssClass="settinglabel"
                        ConfigKey="GalleryDisplayOrderLabel" ResourceFile="GalleryResources"></mp:SiteLabel>
                    <asp:TextBox ID="txtDisplayOrder" runat="server" MaxLength="10" Text="100" CssClass="smalltextbox forminput"></asp:TextBox>
                </div>
                <div class="settingrow">
                    <img alt=" " id="imgThumb" runat="server" src="/Data/SiteImages/1x1.gif" />
                </div>
                <div class="settingrow">
                    <mp:SiteLabel ID="Sitelabel3" runat="server" ForControl="flImage" CssClass="settinglabel"
                        ConfigKey="GalleryFileLabel" ResourceFile="GalleryResources"></mp:SiteLabel>
                    <div class="forminput">
                        <NeatUpload:InputFile ID="flImage" Size="50" runat="server" />
                        <NeatUpload:ProgressBar ID="progressBar" Inline="false" runat="server">
                            <mp:SiteLabel ID="progresBarLabel" runat="server" ConfigKey="CheckProgressText" />
                        </NeatUpload:ProgressBar>
                    </div>
                </div>
                <div class="settingrow">
                    <portal:mojoLabel ID="lblMessage" runat="server" CssClass="txterror" />
                </div>
                <div class="settingrow">
                    <mp:SiteLabel ID="SiteLabel35" runat="server" CssClass="settinglabel" ConfigKey="spacer" />
                    <div class="forminput">
                        <portal:mojoButton ID="btnUpdate" runat="server" />&nbsp;&nbsp;
                        <portal:mojoButton ID="btnDelete" runat="server" CausesValidation="false" />&nbsp;&nbsp;
                        <asp:HyperLink ID="lnkCancel" runat="server" CssClass="cancellink" />&nbsp;
                        <portal:mojoHelpLink ID="MojoHelpLink1" runat="server" HelpKey="galleryedithelp" /><br />
                        <asp:RegularExpressionValidator id="regexFile" 
				            ControlToValidate="flImage"
				            ValidationExpression="(([^.;]*[.])+(jpg|gif|png|JPG|GIF|PNG); *)*(([^.;]*[.])+(jpg|gif|png|JPG|GIF|PNG))?$"
				            Display="Static"
				            EnableClientScript="True" 
				            runat="server"/>
                    </div>
                </div>
            </fieldset>
        </asp:Panel>
        <asp:HiddenField ID="hdnReturnUrl" runat="server" />
    </asp:Panel>
    <mp:CornerRounderBottom ID="cbottom1" runat="server" />
    <portal:SessionKeepAliveControl ID="ka1" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
