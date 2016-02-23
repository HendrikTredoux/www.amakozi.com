<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Company" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="company" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>Get to know Amakozi Technologies</h1>
<p>Amakozi Technologies specializes in Web technologies, with a strong focus on web content management and communications.
We have a proven track record in providing our customers with effective solutions, 
customized to their needs on enterprise strength Web Content Management software.
As a result we have built up a respectable volume of expertise with these technologies.
Several products, aimed at small to medium sized enterprises, are also currently under development.</p>
<h3>Where are we situated</h3>
<p>Our head office is situated in Somerset West, close to Cape Town, South Africa, with a subsidiary office in Oak Park, California, USA.</p>

<h3>Founders</h3>
<p>Established in 2005, Amakozi’s two founders have a combined 36 years experience in the IT industry.</p>
<ul>
<li><strong>Hendrik Tredoux</strong> worked for SDL Tridion in Amsterdam for seven years prior to co-founding Amakozi Technologies, and was instrumental in the development of the original SDL Tridion WCM product. Hendrik is widely accepted as one of the most knowledgeable Tridion experts in the industry. Hendrik is based in Oak Park, north of Los Angeles, CA, USA.</li>
<li><strong>Deon Dixon</strong> comes from a corporate background in the financial industry, with solid IT architecture and business experience. He was on the team that established AstuteFSE, which streamlined the South African life insurance industry, and is an expert in financial and administration systems. Deon is based in Somerset West, South Africa.</li>
</ul>

<h3>Divisions</h3>
<p>From January 2011, the company has reorganized into two seperate, but complementary divisions:</p>
<ul>
<li><strong>Professional Services</strong> is headed up by Hendrik Tredoux, and is dedicated to implementation projects and consulting services.  The PS Division makes use of the pool of consultants that operate from South Africa and the USA.</li>
<li><strong>Product Development</strong> is headed up by Deon Dixon, operating from the South African office. This division concentrates on developing new web based products for selected vertical markets.</li>
</ul>
 
<p>Production Support (HR, administration and accounting) is centralized in South Africa under the watchful eye of Charlotte Laas.</p>

<h3>Our Approach</h3>
<p>Amakozi Technologies employs a small core of permanent employees.</p>
<p>We have an established, cost effective, flexible offshoring model where our development teams work on implementation projects in partnership with the client's business and technical teams. The engagement can range from 100% offshored at our South African premises, to 100% on site at the client, with any mix between the two as dictated by the client and particular project. We have a very low staff turnover, which ensures good continuity with any project.</p>
<p>
            Staffing of large projects is done via established partnerships with Cape Town
            based contracting houses. 
            This business model allows Amakozi Technologies
            to concentrate on their core competencies, while having access to a wide
            range of specialized and scarce skills, as well as a large pool of human
            resources.</p>
<h3>Outsourcing</h3>
<p>Outsourcing is an established business model and is gaining popularity. It frees any
company from staffing problems, as well as the overheads of equipment, software licenses,
and human resource administration and overheads such as pension, medical insurance
and holiday and sick leave.</p>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" Runat="Server">
<br />
<amt:bookmarks runat="server" cssclass="bookmarks"/>
<br />
<br />
<p class="quicklink">
    <a href="/company/contact.aspx" title="Locate a office near you">
	<img src="/graphics/mapsicon.gif" style="float:left;margin-right:10px;" alt="Locate a office near you"/>
	<br /><b>Locate an office near you...</b><br />
    </a>
</p>
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

