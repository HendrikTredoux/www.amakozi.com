<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="PostList.ascx.cs" Inherits="mojoPortal.Web.ForumUI.PostList" %>
<%@ Register Namespace="mojoPortal.Web.ForumUI" Assembly="mojoPortal.Features.UI" TagPrefix="forum" %>

<forum:ForumDisplaySettings ID="displaySettings" runat="server" />
<asp:Panel ID="pnlNotify" runat="server" Visible="false" CssClass="forumnotify">
    <asp:HyperLink ID="lnkNotify" runat="server" CssClass="fsubcribe1"  />
        &nbsp;<asp:HyperLink ID="lnkNotify2" runat="server" CssClass="fsubcribe2" />
    </asp:Panel>
    <div class="modulepager">
        <portal:mojoCutePager ID="pgrTop" runat="server" />
        <a href="" class="ModulePager newpost" id="lnkNewPost" runat="server" visible="false"></a>
        <asp:HyperLink ID="lnkLogin" runat="server" CssClass="ModulePager" />
    </div>
    <asp:Repeater ID="rptMessages" runat="server" EnableViewState="False">
        <ItemTemplate>
            <div class="forumpostheader">
                <%# FormatDate(Convert.ToDateTime(Eval("PostDate")))%>
            </div>
            <div class="postwrapper">
                <div class="postleft">
                    <div class="forumpostusername">
                        <asp:HyperLink Text="Edit" ID="Hyperlink2" ImageUrl='<%# ImageSiteRoot + "/Data/SiteImages/user_edit.png"  %>'
                            NavigateUrl='<%# SiteRoot + "/Admin/ManageUsers.aspx?userid=" + DataBinder.Eval(Container.DataItem,"UserID")   %>'
                            Visible="<%# IsAdmin %>" runat="server" />
                        <%# GetProfileLinkOrLabel(Convert.ToInt32(Eval("UserID")), Eval("PostAuthor").ToString())%>
                    </div>
                    <div class="forumpostuseravatar">
                        <%# GetAvatarUrl(Convert.ToInt32(Eval("UserID")), Eval("PostAuthorAvatar").ToString(), Eval("PostAuthor").ToString())%>
                        <portal:Gravatar ID="grav1" runat="server" Email='<%# Eval("AuthorEmail") %>' MaxAllowedRating='<%# MaxAllowedGravatarRating %>'
                            Visible='<%# allowGravatars %>' LinkUrl='<%# GetGravatarLinkUrl(Convert.ToInt32(Eval("UserID")))%>' LinkTitle='<%# GetGravatarLinkTitle(Eval("PostAuthor").ToString())%>' />
                    </div>
                    <div class="forumpostuserattribute">
                        <mp:SiteLabel ID="lblTotalPosts" runat="server" ConfigKey="ManageUsersTotalPostsLabel"
                            UseLabelTag="false" />
                        <%# Eval("PostAuthorTotalPosts") %>
                    </div>
                    <div class="forumpostuserattribute">
                        <portal:ForumUserThreadLink ID="lnkUserPosts" runat="server" UserId='<%# Convert.ToInt32(DataBinder.Eval(Container.DataItem,"UserID")) %>'
                            TotalPosts='<%# Convert.ToInt32(Eval("PostAuthorTotalPosts")) %>' />
                    </div>
                    <div id="divRevenue" runat="server" visible='<%# showUserRevenue %>' class="forumpostuserattribute">
                        <mp:SiteLabel ID="SiteLabel1" runat="server" ConfigKey="UserSalesLabel" ResourceFile="ForumResources"
                            UseLabelTag="false" />
                        <%# string.Format(currencyCulture, "{0:c}", Convert.ToDecimal(Eval("UserRevenue"))) %>
                    </div>
                    <div class="forumpostuserattribute" id="divUntrustedSignature" runat="server" visible='<%# !Convert.ToBoolean(Eval("Trusted")) %>'>
                        <NeatHtml:UntrustedContent ID="UntrustedContent2" runat="server" TrustedImageUrlPattern='<%# allowedImageUrlRegexPattern %>'
                            ClientScriptUrl="~/ClientScript/NeatHtml.js">
                            <%# Eval("PostAuthorSignature").ToString()%>
                        </NeatHtml:UntrustedContent>
                    </div>
                    <div class="forumpostuserattribute" id="divTrustedSignature" runat="server" visible='<%# Convert.ToBoolean(Eval("Trusted")) %>'>
                        <NeatHtml:UntrustedContent ID="UntrustedContent3" runat="server" TrustedImageUrlPattern='<%# allowedImageUrlRegexPattern %>'
                            ClientScriptUrl="~/ClientScript/NeatHtml.js">
                            <%# Eval("PostAuthorSignature").ToString()%>
                        </NeatHtml:UntrustedContent>
                    </div>
                            
                </div>
                <div class="postright">
                    <div class="posttopic">
                        <h3>
                            <a id='post<%# DataBinder.Eval(Container.DataItem,"PostID") %>'></a>
                            <asp:HyperLink  CssClass="postEdit" ToolTip="<%# Resources.ForumResources.ForumEditPostLink %>"
                                ID="editLink" 
                                NavigateUrl='<%# SiteRoot + "/Forums/EditPost.aspx?pageid=" + PageId.ToString() + "&amp;mid=" + ModuleId.ToString() + "&amp;ItemID=" + ItemId.ToString() + "&amp;postid=" + DataBinder.Eval(Container.DataItem,"PostID")  + "&amp;thread=" + DataBinder.Eval(Container.DataItem,"ThreadID") + "&amp;forumid=" + DataBinder.Eval(Container.DataItem,"ForumID") + "&amp;pagenumber=" + PageNumber.ToString()  %>'
                                Visible='<%# GetPermission(Convert.ToInt32(Eval("UserID")), Convert.ToBoolean(Eval("IsLocked")), Convert.ToDateTime(Eval("PostDate"))) %>' runat="server" />
                            <%# Server.HtmlEncode(Eval("Subject").ToString())%></h3>
                    </div>
                    <div class="postbody" id="divUntrustedPost" runat="server" visible='<%# !(Convert.ToBoolean(Eval("Trusted")) || filterContentFromTrustedUsers) %>'>
                        <NeatHtml:UntrustedContent ID="UntrustedContent1" runat="server" TrustedImageUrlPattern='<%# allowedImageUrlRegexPattern %>'
                            ClientScriptUrl="~/ClientScript/NeatHtml.js">
                            <%# Eval("Post").ToString()%>
                        </NeatHtml:UntrustedContent>
                    </div>
                    <div class="postbody" id="divTrustedPost" runat="server" visible='<%# (Convert.ToBoolean(Eval("Trusted")) && !filterContentFromTrustedUsers) %>'>
                            <%# Eval("Post").ToString()%>
                    </div>
                 
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="modulepager">
        <portal:mojoCutePager ID="pgrBottom" runat="server" />
        <a href="" class="ModulePager newpost" id="lnkNewPostBottom" runat="server" visible="false"></a>
        <asp:HyperLink ID="lnkLoginBottom" runat="server" CssClass="ModulePager" />
    </div>
