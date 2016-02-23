<%@ Page Language="c#" CodeBehind="EditThread.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master"
    AutoEventWireup="false" Inherits="mojoPortal.Web.ForumUI.ForumThreadEdit" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <mp:CornerRounderTop ID="ctop1" runat="server" />
    <asp:Panel ID="pnlWrapper" runat="server" CssClass="panelwrapper forummodule">
        <asp:Panel ID="pnlEdit" runat="server" CssClass="modulecontent" DefaultButton="btnUpdate">
            <fieldset>
                <legend>
                    <mp:SiteLabel ID="lblForumThreadEditLabel" runat="server" ConfigKey="ForumThreadEditLabel"
                        ResourceFile="ForumResources" UseLabelTag="false" />
                </legend>
                <ol class="formlist">
                    <li class="settingrow">
                        <mp:SiteLabel ID="lblThreadSubjectLabel" runat="server" ForControl="txtSubject" CssClass="settinglabel"
                            ConfigKey="ForumThreadEditSubjectLabel" ResourceFile="ForumResources" />
                        <asp:TextBox ID="txtSubject" runat="server" MaxLength="255" CssClass="verywidetextbox forminput"></asp:TextBox>
                    </li>
                    <li class="settingrow">
                        <mp:SiteLabel ID="SiteLabel1" runat="server" ForControl="txtSortOrder" CssClass="settinglabel"
                            ConfigKey="StickySort" ResourceFile="ForumResources" />
                        <asp:TextBox ID="txtSortOrder" runat="server" MaxLength="10" Text="100" CssClass="smalltextbox forminput"></asp:TextBox>
                        <portal:mojoHelpLink ID="MojoHelpLink2" runat="server" HelpKey="forum-stickysort-help" />
                    </li>
                    <li class="settingrow">
                        <mp:SiteLabel ID="SiteLabel2" runat="server" ForControl="chkIsLocked" CssClass="settinglabel"
                            ConfigKey="Locked" ResourceFile="ForumResources" />
                       <asp:CheckBox ID="chkIsLocked" runat="server" />
                        <portal:mojoHelpLink ID="MojoHelpLink3" runat="server" HelpKey="forum-thread-islocked-help" />
                    </li>
                    <li class="settingrow">
                        <mp:SiteLabel ID="lblThreadForumLabel" runat="server" ForControl="ddForumList" CssClass="settinglabel"
                            ConfigKey="ForumThreadEditForumLabel" ResourceFile="ForumResources" />
                        <asp:DropDownList ID="ddForumList" runat="server" EnableTheming="false" CssClass="forminput"
                            AutoPostBack="False" DataTextField="Title" DataValueField="ItemID">
                        </asp:DropDownList>
                    </li>
                    <li class="settingrow">
                        <asp:Label ID="lblError" runat="server" CssClass="txterror"></asp:Label>
                    </li>
                    <li class="settingrow">
                        <mp:SiteLabel ID="SiteLabel35" runat="server" CssClass="settinglabel" ConfigKey="spacer" />
                        <div class="forminput">
                            <portal:mojoButton ID="btnUpdate" runat="server" Text="Update" />&nbsp;
                            <portal:mojoButton ID="btnDelete" runat="server" CausesValidation="false" />&nbsp;
                            <asp:HyperLink ID="lnkCancel" runat="server" />
                            <portal:mojoHelpLink ID="MojoHelpLink1" runat="server" HelpKey="forumthreadedithelp" />
                        </div>
                    </li>
                </ol>
            </fieldset>
        </asp:Panel>
        <asp:HiddenField ID="hdnReturnUrl" runat="server" />
    </asp:Panel>
    <mp:CornerRounderBottom ID="cbottom1" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
