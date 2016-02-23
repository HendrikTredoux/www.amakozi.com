<%@ Page Title="Products - Amakozi Reporting for SDL Tridion" Language="C#" MasterPageFile="~/OneColumn.master" %>

<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="products" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" Runat="Server">
<link href="../design/styles/reporting.css" rel="stylesheet" type="text/css" />
<script src="../design/script/jquery.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/redmond/jquery-ui.css" rel="stylesheet" />
<script src="../design/script/jquery-ui.min.js" type="text/javascript"></script>
<script src="../design/script/jquery.youtubepopup.min.js" type="text/javascript"></script>

<div class="center block selfclear">
	
	   <a class="block" href="reporting_info.aspx">
		<div align="center">
			<p class="hugehead">Simple. Flexible. Powerful.</p>
			<p class="hugeheadgrey">Reporting at your fingertips.</p>
			<img src="../graphics/products/it_banner1.png" />
			<p class="bigteaser">

			Everything you always needed for SDL Tridion&reg; reporting, but never knew existed.<br/>
			Using data you never knew existed. Compliance reports, management statistics,<br/>
			usage reports, Google Analytics&reg;, Omniture&reg;. All with one powerful tool.
			</p>
			<span id="linkstripj" class="learnmore"><br/>Learn more &gt;</span>
		</div>
		</a>
</div>

<div id="buystrip">
<table border="0" class="grid4col" width="900px">
  <tr><td colspan="4"><hr style="color:222222; height:1; "/> </td></tr>
  <tr style="text-align:center; vertical-align:top; ">

    <td ><a class="youtubecustom" youtube="b5fanhpJKDA" href="#">
				<h2><img src="../graphics/products/data.png" height="146px" width="200px" /></h2>
				</a></td>
    <td><a href="reporting_info.aspx">
				<h2><img src="../graphics/products/info_small_g.png" width="55" height="55" /></h2>
				<p class="bigteaser">About Reporting</p>
				<p class="littleteaser">
				Product overview, tech specs,<br/> 
				product highlights, and general <br/>
				product information.</p>
				</a></td>
    <td><a href="reporting_media.aspx">
				<h2><img src="../graphics/products/videos_small_g.png" width="64" height="56" /></h2>
				<p class="bigteaser">Demo video's</p>
				<p class="littleteaser">
				Product video's to demo report<br/> 
				setup, how to run reports, and  <br/>
				specific usage scenario's.</p>
		</a></td>
    <td>
				<h2><img src="../graphics/products/sales_small_g.png" width="55" height="55" /></h2>
				<p class="bigteaser">Contact sales</p> 	
				<p class="littleteaser">
				Contact a sales representative <br/> 
				for more information and <br/>
				product pricing.  </p>
			</td>
  </tr>
  <tr id="linkstripy" class="learnmore" style="text-align:center; vertical-align:top; ">
    <td><span class="bottom-align"><span class="more font-16"><a class="youtubecustom" youtube="b5fanhpJKDA" href="#">View ad &gt; </a></span></span></td>
    <td><span class="bottom-align"><span class="more font-16"><a href="reporting_info.aspx">Learn more &gt;</a></span></span></td>
    <td><span class="bottom-align"><span class="more font-16"><a href="reporting_media.aspx">View video's &gt;</a></span></span></td>
    <td><span class="bottom-align"><%= AMKUtil.secure_email("sales@amakozi.com")%></span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</asp:Content>

