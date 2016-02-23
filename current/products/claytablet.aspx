<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Products - SDL Tridion Claytablet Integration" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="products" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
	<h1>SDL Tridion ClayTablet Integration</h1>

	<h2>Why ClayTablet?</h2>
	<p>ClayTablet provides a secure and flexible integration service between a Content Management system (CMS) and a Translation Management system (TMS).  Theoretically any combination of CMS and TMS is possible.  
    </p><p>Since ClayTable is a facilitator only (formatting and controlling only the messages and queues) there are of course some actions required to get a CMS and TMS to understand and interpret the messages.
In short, the ClayTablet messages can contain certain instructions (these are defined in the ClayTablet API and each CMS and TMS integration process must conform to these) as well as possibly related content/asset(s).<br />The instruction may be a request for Translation into a certain language, or a notification of the status of a translation project, or the completed translated asset, etc.
</p>
<h2>SDL Tridion Integration</h2>
<p>The integration was built from a CMS perspective. Thus, requesting translation, receiving translated content and updating the related asset. 
To allow this sometimes complex process to be easy manageable we extended the SDL Tridion CME (GUI).</p><p>The extension allows editors to manage translation requests from within their everyday CMS interface.  This eliminates any need to access various other systems or having to manually update assets with the translated version.  
The immediate benefit of this is better control, translation process audit trail and elimination of erroneous copy and paste actions.
</p>
<p>The integration process honors the Blueprint hierarchy and will automatically localize the target component within the context repository when applying the translation update.
</p>
<table style="width:100%;" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="/graphics/products/claytabletdesign3.png"/>
		</td>
		<td>
			<img src="/graphics/products/claytabletdesign1.png"/>
			<br/><br/>
			<img src="/graphics/products/claytabletdesign2.png"/>
		</td>
	</tr>
</table>

<h3>Planned enhancements and additions</h3>
<ul>
<li>SDL Tridion 2011 GUI integration</li>
<li>Popular TMS integration</li>
<li><a href="/products/reporting.aspx">SDL Tridion Reporting</a> provider assembly</li>
</ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Right" Runat="Server">
	<br />
	<amt:bookmarks runat="server" cssclass="bookmarks"/>
	<br />
	<img src="/graphics/products/claytablet.jpg" />
	<br />

	<p class="quicklink">
	    <b>Product Highlights</b>
	</p>
	<ul class="small">
	    <li>Content update control</li>
	    <li>Ad-hoc or Batch translation request</li>
        <li>Anytime status request</li>
	    <li>Automatic polling</li>
	</ul>

	<br />
	<br />
	<p class="quicklink">
	    <!--<a href="mailto:support@amakozi.com" title="Need Support?">-->
		<img src="/graphics/support.gif" style="float:left;margin-right:10px;" alt="Need Support?"/>
		<b>Need Support?</b><br />
	    <%= AMKUtil.secure_email("support@amakozi.com")%>
		<!--support@amakozi.com
	    </a>-->
	</p>
	<br />
	<p class="quicklink">
	    <!--<a href="mailto:support@amakozi.com" title="Interested in our services?">-->
		<img src="/graphics/contactinfo.gif" style="float:left;margin-right:10px;" alt="Interested in our products?"/>
		<b>Interested in our products?</b><br />
	    <%= AMKUtil.secure_email("sales@amakozi.com")%>
		<!--sales@amakozi.com
	    </a>-->
	</p>
	<br />
	<p class="quicklink">
	    <!--<a href="mailto:accounts@amakozi.com" title="Question about your invoice?">-->
		<img src="/graphics/billing.gif" style="float:left;margin-right:10px;" alt="Question about your invoice?"/>
		<b>Question about your invoice?</b><br />
	    <%= AMKUtil.secure_email("accounts@amakozi.com")%>
		<!--accounts@amakozi.com
	    </a>-->
	</p>
</asp:Content>

