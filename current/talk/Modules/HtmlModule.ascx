<%@ Control language="c#" Inherits="mojoPortal.Web.ContentUI.HtmlModule" CodeBehind="HtmlModule.ascx.cs" AutoEventWireup="false" %>
<%@ Register Namespace="mojoPortal.Web.ContentUI" Assembly="mojoPortal.Web" TagPrefix="html" %>
<html:HtmlDisplaySettings ID="displaySettings" runat="server" />
<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" EnableViewState="false" />
<portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server"  CssClass="panelwrapper htmlmodule">
<portal:ModuleTitleControl id="Title1" runat="server" EditUrl="/Modules/HtmlEdit.aspx" EnableViewState="false" />
<portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
<portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
<portal:mojoRating runat="server" ID="Rating" Enabled="false" />
<portal:SlidePanel id="divContent" runat="server" EnableViewState="false" EnableSlideShow="false" class="slidecontainer"></portal:SlidePanel>
<portal:mojoRating runat="server" ID="RatingBottom" Enabled="false" />
<portal:FacebookLikeButton ID="fbLike" runat="server" Visible="false" />
</portal:InnerBodyPanel>
<portal:EmptyPanel id="divFooter" runat="server" CssClass="modulefooter" SkinID="modulefooter"></portal:EmptyPanel>
</portal:OuterBodyPanel>
<portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
</portal:InnerWrapperPanel>
<mp:CornerRounderBottom id="cbottom1" runat="server" EnableViewState="false" />
</portal:OuterWrapperPanel>
