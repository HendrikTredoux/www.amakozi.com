<%@ Page Language="C#" MasterPageFile="~/OneColumn.master" Title="Data Migration to SDL Tridion" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="services" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<h1>Data Migration to SDL Tridion <amt:bookmarks runat="server" cssclass="bookmarks"/></h1>
<img src="/graphics/tridiondatamigration.jpg" />
<br />
Below you will find the process worked out in greater detail:<br/>
<h3> 1 - Analyze</h3>
<ul>
    <li>Meet customer (online or onsite)</li>
    <li>Obtain info from customer about data, and data structure.</li>
    <li>Investigate taxonomy, and if clean up required</li>
    <li>Obtain information for remote import and migration</li>
</ul>
<h3> 2 - Define</h3>
<ul>
    <li>Define tridion schemas, or obtain existing schemas</li>
    <li>Map data structure to schemas, and document mappings</li>
    <li>Map taxonomies, and folder structures</li>
    <li>Define Blueprint relationships</li>
</ul>
<h3> 3 - Export</h3>
<ul>
    <li>Export content and pages from existing data stores</li>
    <li>Convert content to XML</li>
    <li>Export dependencies (e.g. References to binaries like PDF's)</li>
</ul>
<h3> 4 - Migrate</h3>
<ul>
    <li>Import content into Tridion</li>
    <li>Create pages to use content (Optional) </li>
</ul>
<h3> 5 - Cleanup</h3>
<ul>
    <li>Run additional scripts to clean up content</li>
    <li>Identify and report on failed import items</li>
    <li>Discuss and perform clean up with customer</li>
</ul>
<h3> 6 - Test</h3>
<ul>
    <li>Test the deployment of content on a clean Tridion installation</li>
    <li>Test the deployment on a replica of customerTridion installation</li>
</ul>
<h3> 7 - Deploy</h3>
<ul>
    <li>Import final content, taxonomy and structures into customer Tridion instance (onsite or remote)</li>
    <li>Hand over results</li>
</ul>
</asp:Content>

