<%@ Page Language="C#" MasterPageFile="~/OneColumn.master" Title="Consultancy" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="services" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<h1>Consultancy <amt:bookmarks runat="server" cssclass="bookmarks"/></h1>
<h3>Developing content management strategy</h3>
<p>Our consultancy services give clients the confidence and knowledge they need to develop their web content management strategy. 
We do this by working closely with them to understand their business requirements, providing services such as best practice reviews 
and technical audits. Once we fully understand the situation we develop a set of functional requirements, which in turn translates 
into technical requirements for the system.</p>

<p>With this in-depth understanding we can provide expert advice on the content management options that are suitable, 
advice on architectural and software improvements, and the overall scalability and reliability of solutions.</p>

<h3>Supporting marketing needs and delivering ROI</h3>

<p>Our team can also provide expert advice on how technology can best support their marketing objectives, including:</p>
<ul>
<li>Understanding online customer behaviour through integrated and holistic analytics.</li>
<li>Integrating services like CRM into content management solutions to show a holistic view of customer interacting with different communications mediums (for example, web, email and kiosks).</li>
<li>Using your website to deliver personalized, timely and relevant content, for example dynamic content, personalised promotions, surveys or forums.</li>
<li>Integrating email marketing campaigns with the content management system as part of an outbound communications strategy.</li>
<li>Improving or developing enterprise search functions and increasing search relevance by organizing content effectively in the content management system.</li>
</asp:Content>

