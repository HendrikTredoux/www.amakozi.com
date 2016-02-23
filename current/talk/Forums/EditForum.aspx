<%@ Page Language="c#" ValidateRequest="false" CodeBehind="EditForum.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="mojoPortal.Web.ForumUI.ForumEdit" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <mp:CornerRounderTop ID="ctop1" runat="server" />
    <asp:Panel ID="pnlEdit" runat="server" DefaultButton="btnUpdate" CssClass="panelwrapper forumedit">
        <div class="modulecontent">
            <fieldset>
                <legend>
                    <mp:SiteLabel ID="lblForumLabel" runat="server" ConfigKey="ForumEditForumLabel" ResourceFile="ForumResources" UseLabelTag="false">
                    </mp:SiteLabel>
                </legend>
                <div class="forum">
                    <div class="settingrow">
                        <mp:SiteLabel ID="lblCreatedDateLabel" runat="server" CssClass="settinglabel" ConfigKey="ForumEditCreatedDateLabel" ResourceFile="ForumResources">
                        </mp:SiteLabel>
                        <asp:Label ID="lblCreatedDate" runat="server" CssClass="Normal forminput"></asp:Label>
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="lblTitleLabel" runat="server" ForControl="txtTitle" CssClass="settinglabel"
                            ConfigKey="ForumEditTitleLabel" ResourceFile="ForumResources"></mp:SiteLabel>
                        <asp:TextBox ID="txtTitle" runat="server" MaxLength="100" CssClass="widetextbox forminput"></asp:TextBox>
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="lblDescriptionLabel" runat="server" ForControl="fckDescription"
                            CssClass="settinglabel" ConfigKey="ForumEditDescriptionLabel" ResourceFile="ForumResources" />
                    </div>
                    <div class="settingrow">
                    <mpe:EditorControl ID="edContent" runat="server">
                        </mpe:EditorControl>
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="lblAllowAnonymousPosts" runat="server" ForControl="chkAllowAnonymousPosts"
                            CssClass="settinglabel" ConfigKey="AllowAnonymousPostsLabel" ResourceFile="ForumResources"></mp:SiteLabel>
                        <asp:CheckBox ID="chkAllowAnonymousPosts" runat="server" CssClass="forminput"></asp:CheckBox>
                    </div>
                    <div class="settingrow" id="divIsModerated" runat="server">
                        <mp:SiteLabel ID="lblIsModeratedLabel" runat="server" ForControl="chkIsModerated"
                            CssClass="settinglabel" ConfigKey="ForumEditIsModeratedLabel" ResourceFile="ForumResources"></mp:SiteLabel>
                        <asp:CheckBox ID="chkIsModerated" runat="server" CssClass="forminput"></asp:CheckBox>
                    </div>
                    <div class="settingrow" id="divIsActive" runat="server">
                        <mp:SiteLabel ID="lblIsActiveLabel" runat="server" ForControl="chkIsActive" CssClass="settinglabel"
                            ConfigKey="ForumEditIsActiveLabel" ResourceFile="ForumResources" />
                        <asp:CheckBox ID="chkIsActive" runat="server" CssClass="forminput"></asp:CheckBox>
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="lblSortOrderLabel" runat="server" ForControl="txtSortOrder" CssClass="settinglabel"
                            ConfigKey="ForumEditSortOrderLabel" ResourceFile="ForumResources" />
                        <asp:TextBox ID="txtSortOrder" runat="server" MaxLength="5" CssClass="smalltextbox forminput"></asp:TextBox>
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="lblPostsPerPageLabel" runat="server" ForControl="txtPostsPerPage"
                            CssClass="settinglabel" ConfigKey="ForumEditPostsPerPageLabel" ResourceFile="ForumResources" />
                        <asp:TextBox ID="txtPostsPerPage" runat="server" MaxLength="5" CssClass="smalltextbox forminput"></asp:TextBox>
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="lblThreadsPerPageLabel" runat="server" ForControl="txtThreadsPerPage"
                            CssClass="settinglabel" ConfigKey="ForumEditThreadsPerPageLabel" ResourceFile="ForumResources" />
                        <asp:TextBox ID="txtThreadsPerPage" runat="server" MaxLength="5" CssClass="smalltextbox forminput"></asp:TextBox>
                    </div>
                    <div class="settingrow">
                        <asp:Label ID="lblError" runat="server" CssClass="txterror"></asp:Label>
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="SiteLabel35" runat="server" CssClass="settinglabel" ConfigKey="spacer" />
                        <div class="forminput">
                        <portal:mojoButton ID="btnUpdate" runat="server" />&nbsp;
                        <portal:mojoButton ID="btnDelete" runat="server" CausesValidation="false" />&nbsp;
                        <asp:HyperLink ID="lnkCancel" runat="server" />
                        <portal:mojoHelpLink ID="MojoHelpLink1" runat="server" HelpKey="forumedithelp" />
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
        <asp:HiddenField ID="hdnReturnUrl" runat="server" />
    </asp:Panel>
    <mp:CornerRounderBottom ID="cbottom1" runat="server" />
    <portal:SessionKeepAliveControl ID="ka1" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
