<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="SkinList.aspx.cs" Inherits="mojoPortal.Web.AdminUI.SkinListPage" %>

<asp:content contentplaceholderid="leftContent" id="MPLeftPane" runat="server" />
<asp:content contentplaceholderid="mainContent" id="MPContent" runat="server">
    <div class="breadcrumbs">
        <asp:hyperlink id="lnkAdminMenu" runat="server" navigateurl="~/Admin/AdminMenu.aspx" />&nbsp;&gt;
        <asp:hyperlink id="lnkAdvancedTools" runat="server" />&nbsp;&gt;
        <asp:hyperlink id="lnkDesignerTools" runat="server" />&nbsp;&gt;
        <asp:hyperlink id="lnkThisPage" runat="server" cssclass="selectedcrumb" />
    </div>
    <portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
        <mp:CornerRounderTop ID="ctop1" runat="server" EnableViewState="false" />
        <portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" cssclass="panelwrapper ">
            <portal:HeadingControl id="heading" runat="server" />
            <portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
                <portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
                    <div id="divUpload" runat="server" class="settingrow">
                        <div class="importskin">
                            <NeatUpload:InputFile ID="zipFile" Style="width: 220px; height: 23px" runat="server"
                                CssClass="forminput normaltextbox" />
                            <NeatUpload:ProgressBar ID="progressBar" runat="server">
                                <mp:SiteLabel ID="SiteLabel2" runat="server" ConfigKey="CheckProgressText"></mp:SiteLabel>
                            </NeatUpload:ProgressBar>
                            <portal:mojoButton ID="btnUpload" runat="server" ValidationGroup="upload" CssClass="importformbutton" />
                            <asp:Checkbox id="chkOverwrite" runat="server" Checked="true" />
                        </div>
                        <asp:regularexpressionvalidator id="regexZipFile" controltovalidate="zipFile" display="Dynamic" enableclientscript="true" runat="server" validationgroup="upload" />
                        <asp:requiredfieldvalidator id="reqZipFile" runat="server" controltovalidate="zipFile" display="Dynamic" validationgroup="upload" />
                    </div>
                    <asp:repeater id="rptSkins" runat="server">
                        <headertemplate>
                            <ul class="simplelist skinlist">
                            
                        </headertemplate>
                        <itemtemplate>
                            <li class="simplelist">
                                <%# Eval("Name") %>
                                <%# BuildDownloadLink(Eval("Name").ToString()) %>
                                <asp:HyperLink ID="lnkSkinPreview" runat="server" CssClass="cblink" Text='<%# PreviewText %>' NavigateUrl='<%# SiteRoot + "/?skin=" + Eval("Name")  %>' />
                                <asp:Hyperlink id="lnkManage" runat="server" Visible='<%# allowEditing %>' Text='<%# ManageText %>' NavigateUrl='<%# SiteRoot + "/DesignTools/ManageSkin.aspx?s=" + Eval("Name")  %>' />
                            </li>
                        </itemtemplate>
                        <footertemplate>
                            </ul>
                        </footertemplate>
                    </asp:repeater>
                </portal:InnerBodyPanel>
            </portal:OuterBodyPanel>
            <portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
        </portal:InnerWrapperPanel>
        <mp:CornerRounderBottom ID="cbottom1" runat="server" EnableViewState="false" />
    </portal:OuterWrapperPanel>
</asp:content>
<asp:content contentplaceholderid="rightContent" id="MPRightPane" runat="server" >
</asp:Content>
<asp:content contentplaceholderid="pageEditContent" id="MPPageEdit" runat="server" >
</asp:Content>

