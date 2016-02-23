<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="PageMenu.ascx.cs" Inherits="mojoPortal.Web.UI.PageMenuControl" %>
<mp:CornerRounderTop id="topRounder" runat="server" />
<ContentTemplate>
<asp:PlaceHolder ID="menuPlaceHolder" runat="server" />
</ContentTemplate>
<mp:CornerRounderBottom id="bottomRounder" runat="server" />
