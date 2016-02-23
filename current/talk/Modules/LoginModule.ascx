<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="LoginModule.ascx.cs" Inherits="mojoPortal.Web.Modules.LoginModule" %>
<%@ Register TagPrefix="mp" TagName="Login" Src="~/Controls/LoginControl.ascx" %>
<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" />
<portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" cssclass="panelwrapper loginmodule">
<portal:ModuleTitleControl EditText="Edit"  runat="server" id="TitleControl" />
<portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
<portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
<div class="sslwarning">
<mp:SiteLabel ID="lblSslWarning" runat="server" CssClass="txterror" ConfigKey="UseSslWarning" Visible="false" ResourceFile="Resource" UseLabelTag="false" />
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
        <ContentTemplate>
<mp:Login ID="login1" runat="server" SetRedirectUrl="false" />
</ContentTemplate>
</asp:UpdatePanel>
</portal:InnerBodyPanel>
</portal:OuterBodyPanel>
<portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
</portal:InnerWrapperPanel>
<mp:CornerRounderBottom id="cbottom1" runat="server" />
</portal:OuterWrapperPanel>
