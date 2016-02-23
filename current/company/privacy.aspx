<%@ Page Language="C#" MasterPageFile="~/OneColumn.master" Title="Privacy" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="company" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">




<h1>Privacy Policy <amt:bookmarks runat="server" cssclass="bookmarks"/></h1>
<p><strong>Your privacy is important to Amakozi Technologies.</strong></p>
<h3>1. Personal information</h3>
In general, you can visit Amakozi Technologies' web site without telling us who you are and without revealing any information about yourself. There are times, however, when we or our partners may need information from you. You may choose to give us personal information, such as your name and address or email addresses that may be needed, for example, to correspond with you, to process an order, or to provide you with a subscription. It is our intention to let you know how we will use such information before we collect it from you on the Internet. If you tell us that you do not want us to use this information as a basis for further contact with you, we will not do so.
<h3>2. Information security and quality</h3>
We intend to protect the quality and integrity of your identifiable personal information. We have implemented appropriate technical and organizational measures to help us keep your information secure, accurate, current, and complete. However, we cannot guarantee the security of any information you transmit to us online and you do so at your own risk. We will make a sincere effort to respond in a timely manner to any of your requests to correct inaccuracies in your personal information. To correct inaccuracies in your personal information please return the message containing the inaccuracies to us with details of the correction requested.
<h3>3. Information collection</h3>
To monitor and improve the web site, we also gather certain information about you when you use it, including details of your operating system, browser version, domain name, and IP address (the IP address is a string of numbers that tells us which server you are using but does not identify you).
<h3>4. Use of information</h3>
Amakozi Technologies is committed to keeping your information confidential. We will use it to personalize your experience, service your policy, and to directly communicate with you.

<h3>5. Sharing of information</h3>
<ul>
    <li>Amakozi Technologies does not sell, rent, or trade your personal information with any third party.</li>
    <li>Amakozi Technologies will disclose information when required to do so</li>
    <li>to comply with any relevant legislation, or any legal process</li>
    <li>to protect and defend Amakozi Technologies' rights and property (including Amakozi Technologies' intellectual property)</li>
    <li>Sometimes we may need to share aggregate information (for example, demographic data) with our stakeholders and business partners but we do not disclose to them information about our individual users.</li>

</ul>
<h3>6. Collection of information by other parties</h3>
Some advertisers or web sites that have links on our web site may collect personal information about you when you use their links. Amakozi Technologies does not control the collection or use of such information. This privacy policy does not apply to these advertisers and their web sites.
<h3>7. Clickstream data</h3>
We sometimes collect anonymous information from visitors to our web sites to help us provide better customer service. For example, we keep track of the domains from which people visit and we also measure visitor activity on Amakozi Technologies web sites, but we do so in ways that keep the information anonymous. This anonymous information is sometimes known as "clickstream data". Amakozi Technologies or its analytic vendors may use this data to analyze trends and statistics and to help us provide better customer service. If you do not wish information to be used in this way, please notify us.
<h3>8. Online advertising</h3>
Amakozi Technologies has certain companies that help us deliver our banner ads and other online communications. These companies may collect and use information about customers to help us better understand the offers, promotions, and types of advertising that are most appealing to our customers. The information they collect is aggregated so it is not identifiable to a specific individual. If, however, you would prefer that these companies not collect information from your experience, please advise us.
<h3>9. Personalized URL link</h3>
On occasion, Amakozi Technologies presents a personalized URL (link) that brings the visitor to a personalized web page. Such a personal URL is readily identifiable and by clicking on that link and going to a personal web page you are agreeing to let Amakozi Technologies collect information about your session visits. We use this information to help us provide you with information that matches your interests. If you do not wish information to be used in this way, please notify us.
<h3>10. Children</h3>
While none of Amakozi Technologies' web sites are directed towards children, we are committed to comply with all applicable laws and requirements.
<h3>11. Updates</h3>

This privacy statement was last updated in August 2008. A notice will be posted on our home page whenever this privacy statement is materially changed.
<h3>12. Questions regarding this statement</h3>
Questions regarding this statement may be directed to <%= AMKUtil.secure_email("info@amakozi.com")%> for clarification.



</asp:Content>

