using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Diagnostics;
using System.IO;

namespace AmakoziPDF
{
    /// <summary>
    /// Summary description for pdf
    /// </summary>
    public class IHttpHandler//pdf : IHttpHandler
    {

        public void ProcessRequest(HttpContext context, String html)
        {
            //String html = System.IO.File.ReadAllText(context.Server.MapPath("~/a.txt"));
            String filename_cv = "amakozi_cv.pdf";
            context.Response.ContentType = "application/pdf";
            context.Response.Headers["Content-Disposition"] = "attachment; filename=" + filename_cv;
            WritePDFToResponse(ref html, context.Response);
            // context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        /**
         * This has to point to the WKHtmlToPDF Binary on the Server.
        **/
        public static String filename = System.IO.Path.Combine("c:\\", "Program Files (x86)", "wkhtmltopdf", "wkhtmltopdf.exe");

        /**
         * Writes a generated PDF to the response object.
         * 
         * Good for not having to deal with all the streams etc.
         * 
         * Expects:
         * @html - The String of HTML to put in the PDF
         * @res - The response to write the output to
         * 
         * Returns a Boolean to indicate if it was a success.
         * 
         * @author Johann du Toit
         **/
        public static Boolean WritePDFToResponse(ref String html, HttpResponse res)
        {
            MemoryStream pdf_content = new MemoryStream();

            if (HTMLStringToPDF(html, pdf_content))
            {
                res.BinaryWrite(pdf_content.ToArray());
                return true;
            }
            else return false;
        }

        /**
     * Does the actuall Binary calling and copies the Output the stream given.
     * 
     * @authro Johann du Toit
     **/
        public static bool HTMLStringToPDF(String Html, Stream pdf)
        {
            Process p;
            StreamWriter stdin;
            ProcessStartInfo psi = new ProcessStartInfo();

            psi.FileName = filename;
            psi.WorkingDirectory = Path.GetDirectoryName(psi.FileName);

            // run the conversion utility
            psi.UseShellExecute = false;
            psi.CreateNoWindow = true;
            psi.RedirectStandardInput = true;
            psi.RedirectStandardOutput = true;
            psi.RedirectStandardError = true;

            // note: that we tell wkhtmltopdf to be quiet and not run scripts
            //psi.Arguments = "--footer-html \"C:\\inetpub\\wwwroot\\UMLNico\\catalog\\pdf\\footerpage.html\" --footer-right \"Page [page] of [toPage]\" " + "- -";
            //psi.Arguments = "--footer-right \"Page [page] of [toPage]\" " + "- -";
            //psi.Arguments = "--footer-html \"" + UMLConstants.AppSettings.footerpath + "\" --footer-right \"Page [page] of [toPage]\" " + "- -";

            //psi.Arguments = "--footer-right  C:\\inetpub\\wwwroot\\UMLNico\\catalog\\pdf\footerpage.html" + "- -";
            psi.Arguments = "--footer-right \"Page [page] of [toPage]\" " + "- -";


            p = Process.Start(psi);

            try
            {
                stdin = p.StandardInput;
                stdin.AutoFlush = true;
                stdin.Write(Html);
                stdin.Dispose();

                CopyStream(p.StandardOutput.BaseStream, pdf);
                p.StandardOutput.Dispose();
                pdf.Position = 0;

                //debugging code!!!
                MemoryStream pdf_error = new MemoryStream();
                CopyStream(p.StandardError.BaseStream, pdf_error);
                p.StandardError.Dispose();
                pdf_error.Position = 0;

                var sr = new StreamReader(pdf_error);
                var myStr = sr.ReadToEnd();

                p.WaitForExit(10000);

                return true;
            }
            catch
            {
                return false;

            }
            finally
            {
                p.Dispose();
            }
        }

        /**
         * Quick Helper method to Write the stream.
         * @author Johann du Toit
         **/
        public static void CopyStream(Stream input, Stream output)
        {
            byte[] buffer = new byte[32768];
            int read;
            while ((read = input.Read(buffer, 0, buffer.Length)) > 0)
            {
                output.Write(buffer, 0, read);
            }
        }
    }
}