<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Products" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="products" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
	<h1>Amakozi Products</h1>

	<p>Our products a architected and designed to meet specific requirements detailed by our customers.  All our products is build by our own dedicated R&D team.  Contact us at sales@amakozi.com for a demonstration, <br/>or for more information on any our products.</p>
	<br/>

	<p class="quicklink">
	    <a href="/products/reporting.aspx" title="Amakozi Reporting">
		<img src="/graphics/products/reporting.png" style="float:left;margin-right:10px;width:140px;" alt="Amakozi Reporting"/>
        <br/>
		<b>Reporting For SDL Tridion</b>
		<br/>
		<br/>
		<ul>
			<li>Real time reporting data collection</li>
			<li>Pre-built reports out of the box</li>
			<li>Customizable user interface</li>
		</ul>
	    </a>
	</p>
	<br />
	<p class="quicklink">
	    <a href="/products/claytablet.aspx" title="SDL Tridion Claytablet Integration">
		<img src="/graphics/products/claytablet.jpg" style="float:left;margin-right:10px;width:140px;" alt="SDL Tridion Claytablet Integration"/>
		<b>SDL Tridion Clay tablet Integration</b>
		<br/>
		<br/>
		<ul>
			<li>Seamless integration with SDL Tridion</li>
			<li>Automatic check-in & check-out of content</li>
			<li>BluePrint aware, automatic localization after translation</li>
		</ul>
	    </a>
	</p>
	<br />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Right" Runat="Server">
	<br />
	<amt:bookmarks runat="server" cssclass="bookmarks"/>
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

