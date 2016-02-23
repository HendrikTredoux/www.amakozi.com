<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="UserThreadListAlt.ascx.cs" Inherits="mojoPortal.Web.ForumUI.UserThreadListAlt" %>
<div class="modulepager">
		<portal:mojoCutePager ID="pgrTop" runat="server" />
	</div>
	
<asp:Repeater id="rptForums" runat="server" >
	<HeaderTemplate><ul class="simplelist threadlist"></HeaderTemplate>
	<ItemTemplate>
		<li class='forumwrap threadwrap'>
			<div class="threadtitle"> 
				<img alt="" src='<%# ImageSiteRoot + "/Data/SiteImages/thread.gif"  %>'  />
				<a href="Thread.aspx?thread=<%# DataBinder.Eval(Container.DataItem,"ThreadID") %>&amp;mid=<%# DataBinder.Eval(Container.DataItem,"ModuleID") %>&amp;pageid=<%# DataBinder.Eval(Container.DataItem,"PageID") %>&amp;ItemID=<%# DataBinder.Eval(Container.DataItem,"ForumID") %>">
					<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "ThreadSubject").ToString())%></a>
			</div>
			<div class="threadstartedby">  
                <mp:SiteLabel id="lblForumStartedBy" runat="server" ConfigKey="ForumViewStartedByLabel" ResourceFile="ForumResources" UseLabelTag="false" CssClass="fstatlabel" />
				<%# DataBinder.Eval(Container.DataItem, "StartedBy")%>
			</div>
		</li>
	</ItemTemplate>
	<alternatingItemTemplate>
		<li class='forumwrap threadwrap threadwrapalt'>
			<div class="threadtitle"> 
				<img alt="" src='<%# ImageSiteRoot + "/Data/SiteImages/thread.gif"  %>'  />
				<a href="Thread.aspx?thread=<%# DataBinder.Eval(Container.DataItem,"ThreadID") %>&amp;mid=<%# DataBinder.Eval(Container.DataItem,"ModuleID") %>&amp;pageid=<%# DataBinder.Eval(Container.DataItem,"PageID") %>&amp;ItemID=<%# DataBinder.Eval(Container.DataItem,"ForumID") %>">
					<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "ThreadSubject").ToString())%></a>
			</div>
			<div class="threadstartedby">  
                <mp:SiteLabel id="SiteLabel1" runat="server" ConfigKey="ForumViewStartedByLabel" ResourceFile="ForumResources" UseLabelTag="false" CssClass="fstatlabel" />
				<%# DataBinder.Eval(Container.DataItem, "StartedBy")%>
			</div>
		</li>
	</AlternatingItemTemplate>
	<FooterTemplate></ul></FooterTemplate>
</asp:Repeater>
	
	<div class="modulepager">
		<portal:mojoCutePager ID="pgrBottom" runat="server" />
	</div>
