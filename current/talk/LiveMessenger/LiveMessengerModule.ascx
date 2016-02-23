<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="LiveMessengerModule.ascx.cs" Inherits="mojoPortal.Features.UI.LiveMessengerModule" %>

<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" />
<portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" cssclass="panelwrapper LiveMessenger">
<portal:ModuleTitleControl EditText="" EditUrl="" runat="server" id="TitleControl" />
<portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
<portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
<portal:LiveMessengerControl ID="chat1" runat="server"
    Invitee=""
    Height="300"
    Width="300"
    InviteeDisplayName=""
    OverrideCulture=""
    UseTheme="true"
    ThemeName="blue"
/>
<asp:Panel ID="pnlCopyCidFromUser" runat="server" Visible="false">
<asp:Label ID="lblCopyFromProfileInstructions" runat="server" />
<portal:mojoButton ID="btnCopyFromProfile" runat="server" />
</asp:Panel>
</portal:InnerBodyPanel>
</portal:OuterBodyPanel>
<portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
</portal:InnerWrapperPanel>
<mp:CornerRounderBottom id="cbottom1" runat="server" />
</portal:OuterWrapperPanel>
