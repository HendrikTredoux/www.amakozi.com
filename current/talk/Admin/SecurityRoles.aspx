<%@ Page language="c#" CodeBehind="SecurityRoles.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="mojoPortal.Web.AdminUI.SecurityRoles" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<asp:Panel id="pnlSecurity" runat="server"  CssClass="securityroles">
    <fieldset>
    <legend>
        <asp:HyperLink ID="lnkAdminMenu" runat="server" NavigateUrl="~/Admin/AdminMenu.aspx" />&nbsp;&gt;
        <asp:HyperLink ID="lnkRoleManager" runat="server" NavigateUrl="~/Admin/RoleManager.aspx" />&nbsp;&gt;
        <span id="spnTitle" runat="server"></span>
    </legend>
    <div class="modulecontent">
        <asp:HyperLink id="lnkFindUser" runat="server" CssClass="cblink" />
        <asp:HiddenField ID="hdnUserID" runat="server" />
        <asp:ImageButton ID="btnSetUserFromGreyBox" runat="server" />
    </div>
    <div class="modulecontent">
        <asp:Repeater ID="rptRoleMembers" runat="server">
            <HeaderTemplate>
                <ul class="simplelist">
            </HeaderTemplate>
            <ItemTemplate>
                <li class="simplelist">
                    <asp:ImageButton ImageUrl='<%# DeleteLinkImage %>' 
                    AlternateText='<%# Resources.Resource.ManageUsersRemoveFromRoleButton %>'
                     ToolTip='<%# Resources.Resource.ManageUsersRemoveFromRoleButton %>'
                    CommandName="delete" 
                    CommandArgument='<%# DataBinder.Eval(Container.DataItem, "UserID") %>' runat="server" ID="btnDelete"  />
				<asp:Label Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' runat="server" ID="Label1" EnableViewState="false" />
                <asp:HyperLink ID="lnkManageUser" runat="server" EnableViewState="false" Visible='<%# CanManageUsers %>'
                    NavigateUrl='<%# SiteRoot + "/Admin/ManageUsers.aspx?userid=" + Eval("UserID") %>' Text='<%# Resources.Resource.ManageUsersPageTitle %>' />
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <div class="modulecontent">
        <portal:mojoLabel id="Message" runat="server" CssClass="txterror" />
    </div>
    <div class="modulepager">
        <portal:mojoCutePager ID="pgr" runat="server" />
    </div>
    </fieldset>
</asp:Panel>
	
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
