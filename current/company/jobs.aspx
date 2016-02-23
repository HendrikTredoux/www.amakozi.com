<%@ Page Language="C#" MasterPageFile="~/OneColumn.master" Title="Untitled Page" %>
<asp:Content ID="MenuContent" runat="server" ContentPlaceHolderID="MainMenu">
   <amt:Menu ID="menu" runat="server" Location="company" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <h1>jobs @ amakozi technologies <amt:bookmarks runat="server" cssclass="bookmarks"/></h1><hr />
    <h3>Yes, we need you!</h3>
    <p>Amakozi Technologies has several job openings, and are looking to fill these positions based on the skill requirements below.  Please indicate in your application for which office you are applying, cc or LLC.</p>
    <table style="width:100%;">
	    <tr>
		    <td><b>Amakozi Technologies cc</b></td>

		    <td style="width:15px;"></td>
		    <td><b>Amakozi Technologies LLC</b></td>
	    </tr>
	    <tr>
		    <td style="border:1px solid grey" valign="top">
			    <p>The positions below are open in the Amakozi Technologies cc office, based in South Africa.</p>
			    <p>Consultants will travel to United States and Europe for periods of 1-2 months at a time, and the remainder of the time be working from the Amakozi Technologies office in Somerset West.</p>

			    <p>Applicants require a South African passport, a legalized birth certificate, and must be fluent in English</p>
			    <ul>
				    <li>Tridion Senior Technical Consultant</li>
				    <li>Tridion Technical Consultant</li>
				    <li>ASP.Net 3.5 Developer</li>
			    </ul>
			    <br/>

			    <p>Minimum skill requirements:</p>
			    <ul>
				    <li>C#</li>
				    <li>XSL, XSLT</li>
				    <li>CSS</li>
				    <li>JavaScript</li>

				    <li>Microsoft SQL Server or Oracle</li>
				    <li>Optional: Dreamweaver</li>
			    </ul>
		    </td>
		    <td style="width:15px;"></td>
		    <td style="border:1px solid grey" valign="top">
			    <p>The positions below are open in the Amakozi Technologies LLC office, based in United States of America.</p>

			    <p>Consultants will be employed by the Amakozi Technologies llc office, and will be permanently based in United States.  US citizens or green card holders only.</p>
			    <p>Consultants will do extensive traveling in United States, and have the option to home-office.</p>
			    <ul>
				    <li>Tridion Senior Technical Consultant</li>
				    <li>Tridion Technical Consultant</li>
				    <li>ASP.Net 3.5 Developer</li>

			    </ul>
			    <br/>
			    <p>Minimum skill requirements:</p>
			    <ul>
				    <li>C#</li>
				    <li>XSL, XSLT</li>
				    <li>CSS</li>

				    <li>JavaScript</li>
				    <li>Microsoft SQL Server or Oracle</li>
				    <li>Optional: Dreamweaver</li>
			    </ul>
		    </td>
	    </tr>
    </table>

    <h3>Email Your CV</h3>
    <hr /><p>Please email your CV to <%= AMKUtil.secure_email("jobs@amakozi.com")%></p>
</asp:Content>

