<%@ Page Language="C#" AutoEventWireup="false" MasterPageFile="~/App_MasterPages/layout.Master" CodeBehind="RecoverPassword.aspx.cs" Inherits="mojoPortal.Web.UI.Pages.RecoverPassword" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" />
<asp:Panel id="pnlLogin" runat="server" CssClass="panelwrapper login">
<div  class="modulecontent">
<fieldset>
    <legend>
        <mp:SiteLabel id="SiteLabel1" runat="server" ConfigKey="SignInSendPasswordButton" UseLabelTag="false"></mp:SiteLabel>
    </legend>

    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" >
        <UserNameTemplate>
        <asp:Panel id="pnlRecover" runat="server" DefaultButton="SubmitButton">
            <h2><mp:SiteLabel id="sitelabel1" runat="server" ConfigKey="ForgotPasswordLabel" /></h2>
            <div class="settingrow">
                <asp:Label id="lblEnterUserName" AssociatedControlID="UserName" runat="server" Text="" />
                <br /><asp:TextBox ID="UserName" runat="server" MaxLength="100" CssClass="widetextbox" />
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                Display="Dynamic" ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
            </div>
            <div class="settingrow">
                <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" ValidationGroup="PasswordRecovery1" />
            </div>
            <div class="txterror">
                <asp:ValidationSummary ID="vSummary" runat="server" ValidationGroup="PasswordRecovery1" />
                <asp:Literal ID="FailureText" runat="server" />
            </div>
            </asp:Panel>
        </UserNameTemplate>
        <QuestionTemplate>
        <asp:Panel id="pnlRecover2" runat="server" DefaultButton="SubmitButton">
        <h2><mp:SiteLabel id="sitelabel2" runat="server" ConfigKey="ForgotPasswordLabel" /></h2>
        <div class="settingrow">
            <mp:SiteLabel id="sitelabel4" runat="server" ConfigKey="HelloLabel" UseLabelTag="false" />
            <asp:Literal ID="UserName" runat="server"  /> 
            <br /><mp:SiteLabel id="sitelabel5" runat="server" ConfigKey="PasswordQuestionLabel" />
            <br /><asp:Literal ID="Question" runat="server" />
            <br /><asp:TextBox ID="Answer" runat="server" CssClass="verywidetextbox" />
            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" 
            Display="Dynamic" ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
            <br /><asp:Button ID="SubmitButton" runat="server" CommandName="Submit"  ValidationGroup="PasswordRecovery1" />
        </div>
        <div class="txterror">
                <asp:ValidationSummary ID="vSummary" runat="server" ValidationGroup="PasswordRecovery1" />
                <asp:Literal ID="FailureText" runat="server" />
        </div>
        </asp:Panel>
        </QuestionTemplate>
        <SuccessTemplate>
            <mp:SiteLabel id="successLabel" runat="server" ConfigKey="PasswordRecoverySuccessMessage" />
            <asp:Literal ID="EmailLabel" runat="server" />
        </SuccessTemplate>
    </asp:PasswordRecovery>
    <asp:Label ID="lblMailError" runat="server" CssClass="txterror" />
</fieldset>
</div>
</asp:Panel> 
<mp:CornerRounderBottom id="cbottom1" runat="server" />	
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />