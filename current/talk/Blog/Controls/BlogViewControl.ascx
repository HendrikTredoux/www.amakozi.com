<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="BlogViewControl.ascx.cs" Inherits="mojoPortal.Web.BlogUI.BlogViewControl" %>
<%@ Register TagPrefix="blog" TagName="NavControl" Src="~/Blog/Controls/BlogNav.ascx" %>
<%@ Register Namespace="mojoPortal.Web.BlogUI" Assembly="mojoPortal.Features.UI" TagPrefix="blog" %>
<portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" CssClass="panelwrapper blogwrapper blogview">
    <portal:HeadingControl ID="heading" runat="server" />
    <portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
        <portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
            <blog:BlogDisplaySettings ID="displaySettings" runat="server" />
            <blog:NavControl ID="navTop" runat="server" ShowCalendar="false" />
            <asp:panel id="divblog" runat="server" cssclass="blogcenter-rightnav" skinid="plain" defaultbutton="btnPostComment">
                <blog:BlogDatePanel ID="pnlDateTop" runat="server" CssClass="blogdate">
                    <span class="blogauthor"><asp:literal id="litAuthor" runat="server" enableviewstate="false" visible="false" /></span>
                    <span class="bdate"><asp:literal id="litStartDate" runat="server" enableviewstate="false" /></span>
                    <asp:Repeater id="rptTopCategories" runat="server" EnableViewState="false" Visible='false'>
                        <HeaderTemplate><span class="blogtags tagslabel"><mp:sitelabel id="lblcatTop" runat="server" ConfigKey='<%# CategoriesResourceKey %>' ResourceFile="BlogResources" UseLabelTag="false" ShowWarningOnMissingKey="false" /></span><span class="blogtags"> </HeaderTemplate>
                        <ItemTemplate>
                        <asp:HyperLink id="Hyperlink5" runat="server" EnableViewState="false" 
                                Text='<%# Eval("Category").ToString() %>' 
                                NavigateUrl='<%# this.SiteRoot + "/Blog/ViewCategory.aspx?cat=" + DataBinder.Eval(Container.DataItem,"CategoryID") + "&amp;mid=" + ModuleId.ToString() + "&amp;pageid=" + PageId.ToString() %>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                        <FooterTemplate></span></FooterTemplate>
                     </asp:Repeater>
                </blog:BlogDatePanel>
                <blog:BlogPagerPanel ID="divTopPager" runat="server" CssClass="blogpager">
                    <asp:hyperlink id="lnkPreviousPostTop" runat="server" visible="false" CssClass="postlink prevpost" enableviewstate="false">
                    </asp:hyperlink>
                    <asp:hyperlink id="lnkNextPostTop" runat="server" visible="false" CssClass="postlink nextpost" enableviewstate="false">
                    </asp:hyperlink>
                </blog:BlogPagerPanel>
                <asp:panel id="pnlDetails" runat="server">
                    <portal:mojoRating runat="server" ID="Rating" Enabled="false" />
                    <mp:OdiogoItem ID="odiogoPlayer" runat="server" EnableViewState="false" />
                    <div class="blogtext">
                        <asp:literal id="litDescription" runat="server" enableviewstate="false" />
                    </div>
                    <portal:LocationMap ID="gmap" runat="server" EnableViewState="false" Visible="false">
                    </portal:LocationMap>
                    <portal:BingMap id="bmap" runat="server" Visible="false" EnableViewState="false" />
                    <asp:panel id="divDirections" runat="server" visible="false" cssclass="settingrow directionsrow"
                        defaultbutton="btnGetBingDirections">
                        <portal:mojoButton ID="btnGetBingDirections" runat="server" />
                        <asp:textbox id="txtFromLocation" runat="server" cssclass="widetextbox fromlocationtb" />
                    </asp:panel>
                    <asp:panel id="pnlBingDirections" runat="server" cssclass="drivingdirections">
                    </asp:panel>
                </asp:panel>
                <blog:BlogDatePanel ID="pnlBottomDate" runat="server" Visible="false" CssClass="blogdate">
                    <span class="blogauthor"><asp:literal id="litAuthorBottom" runat="server" enableviewstate="false" visible="false" /></span>
                    <span class="bdate"><asp:literal id="litStartDateBottom" runat="server" enableviewstate="false" /></span>
                    <asp:Repeater id="rptBottomCategories" runat="server" EnableViewState="false" Visible='false'>
                        <HeaderTemplate><span class="blogtags tagslabel"><mp:sitelabel id="lblcatBottom" runat="server" ConfigKey='<%# CategoriesResourceKey %>' ResourceFile="BlogResources" UseLabelTag="false" ShowWarningOnMissingKey="false" /></span><span class="blogtags"> </HeaderTemplate>
                        <ItemTemplate>
                        <asp:HyperLink id="Hyperlink5" runat="server" EnableViewState="false" 
                                Text='<%# Eval("Category").ToString() %>' 
                                NavigateUrl='<%# this.SiteRoot + "/Blog/ViewCategory.aspx?cat=" + DataBinder.Eval(Container.DataItem,"CategoryID") + "&amp;mid=" + ModuleId.ToString() + "&amp;pageid=" + PageId.ToString() %>'>
                            </asp:HyperLink>
                        </ItemTemplate>
                        <FooterTemplate></span></FooterTemplate>
                     </asp:Repeater>
                </blog:BlogDatePanel>
                <div class="blogcopyright">
                    <asp:label id="lblCopyright" runat="server" EnableViewState="false" />
                </div>
                <portal:mojoRating runat="server" ID="RatingBottom" Enabled="false" />
                <div class="bsocial">
                    <div class="blogaddthis">
                        <mp:AddThisButton ID="addThis1" runat="server" EnableViewState="false" />
                    </div>
                    <portal:TweetThisLink ID="tweetThis1" runat="server" EnableViewState="false" />
                    <portal:FacebookLikeButton ID="fblike" runat="server" Visible="false" EnableViewState="false" />
                    <portal:PlusOneButton ID="btnPlusOne" runat="server" Visible="false" SkinID="BlogDetail" EnableViewState="false" />
                </div>
                <blog:BlogPagerPanel ID="divBottomPager" runat="server" EnableViewState="false" CssClass="blogpager blogpagerbottom">
                    <asp:hyperlink id="lnkPreviousPost" runat="server" CssClass="postlink prevpost" visible="false" enableviewstate="false">
                    </asp:hyperlink>
                    <asp:hyperlink id="lnkNextPost" runat="server" visible="false" CssClass="postlink nextpost" enableviewstate="false">
                    </asp:hyperlink>
                </blog:BlogPagerPanel>
                <div class="blogcommentservice">
                    <portal:IntenseDebateDiscussion ID="intenseDebate" runat="server" EnableViewState="false" />
                    <portal:DisqusWidget ID="disqus" runat="server" RenderPoweredBy="false" EnableViewState="false" />
                </div>
                <blog:BlogCommentPanel id="pnlFeedback" runat="server" CssClass="bcommentpanel">
                    <fieldset>
                        <legend>
                            <mp:SiteLabel ID="lblFeedback" runat="server" ConfigKey="BlogFeedbackLabel" ResourceFile="BlogResources"
                                EnableViewState="false"></mp:SiteLabel>
                        </legend>
                        <div class="blogcomments">
                            <asp:repeater id="dlComments" runat="server" enableviewstate="true" onitemcommand="dlComments_ItemCommand">
                                <itemtemplate>
			        <h3 class="blogtitle">
				        <asp:ImageButton id="btnDelete" runat="server"  
				            AlternateText="<%# Resources.BlogResources.DeleteImageAltText %>" 
				            Tooltip="<%# Resources.BlogResources.DeleteImageAltText %>"   
				            ImageUrl='<%# DeleteLinkImage %>'
				            CommandName="DeleteComment" 
				            CommandArgument='<%# DataBinder.Eval(Container.DataItem,"BlogCommentID")%>' 
				            Visible="<%# IsEditable%>" />
				        <asp:Literal ID="litTitle" runat="server" EnableViewState="false" Text='<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"Title").ToString()) %>' />
				        
			        </h3>
			        <div >
				        <asp:Label id="Label2" Visible="True" runat="server" EnableViewState="false"
				            CssClass="blogdate" 
				            Text='<%# FormatCommentDate(Convert.ToDateTime(Eval("DateCreated"))) %>' />
				        <asp:Label id="Label3" runat="server" EnableViewState="false"
				            Visible='<%# (bool) (DataBinder.Eval(Container.DataItem, "URL").ToString().Length == 0) %>' 
				            CssClass="blogcommentposter">
					        <%#  Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"Name").ToString()) %>
				        </asp:Label>
				        <asp:HyperLink id="Hyperlink2" runat="server"  EnableViewState="false" 
				            Visible='<%# (bool) (DataBinder.Eval(Container.DataItem, "URL").ToString().Length != 0) %>' 
				            Text='<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"Name").ToString()) %>' 
				            NavigateUrl='<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"URL").ToString())%>' 
				            CssClass="blogcommentposter">
				        </asp:HyperLink>
			        </div>
			        <div class="blogcommenttext">
			        <NeatHtml:UntrustedContent ID="UntrustedContent1" runat="server" EnableViewState="false"  TrustedImageUrlPattern='<%# RegexRelativeImageUrlPatern %>' ClientScriptUrl="~/ClientScript/NeatHtml.js">
                    <asp:Literal ID="litComment" runat="server" EnableViewState="false" Text='<%# DataBinder.Eval(Container.DataItem, "Comment").ToString() %>' />
                    </NeatHtml:UntrustedContent>
			        </div>
		        </itemtemplate>
                            </asp:repeater>
                            <asp:panel id="pnlNewComment" runat="server">
                                <div class="settingrow">
                                    <mp:SiteLabel ID="lblCommentTitle" runat="server" ForControl="txtCommentTitle" CssClass="settinglabel"
                                        ConfigKey="BlogCommentTitleLabel" ResourceFile="BlogResources" EnableViewState="false">
                                    </mp:SiteLabel>
                                    <asp:textbox id="txtCommentTitle" runat="server" maxlength="100" enableviewstate="false"
                                        cssclass="forminput widetextbox">
                                    </asp:textbox>
                                </div>
                                <div class="settingrow">
                                    <mp:SiteLabel ID="lblCommentUserName" runat="server" ForControl="txtName" CssClass="settinglabel"
                                        ConfigKey="BlogCommentUserNameLabel" ResourceFile="BlogResources" EnableViewState="false">
                                    </mp:SiteLabel>
                                    <asp:textbox id="txtName" runat="server" maxlength="100" enableviewstate="false"
                                        cssclass="forminput widetextbox">
                                    </asp:textbox>
                                </div>
                                <div id="divCommentUrl" runat="server" class="settingrow">
                                    <mp:SiteLabel ID="lblCommentURL" runat="server" ForControl="txtURL" CssClass="settinglabel"
                                        ConfigKey="BlogCommentUrlLabel" ResourceFile="BlogResources" EnableViewState="false">
                                    </mp:SiteLabel>
                                    <asp:textbox id="txtURL" runat="server" maxlength="200" enableviewstate="false" cssclass="forminput widetextbox">
                                    </asp:textbox>
                                </div>
                                <div class="settingrow">
                                    <mp:SiteLabel ID="lblRememberMe" runat="server" ForControl="chkRememberMe" CssClass="settinglabel"
                                        ConfigKey="BlogCommentRemeberMeLabel" ResourceFile="BlogResources" EnableViewState="false">
                                    </mp:SiteLabel>
                                    <asp:checkbox id="chkRememberMe" runat="server" enableviewstate="false" cssclass="forminput">
                                    </asp:checkbox>
                                </div>
                                <div class="settingrow">
                                    <mp:SiteLabel ID="SiteLabel1" runat="server" CssClass="settinglabel" ConfigKey="BlogCommentCommentLabel"
                                        ResourceFile="BlogResources" EnableViewState="false"></mp:SiteLabel>
                                </div>
                                <div class="settingrow">
                                    <mpe:EditorControl ID="edComment" runat="server">
                                    </mpe:EditorControl>
                                </div>
                                <asp:panel id="pnlAntiSpam" runat="server">
                                    <mp:CaptchaControl ID="captcha" runat="server" />
                                </asp:panel>
                                <div class="settingrow">
                                    <asp:validationsummary id="vSummary" runat="server" validationgroup="blogcomments" />
                                    <asp:regularexpressionvalidator id="regexUrl" runat="server" controltovalidate="txtURL"
                                        display="Dynamic" validationgroup="blogcomments" validationexpression="(((http(s?))\://){1}\S+)">
                                    </asp:regularexpressionvalidator>
                                </div>
                                <div class="modulebuttonrow">
                                    <portal:mojoButton id="btnPostComment" Runat="server" Text="Submit" />
                                </div>
                            </asp:panel>
                            <asp:panel id="pnlCommentsClosed" runat="server" enableviewstate="false">
                                <asp:literal id="litCommentsClosed" runat="server" enableviewstate="false" />
                            </asp:panel>
                            <asp:panel id="pnlCommentsRequireAuthentication" runat="server" visible="false" enableviewstate="false">
                                <asp:literal id="litCommentsRequireAuthentication" runat="server" enableviewstate="false" />
                            </asp:panel>
                        </div>
                    </fieldset>
                </blog:BlogCommentPanel>
            </asp:panel>
            <asp:panel id="pnlExcerpt" runat="server" visible="false">
                <div class="blogtext">
                    <asp:literal id="litExcerpt" runat="server" enableviewstate="false" />
                </div>
                <mp:SiteLabel ID="SiteLabel2" runat="server" CssClass="settinglabel" ConfigKey="MustSignInToViewFullPost"
                    ResourceFile="BlogResources" EnableViewState="false"></mp:SiteLabel>
            </asp:panel>
            <blog:NavControl ID="navBottom" runat="server" ShowCalendar="false" />
        </portal:InnerBodyPanel>
    </portal:OuterBodyPanel>
    <portal:EmptyPanel ID="divCleared" runat="server" CssClass="cleared" SkinID="cleared">
    </portal:EmptyPanel>
</portal:InnerWrapperPanel>
