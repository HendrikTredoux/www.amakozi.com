<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Services - Backbase" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="services" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
	<h1>Backbase Services</h1>

	<h2>The standard Lorem Ipsum passage, used since the 1500s</h2>
	<p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
	<h3>Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC</h3>
	<p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p>
	<h3>1914 translation by H. Rackham</h3>
	<p>"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"</p>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Right" Runat="Server">
	<br />
	<amt:bookmarks runat="server" cssclass="bookmarks"/>
	<br />
	<img src="/graphics/services/backbase.gif" />
	<br />
	<p class="quicklink">
	    <b>Backbase Services Highlights</b>
	</p>
	<ul class="small">
	    <li>Lorum Ipsum Indent this</li>
	    <li>Lorum Ipsum</li>
	    <li>Lorum Ipsum</li>
	    <li>Lorum Ipsum</li>
	    <li>Lorum Ipsum</li>
	    <li>Lorum Ipsum</li>
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
		<img src="/graphics/contactinfo.gif" style="float:left;margin-right:10px;" alt="Interested in our services?"/>
		<b>Interested in our services?</b><br />
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

