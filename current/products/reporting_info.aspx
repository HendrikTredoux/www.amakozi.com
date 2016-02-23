<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Products - Reporting" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="products" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
	<h1>Reporting for SDL Tridion<sup>*</sup></h1>

	<h2>Customizable, user defined reporting available for SDL Tridion</h2>
    <p>Compatible with SDL Tridion versions 2011 through 2013.</p>
	<p>Gone are the days of costly, time consuming, hard-coding your reports for SDL Tridion! 
    Reporting is now available as an add-on to SDL Tridion. 
    The product contains several of the more popular reports, pre-defined and ready to use, 
    and you can change them to suit your needs or add your own from our comprehensive reporting 
    database or any external data source.</p>
    <p>The Reporting add-on integrates seamlessly with the SDL Tridion base products.</p>
	<h3>Version 2.0</h3>
	<p>Version 1.0 consisted of a Community Technology Preview to selected industry players. 
<br /><br />Version 2.0 the first commercial release, consists of:</p>
<ul>
<li>a Content Archive feature to collect SDL Tridion reporting data in real time </li>
<li>an extension library (API) integrating fully with the SDL Tridion Content Manager Explorer</li>
<li>a user interface integrating seamlessly with the SDL Tridion Content Manager Explorer</li>
<li>a wide range of prebuilt data sources to build various kinds of reports (UGC, Audience Manager, Archived Content, Broker Content, etc)</li>
<li>a pre-defined set of sample reports</li>
<li>the ability to schedule reports to run at set times</li>
<li>the ability to export report data to CSV, XML or HTML</li>
<li>Security Roles, and flexible security architecture to integrate with any security model (e.g. SDL Tridion Groups/Users)</li>
<li>Compatibility with SDL Tridion 2013 added</li>
<li>Graphs on report definitions and reports</li>
<li>Custom Report templates</li>
</ul>
<h3>Tailored for all sources</h3>
<p>The unique architecture of the Reporting add-on allows customers to consume any 
data source to report on, and supports the development of custom data sources.</p> 
<p>Out of the box, we deliver data sources consuming data from Omniture, 
Google Analytics, Direct Database queries, and a wide range of SDL Tridion libraries.</p>  
<p>In the future Amakozi (and users of the product) will develop more data libraries.  
These libraries will be downloadable from this website.</p>
<h3>Upcoming releases</h3>
<p>We are also looking at larger features, which were scoped out at first until we get more input from users of Version 2.0.  These features include:</p>
<ul>
<li>Support for iPad and Android devices</li>
<li>A customizable dashboard to show statistics, shortcuts, etc.</li>
</ul>
<p><br /><font style="font-style:italic">* SDL Tridion is a registered trademark of the SDL group</font></p>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Right" Runat="Server">
	<br />
	<amt:bookmarks runat="server" cssclass="bookmarks"/>
	<br />
	<img src="../graphics/products/boxproduct_reporting.png" />
	<br />

	<p class="quicklink">
	    <b>Product Highlights</b>
	</p>
	<ul class="small">
<li>Seamless integration with SDL Tridion</li>
<li>Real time reporting data collection</li>
<li>Pre-built reports out of the box</li>
<li>Customizable data sources</li>
<li>Integrated security features</li>
<li>Extension libraries</li>
	</ul>

	<br />
	<br />
	<p class="quicklink">
	    <img src="/graphics/contactinfo.gif" style="float:left;margin-right:10px;" alt="Interested in our products?"/>
		<b>Interested in our products?</b><br />
	    <%= AMKUtil.secure_email("sales@amakozi.com")%>
		
	</p>
	<br />
	<p class="quicklink">
		<img src="/graphics/support.gif" style="float:left;margin-right:10px;" alt="Need Support?"/>
		<b>Need Support?</b><br />
	    <%= AMKUtil.secure_email("support@amakozi.com")%>
	</p>
	<br />


</asp:Content>

