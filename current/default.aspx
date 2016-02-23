<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Your one stop shop Content Management services" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="home" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<link rel="stylesheet" href="/design/styles/nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="/design/script/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
$(window).load(function() {
$('#slider').nivoSlider();
});
</script>

<br />
<br />
<br />
<div id="slider" class="nivoSlider">
	<a href="/services/consultancy.aspx"><img src="/graphics/banner6.png" alt="banner6" title="" /></a>
    <a href="/services/consultancy.aspx"><img src="/graphics/banner5.png" alt="banner5" title="" /></a>
	<a href="/services/consultancy.aspx"><img src="/graphics/banner4.png" alt="banner4" title="" /></a>
	<a href="/services/consultancy.aspx"><img src="/graphics/banner3.png" alt="banner3" title="" /></a>
	<a href="/services/consultancy.aspx"><img src="/graphics/banner2.png" alt="banner2" title="" /></a>
	<a href="/services/consultancy.aspx"><img src="/graphics/banner1.png" alt="banner1" title="" /></a>
</div>
<br />
<img src="/design/images/BigBoxBottom.gif" alt="" />
<br />
<table cellpadding="2" cellspacing="0" style="width:100%;">
    <tr>
        <td style="width:45%;vertical-align:top;background-image:url(/design/images/boxcorner.gif);background-repeat:no-repeat;background-position:right;">
            <h3>Reporting for SDL Tridion</h3>
            
            <p>
            <a href="/products/reporting.aspx"><img src="/graphics/products/reporting.png" style="padding-top:5px;padding-bottom:1px;" alt="Customizable, user defined reporting available for SDL Tridion 2013"/></a>
            <br/><br/>
            Gone are the days of costly, time consuming, hard-coding your reports for SDL Tridion! Our Reporting product is now available as an add-on to SDL Tridion 2011 and 2013.
            </p>
            <p>
            <a href="/products/reporting.aspx"><b>Read here about our Reporting product</b></a>
            </p>
            <br />
        </td>
        <td style="width:5%">&nbsp;</td>
        <td style="width:45%;vertical-align:top;background-image:url(/design/images/boxcorner.gif);background-repeat:no-repeat;background-position:right;">
            <h3>Onsite or Offsite</h3>
            <a href="/services/offshore.aspx"><img src="/graphics/offshorethumb.jpg" alt="We expand your team" /></a>
            <p>
            Amakozi developers work in teams, situated in Cape Town, South Africa and in the USA.  Work <br/> is done offsite for optimum pricing. Hourly rates apply. Please contact us for a quote.
            </p>
            <p>
           
            <a href="/services/offshore.aspx"><b>Read here how we expand your team</b></a>
            </p>
            <br />
        </td>
        <td style="width:5%">&nbsp;</td>
    </tr>
    <!-- tr>
        <td style="vertical-align:top;background-image:url(/design/images/boxcorner.gif);background-repeat:no-repeat;background-position:right;" colspan="3">
            <h3>Migrate to SDL Tridion</h3>
            
            <p>
            <a href="/services/tridionmigration.aspx"><img src="/graphics/services/migratethumb.jpg" style="height:70px; width:280px;" alt="Migrate your content to SDL Tridion"/></a>
            <br/>
            We do migration of your corporate data to Tridion as managed content. Work is done offsite for optimum pricing. <br />Hourly rates apply. Please contact us for a quote.
            </p>
            <p style="text-align:right; margin-right:40px;">
            <a href="/services/tridionmigration.aspx"><b>Read here how we can help you migrate</b></a>
            </p>
            <br />
        </td>
        <td style="width:5%">&nbsp;</td>
    </tr -->
</table>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" Runat="Server">
<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Need a job?</h3>
<p class="quicklink">
    <a href="/company/jobs.aspx" title="Need a job?">
	<img src="/graphics/unclesamneedyou.jpg" style="float:left;margin-right:10px;" alt="We need you!"/>
	<br />
	<b>We need you!</b>
	<br />
	Click here to view the jobs @ amakozi.
    </a>
    <br/><br/><br/>

    <a href="/company/contact.aspx" title="Locate a office near you">
	<img src="/graphics/mapsicon.gif" style="float:left;margin-right:10px;" alt="Locate a office near you"/>
	<br /><b>Locate an office <br/>near you...</b><br />
    </a>
</p>
<p class="quicklink">
	<a href="http://www.linkedin.com/company/amakozi-technologies?trk=fc_badge"><img src="http://static01.linkedin.com/scds/common/u/img/webpromo/btn_cofollow_badge.png" alt="Amakozi Technologies on LinkedIn"/></a>
	<br/>
	<!-- <div style="padding-left:25px">
		<div style="padding-left:15px;"><b class="small">A proud member of the</b><br/></div>
		<a href="http://www.cmsalliance.com"><img src="/graphics/cmsalliance.png" alt="CMS Alliance" style="width:120px;"/></a>
	</div> -->
	<br/>
	<div style="padding-left:37px">
		<span class="st_twitter"></span><span class="st_facebook"></span><span class="st_email"></span><span class="st_sharethis"></span><span class="st_plusone"></span>
	</div>
</p>
<h3>&nbsp;&nbsp;&nbsp;&nbsp;Some things about us ...</h3>
<p class="quicklink">
    <a href="/news/reporting.aspx" title="Amakozi release Reporting product">
	<img src="/graphics/news.gif" style="float:left;margin-right:10px;" alt="Amakozi release Reporting product"/>
	<b>Amakozi Reporting</b><br />
	Amakozi releases its Reporting product.
    </a>
</p>
<p class="quicklink">
    <a href="/news/expandtousa.aspx" title="Amakozi arrives in USA">
	<img src="/graphics/news.gif" style="float:left;margin-right:10px;" alt="Amakozi arrives in USA"/>
	<b>Amakozi arrives in USA</b><br />
	Amakozi opens a subsidiary in California.
    </a>
</p>
<p class="quicklink">
    <a href="/news/">
	<b>&nbsp;More things about us...</b>
    </a>
</p>

</asp:Content>

