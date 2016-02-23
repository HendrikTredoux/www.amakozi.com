<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="FeedManagerModule.ascx.cs" Inherits="mojoPortal.Web.FeedUI.FeedManagerModule" %>
<%@ Register TagPrefix="NeatHtml" Namespace="Brettle.Web.NeatHtml" Assembly="Brettle.Web.NeatHtml" %>
<%@ Register Namespace="mojoPortal.Web.FeedUI" Assembly="mojoPortal.Features.UI" TagPrefix="feed" %>
<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
<mp:CornerRounderTop ID="ctop1" runat="server" />
        <portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" cssclass="panelwrapper rssfeedmodule">
            <portal:ModuleTitleControl ID="Title1" runat="server" />
            <portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
            <feed:FeedManagerDisplaySettings ID="displaySettings" runat="server" />
                <asp:updatepanel id="updPnlRSSA" updatemode="Conditional" runat="server">
                    <contenttemplate>
        <portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent rsswrapper">
    
        <asp:Panel ID="divNav" runat="server" CssClass="rssnavright" SkinID="plain">
            <asp:Label ID="lblFeedListName" Font-Bold="True" runat="server"></asp:Label>
            <a id="lnkAggregateRSS" href="~/FeedManager/FeedAggregate.aspx" runat="server" enableviewstate="false">
                <img alt="RSS" id="imgAggregateRSS" src="/images/xml.gif" runat="server" enableviewstate="false" /></a>
            <br />
            <portal:mojoDataList ID="dlstFeedList" runat="server" EnableViewState="false">
                <ItemTemplate>
                    <asp:HyperLink ID="editLink" runat="server" EnableViewState="false" Text="<%# Resources.FeedResources.EditImageAltText%>"
                        ToolTip="<%# Resources.FeedResources.EditImageAltText%>" ImageUrl='<%# this.ImageSiteRoot + "/Data/SiteImages/" + EditContentImage %>'
                        NavigateUrl='<%# this.SiteRoot + "/FeedManager/FeedEdit.aspx?pageid=" + PageId.ToString() + "&amp;ItemID=" + DataBinder.Eval(Container.DataItem,"ItemID") + "&amp;mid=" + ModuleId.ToString()  %>'
                        Visible="<%# IsEditable %>" />
                    <asp:HyperLink ID="Hyperlink2" runat="server" EnableViewState="false" Visible="<%# LinkToAuthorSite %>" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.Url")%>'>
						<%# DataBinder.Eval(Container, "DataItem.Author")%>
                    </asp:HyperLink>
                    <asp:Button runat="server" Visible="<%# config.UseFeedListAsFilter %>" 
                        CommandName="filter" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.ItemID")%>' Text='<%# DataBinder.Eval(Container, "DataItem.Author")%>' CssClass="buttonlink" />
                    <asp:HyperLink ID="Hyperlink3" runat="server" EnableViewState="false" Visible="<%# config.ShowIndividualFeedLinks %>"
                        ImageUrl='<%# this.ImageSiteRoot + "/Data/SiteImages/" + RssImageFile %>' NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.RssUrl")%>'>
                    </asp:HyperLink>&nbsp;&nbsp;
                </ItemTemplate>
            </portal:mojoDataList>
        </asp:Panel>
        <asp:Panel ID="divFeedEntries" runat="server" CssClass="rsscenter-rightnav rssentries" SkinID="plain">
            <asp:Literal ID="lblFeedHeading" runat="server" Visible="false" EnableViewState="false" />
            
            <asp:Repeater ID="rptEntries" runat="server">
                <ItemTemplate>
                <asp:ImageButton CommandName="Confirm" CommandArgument='<%#DataBinder.Eval(Container, "DataItem.EntryHash") + "_" + Convert.ToString(DataBinder.Eval(Container, "DataItem.Confirmed")) %>' 
                ID="ConfirmBtn" runat="server" ImageUrl='<%# ConfirmImage + DataBinder.Eval(Container, "DataItem.Confirmed") + ".png"%>'
                visible='<%# EnableInPlaceEditing %>' AlternateText='<%# Convert.ToBoolean(DataBinder.Eval(Container, "DataItem.Confirmed"))?Resources.FeedResources.EntryPublishTrueAlternateText:Resources.FeedResources.EntryPublishFalseAlternateText %>' 
                />
                    <div class='<%#"rssfeedentry" + DataBinder.Eval(Container, "DataItem.Confirmed") %>' id="divFeedEntry" runat="server" enableviewstate="false">
                    <div class="rsstitle">
                    <NeatHtml:UntrustedContent ID="UntrustedContent2" runat="server" TrustedImageUrlPattern='<%# allowedImageUrlRegexPattern %>'
                            ClientScriptUrl="~/ClientScript/NeatHtml.js" EnableViewState="false">
                        <%# "<" + FeedItemHeadingElement + ">" %>
                            <a href='<%# DataBinder.Eval(Container, "DataItem.Link")%>' <%# GetOnClick() %>>
												<%# DataBinder.Eval(Container, "DataItem.Title").ToString()%>
                            </a><%# "</" + FeedItemHeadingElement + ">" %>
                        </NeatHtml:UntrustedContent>
                    </div>
                    <div class="rssdate" id="divDate" runat="server" visible='<%# config.ShowDate %>' enableviewstate="false">
                        <%# GetDateHeader((DateTime)DataBinder.Eval(Container, "DataItem.PubDate"))%>
                    </div>
                    <div class="rssfeedname" id="div2" runat="server" visible='<%# config.ShowFeedNameBeforeContent %>' enableviewstate="false">
                        <asp:HyperLink ID="Hyperlink6" runat="server" EnableViewState="false"  NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.BlogUrl")%>'>
												<%# Server.HtmlEncode(DataBinder.Eval(Container, "DataItem.FeedName").ToString())%>
                        </asp:HyperLink>
                    </div>
                    <div class="rsstext" id="divFeedBody" runat="server" enableviewstate="false" visible='<%# config.ShowItemDetail && !displaySettings.ForceShowHeadingsOnly %>'>
                        <NeatHtml:UntrustedContent ID="UntrustedContent1" runat="server" TrustedImageUrlPattern='<%# allowedImageUrlRegexPattern %>'
                            ClientScriptUrl="~/ClientScript/NeatHtml.js" Visible='<%# config.UseNeatHtml %>' EnableViewState="false">
                            <%# FormatBody(Eval("Description").ToString(), Eval("Link").ToString())%>
                        </NeatHtml:UntrustedContent>
                        <div id="unfilteredContent" runat="server" enableviewstate="false" visible='<%# (!config.UseNeatHtml) %>'>
                             <%# FormatBody(Eval("Description").ToString(), Eval("Link").ToString())%>
                        </div>
                    </div>
                    <div class="rssauthor" id="divAuthor" runat="server" enableviewstate="false" visible='<%# config.ShowAuthor %>'>
                        <asp:HyperLink ID="Hyperlink1" runat="server" EnableViewState="false"  NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.BlogUrl")%>'>
												<%# Server.HtmlEncode(DataBinder.Eval(Container, "DataItem.Author").ToString())%>
                        </asp:HyperLink>
                    </div>
                    <div class="rssfeedname" id="div1" runat="server" enableviewstate="false" visible='<%# config.ShowFeedName %>'>
                        <asp:HyperLink ID="Hyperlink5" runat="server" EnableViewState="false"  NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.BlogUrl")%>'>
												<%# Server.HtmlEncode(DataBinder.Eval(Container, "DataItem.FeedName").ToString())%>
                        </asp:HyperLink>
                    </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
            <mp:DataCalendar id="dataCal1"  runat="server" Visible="false"
            EnableTheming='false' 
            UseAccessibleHeader="true"
            SelectionMode="Day"
            DayField="PubDate"
            CssClass="mpcalendarmain"
            DayHeaderStyle-CssClass="mpcalendardayheader"
            DayStyle-CssClass="mpcalendarday"
            NextPrevStyle-CssClass="mpcalendarnextprevious"
            OtherMonthDayStyle-CssClass="mpcalendarothermonth"
            SelectedDayStyle-CssClass="mpcalendarselectedday"
            SelectorStyle-CssClass="mpcalendarselector"
             TitleStyle-CssClass="mpcalendartitle"
             TodayDayStyle-CssClass="mpcalendartoday"
             WeekendDayStyle-CssClass="mpcalendarweekendday"
             NextPrevStyle-BorderStyle="None"
            NextPrevStyle-BorderWidth="0px"
            DayHeaderStyle-BorderStyle="None"
            DayHeaderStyle-BorderWidth="0px"
            ShowGridLines="true"
            >
	    <ItemTemplate>
		    <br />
			    <asp:HyperLink ID="lnkItemUrl" runat="server" EnableViewState="false" NavigateUrl='<%# Container.DataItem["Link"] %>' Text='<%# Container.DataItem["Title"] %>' />
												
	    </ItemTemplate>
	    <NoEventsTemplate>
		    <% if (config.UseFillerOnEmptyDays)
         {%><br /><br /><br /><% }%>
	    </NoEventsTemplate>
    </mp:DataCalendar>
            
        </asp:Panel>
        <div class="modulepager">
        <portal:mojoCutePager ID="pgrRptEntries" runat="server" />
        </div>
    
    </portal:InnerBodyPanel>
</contenttemplate>
                </asp:updatepanel>
            </portal:OuterBodyPanel>
            <portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared" EnableViewState="false"></portal:EmptyPanel>
  </portal:InnerWrapperPanel>
 <mp:CornerRounderBottom ID="cbottom1" runat="server" />
</portal:OuterWrapperPanel>

