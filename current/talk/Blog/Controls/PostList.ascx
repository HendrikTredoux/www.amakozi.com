<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="PostList.ascx.cs" Inherits="mojoPortal.Web.BlogUI.PostList" %>
<%@ Register TagPrefix="blog" TagName="NavControl" Src="~/Blog/Controls/BlogNav.ascx" %>
<%@ Register Namespace="mojoPortal.Web.BlogUI" Assembly="mojoPortal.Features.UI" TagPrefix="blog" %>

<blog:BlogDisplaySettings ID="displaySettings" runat="server" />
<blog:NavControl ID="navTop" runat="server" />
<asp:Panel ID="divblog" runat="server" CssClass="blogcenter-rightnav" SkinID="plain">
    <asp:Repeater ID="rptBlogs" runat="server" SkinID="Blog" EnableViewState="False">
        <ItemTemplate>
            <div class="blogitem">
                <<%# itemHeadingElement %> class="blogtitle">
                    <asp:HyperLink SkinID="BlogTitle" ID="lnkTitle" runat="server" EnableViewState="false" CssClass="blogitemtitle"
                        Text='<%# DataBinder.Eval(Container.DataItem,"Heading") %>' Visible='<%# Config.UseLinkForHeading %>'
                        NavigateUrl='<%# FormatBlogTitleUrl(DataBinder.Eval(Container.DataItem,"ItemUrl").ToString(), Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ItemID")))  %>'>
                    </asp:HyperLink><asp:Literal ID="litTitle" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Heading") %>'
                        Visible='<%#(!Config.UseLinkForHeading) %>' />&nbsp;
                    <asp:HyperLink ID="editLink" runat="server" EnableViewState="false" Text="<%# EditLinkText %>"
                        ToolTip="<%# EditLinkTooltip %>" ImageUrl='<%# EditLinkImageUrl %>' NavigateUrl='<%# this.SiteRoot + "/Blog/EditPost.aspx?pageid=" + PageId.ToString() + "&amp;ItemID=" + DataBinder.Eval(Container.DataItem,"ItemID") + "&amp;mid=" + ModuleId.ToString() %>'
                        Visible="<%# IsEditable %>" CssClass="ModuleEditLink" /></<%# itemHeadingElement %>>
                <% if (!displaySettings.PostListUseBottomDate)
                   { %>
                <div class="blogdate">
                    <span class="blogauthor">
                        <%# FormatPostAuthor(DataBinder.Eval(Container.DataItem, "Name").ToString())%></span>
                    <span class="bdate">
                        <%# FormatBlogDate(Convert.ToDateTime(Eval("StartDate"))) %></span>
                        <asp:Repeater id="rptTopCategories" runat="server" Visible='<%# displaySettings.ShowTagsOnPostList %>'>
                            <HeaderTemplate><span class="blogtags tagslabel"><mp:sitelabel id="lblcatBottom" runat="server" ConfigKey='<%# CategoriesResourceKey %>' ResourceFile="BlogResources" UseLabelTag="false" ShowWarningOnMissingKey="false" /></span><span class="blogtags"> </HeaderTemplate>
                            <ItemTemplate>
                            <asp:HyperLink id="Hyperlink6" runat="server" EnableViewState="false" 
                                    Text='<%# Eval("Category").ToString() %>' 
                                    NavigateUrl='<%# this.SiteRoot + "/Blog/ViewCategory.aspx?cat=" + DataBinder.Eval(Container.DataItem,"CategoryID") + "&amp;mid=" + ModuleId.ToString() + "&amp;pageid=" + PageId.ToString() %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate></span></FooterTemplate>
                            </asp:Repeater>
                </div>
                <% } %>
                <asp:Panel ID="pnlPost" runat="server" Visible='<%# !TitleOnly %>'>
                    <portal:mojoRating runat="server" ID="Rating" Enabled='<%# EnableContentRating && !displaySettings.UseBottomContentRating %>'
                        ContentGuid='<%# new Guid(Eval("BlogGuid").ToString()) %>' AllowFeedback='false' />
                    <mp:OdiogoItem ID="od1" runat="server" OdiogoFeedId='<%# Config.OdiogoFeedId %>'
                        ItemId='<%# DataBinder.Eval(Container.DataItem,"ItemID") %>' ItemTitle='<%# Eval("Heading") %>' />
                    <div class="blogtext">
                        <%# FormatBlogEntry(DataBinder.Eval(Container.DataItem, "Description").ToString(), DataBinder.Eval(Container.DataItem, "Abstract").ToString(), DataBinder.Eval(Container.DataItem, "ItemUrl").ToString(), Convert.ToInt32(Eval("ItemID")))%></div>
                    <portal:LocationMap ID="gmap" runat="server" Visible='<%# ((Eval("Location").ToString().Length > 0)&&(ShowGoogleMap &&(!Config.UseBingMap))) %>'
                        Location='<%# Eval("Location") %>' GMapApiKey='<%# GmapApiKey %>' EnableMapType='<%# Config.GoogleMapEnableMapType %>'
                        EnableZoom='<%# Config.GoogleMapEnableZoom %>' ShowInfoWindow='<%# Config.GoogleMapShowInfoWindow %>'
                        EnableLocalSearch='<%# Config.GoogleMapEnableLocalSearch %>' EnableDrivingDirections='<%# Config.GoogleMapEnableDirections %>'
                        GmapType='<%# Config.GoogleMapType %>' ZoomLevel='<%# Config.GoogleMapInitialZoom %>'
                        MapHeight='<%# Config.GoogleMapHeight %>' MapWidth='<%# Config.GoogleMapWidth %>'>
                    </portal:LocationMap>
                    <portal:BingMap id="bmap" runat="server" Visible='<%# ((Eval("Location").ToString().Length > 0)&&(ShowGoogleMap && Config.UseBingMap)) %>' Location='<%# Eval("Location") %>'
                        MapStyle='<%# Config.BingMapStyle %>' Height='<%# Config.GoogleMapHeight %>' Width='<%# Config.GoogleMapWidth %>'
                        ShowGetDirections='<%# Config.GoogleMapEnableDirections %>' Zoom='<%# Config.GoogleMapInitialZoom %>' ShowMapControls='<%# Config.GoogleMapEnableMapType %>'
                        ShowLocationPin='<%# Config.GoogleMapShowInfoWindow %>'  />
                    
                    <% if (displaySettings.PostListUseBottomDate)
                       { %>
                    <div class="blogdate">
                        <span class="blogauthor">
                            <%# FormatPostAuthor(DataBinder.Eval(Container.DataItem, "Name").ToString())%></span>
                        <span class="bdate">
                            <%# FormatBlogDate(Convert.ToDateTime(Eval("StartDate"))) %></span>
                            <asp:Repeater id="rptBottomCategories" runat="server" Visible='<%# displaySettings.ShowTagsOnPostList %>'>
                            <HeaderTemplate><span class="blogtags tagslabel"><mp:sitelabel id="lblcatBottom" runat="server" ConfigKey='<%# CategoriesResourceKey %>' ResourceFile="BlogResources" UseLabelTag="false" ShowWarningOnMissingKey="false" /></span><span class="blogtags"> </HeaderTemplate>
                            <ItemTemplate>
                            <asp:HyperLink id="Hyperlink5" runat="server" EnableViewState="false" 
                                    Text='<%# Eval("Category").ToString() %>' 
                                    NavigateUrl='<%# this.SiteRoot + "/Blog/ViewCategory.aspx?cat=" + DataBinder.Eval(Container.DataItem,"CategoryID") + "&amp;pageid=" + PageId.ToString() + "&amp;mid=" + ModuleId.ToString()  %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate></span></FooterTemplate>
                            </asp:Repeater>
                    </div>
                    <% } %>
                    <portal:mojoRating runat="server" ID="Rating2" Enabled='<%# EnableContentRating && displaySettings.UseBottomContentRating %>'
                        ContentGuid='<%# new Guid(Eval("BlogGuid").ToString()) %>' AllowFeedback='false' />
                    <div class="bsocial">
                    <mp:AddThisButton ID="addThis1" runat="server" AccountId='<%# addThisAccountId %>'
                        Visible='<%# (!Config.HideAddThisButton) %>' UseMouseOverWidget='<%# Config.UseAddThisMouseOverWidget %>'
                        Text='<%# Resources.BlogResources.AddThisButtonAltText %>' TitleOfUrlToShare='<%# DataBinder.Eval(Container.DataItem,"Heading") %>'
                        CustomBrand='<%# addThisCustomBrand %>' CustomOptions='<%# Config.AddThisCustomOptions %>'
                        CustomLogoUrl='<%# Config.AddThisCustomLogoUrl %>' CustomLogoBackgroundColor='<%# Config.AddThisCustomLogoBackColor %>'
                        CustomLogoColor='<%# Config.AddThisCustomLogoForeColor %>' ButtonImageUrl='<%# Config.AddThisButtonImageUrl %>'
                        UrlToShare='<%# this.SiteRoot + DataBinder.Eval(Container.DataItem,"ItemUrl").ToString().Replace("~", string.Empty)  %>' />
                    <portal:TweetThisLink id="tt1" runat="server" Visible='<%# ShowTweetThisLink %>' UrlToTweet='<%# FormatBlogTitleUrl(DataBinder.Eval(Container.DataItem,"ItemUrl").ToString(), Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ItemID"))) %>' TitleToTweet='<%# DataBinder.Eval(Container.DataItem,"Heading") %>' />
                    <portal:FacebookLikeButton ID="fbl1" runat="server" Visible='<%# UseFacebookLikeButton %>' 
                        UrlToLike='<%# FormatBlogTitleUrl(DataBinder.Eval(Container.DataItem,"ItemUrl").ToString(), Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ItemID"))) %>'
                            ColorScheme='<%# Config.FacebookLikeButtonTheme %>' ShowFaces='<%# Config.FacebookLikeButtonShowFaces %>'
                            WidthInPixels='<%# Config.FacebookLikeButtonWidth %>' HeightInPixels='<%# Config.FacebookLikeButtonHeight %>' />
                    <portal:PlusOneButton ID="btnPlusOne" runat="server" TargetUrl='<%# FormatBlogTitleUrl(DataBinder.Eval(Container.DataItem,"ItemUrl").ToString(), Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ItemID"))) %>' 
                        Visible='<%# ShowPlusOneButton %>' SkinID="BlogPostList"
                        />
                    </div>
                    <div class="blogcommentlink">
                        <asp:HyperLink ID="Hyperlink2" runat="server" EnableViewState="false" Text='<%# FeedBackLabel + "(" + DataBinder.Eval(Container.DataItem,"CommentCount") + ")" %>'
                            Visible='<%# AllowComments %>' NavigateUrl='<%# FormatBlogUrl(DataBinder.Eval(Container.DataItem,"ItemUrl").ToString(), Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ItemID")))  %>'
                            CssClass="blogcommentlink"></asp:HyperLink>
                        <asp:HyperLink ID="Hyperlink1" runat="server" EnableViewState="false" Text='<%# FeedBackLabel %>'
                            Visible='<%# Config.AllowComments && !ShowCommentCounts %>' NavigateUrl='<%# FormatBlogUrl(DataBinder.Eval(Container.DataItem,"ItemUrl").ToString(), Convert.ToInt32(DataBinder.Eval(Container.DataItem,"ItemID")))  %>'
                            CssClass="blogcommentlink"></asp:HyperLink>&#160;
                    </div>
                </asp:Panel>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="blogpager">
    <portal:mojoCutePager ID="pgr" runat="server" />
    </div>
</asp:Panel>
<blog:NavControl ID="navBottom" runat="server" />
<div class="blogcopyright">
    <asp:Label ID="lblCopyright" runat="server" />
</div>
<portal:DisqusWidget ID="disqus" runat="server" />


