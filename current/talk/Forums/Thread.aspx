<%@ Page Language="c#" CodeBehind="Thread.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="mojoPortal.Web.ForumUI.ForumThreadView" %>
<%@ Register TagPrefix="forum" TagName="PostList" Src="~/Forums/Controls/PostList.ascx" %>
<%@ Register TagPrefix="forum" TagName="PostListAlt" Src="~/Forums/Controls/PostListAlt.ascx" %>
<%@ Register Namespace="mojoPortal.Web.ForumUI" Assembly="mojoPortal.Features.UI" TagPrefix="forum" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<div class="breadcrumbs forumthreadcrumbs">
                 <asp:HyperLink ID="lnkPageCrumb" runat="server" CssClass="unselectedcrumb"></asp:HyperLink>
                &gt; <a href="" id="lnkForum" runat="server"></a>
                <asp:Literal ID="litThreadDescription" runat="server" />
            </div>
<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
    <mp:CornerRounderTop ID="ctop1" runat="server" EnableViewState="false" />
    <portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" CssClass="panelwrapper forumthreadview" EnableViewState="false">
        <forum:ForumDisplaySettings ID="displaySettings" runat="server" />
        <portal:HeadingControl ID="heading" runat="server" CssClass="threadheading" />
        <portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
        <portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent"> 
            <div id="divDescription" runat="server" class="settingrow forumdesc">
                <asp:Literal ID="litForumDescription" runat="server" />
            </div>
            
            <forum:PostList id="postList" runat="server" />
            <forum:PostListAlt id="postListAlt" runat="server" Visible="false" />
        </portal:InnerBodyPanel>
        </portal:OuterBodyPanel>
        <portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
    </portal:InnerWrapperPanel>
    <mp:CornerRounderBottom ID="cbottom1" runat="server" EnableViewState="false" />
    </portal:OuterWrapperPanel>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
