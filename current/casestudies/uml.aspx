<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Customer Case Study - UML" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="casestudies" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<h1>Customer Case Study - UMASS Lowell Catalog</h1>
<h3>Customer Requirements</h3>
<p>First Project: Infrastructure’s administration and Blueprinting designs, create page templates and set up an Event System.</p>
<br />
<p>Second Project: Upgrade current course catalog and launch a new website called UML Today</p>

<h3>The Tailored Solution</h3>
<h4>First Project</h4>
<p>Infrastructure’s administration and Blueprinting designs, creating the component and page templates and setting up an Event System.</p>
<p>All this was done in accordance to UML’s architecture, Microsoft.Net C#.</p>
<p>The quality and time to delivery of the product as well as the good relationship built between Nationwide and Backbase (and Amakozi) left the door open for similar projects in the nearby future.</p>
<br />
<h4>Second Project</h4>
<p>It was decided that the project would be done mostly offshore from Amakozi’s offices in South Africa. Skype meetings and emails were used to give regular updates on the progress of the project. Every time deliverable content was finished it was send to the UML IT department for testing purposes.</p>
<p>As with the previous project Amakozi did for UML, Asp.Net (C#) with a SQL Server back end was used.</p>
<p>After all templates were completed, continued support was given by Amakozi to UML in order to put their content management system in place.</p>

<table cellpadding="0" cellspacing="0" style="width:100%;">
    <tr>
        <td style="vertical-align:top;">
            <h3>UML Catalog Landing Page</h3>
            <img src="/graphics/uml/UMLCatalog_landing_page.jpg" style="width:200px" />
        </td>
        <td style="vertical-align:top;">
            <h3>UML Catalog Search</h3>
            <img src="/graphics/uml/UMLCatalog_Search.jpg" style="width:200px" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top;">
            <h3>UML Today Landing Page</h3>
            <img src="/graphics/uml/UMLToday_landing_page.jpg" style="width:200px"/>
        </td>
        <td style="vertical-align:top;">
            <h3>UML Today News Item</h3>
            <img src="/graphics/uml/UMLToday_News_item.jpg" style="width:200px" />
        </td>
    </tr>
</table>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Right" Runat="Server">
<br />
<amt:bookmarks runat="server" cssclass="bookmarks"/>
<br />
<img src="/graphics/uml/logo.jpg" />
<br />
<p class="small">
    <b>Columbus, OH</b><br />
</p>

<p class="small">
    <b>Industry</b><br />
    Systems Management
</p>

<p class="small">
    The University of Massachusetts Lowell (UML) is located in Lowell, Massachusetts in the United States. It is a public university with more than 16000 students enrolled offering more than 120 different degrees. 
Being such a large university it had no choice but to look for an efficient reliable Content Management System that was able to handle its huge quantities of content and Tridion was the obvious choice.
</p>
<p class="small">
	 <b>The Solution Team</b><br />
    Amakozi Technologies<br />
</p>
<ul class="small">
    <li>Responsible for building the catalog site</li>
    <li>Responsible for building UML today</li>
</ul>

<p class="small">
    <b>Project Duration</b><br />
    March 2012 - July 2012
</p>
</asp:Content>

