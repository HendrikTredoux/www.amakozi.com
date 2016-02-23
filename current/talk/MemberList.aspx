<%@ Page language="c#" Codebehind="MemberList.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="mojoPortal.Web.UI.Pages.MemberList" %>


<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<div id="divBreadCrumbs" runat="server" visible="false" class="breadcrumbs">
   <asp:HyperLink ID="lnkAdminMenu" runat="server" NavigateUrl="~/Admin/AdminMenu.aspx" CssClass="unselectedcrumb" EnableViewState="false" />
</div>
<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" />
<portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" CssClass="panelwrapper memberlist" DefaultButton="btnSearchUser">
	<portal:HeadingControl ID="heading" runat="server" />	
	<portal:OuterBodyPanel ID="pnlOuterBody" runat="server">	
	<portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
	<asp:Panel CssClass="modulesubtitle" id="divNewUser" runat="server" DefaultButton="btnSearchUser">
	    <asp:TextBox ID="txtSearchUser" runat="server" CssClass="mediumtextbox" MaxLength="255" />
	    <portal:mojoButton ID="btnSearchUser" runat="server" />
		<asp:HyperLink ID="lnkNewUser" runat="server" Visible="false" /> 
		<span id="spnIPLookup" runat="server" visible="false" class="iplookup">
		    <asp:TextBox ID="txtIPAddress" runat="server" CssClass="mediumtextbox" MaxLength="50" />
	        <portal:mojoButton ID="btnIPLookup" runat="server" />
		</span>
	</asp:Panel>	
    <asp:Panel ID="pnlLocked" runat="server" CssClass="settingrow padded lockedbutton">
            <portal:mojoButton ID="btnFindLocked" visible="false" runat="server" />
            <portal:mojoButton ID="btnFindNotApproved" Visible="false" runat="server" />
        </asp:Panel>
	<div class="modulepager">
	    <asp:HyperLink ID="lnkAllUsers" runat="server" CssClass="ModulePager" EnableViewState="false" />
	    <span id="spnTopPager"  runat="server" ></span>
	</div>
	<div class="AspNet-GridView">		
	<table  cellspacing="0" width="100%">
		<thead>
		<tr>
			<th id='t1' >
				<mp:SiteLabel id="lblUserNameLabel" runat="server" ConfigKey="MemberListUserNameLabel" UseLabelTag="false"></mp:SiteLabel>
			</th>
			<th  id='t2'>
				<mp:SiteLabel id="SiteLabel2" runat="server" ConfigKey="MemberListDateCreatedLabel" UseLabelTag="false"></mp:SiteLabel>
			</th>
			<th  id="thWebLink" runat="server" >
				<mp:SiteLabel id="lblUserWebSite" runat="server" ConfigKey="MemberListUserWebSiteLabel" UseLabelTag="false"></mp:SiteLabel>
			</th>
			<th  id='thForumPosts' runat="server">
				<mp:SiteLabel id="lblTotalPosts" runat="server" ConfigKey="MemberListUserTotalPostsLabel" UseLabelTag="false"></mp:SiteLabel>
			</th>
			<th></th>
		</tr></thead><tbody>
		<asp:Repeater id="rptUsers" runat="server" EnableViewState="False">
			<ItemTemplate>
				<tr >
					<td headers='t1'>
						<strong><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "Name").ToString())%></strong>
						<div runat="server" visible='<%# mojoPortal.Web.WebConfigSettings.ShowEmailInMemberList %>'>
						&nbsp;<a href='<%# "mailto:" + Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "Email").ToString())%>'><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "Email").ToString())%></a>
						 </div>
						 <div runat="server" visible='<%# mojoPortal.Web.WebConfigSettings.ShowLoginNameInMemberList %>'>
						 &nbsp;<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "LoginName").ToString())%>
						 </div>
						 <div id="Div1" runat="server" visible='<%# mojoPortal.Web.WebConfigSettings.ShowUserIDInMemberList %>'>
						 &nbsp;<mp:SiteLabel id="lblTotalPosts" runat="server" ConfigKey="RegisterLoginNameLabel" UseLabelTag="false"></mp:SiteLabel>
						 <%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "UserID").ToString())%>
						 </div>
						 <div id="Div4" runat="server" visible='<%# (IsAdmin && (!Convert.ToBoolean(Eval("DisplayInMemberList")))) %>' class="floatrightimage isvisible">
						 <%# Resources.Resource.HiddenUser%>
						 </div>
						 
					</td>
					<td headers='t2'>
                        <%# DateTimeHelper.Format(Convert.ToDateTime(Eval("DateCreated")), timeZone, "d", timeOffset)%>
					</td>
					<td headers='<%# thWebLink.ClientID %>' id="tdWebLink" runat="server" visible='<%# ShowWebSiteColumn %>' >
						<a rel="nofollow"  href='<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"WebSiteUrl").ToString()) %>'><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "WebSiteUrl").ToString())%></a>
					</td>
					<td id="tdForumPosts" runat="server" visible='<%# ShowForumPostColumn %>' headers='<%# thForumPosts.ClientID %>' enableviewstate="false">
						<%# DataBinder.Eval(Container.DataItem,"TotalPosts") %>
						<portal:ForumUserThreadLink id="lnkUserPosts" runat="server" UserId='<%# Convert.ToInt32(DataBinder.Eval(Container.DataItem,"UserID")) %>' TotalPosts='<%# Convert.ToInt32(DataBinder.Eval(Container.DataItem,"TotalPosts")) %>' />
					</td>
					<td>
						<a href='<%# SiteRoot + "/ProfileView.aspx?userid=" + DataBinder.Eval(Container.DataItem,"UserID") %>'><mp:SiteLabel id="lblViewProfile" runat="server" ConfigKey="MemberListViewProfileLabel" UseLabelTag="false"></mp:SiteLabel></a>&nbsp;&nbsp;
					    <asp:HyperLink Text='<%# Resources.Resource.ManageUserLink %>' id="Hyperlink2" 
						    NavigateUrl='<%# SiteRoot + "/Admin/ManageUsers.aspx?userid=" + DataBinder.Eval(Container.DataItem,"UserID")   %>' 
						    Visible="<%# canManageUsers %>" runat="server" EnableViewState="false" />
					</td>
				</tr>
			</ItemTemplate>
			<alternatingItemTemplate>
				<tr class="AspNet-GridView-Alternate">
					<td headers='t1'>
						<strong><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "Name").ToString())%></strong>
						<div id="Div3" runat="server" enableviewstate="false" visible='<%# mojoPortal.Web.WebConfigSettings.ShowEmailInMemberList %>'>
						&nbsp;<a href='<%# "mailto:" + Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "Email").ToString())%>'><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "Email").ToString())%></a>
					    </div>
					    <div id="Div2" runat="server" enableviewstate="false" visible='<%# mojoPortal.Web.WebConfigSettings.ShowLoginNameInMemberList %>'>
						 &nbsp;<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "LoginName").ToString())%>
						 </div>
						 <div id="Div1" runat="server" enableviewstate="false" visible='<%# mojoPortal.Web.WebConfigSettings.ShowUserIDInMemberList %>'>
						 &nbsp;<mp:SiteLabel id="lblTotalPosts" runat="server" ConfigKey="RegisterLoginNameLabel" UseLabelTag="false"></mp:SiteLabel>
						 <%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem, "UserID").ToString())%>
						 </div>
						 <div id="Div4" runat="server" enableviewstate="false" visible='<%# (IsAdmin && (!Convert.ToBoolean(Eval("DisplayInMemberList")))) %>' class="floatrightimage isvisible">
						 <%# Resources.Resource.HiddenUser%>
						 </div>
					</td>
					<td headers='t2'>
					    <%# DateTimeHelper.Format(Convert.ToDateTime(Eval("DateCreated")), timeZone, "d", timeOffset)%>
					</td>
					<td headers='<%# thWebLink.ClientID %>' id="tdWebLink2" runat="server" enableviewstate="false" visible='<%# ShowWebSiteColumn %>'>
						<a rel="nofollow" href='<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"WebSiteUrl").ToString()) %>'><%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"WebSiteUrl").ToString()) %></a>
					</td>
					<td id="tdForumPosts" runat="server" enableviewstate="false" visible='<%# ShowForumPostColumn %>' headers='t4'>
						<%# DataBinder.Eval(Container.DataItem,"TotalPosts") %>
						<portal:ForumUserThreadLink id="lnkUserPosts" runat="server" UserId='<%# Convert.ToInt32(DataBinder.Eval(Container.DataItem,"UserID")) %>' TotalPosts='<%# Convert.ToInt32(DataBinder.Eval(Container.DataItem,"TotalPosts")) %>' />
					</td>
					<td>
						<a href='<%# SiteRoot + "/ProfileView.aspx?userid=" + DataBinder.Eval(Container.DataItem,"UserID") %>'><mp:SiteLabel id="Sitelabel1" runat="server" ConfigKey="MemberListViewProfileLabel" UseLabelTag="false"></mp:SiteLabel></a>&nbsp;&nbsp;
					    <asp:HyperLink Text='<%# Resources.Resource.ManageUserLink %>' id="Hyperlink1"  
						    NavigateUrl='<%# SiteRoot + "/Admin/ManageUsers.aspx?userid=" + DataBinder.Eval(Container.DataItem,"UserID")   %>' 
						    Visible="<%# canManageUsers %>" runat="server" EnableViewState="false" />
					</td>
				</tr>
			</AlternatingItemTemplate>
		</asp:Repeater></tbody>
	</table>
	</div>	
	<div class="modulepager">
		<portal:mojoCutePager ID="pgrMembers" runat="server" />
	</div>
    <portal:MemberListDisplaySettings id="displaySettings" runat="server" />
	</portal:InnerBodyPanel>
	</portal:OuterBodyPanel>
	<portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
</portal:InnerWrapperPanel>
<mp:CornerRounderBottom id="cbottom1" runat="server" />
</portal:OuterWrapperPanel>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
