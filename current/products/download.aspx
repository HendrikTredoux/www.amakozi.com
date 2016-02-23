<%@ Page Title="" Language="C#" MasterPageFile="~/TwoColumn.master" AutoEventWireup="true" CodeFile="download.aspx.cs" Inherits="products_download" %>

<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
    <amt:Menu ID="menu" runat="server" Location="products" />
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
    <div><p><h3>Create your evaluation account</h3></p>
        <p>Please create an account for downloading a 30-day evaluation copy of our Reporting for SDL Tridion product.</p>
        <p>The company and personal information you provide here, will be used solely for our internal administrative processes and will not be disclosed to any third parties.</p>
    </div>
    <br />
    <img src="../graphics/required_icon.png" /><span style="font-size:smaller">Indicates required field</span>
    <table width="100%">
<!-- Account information -->
        <tr>
            <td colspan="3" style="background-color:lightgray;"><font style="font-weight:700; font-size:smaller">Account information</font></td>
        </tr>
        <tr>
            <td style="text-align:right; width:25%">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
            </td>
            <td style="width:40%"><asp:TextBox ID="tbEmail" runat="server" Width="243px"></asp:TextBox></td>
            <td style="width:35%; color:lightgray; font-size:smaller">Your email address is your username</td>
        </tr>
       <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbPassword" runat="server" Width="243px"></asp:TextBox></td>
            <td></td>
        </tr>       
        <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label3" runat="server" Text="Confirm password"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbPasswordConfirm" runat="server" Width="243px"></asp:TextBox></td>
            <td style="width:35%; color:lightgray; font-size:smaller">Passwords must be at least 8 characters long, and contain at least one number</td>
        </tr>
<!-- Company information -->
        <tr>
            <td colspan="3" style="background-color:lightgray;"><font style="font-weight:700; font-size:smaller">Company information</font></td>
        </tr>

        <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label4" runat="server" Text="Company name"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbCompany" runat="server" Width="243px"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label5" runat="server" Text="Country"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbCountry" runat="server" Width="243px"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td style="text-align:right">
                <asp:Label ID="Label6" runat="server" Text="Website URL"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbURL" runat="server" Width="243px"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label7" runat="server" Text="Address1"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbAddress1" runat="server" Width="243px"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label8" runat="server" Text="Address 2"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbAddress2" runat="server" Width="243px"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label9" runat="server" Text="ZIP/Postal code"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbZIP" runat="server" Width="243px"></asp:TextBox></td>
            <td ></td>
        </tr>
<!-- Personal information -->
        <tr>
            <td colspan="3" style="background-color:lightgray;"><font style="font-weight:700; font-size:smaller">Personal information</font></td>
        </tr>
        <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label10" runat="server" Text="First name"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbFirstname" runat="server" Width="243px"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label11" runat="server" Text="Last name"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbLastname" runat="server" Width="243px"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label12" runat="server" Text="Job Title"></asp:Label>
            </td>
            <td><asp:TextBox ID="tbJobtitle" runat="server" Width="243px"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td style="text-align:right">
                <img src="../graphics/required_icon.png" />
                <asp:Label ID="Label13" runat="server" Text="Phone number"></asp:Label>
            </td>
            <td><asp:TextBox ID="TextBox3" runat="server" Width="243px"></asp:TextBox></td>
            <td style="width:35%; color:lightgray; font-size:smaller">e.g. +1-720-555-1234</td>
        </tr>
    </table>
    <p align="center"><asp:Button ID="btnRequest" runat="server" Text="Request" /></p>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Right" Runat="Server">
    <div >
&nbsp;<amt:bookmarks runat="server" cssclass="bookmarks"/>
</div>
<div>
    <br />	<br />
	<img src="../graphics/products/boxproduct_reporting.png" />
	<br />
<br /><br />
<p class="small">
	<p class="small">
	    <b>Product Highlights</b>
	    <ul class="small">
            <li>Seamless integration with SDL Tridion</li>
            <li>Real time reporting data collection</li>
            <li>Pre-built reports out of the box</li>
            <li>Customizable data sources</li>
            <li>Integrated security features</li>
            <li>Extension libraries</li>
	    </ul>
    <br /><br />
	<p class="small">
	    <img src="/graphics/contactinfo.gif" style="float:left;margin-right:10px;" alt="Interested in our products?"/>
		<b>Interested in our products,<br />or want to request a live demo?</b><br />
	    <%= AMKUtil.secure_email("sales@amakozi.com")%>
		
	</p>
	<br />
	<p class="small">
		<img src="/graphics/support.gif" style="float:left;margin-right:10px;" alt="Need Support?"/>
		<b>Need Support?</b><br />
	    <%= AMKUtil.secure_email("support@amakozi.com")%>
	</p>
</p>
</div>
</asp:Content>

