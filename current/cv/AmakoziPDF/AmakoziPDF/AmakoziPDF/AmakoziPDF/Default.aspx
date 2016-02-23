<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="AmakoziPDF._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to Amakozi PDF!
    </h2>
    <p>
        This WebApplication will create a pdf from the online cv for the user to download
    </p>
    <div>
        <asp:Button Text="Create" runat="server" OnClick="RunPDF" />
    </div>
</asp:Content>
