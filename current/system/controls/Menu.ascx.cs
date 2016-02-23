using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public partial class system_controls_Menu : System.Web.UI.UserControl
{
	public enum SiteSection { home, products, services, casestudies, company, awareness, talk };
	private SiteSection location = SiteSection.home;
	protected Dictionary<SiteSection, KeyValuePair<string, string>> menuSource = new Dictionary<SiteSection, KeyValuePair<string, string>>();

    protected void Page_Load(object sender, EventArgs e)
    {
		menuSource.Add(SiteSection.home, new KeyValuePair<string, string>("Home", "/"));
		menuSource.Add(SiteSection.products, new KeyValuePair<string, string>("Products", "/products"));
		menuSource.Add(SiteSection.services, new KeyValuePair<string, string>("Services", "/services"));
		menuSource.Add(SiteSection.casestudies, new KeyValuePair<string, string>("Case Studies", "/casestudies"));
        menuSource.Add(SiteSection.company, new KeyValuePair<string, string>("Company", "/company"));
        menuSource.Add(SiteSection.awareness, new KeyValuePair<string, string>("Awareness", "/awareness"));
        menuSource.Add(SiteSection.talk, new KeyValuePair<string, string>("Talk", "/talk"));
		MenuItems.DataSource = menuSource;
		MenuItems.DataBind();
	}
	public SiteSection Location {
		get { return location; }
		set { location = value; }
	}

    protected string sub_menus(SiteSection section)
    {
        switch (section)
        {
            case SiteSection.products:
                return products_sub_menu();
//            case SiteSection.services:
//                return services_sub_menu();
            // case SiteSection.awareness:
            //     return awareness_sub_menu();
            case SiteSection.casestudies:
                return casestudies_sub_menu();
            case SiteSection.talk:
                return talk_sub_menu();
            default:
                return string.Empty;
        }
    }

    private String talk_sub_menu()
    {
        System.Text.StringBuilder bldr = new System.Text.StringBuilder();

        bldr.Append("<div class=\"dropdown_2columns\">");
        bldr.Append("<div class=\"col_2\"><a style=\"display:block;width:100%;\" href=\"http://www.amakozi.com/talk/blogs/blogs.aspx\"><h3 style=\"border-bottom-width: 0px;font-size:14px;\">Knowledge Base</h3></a></div>");
        bldr.Append("<div class=\"col_2\"><a style=\"display:block;width:100%;\" href=\"http://www.amakozi.com/talk/Forums/ForumView.aspx?pageid=1&mid=9&ItemID=3\"><h3 style=\"border-bottom-width: 0px;font-size:14px;\">SDL Tridion Forum</h3></a></div>");
        bldr.Append("<div class=\"col_2\"><a style=\"display:block;width:100%;\" href=\"http://www.amakozi.com/talk/Forums/ForumView.aspx?pageid=1&mid=9&ItemID=4\"><h3 style=\"border-bottom-width: 0px;font-size:14px;\">Backbase Forum</h3></a></div>");
        bldr.Append("<div class=\"col_2\"><a style=\"display:block;width:100%;\" href=\"http://www.amakozi.com/talk/Forums/ForumView.aspx?pageid=1&mid=9&ItemID=5\"><h3 style=\"border-bottom-width: 0px;font-size:14px;\">Reporting Forum</h3></a></div>");
        bldr.Append("</div>");
        return bldr.ToString();
    }

    private String awareness_sub_menu()
    {
        System.Text.StringBuilder bldr = new System.Text.StringBuilder();

        bldr.Append("<div class=\"dropdown_2columns\">");
        bldr.Append("<div class=\"col_2\"><a href=\"" + ResolveClientUrl("~/awareness/default.aspx") + "\"><h3 style=\"border-bottom-width: 0px;font-size:14px;\">Fuel</h3></a></div>");
        bldr.Append("</div>");
        return bldr.ToString();
    }

    private String products_sub_menu()
    {
            System.Text.StringBuilder bldr = new System.Text.StringBuilder();

            bldr.Append("<div class=\"dropdown_2columns\">");
            bldr.Append("<div class=\"col_2\"><a href=\"" + ResolveClientUrl("~/products/reporting.aspx") + "\"><img src=\"/graphics/products/reporting.png\" style=\"width: 70px; margin-left: -10px;\" class=\"img_left imgshadow\" alt=\"\" /><h3 style=\"border-bottom-width: 0px;font-size:14px;\">Reporting for SDL Tridion</h3></a></div>");
            bldr.Append("<div class=\"col_2\"><a href=\"" + ResolveClientUrl("~/products/claytablet.aspx") + "\"><img src=\"/graphics/products/claytablet.jpg\" style=\"width: 70px; margin-left: -10px;\" class=\"img_left imgshadow\" alt=\"\" /><h3 style=\"border-bottom-width: 0px;font-size:14px;\">SDL Tridion Claytablet</h3></a></div>");
            bldr.Append("</div>");
            return bldr.ToString();
    }

    public String casestudies_sub_menu()
    {
            System.Text.StringBuilder bldr = new System.Text.StringBuilder();

            bldr.Append("<div class=\"dropdown_2columns\">");
            bldr.Append("<div class=\"col_2\"><a href=\"" + ResolveClientUrl("~/casestudies/harris.aspx") + "\"><img src=\"/graphics/harris/harris.png\" style=\"width: 70px; margin-left: -10px;\" class=\"img_left imgshadow\" alt=\"\" /><h3 style=\"border-bottom-width: 0px;font-size:14px;\">Harris</h3></a></div>");
            bldr.Append("<div class=\"col_2\"><a href=\"" + ResolveClientUrl("~/casestudies/move.aspx") + "\"><img src=\"/graphics/move/image001.png\" style=\"width: 70px; margin-left: -10px;\" class=\"img_left imgshadow\" alt=\"\" /><h3 style=\"border-bottom-width: 0px;font-size:14px;\">Move.com</h3></a></div>");
             bldr.Append("<div class=\"col_2\"><a href=\"" + ResolveClientUrl("~/casestudies/bdbio.aspx") + "\"><img src=\"/graphics/bdbio/BD.jpg\" style=\"width: 70px; margin-left: -10px;\" class=\"img_left imgshadow\" alt=\"\" /><h3 style=\"border-bottom-width: 0px;font-size:14px;\">BD Biosciences</h3></a></div>");
            bldr.Append("<div class=\"col_2\"><a href=\"" + ResolveClientUrl("~/casestudies/quest.aspx") + "\"><img src=\"/graphics/quest/image001.png\" style=\"width: 70px; margin-left: -10px;\" class=\"img_left imgshadow\" alt=\"\" /><h3 style=\"border-bottom-width: 0px;font-size:14px;\">Quest Software</h3></a></div>");
			bldr.Append("<div class=\"col_2\"><a href=\"" + ResolveClientUrl("~/casestudies/nationwide.aspx") + "\"><img src=\"/graphics/nationwide/nationwide.jpg\" style=\"width: 70px; margin-left: -10px;\" class=\"img_left imgshadow\" alt=\"\" /><h3 style=\"border-bottom-width: 0px;font-size:14px;\">Nationwide</h3></a></div>");
			bldr.Append("<div class=\"col_2\"><a href=\"" + ResolveClientUrl("~/casestudies/uml.aspx") + "\"><img src=\"/graphics/uml/logo.jpg\" style=\"width: 70px; margin-left: -10px;\" class=\"img_left imgshadow\" alt=\"\" /><h3 style=\"border-bottom-width: 0px;font-size:14px;\">UML</h3></a></div>");
            bldr.Append("</div>");
			

            return bldr.ToString();
    }

    public String services_sub_menu()
    {
            System.Text.StringBuilder bldr = new System.Text.StringBuilder();

            bldr.Append("<div class=\"dropdown_2columns\">");
            bldr.Append("<div class=\"col_2\"><a href=\"" + ResolveClientUrl("~/services/sdltridion.aspx") + "\"><img src=\"/graphics/services/sdltridion.jpg\" style=\"width: 70px; margin-left: -10px;\" class=\"img_left imgshadow\" alt=\"\" /><h3 style=\"border-bottom-width: 0px;font-size:14px;\">CMS Services</h3></a></div>");
            bldr.Append("</div>");

            return bldr.ToString();
    }
}
