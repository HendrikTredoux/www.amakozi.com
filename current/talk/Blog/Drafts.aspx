<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="Drafts.aspx.cs" Inherits="mojoPortal.Web.BlogUI.BlogDraftsPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">

<portal:mojoPanel ID="mp1" runat="server" ArtisteerCssClass="art-Post" RenderArtisteerBlockContentDivs="true">
<mp:CornerRounderTop ID="ctop1" runat="server" />
<asp:Panel id="divblog" runat="server" cssclass="panelwrapper blogdrafts" SkinID="plain">
        <h2 class="moduletitle"><asp:Label id="litHeader" runat="server" Visible="True" /></h2>
        <portal:mojoPanel ID="MojoPanel1" runat="server" ArtisteerCssClass="art-PostContent">
        <div class="modulecontent ">
		<asp:repeater id="rptDrafts" runat="server"  EnableViewState="False" >
			<ItemTemplate>
			    <h3 class="blogtitle">
				<asp:HyperLink id="Title" runat="server"  SkinID="plain"
				    Text='<%# Server.HtmlEncode(DataBinder.Eval(Container.DataItem,"Heading").ToString()) %>' 
				    NavigateUrl='<%# SiteRoot + "/Blog/EditPost.aspx?pageid=" + PageId.ToString() + "&ItemID=" + DataBinder.Eval(Container.DataItem,"ItemID") + "&mid=" + ModuleId %>'>
				</asp:HyperLink>&#160;</h3>
				<div class="blogcontent">
				<asp:Literal ID="litPubInfo" runat="server" Text='<%# Resources.BlogResources.BlogToBePublishedLabel + FormatBlogDate(Convert.ToDateTime(Eval("StartDate"))) %>' 
				Visible='<%# Convert.ToBoolean(Eval("IsPublished")) %>' />
				</div>
			</ItemTemplate>
		</asp:repeater>
        </div>
        </portal:mojoPanel>
        <div class="cleared"></div>
    </asp:Panel>

    <mp:CornerRounderBottom ID="cbottom1" runat="server" />
</portal:mojoPanel>
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />