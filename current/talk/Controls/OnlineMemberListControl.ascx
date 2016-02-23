<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OnlineMemberListControl.ascx.cs" Inherits="mojoPortal.Web.UI.OnlineMemberListControl" %>

<asp:Repeater ID="rptOnlineMembers" runat="server" EnableViewState="false">
 <HeaderTemplate>
 <ul class="userstats">
    <li>
        <mp:SiteLabel id="slMembersOnline" runat="server"  ConfigKey="OnlineMembersLabel" UseLabelTag="false" />
    </li>
    <li><ul class="userstats">
 </HeaderTemplate>
 <ItemTemplate>
 <li class="whoson" >
 <%# GetAvatarUrl(DataBinder.Eval(Container.DataItem, "UserID"), DataBinder.Eval(Container.DataItem, "Name").ToString(), DataBinder.Eval(Container.DataItem, "AvatarUrl").ToString())%>
 <portal:Gravatar ID="grav1" runat="server" EnableViewState="false" Email='<%# Eval("Email") %>' MaxAllowedRating='<%# MaxAllowedGravatarRating %>' Visible='<%# allowGravatars %>' Size="60"  /><br />
 <asp:HyperLink Text="Edit" id="Hyperlink2" EnableViewState="false" 
	ImageUrl='<%# Page.ResolveUrl("~/Data/SiteImages/user_edit.png") %>' 
	NavigateUrl='<%# SiteRoot + "/Admin/ManageUsers.aspx" + "?userid=" + DataBinder.Eval(Container.DataItem,"UserID") %>' 
	Visible="<%# IsAdmin %>" runat="server" />
 <%# SiteUtils.GetProfileLink(Page, DataBinder.Eval(Container.DataItem,"UserID"),DataBinder.Eval(Container.DataItem,"Name")) %>
 </li>
 </ItemTemplate>
 <FooterTemplate>
 </ul>
 </li>
 </ul>
 </FooterTemplate>
</asp:Repeater>
