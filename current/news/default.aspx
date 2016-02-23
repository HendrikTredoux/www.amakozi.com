<%@ Page Language="C#" MasterPageFile="~/TwoColumn.master" Title="News" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="home" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<h1>News @ amakozi</h1>

<p class="quicklink">
    <a href="/news/reporting.aspx">
        <img src="/graphics/news.gif" style="float:left;margin-right:10px;"/>
        <label>
            <b>Amakozi Reporting</b><br />
            The Amakozi Reporting product has been released!
        </label>
    </a>
</p>
<br />
<p class="quicklink">
    <a href="/news/expandtousa.aspx">
        <img src="/graphics/news.gif" style="float:left;margin-right:10px;"/>
        <label>
            <b>We arrived in USA</b><br />
            Amakozi Technologies opens subsidiary in California, United States of America.
        </label>
    </a>
</p>
<br />
<p class="quicklink">
    <a href="/news/moveoffice.aspx">
        <img src="/graphics/news.gif" style="float:left;margin-right:10px;"/>
        <label>
            <b>We moved office</b><br />
            Amakozi Technologies moves from Strand to new premises in Somerset West.
        </label>
    </a>
</p>
<br />
<p class="quicklink">
    <a href="/news/expandtoeu.aspx">
        <img src="/graphics/news.gif" style="float:left;margin-right:10px;"/>
        <label>
            <b>Europe, here we come</b><br />
            Amakozi Technologies opens subsidiary in Rotterdam, Netherlands.
        </label>
    </a>
</p>
<br />
<p class="quicklink">
    <a href="/news/partnersdltridion.aspx">
        <img src="/graphics/news.gif" style="float:left;margin-right:10px;"/>
        <label>
            <b>Amakozi partners with SDL Tridion</b><br />
            Amakozi Technologies signs a sales and consultancy partnership agreement with leading web content management system provider SDL Tridion, for the Southern African region.
        </label>
    </a>
</p>
<br />
<p class="quicklink">
    <a href="/news/IMSSUsponser.aspx">
        <img src="/graphics/news.gif" style="float:left;margin-right:10px;"/>
        <label>
            <b>Amakozi Technologies sponsors Metallic Silhouette Shooting</b><br />
            Amakozi Technologies is the technology sponsor for Metallic Silhouette Shooting in South Africa. The sponsorship consists of providing equipment and data processing assistance at national and world championship events, as well as designing and maintaining websites for the national and Western Province controlling bodies.
        </label>
    </a>
</p>
<br />

</asp:Content>
<asp:Content ContentPlaceHolderID="Right" runat="server">
<br />
<br />
<br />
<p class="quicklink">
    <a href="/company/jobs.aspx">
        <img src="/graphics/unclesamneedyou.jpg" style="float:left;margin-right:10px;"/>
        <label>
            <b>Need a job?</b><br /><br />
            We need you! Click here to view jobs @ amakozi.
        </label>
    </a>
</p>

</asp:Content>
