<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Reporting - Resources" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="products" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<script src="../design/script/jquery.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/redmond/jquery-ui.css" rel="stylesheet" />
<script src="../design/script/jquery-ui.min.js" type="text/javascript"></script>
<script src="../design/script/jquery.youtubepopup.min.js" type="text/javascript"></script>
<div style="height:50px; vertical-align:middle"><h1>Reporting for SDL Tridion - Resources</h1></div>
<ul>
    <li><a href="#video">Video resources</a></li>
    <li><a href="#documentation">Documentation</a></li>
</ul>

<div>
<hr />
<a name="video"></a>
<h2>Video resources</h2>
<table style="border-width:0px;">
<!-- Row 1 -->
    <tr>
        <td  class="mediablock"><a class="youtubecustom" youtube="b5fanhpJKDA" href="#"><b>View the Reporting ad video</b><br /><br />
			<h2><img src="../graphics/products/ad_thumbnail.png"height="120px" /></h2></a>
            <p>
                <b>Audience:</b> Management<br />
                <b>Running time:</b> 2:11<br />
                <b>Description:</b><br />
                Video advertisement for the Reporting add-on for SDL Tridion<br />
            </p>
        </td>
        <td class="mediablock"><a class="youtubecustom" youtube="fO4iK6C2GUw" href="#"><b>Reporting demo -<br />Report creation</b><br />
			<h2><img src="../graphics/products/full_demo_thumbnail.png" height="120px" /></h2></a>
            <p>
                <b>Audience:</b> Technical<br />
                <b>Running time:</b> 8:26<br />
                <b>Description:</b><br />
                End-to-end demonstration taking you through the full process of selecting a data source for your report, creating a query definition, a report definition, and the report itself.<br /><br />
            </p>
        </td>
        <td class="mediablock"><a class="youtubecustom" youtube="JvXhmrgKXWU" href="#"><b>Reporting demo -<br />Exporting data</b><br />
		    <h2><img src="../graphics/products/exporting_data_thumbnail.png" height="120px" /></h2></a>
            <p class="small">
                <b>Audience:</b> Technical<br />
                <b>Running time:</b> 3:25<br />
                <b>Description:</b><br />
                Exporting and manipulating report data<br />
            </p>
        </td>
    </tr>
    <tr height="10px"></tr>
    <tr><td colspan="3"><p></p></td></tr>
<!-- Row 2 -->
    <tr>
        <td  class="mediablock"><a class="youtubecustom" youtube="6C_e6I-8rmI" href="#"><b>Reporting demo -<br />Security and Permissions</b><br />
			<h2><img src="../graphics/products/permissions_thumbnail.png"height="120px" /></h2></a>
            <p class="small">
                <b>Audience:</b> Technical<br />
                <b>Running time:</b> 1:02<br />
                <b>Description:</b><br />
                Setting global and report specific permissions<br />
            </p>
        </td>
        <td class="mediablock"><a class="youtubecustom" youtube="SxKX9wbLoX0" href="#"><b>Reporting demo -<br />Menu structure</b><br />
			<h2><img src="../graphics/products/menu_structure_thumbnail.png" height="120px" /></h2></a>
             <p class="small">
                <b>Audience:</b> Technical<br />
                <b>Running time:</b> 1:00<br />
                <b>Description:</b><br />
                Brief overview of the menu structure<br />
            </p>
        </td>
        <td class="mediablock">
        </td>
        <td></td>
    </tr>
</table>
</div>
<div>
<hr />
<a name="documentation"></a>
<h2>Documentation</h2>
<table style="border-width:0px;">
<!-- Row 1 -->
    <tr>
        <td  class="mediablock"><a href="../documentation/Amakozi%20Technologies%20Company%20Profile.pdf" target="_blank"><b>Amakozi Technologies Company Profile</b><br /><br />
                <img src="../graphics/general/company_profile_thumbnail.png" /><p></a>
                <b>Audience:</b> Management<br />
                <b>Type:</b> PDF<br />
                <b>Size:</b> 231kb<br />
                <b>Description:</b><br />
                Company profile document for Amakozi Technologies<br />
            </p>
        </td>
        <td class="mediablock"></td>
        <td class="mediablock"></td>
    </tr>
    <tr height="10px"></tr>
    <tr><td colspan="3"><p></p></td></tr>

</table>
</div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Right" Runat="Server">
<div >
&nbsp;<amt:bookmarks runat="server" cssclass="bookmarks"/>
</div>
<div>
    <br /><br /><br />
<p class="small">
	<p class="small">
	    <b>Product Highlights</b>
	    <ul class="small">
            <li>Seamless integration with SDL Tridion</li>
            <li>Real time reporting data collection</li>
            <li>Pre-built reports out of the box</li>
            <li>Customizable data sources</li>
            <li>Integrated security features</li>
            <li>Extension libraries</li>
	    </ul>
    <br /><br />
	<p class="small">
	    <img src="/graphics/contactinfo.gif" style="float:left;margin-right:10px;" alt="Interested in our products?"/>
		<b>Interested in our products,<br />or want to request a live demo?</b><br />
	    <%= AMKUtil.secure_email("sales@amakozi.com")%>
		
	</p>
	<br />
	<p class="small">
		<img src="/graphics/support.gif" style="float:left;margin-right:10px;" alt="Need Support?"/>
		<b>Need Support?</b><br />
	    <%= AMKUtil.secure_email("support@amakozi.com")%>
	</p>
</p>
</div>
</asp:Content>

