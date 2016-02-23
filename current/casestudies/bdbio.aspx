<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Customer Case Study - BD Biosciences" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="casestudies" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<h1>Customer Case Study - BD Biosciences</h1>
<h3>Customer Requirements</h3>
<p>BD Biosciences required a content management system to manage and maintain their large new marketing website.  </p>
<p>The system had to allow for content localization for several country specific websites and provide customizable workflow options.</p>
<p>The system had to co-exist with their current J2EE systems (hosted by IBM WebSphere™ application server) and allow for tight integration in the near future, as more knowledge about the implemented content management system is gained and the marketing teams realize more opportunities to leverage such integrations to streamline business processes.</p>
<p>SDL Tridion® was the chosen content management system.  Because of the vast flexibility and complexity of the system BD Biosciences required an expert team to translate their requirements for the new website into a best-fitting solution in SDL Tridion®.</p>
<p>BD Biosciences also needed their designated users (both technical and end users) to receive training on the new system, and specifically within context of the BD Biosciences website implementation.</p>

<h3>The Tailored Solution</h3>
<p>The implementation team discussed the requirements in depth with the business and technology users to gain a complete understanding of what was needed and the various technologies involved.</p>
<p>After the initial discovery phase were complete the team created a complete system implementation design, including a built-in content localization strategy based on the powerful BluePrint™  technology provided by SDL Tridion.</p>
<p>The team worked closely together with the website design team during the html development phase to ease implementation of the required site look-and-feel.  Extensive planning, working with the resident Java architects, went into fitting the published content in the existing J2EE web applications architecture ensuring seamless integration and extensibility of functionality for country specific website structures and content.</p>
<p>After initial development was complete Amakozi Technologies conducted various training sessions (including real-time content creation) to empower the users of the new system to effectively manage their content. </p>
<p>Various additional modules were also implanted to ease the work for the users (SiteEdit) and ensure that the content produced and published met the business requirements (content workflow).</p>

<table cellpadding="0" cellspacing="0" style="width:100%;">
    <tr>
        <td style="vertical-align:top;">
            <h3>Blueprint</h3>
            <img src="/graphics/bdbio/image002.png" />
        </td>
        <td style="vertical-align:top;">
            <h3>Workflow</h3>
            <img src="/graphics/bdbio/image003.png" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top;">
            <h3>Design</h3>
            <img src="/graphics/bdbio/image004.png" style="width:200px"/>
        </td>
        <td style="vertical-align:top;">
            <h3>Technologies</h3>
            <img src="/graphics/bdbio/image005.png" /><br />
            <img src="/graphics/bdbio/image006.png" /><br />
            <img src="/graphics/bdbio/image007.png" /><br />
            <img src="/graphics/bdbio/image008.png" />
        </td>
    </tr>
</table>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Right" Runat="Server">
<br />
<amt:bookmarks runat="server" cssclass="bookmarks"/>
<br />
<img src="/graphics/bdbio/bd.jpg" />
<br />
<p class="small">
    <b>Head Quarters</b><br />
    2350 Qume Drive<br />
    San Jose, CA, 95131
</p>

<p class="small">
    <b>Industry</b><br />
    Healthcare Equipment, Bio-sciences (research, development and manufacturing)
</p>

<p class="small">
    <b>Employees</b><br />
    28,000 (associates worldwide)
</p>

<p class="small">
    BD Biosciences is a business segment of Becton, Dickinson and Company, a global medical technology company.
</p>
<p class="small">
    BD Biosciences provides instruments, reagents, cell cultureware, and a wide range of services to support the work of researchers and clinicians who understand disease and improve care.
</p>

<p class="small">
    <b>The Solution Team</b><br />
    Amakozi Technologies<br />
</p>
<ul class="small">
    <li>Overall Tridion implementation and design</li>
    <li>Tridion template development</li>
    <li>Tridion modules customization and extension</li>
</ul>

<p class="small">
    <b>Project Duration</b><br />
    October 2008 – March 2009
</p>
</asp:Content>

