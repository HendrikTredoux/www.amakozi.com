<%@ Control Language="c#" AutoEventWireup="false" Codebehind="Gallery.ascx.cs" Inherits="mojoPortal.Web.GalleryUI.GalleryControl" %>
<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" EnableViewState="false" />
<portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" CssClass="panelwrapper gallerymodule">
<portal:ModuleTitleControl id="Title1" runat="server" />
<portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
<portal:InnerBodyPanel ID="pnlSl" runat="server" Visible="false" CssClass="modulecontent">
<portal:VertigoSlideshow ID="slideShow" runat="server" />
</portal:InnerBodyPanel>
<portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
<asp:UpdatePanel ID="upGallery" UpdateMode="Conditional" runat="server">
<ContentTemplate>
<div class="modulecontent">
<portal:mojoCutePager ID="pager" runat="server" />
<div class="mojogallery">
<asp:Repeater id="rptGallery" runat="server">
    <HeaderTemplate><ul class="simplehorizontalmenu gallerylist"></HeaderTemplate>
	<ItemTemplate>
        <li class="galleryitem">
	    <%# GetThumnailImageLink(DataBinder.Eval(Container.DataItem, "ItemID").ToString(), DataBinder.Eval(Container.DataItem, "ThumbnailFile").ToString(), DataBinder.Eval(Container.DataItem, "WebImageFile").ToString(), DataBinder.Eval(Container.DataItem, "Caption").ToString()) %>
		<asp:ImageButton ID="btnThumb" runat="server" EnableViewState='<%# useViewState %>' Visible='<%# (!UseLightboxMode) %>' ImageUrl='<%# GetThumnailUrl(Eval("ThumbnailFile").ToString()) %>' CommandName="setimage" CommandArgument='<%# Eval("ItemID") %>' />
		<span class="txtmed galleryedit" id="spnEdit" runat="server" Visible="<%# IsEditable %>">
				<asp:HyperLink id="editLink" runat="server" EnableViewState="false"
				    Text="<%# Resources.GalleryResources.GalleryEditImageLink %>" 
				    Tooltip="<%# Resources.GalleryResources.GalleryEditImageLink %>" 
				    ImageUrl='<%# this.ImageSiteRoot + "/Data/SiteImages/" + EditContentImage %>' 
				    NavigateUrl='<%# this.SiteRoot + "/ImageGallery/EditImage.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ItemID") + "&amp;mid=" + ModuleId.ToString() + "&amp;pageid=" + this.PageId.ToString() %>' 
				    Visible="<%# IsEditable %>"
				     />
				</span></li> 
	</ItemTemplate>
    <FooterTemplate></ul></FooterTemplate>
</asp:Repeater>

</div>
<div class="divgalleryimage">
<asp:Panel id="pnlGallery" runat="server" SkinID="plain" EnableViewState="false"></asp:Panel>
<asp:Label ID="lblCaption" Runat="server" EnableViewState="false"></asp:Label><br />
<asp:Label ID="lblDescription" Runat="server" EnableViewState="false"></asp:Label><br /><br />
</div>
<div class="divgalleryimagemeta">
<asp:Panel ID="pnlImageDetails" runat="server" SkinID="plain" EnableViewState="false" >
	<asp:xml ID="xmlMeta" runat="server" />
</asp:Panel>
</div>
</div>
</ContentTemplate>
</asp:UpdatePanel>
</portal:InnerBodyPanel>
</portal:OuterBodyPanel>
<portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
</portal:InnerWrapperPanel>
<mp:CornerRounderBottom id="cbottom1" runat="server" EnableViewState="false" />
</portal:OuterWrapperPanel>
