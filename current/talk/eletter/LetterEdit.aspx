<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master"
    CodeBehind="LetterEdit.aspx.cs" Inherits="mojoPortal.Web.ELetterUI.LetterEditPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
    <div class="breadcrumbs">
        <span id="spnAdmin" runat="server">
            <asp:HyperLink ID="lnkAdminMenu" runat="server" NavigateUrl="~/Admin/AdminMenu.aspx"
                CssClass="unselectedcrumb" />&nbsp;&gt;</span>
        <asp:HyperLink ID="lnkLetterAdmin" runat="server" CssClass="unselectedcrumb" />&nbsp;&gt;
        <asp:HyperLink ID="lnkDraftList" runat="server" CssClass="selectedcrumb" />
    </div>
    <mp:CornerRounderTop ID="ctop1" runat="server" />
    <asp:Panel ID="pnlSettings" runat="server" CssClass="panelwrapper editpage newsletter">
        <div class="modulecontent">
            <fieldset class="newsletteredit">
                <legend>
                    <mp:SiteLabel ID="lblPageNameLayout" runat="server" ConfigKey="NewsLetterEditLetterHeading">
                    </mp:SiteLabel>
                    <asp:Literal ID="litHeading" runat="server" />
                </legend>
                <div class="settingrow">
                    <mp:SiteLabel ID="lbl1" runat="server" CssClass="settinglabel" ConfigKey="NewsLetterSubjectLabel">
                    </mp:SiteLabel>
                    <asp:TextBox ID="txtSubject" runat="server" Columns="70" CssClass="forminput"></asp:TextBox>
                </div>
                <div class="settingrow">
                    <mp:SiteLabel ID="SiteLabel35" runat="server" CssClass="settinglabel" ConfigKey="spacer" />
                    <portal:mojoButton ID="btnSave" runat="server" />&nbsp;
                    <portal:mojoButton ID="btnDelete" runat="server" CausesValidation="False" />&nbsp;
                    <portal:mojoButton ID="btnSendToList" runat="server" />&nbsp;
                    <portal:mojoHelpLink ID="MojoHelpLink2" runat="server" HelpKey="newsletter-general-help" />
                    <portal:mojoLabel ID="lblErrorMessage" runat="server" CssClass="txterror" />
                </div>
                <div class="settingrow">
                    <mp:SiteLabel ID="SiteLabel2" runat="server" CssClass="settinglabel" ConfigKey="spacer" />
                    <portal:mojoButton ID="btnSendPreview" runat="server" Text="" CausesValidation="false" />&nbsp;
                    <asp:TextBox ID="txtPreviewAddress" runat="server" CssClass="mediumtextbox"></asp:TextBox>
                    <portal:mojoButton ID="btnGeneratePlainText" runat="server" />
                </div>
                <div class="settingrow">
                    <mp:SiteLabel ID="SiteLabel1" runat="server" CssClass="settinglabel" ConfigKey="NewsLetterTemplatesLabel">
                    </mp:SiteLabel>
                    <asp:DropDownList ID="ddTemplates" runat="server" DataTextField="Title" DataValueField="Guid">
                    </asp:DropDownList>
                    <portal:mojoButton ID="btnLoadTemplate" runat="server" />
                </div>
                <div class="settingrow">
                    <mp:SiteLabel ID="SiteLabel3" runat="server" CssClass="settinglabel" ConfigKey="spacer" />
                    <portal:mojoButton ID="btnSaveAsTemplate" runat="server" />
                    <asp:TextBox ID="txtNewTemplateName" runat="server" CssClass="mediumtextbox"></asp:TextBox>
                    <asp:HyperLink ID="lnkManageTemplates" runat="server"></asp:HyperLink>
                </div>
                <div id="divtabs" class="mojo-tabs">
                    <ul>
                        <li class="selected"><a href="#tabHtml"><em>
                            <asp:Literal ID="litHtmlTab" runat="server" /></em></a></li>
                        <li><a href="#tabPlainText"><em>
                            <asp:Literal ID="litPlainTextTab" runat="server" /></em></a></li>
                    </ul>
                    <div id="tabHtml">
                        <mpe:EditorControl ID="edContent" runat="server">
                        </mpe:EditorControl>
                    </div>
                    <div id="tabPlainText">
                        <asp:TextBox ID="txtPlainText" runat="server" TextMode="MultiLine" Width="100%" Height="800px"></asp:TextBox>
                    </div>
                </div>
            </fieldset>
        </div>
    </asp:Panel>
    <mp:CornerRounderBottom ID="cbottom1" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
