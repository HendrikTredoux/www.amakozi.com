<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Contact Us" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="company" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<link rel="stylesheet" href="/design/styles/nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="/design/script/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
$(window).load(function() {
$('#slider').nivoSlider();
});
</script>

<h1>Get in touch with us</h1>

<img src="http://maps.google.com/maps/api/staticmap?center=Cnr%20Reitz%20and%20Lourens%20Street+Somerset%20West+South%20Africa&zoom=11&size=180x130&maptype=roadmap&sensor=false" style="border:1px solid gray;float:right; margin-right:50px;"/>
<h3>South Africa</h3>
<p>
Amakozi Technologies cc <br/>
Unit 10, Pastorie Park <br />
Cnr Reitz and Lourens Street <br />
Somerset West, 7130 <br />
<br />
T: +27 (21) 851 2102 <br />
F: +27 (86) 695 2337 <br /> 
<%= AMKUtil.secure_email("info@amakozi.com")%>
</p>
<img alt=" 4383 Via Rio, Newbury Park, CA 91320" src="http://maps.google.com/maps/api/staticmap?center=Sanford+Ave+SW+United+States&zoom=11&size=180x130&maptype=roadmap&sensor=false" style="border:1px solid gray;float:right; margin-right:50px;"/>
<!-- <div id="slider" class="nivoSlider" style="float:right;border:1px solid gray;margin-right:50px;">
    
    <img alt=" 4383 Via Rio, Newbury Park, CA 91320" src="http://maps.google.com/maps/api/staticmap?center=4383+Via+Rio+Newbury+Park+Thousand+Oaks+CA+91320+United+States&zoom=11&size=180x130&maptype=roadmap&sensor=false"/>
	<img alt="8 Faneuil Hall Marketplace, 3rd Floor, Boston, MA 02109" src="http://maps.google.com/maps/api/staticmap?center=Faneuil Hall Marketplace+Boston+MA+02109+United States&zoom=11&size=180x130&maptype=roadmap&sensor=false"/>
	<img alt="5315 Oak Park Ln, Oak Park, CA 91377" src="http://maps.google.com/maps/api/staticmap?center=5315 Oak Park Ln+Oak Park+CA+91377+United States&zoom=11&size=180x130&maptype=roadmap&sensor=false"/> 1
</div>-->
<h3>United States</h3>
<p>
Amakozi Technologies LLC <br/>
2885 Sanford Ave SW #28481<br />
Grandville<br />
MI 49418<br />
 <br />
T: +1 (646) 461 2167 <br />
M: +1 (646) 461 2167 <br />
<%= AMKUtil.secure_email("usa@amakozi.com")%>
</p>
<!--<img src="http://maps.google.com/maps/api/staticmap?center=Rietgorsstraat+Den Haag+The Netherlands&zoom=11&size=180x130&maptype=roadmap&sensor=false" style="border:1px solid gray;float:right; margin-right:50px;"/>
<h3>Europe</h3>
<p>
Amakozi Technologies bv <br/>
Rietgorsstraat 21<br />
Den Haag, 2496 MN<br />
The Netherlands<br />
<br /> 
T: +31 (64) 5233 500<br />
<%= AMKUtil.secure_email("eu@amakozi.com")%>
</p> -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Right" Runat="Server">
<br />
<amt:bookmarks runat="server" cssclass="bookmarks"/>
<br />
<p class="quicklink">
	<img src="/graphics/support.gif" style="float:left;margin-right:10px;" alt="Need Support?"/>
	<b>Need Support?</b><br />
    <%= AMKUtil.secure_email("support@amakozi.com") %>
</p>
<br />
<p class="quicklink">
	<img src="/graphics/contactinfo.gif" style="float:left;margin-right:10px;" alt="Interested in our services?"/>
	<b>Interested in our services?</b><br />
	<%= AMKUtil.secure_email("sales@amakozi.com")%>
</p>
<br />
<p class="quicklink">
	<img src="/graphics/billing.gif" style="float:left;margin-right:10px;" alt="Question about your invoice?"/>
	<b>Question about your invoice?</b><br />
    <%= AMKUtil.secure_email("accounts@amakozi.com")%>
</p>

</asp:Content>