<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="EditLoginInfo.aspx.cs" Inherits="mojoPortal.Web.AdminUI.EditLoginInfo" %>

<asp:content contentplaceholderid="leftContent" id="MPLeftPane" runat="server" />
<asp:content contentplaceholderid="mainContent" id="MPContent" runat="server">
    <div class="breadcrumbs">
        <asp:hyperlink id="lnkAdminMenu" runat="server" navigateurl="~/Admin/AdminMenu.aspx" />&nbsp;&gt;
        <asp:hyperlink id="lnkCurrentPage" runat="server" cssclass="selectedcrumb" />
    </div>
    <portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
        <mp:CornerRounderTop ID="ctop1" runat="server" EnableViewState="false" />
        <portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" cssclass="panelwrapper admin adminregagreement ">
            <portal:HeadingControl id="heading" runat="server" />
            <portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
                <portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
                    <div class="settingrow">
                        <mp:SiteLabel ID="SiteLabel3" runat="server" CssClass="settinglabel" ConfigKey="LoginPageTopContent" />
                    </div>
                    <div class="settingrow">
                        <mpe:EditorControl ID="edTopInfo" runat="server"></mpe:EditorControl>
                    </div>
                    <div class="settingrow">
                        <mp:SiteLabel ID="SiteLabel1" runat="server" CssClass="settinglabel" ConfigKey="LoginPageBottomContent" />
                    </div>
                    <div class="settingrow">
                        <mpe:EditorControl ID="edBottomInfo" runat="server"></mpe:EditorControl>
                    </div>
                    <div class="settingrow">
                    <portal:mojoButton id="btnSave" runat="server" />
                    </div>
                </portal:InnerBodyPanel>
            </portal:OuterBodyPanel>
            <portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
        </portal:InnerWrapperPanel>
        <mp:CornerRounderBottom ID="cbottom1" runat="server" EnableViewState="false" />
    </portal:OuterWrapperPanel>
</asp:content>
<asp:content contentplaceholderid="rightContent" id="MPRightPane" runat="server" />
<asp:content contentplaceholderid="pageEditContent" id="MPPageEdit" runat="server" />

