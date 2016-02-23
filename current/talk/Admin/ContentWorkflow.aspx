<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="ContentWorkflow.aspx.cs" Inherits="mojoPortal.Web.AdminUI.ContentWorkflowPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<div class="breadcrumbs">
<asp:HyperLink ID="lnkAdminMenu" runat="server" NavigateUrl="~/Admin/AdminMenu.aspx" />&nbsp;&gt;
<asp:HyperLink ID="lnkCurrentPage" runat="server" CssClass="selectedcrumb" />
</div>
<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server"  />
<portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" CssClass="panelwrapper contentworkflowpage adminmenu">
<portal:HeadingControl id="heading" runat="server" />
<portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
<portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
		<ul class="simplelist">		    
		    <li id="liAwaitingApproval" runat="server">
		        <asp:HyperLink ID="lnkAwaitingApproval" runat="server" CssClass="lnkAwaitingApproval" />
		    </li>	
		    <li id="liRejectedContent" runat="server">
		        <asp:HyperLink ID="lnkRejectedContent" runat="server" CssClass="lnkRejectedContent" />
		    </li>
		    <li id="liPendingPages" runat="server">
		        <asp:HyperLink ID="lnkPendingPages" runat="server" CssClass="lnkPendingPages" />
		    </li>		    
		</ul>
	</portal:InnerBodyPanel>	
</portal:OuterBodyPanel>
<portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
</portal:InnerWrapperPanel> 
<mp:CornerRounderBottom id="cbottom1" runat="server" />	
</portal:OuterWrapperPanel>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
