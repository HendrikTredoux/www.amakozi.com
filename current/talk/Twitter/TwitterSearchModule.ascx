<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="TwitterSearchModule.ascx.cs" Inherits="mojoPortal.Features.UI.TwitterSearchModule" %>
<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" />
<portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" cssclass="panelwrapper TwitterSearch">
<portal:ModuleTitleControl  runat="server" id="TitleControl" />
<portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
<portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
<portal:TwitterWidget ID="twitter" runat="server" />
<mp:SiteLabel ID="lblNoSearch" runat="server" ConfigKey="NoSearchTermsConfigured" CssClass="txterror" ResourceFile="TwitterResources" UseLabelTag="false" Visible="false" />
</portal:InnerBodyPanel>
</portal:OuterBodyPanel>
<portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
</portal:InnerWrapperPanel>
<mp:CornerRounderBottom id="cbottom1" runat="server" />
</portal:OuterWrapperPanel>
