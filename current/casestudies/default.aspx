<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="Case Studies" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="casestudies" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
<h1>Case Studies</h1>

<p class="quicklink">
    <a href="/casestudies/move.aspx" title="Move.com">
	<img src="/graphics/move/image001.png" style="float:left;margin-right:10px;width:140px;" alt="Move.com"/>
	<b>Move.com</b>
	<br />
	March 2010 - April 2010 
    </a>
</p>
<br />
<p class="quicklink">
    <a href="/casestudies/bdbio.aspx" title="BD Biosciences">
	<img src="/graphics/bdbio/bd.jpg" style="float:left;margin-right:10px;width:140px;" alt="BD Biosciences"/>
	<b>BD Biosciences</b>
	<br />
	October 2008 - March 2009 
    </a>
</p>
<br />
<p class="quicklink">
    <a href="/casestudies/harris.aspx" title="Harris">
	<img src="/graphics/harris/harris.png" style="float:left;margin-right:10px;width:140px;" alt="Harris"/>
	<b>Harris</b>
	<br />
	February 2010 - March 2011 
    </a>
</p>
<br />
<p class="quicklink">
    <a href="/casestudies/quest.aspx" title="Harris">
	<img src="/graphics/quest/image001.png" style="float:left;margin-right:10px;width:140px;" alt="Quest"/>
	<b>Quest Software</b>
	<br />
	April 2009 - February 2010
    </a>
</p>
<br />
<p class="quicklink">
    <a href="/casestudies/uml.aspx" title="Harris">
	<img src="/graphics/uml/logo.jpg" style="float:left;margin-right:10px;width:140px;" alt="UML"/>
	<b>UML</b>
	<br />
	July 2010 - July 2011
    </a>
</p>
<br />
<p class="quicklink">
    <a href="/casestudies/nationwide.aspx" title="Harris">
	<img src="/graphics/nationwide/nationwide.jpg" style="float:left;margin-right:10px;width:140px;" alt="Nationwide"/>
	<b>Nationwide</b>
	<br />
	October 2013 - December 2013 
    </a>
</p>
<br />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Right" Runat="Server">
<br />
<amt:bookmarks runat="server" cssclass="bookmarks"/>
<br />

<div class="quote">
    <div class="quotehead"></div>
    <div class="quotecontent">
    <i>"...they went above and beyond the call of duty, graciously providing additional support before and after the contract terms."</i>
    <br />
    <br />
    Javier J. Lopez<br />
    <label class="small">Senior Manager Application Engineering @ Move.com</label>
    </div>
    <div class="quotebottom"></div>
</div>
<br />
<div class="quote">
    <div class="quotehead"></div>
    <div class="quotecontent">
    <i>"My hat goes off to all of you! You all did an incredible job on this deployment and each share in its success!!"</i>
    <br />
    <br />
    Brian Tracy<br />
    <label class="small">Software Engineering Team Lead @ Harris Corporation</label>
    </div>
    <div class="quotebottom"></div>
</div>
<br />
<div class="quote">
    <div class="quotehead"></div>
    <div class="quotecontent">
    <i>"My god. Are you avare that you saved me some nightmares tonight? Some Amakozi-magic did the trick. Thanks a billion!!!"</i>
    <br />
    <br />
    Marius Müller <br />
    <label class="small">Systemcoordinator SAP and Corporate Systems @ Statkraft</label>
    </div>
    <div class="quotebottom"></div>
</div>
<br />
<div class="quote">
    <div class="quotehead"></div>
    <div class="quotecontent">
    <i>"I think the team has done good work here to design a blueprint and a work plan that will help us successfully launch the site.  My thanks to them."</i>
    <br />
    <br />
    Michael J Ryan <br />
    <label class="small">eBusiness Marketing Director @ BD Bioscience</label>
    </div>
    <div class="quotebottom"></div>
</div>
<br />
<div class="quote">
    <div class="quotehead"></div>
    <div class="quotecontent">
        <i>"YOU GUYS ROCK!!!  Thank you so much for partnering up to get this done!"</i>
        <br />
        <br />
        Carol Fawcett <br />
        <label class="small">VP Information Systems @ Quest Software</label>
    </div>
    <div class="quotebottom"></div>
</div>
</asp:Content>

