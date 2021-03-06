<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="SurveyEdit.aspx.cs" Inherits="SurveyFeature.UI.SurveyEditPage" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<div class="breadcrumbs">
    <asp:HyperLink ID="lnkPageCrumb" runat="server" CssClass="unselectedcrumb"></asp:HyperLink> &gt;
    <asp:HyperLink runat="server" ID="lnkSurveys" CssClass="unselectedcrumb"></asp:HyperLink> &gt;
    <asp:HyperLink runat="server" ID="lnkSurveyEdit" CssClass="selectedcrumb"></asp:HyperLink>
</div>

<mp:CornerRounderTop id="ctop1" runat="server" />    
<asp:Panel ID="pnlSurvey" runat="server" DefaultButton="btnSave" CssClass="panelwrapper survey">    
    <div class="settingrow">
        <mp:SiteLabel ID="lblSurveyName" runat="server" ForControl="txtSurveyName" CssClass="settinglabel"
            ConfigKey="SurveyEditSurveyNameLabel" ResourceFile="SurveyResources"></mp:SiteLabel>
        <asp:TextBox ID="txtSurveyName" runat="server" Columns="50" MaxLength="100"></asp:TextBox>                
    </div>
    <div class="settingrow">
        <mp:SiteLabel ID="lblWelcomeMessage" runat="server" ForControl="edWelcomeMessage"
            CssClass="settinglabel" ConfigKey="SurveyWelcomeMessageLabel" ResourceFile="SurveyResources" />
     </div>
     <div class="settingrow">
        <mpe:EditorControl id="edWelcomeMessage" runat="server"></mpe:EditorControl>
    </div>
    <div class="settingrow">
        <mp:SiteLabel ID="lblThankyouMessage" runat="server" ForControl="edThankyouMessage"
            CssClass="settinglabel" ConfigKey="SurveyThankyouMessageLabel" ResourceFile="SurveyResources" />
     </div>
     <div class="settingrow">
        <mpe:EditorControl id="edThankyouMessage" runat="server"></mpe:EditorControl>
    </div>
    <div class="settingrow">
        <mp:SiteLabel ID="SiteLabel1" runat="server" CssClass="settinglabel" ConfigKey="spacer" UseLabelTag="false" />
        <portal:mojoButton ID="btnSave" runat="server" />&nbsp;
        <portal:mojoButton ID="btnCancel" runat="server" CausesValidation="false" />&nbsp;
    </div>
 </asp:Panel>
 <mp:CornerRounderBottom id="cbottom1" runat="server" />
<portal:SessionKeepAliveControl id="ka1" runat="server" />    
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
