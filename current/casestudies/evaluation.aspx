<%@ page language="C#" masterpagefile="~/OneColumn.master" autoeventwireup="true" inherits="casestudies_evaluation, App_Web_wjtpycju" title="Services Evaluation" validaterequest="false" %>
<asp:Content ContentPlaceHolderID="HeadSection" ID="HeadContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="/design/styles/evaluation.css" media="screen" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainMenu" Runat="Server">
    <amt:Menu ID="menu" runat="server" Location="casestudies" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
   <amt:Evaluation ID="eval1" runat="server" QueryStringKey="EID" />
</asp:Content>

