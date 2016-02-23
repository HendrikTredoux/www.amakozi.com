using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AmakoziPDF
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RunPDF(object sender, EventArgs e)
        {
            //get the cv page html
            String html = GetHTML();            

            IHttpHandler pdf = new IHttpHandler();

            pdf.ProcessRequest(HttpContext.Current, html);
        }

        protected String GetHTML()
        {
            //TODO something that will grab the html of the cv from the page
            string html = string.Empty;

            html = "<p>Testingg...</p>";

            return html;
        }
    }
}
