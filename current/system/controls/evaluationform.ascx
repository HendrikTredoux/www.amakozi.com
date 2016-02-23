<%@ Control Language="C#" AutoEventWireup="true" CodeFile="evaluationform.ascx.cs" Inherits="system_controls_evaluationform" %>
<div class="formwrapper">
        <h1>Constultant evaluation form</h1>
<asp:Panel ID="EvaluationContainer" runat="server">
        <p>Because you are a valued client of Amakozi Technologies, we're asking you to complete this short evaluation form and provide your honest opinions regarding our work.</p>
        <p>You're also welcome to speak directly with Hendrik Treeoux [hendrik.tredoux@amakozi.com] about your experience.  Alternativly, feel free to contact us via <a href="/company/contact.aspx">phone</a>.</p>
<table cellspacing="2px" cellpadding="3px">
    <tr class="rowon">
        <td class="questionlabel bold">Client Organization</td><td colspan="3"><asp:Label ID="lblClientName" runat="server">Client Name</asp:Label></td>
    </tr>
    <tr class="rowoff">
        <td class="questionlabel bold">Consultant Name</td><td colspan="3"><asp:Label ID="lblConsultantName" runat="server">Consultant Name</asp:Label></td>
    </tr>
    <tr class="rowon">
        <td class="questionlabel bold">Contract Period</td><td><asp:Label ID="lblContractFrom" runat="server">Contract From</asp:Label></td><td>To</td><td><asp:Label ID="lblContractTo" runat="server">Contract To</asp:Label></td>
    </tr>
    <tr class="rowoff">
        <td class="questionlabel bold">Reviewer Name/Title</td><td colspan="3"><asp:Label ID="lblReviewerName" runat="server">Reviewer Name</asp:Label></td>
    </tr>
    <tr class="rowon">
        <td class="questionlabel bold">Project</td><td colspan="3"><asp:Label ID="lblProjectName" runat="server">Project Name</asp:Label></td>
    </tr>
</table>
<hr />
    <asp:PlaceHolder ID="SurveyPlaceHolder" runat="server">
    </asp:PlaceHolder>    &nbsp;<br />
    <center><asp:Button ID="Button1" runat="server" OnClientClick="return ValidateForm()" OnClick="Button1_Click" Text="Submit" Width="80" Height="20" /></center>
</asp:Panel>
<asp:Label ID="MessageContainer" runat="server" Visible="false">

</asp:Label>
</div>