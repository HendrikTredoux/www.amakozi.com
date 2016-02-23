<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="Edit.aspx.cs" Inherits="mojoPortal.Web.GalleryUI.FolderGalleryEditPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <mp:CornerRounderTop ID="ctop1" runat="server" />
    <asp:Panel ID="pnlWrapper" runat="server" CssClass="panelwrapper xmlmodule">
        <div class="modulecontent">
            <fieldset class="foldergallery">
                <legend>
                    <mp:SiteLabel ID="lblSettings" runat="server" ConfigKey="FolderGalleryEditHeading"
                        ResourceFile="FolderGalleryResources" UseLabelTag="false"></mp:SiteLabel>
                </legend>
                <asp:Panel ID="pnlEdit" runat="server" CssClass="modulecontent" DefaultButton="btnSave">
                    <div class="settingrow">
                        <asp:Label ID="lblBasePath" runat="server" AssociatedControlID="txtFolderName"></asp:Label>
                        <asp:TextBox ID="txtFolderName" runat="server"></asp:TextBox>
                        <asp:Label ID="lblError" runat="server" CssClass="txterror"></asp:Label>
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="SiteLabel35" runat="server" CssClass="settinglabel" ConfigKey="spacer" />
                        <portal:mojoButton ID="btnSave" runat="server" />&nbsp;
                        <asp:HyperLink ID="lnkCancel" runat="server" CssClass="cancellink" />&nbsp;
                        <portal:mojoHelpLink ID="MojoHelpLink1" runat="server" HelpKey="foldergalleryedithelp" />
                    </div>
                </asp:Panel>
            </fieldset>
            <asp:Panel ID="pnlUpload" runat="server" DefaultButton="btnUpload">
                <fieldset class="foldergallery">
                    <legend>
                        <mp:SiteLabel ID="SiteLabel1" runat="server" ConfigKey="FolderGalleryUploadHeading"
                            ResourceFile="FolderGalleryResources" UseLabelTag="false"></mp:SiteLabel>
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
                </fieldset>
            </asp:Panel>
        </div>
    </asp:Panel>
    <mp:CornerRounderBottom ID="cbottom1" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
