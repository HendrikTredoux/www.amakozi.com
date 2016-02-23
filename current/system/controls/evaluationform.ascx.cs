using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Net.Mail;
using System.Net;
using System.Net.Mime;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Xml.Xsl;
using System.IO;

public partial class system_controls_evaluationform : System.Web.UI.UserControl
{
	string _FilePath = "";
	string _QueryStringKey = "EID";
	string _SurveyReportXsl = "~/system/xslt/surveyreport.xsl";
	string[,] _Surveys = null;
	bool _GeneralComments = false;
	bool _Completed = false;
	string _CompletedMessage = "";

    protected void Page_Load(object sender, EventArgs e)
    {

    }

	protected void Page_Init(object sender, EventArgs e) {
			XmlDocument FormDoc = new XmlDocument();
			XmlReader reader;
			try {
				string path = Server.MapPath("~/App_Data/" + _FilePath + "/" + Request.QueryString[_QueryStringKey] + ".xml");
				if (File.Exists(path)) {
					reader = XmlReader.Create(path);
					FormDoc.Load(reader);
					reader.Close();
					_CompletedMessage = FormDoc.SelectSingleNode("/root/completedmessage").InnerText;
					if (FormDoc.SelectSingleNode("/root").Attributes["completed"].Value == "true") {
						_Completed = true;
						EvaluationContainer.Visible = false;
						MessageContainer.Text = _CompletedMessage;
						MessageContainer.Visible = true;
					} else {
						lblClientName.Text = FormDoc.SelectSingleNode("/root/client").InnerText;
						lblConsultantName.Text = FormDoc.SelectSingleNode("/root/consultant").InnerText;
						lblContractFrom.Text = FormDoc.SelectSingleNode("/root/contractperiod/start").InnerText;
						lblContractTo.Text = FormDoc.SelectSingleNode("/root/contractperiod/end").InnerText;
						lblProjectName.Text = FormDoc.SelectSingleNode("/root/project").InnerText;
						lblReviewerName.Text = FormDoc.SelectSingleNode("/root/reviewer").InnerText;
						XmlNodeList Surveys = FormDoc.SelectNodes("/root/survey");
						int j = 0;
						_Surveys = new string[Surveys.Count, 4];
						string clientarray = "[";
						string mainsep = "";
						foreach (XmlNode Survey in Surveys) {
							Label Label = new Label();
							Label.Text = Survey["label"].InnerText;
							SurveyPlaceHolder.Controls.Add(Label);
							HtmlTable Table = new HtmlTable();
							Table.CellSpacing = 1;
							Table.CellPadding = 3;
							XmlNodeList Options = Survey.SelectNodes("option");
							XmlNodeList Items = Survey.SelectNodes("item");
							if (Survey.Attributes["type"].Value == "radio") {
								HtmlTableRow Row = new HtmlTableRow();
								HtmlTableCell LabelCell = new HtmlTableCell();
								LabelCell.Attributes.Add("class", "questionlabel");
								LabelCell.InnerText = "";
								Row.Cells.Add(LabelCell);
								foreach (XmlNode Option in Options) {
									HtmlTableCell OptionCell = new HtmlTableCell("th");
									OptionCell.InnerText = Option.InnerText;
									Row.Cells.Add(OptionCell);
								}
								Table.Rows.Add(Row);
								_Surveys[j, 2] = Options.Count.ToString();
							} else {
								_Surveys[j, 2] = "1";
							}
							int k = 0;
							clientarray += mainsep + "[[" + Items.Count + ",'" + Survey.Attributes["type"].Value + "', " + Options.Count.ToString() + "],[";
							mainsep = ",";
							string sep = "";
							foreach (XmlNode Item in Items) {
								string answer = Item["answer"].InnerText;
								HtmlTableRow Row = new HtmlTableRow();
								if ((k % 2) == 0) {
									Row.Attributes.Add("class", "rowon");
								} else {
									Row.Attributes.Add("class", "rowoff");
								}
								HtmlTableCell LabelCell = new HtmlTableCell();
								LabelCell.Attributes.Add("class", "questionlabel");
								LabelCell.InnerText = Item["question"].InnerText;
								clientarray += sep + "\"" + Item["question"].InnerText + "\"";
								sep = ",";
								Row.Cells.Add(LabelCell);
								if (Survey.Attributes["type"].Value == "radio") {
									int i = 0;
									foreach (XmlNode Option in Options) {
										HtmlTableCell AnswerCell = new HtmlTableCell();
										AnswerCell.Align = "center";
										HtmlInputRadioButton RButton = new HtmlInputRadioButton();
										RButton.Name = "Answer_" + j.ToString() + "_" + k.ToString();
										RButton.ID = "Answer_" + j.ToString() + "_" + k.ToString() + "_" + i.ToString();
										i++;
										RButton.Value = Option.Attributes["value"].Value;
										if (RButton.Value == answer) {
											RButton.Checked = true;
										}
										AnswerCell.Controls.Add(RButton);
										Row.Cells.Add(AnswerCell);
										ListItem LItem = new ListItem(Option.InnerText, Option.Attributes["value"].Value);
									}
								} else {
									HtmlTableCell AnswerCell = new HtmlTableCell();
									HtmlSelect DDList = new HtmlSelect();
									DDList.ID = "Answer_" + j.ToString() + "_" + k.ToString();
									foreach (XmlNode Option in Options) {
										ListItem LItem = new ListItem(Option.InnerText, Option.Attributes["value"].Value);
										if (LItem.Value == answer) {
											LItem.Selected = true;
										}
										DDList.Items.Add(LItem);
									}
									AnswerCell.Controls.Add(DDList);
									Row.Cells.Add(AnswerCell);
								}
								Table.Rows.Add(Row);
								k++;
							}
							clientarray += "]]";
							_Surveys[j, 0] = Survey.Attributes["type"].Value;
							_Surveys[j, 1] = k.ToString();
							_Surveys[j, 3] = "false";
							if (Survey["comments"].Attributes["show"].Value == "true") {
								_Surveys[j, 3] = "true";
								HtmlTextArea TextArea = new HtmlTextArea();
								TextArea.Cols = 30;
								TextArea.Rows = 6;
								TextArea.ID = "Comment_" + j.ToString();
								TextArea.InnerText = Survey["comments"]["answer"].InnerText;
								HtmlTableRow LabelRow = new HtmlTableRow();
								HtmlTableCell LabelCell = new HtmlTableCell();
								LabelCell.ColSpan = Int32.Parse(_Surveys[j, 2]) + 1;
								LabelCell.InnerHtml = Survey["comments"]["label"].InnerText;
								LabelRow.Cells.Add(LabelCell);
								Table.Rows.Add(LabelRow);
								HtmlTableRow CommentRow = new HtmlTableRow();
								HtmlTableCell CommentCell = new HtmlTableCell();
								CommentCell.ColSpan = Int32.Parse(_Surveys[j, 2]) + 1;
								CommentCell.Controls.Add(TextArea);
								CommentRow.Cells.Add(CommentCell);
								Table.Rows.Add(CommentRow);
							}
							SurveyPlaceHolder.Controls.Add(Table);
							SurveyPlaceHolder.Controls.Add(new HtmlGenericControl("hr"));
							j++;
						}
						clientarray += "]";
						XmlNode Comment = FormDoc.SelectSingleNode("/root/comments");
						if (Comment.Attributes["show"].Value == "true") {
							_GeneralComments = true;
							HtmlTable Table = new HtmlTable();
							Table.CellSpacing = 0;
							Table.CellPadding = 3;
							HtmlTableRow LabelRow = new HtmlTableRow();
							HtmlTableCell LabelCell = new HtmlTableCell();
							LabelCell.InnerHtml = Comment["label"].InnerText;
							LabelRow.Cells.Add(LabelCell);
							Table.Rows.Add(LabelRow);
							HtmlTextArea GeneralComments = new HtmlTextArea();
							GeneralComments.Cols = 30;
							GeneralComments.Rows = 6;
							GeneralComments.InnerText = Comment["answer"].InnerText;
							GeneralComments.ID = "GeneralComment";
							HtmlTableRow CommentRow = new HtmlTableRow();
							HtmlTableCell CommentCell = new HtmlTableCell();
							CommentCell.Controls.Add(GeneralComments);
							CommentRow.Cells.Add(CommentCell);
							Table.Rows.Add(CommentRow);
							SurveyPlaceHolder.Controls.Add(Table);
						}
						string ValScript = "<script>";
						ValScript += "var SurveyInfo = " + clientarray + ";";
						ValScript += "function ValidateForm(){";
						ValScript += "var msg = ''; ";
						ValScript += "for(i = 0; i < " + Surveys.Count + "; i++) {";
						ValScript += "if(SurveyInfo[i][0][1] == 'radio') {";
						ValScript += "for(j = 0; j < SurveyInfo[i][0][0]; j++) { ";
						ValScript += "var answerset = false; ";
						ValScript += "for(k = 0; k < SurveyInfo[i][0][2]; k++) { ";
						ValScript += "var rb = document.getElementById('" + this.ClientID + this.ClientIDSeparator + "Answer_' + i + '_' + j + '_' + k);";
						ValScript += "if(rb.checked){";
						ValScript += "answerset = true; ";
						ValScript += "k = SurveyInfo[i][0][2];}}";
						ValScript += "if(!answerset) { ";
						ValScript += "msg += '\\n' + SurveyInfo[i][1][j];}}}else{ ";
						ValScript += "for(j = 0; j < SurveyInfo[i][0][0]; j++) { ";
						ValScript += "var dd = document.getElementById('" + this.ClientID + this.ClientIDSeparator + "Answer_' + i + '_' + j);";
						ValScript += "if(dd.value == '') {";
						ValScript += "msg += '\\n' + SurveyInfo[i][1][j];}}}}";
						ValScript += "if(msg != ''){alert('Please ensure to rate/answer all items.\\n' + msg); return false;}return true;";
						ValScript += "}</script>";
						Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ValidationScript", ValScript, false);
					}
				} else {
					EvaluationContainer.Visible = false;
					MessageContainer.Text = "The requested evaluation is currently not available";
					MessageContainer.Visible = true;
				}
			} catch {
				EvaluationContainer.Visible = false;
				MessageContainer.Text = "An error occurred, please try again later";
				MessageContainer.Visible = true;
			} finally {
				FormDoc = null;
				reader = null;
			}
	}

	public string FilePath {
		get { return _FilePath; }
		set { _FilePath = value; }
	}

	public string QueryStringKey {
		get { return _QueryStringKey; }
		set { _QueryStringKey = value; }
	}
	protected void Button1_Click(object sender, EventArgs e) {
		if (!_Completed) {
			XmlDocument FormDoc = new XmlDocument();
			XmlReader reader = null;
			try {
				string path = Server.MapPath("~/App_Data/" + _FilePath + "/" + Request.QueryString[_QueryStringKey] + ".xml");
				//string path = Server.MapPath("~/App_Data/evaluation/evaluation.xml");
				reader = XmlReader.Create(path);				
				FormDoc.Load(reader);
				reader.Close();
				XmlNode RootNode = FormDoc.SelectSingleNode("/root");
				if (RootNode.Attributes["completed"].Value == "false") {
					for (int i = 0; i <= _Surveys.GetUpperBound(0); i++) {
						if (_Surveys[i, 0] == "radio") {
							for (int j = 1; j <= Int32.Parse(_Surveys[i, 1]); j++) {
								string answer = "";
								for (int k = 0; k < Int32.Parse(_Surveys[i, 2]); k++) {
									HtmlInputRadioButton rb = (HtmlInputRadioButton)SurveyPlaceHolder.FindControl("Answer_" + i.ToString() + "_" + Convert.ToString(j - 1) + "_" + k.ToString());
									if (rb.Checked) {
										answer = rb.Value;
										break;
									}
								}
								XmlNode Answer = FormDoc.SelectSingleNode("/root/survey[" + Convert.ToString(i + 1) + "]/item[" + j.ToString() + "]/answer");
								Answer.InnerText = answer;
							}
						} else {
							for (int j = 1; j <= Int32.Parse(_Surveys[i, 1]); j++) {
								string answer = "";
								HtmlSelect dd = (HtmlSelect)SurveyPlaceHolder.FindControl("Answer_" + i.ToString() + "_" + Convert.ToString(j - 1));
								answer = dd.Value;
								XmlNode Answer = FormDoc.SelectSingleNode("/root/survey[" + Convert.ToString(i + 1) + "]/item[" + j.ToString() + "]/answer");
								Answer.InnerText = answer;
							}
						}
						if (_Surveys[i, 3] == "true") {
							string answer = "";
							HtmlTextArea SurveyComment = (HtmlTextArea)SurveyPlaceHolder.FindControl("Comment_" + i.ToString());
							answer = SurveyComment.InnerText;
							XmlNode Answer = FormDoc.SelectSingleNode("/root/survey[" + Convert.ToString(i + 1) + "]/comments/answer");
							Answer.InnerText = answer;
						}
					}
					if (_GeneralComments) {
						string answer = "";
						HtmlTextArea GeneralComment = (HtmlTextArea)SurveyPlaceHolder.FindControl("GeneralComment");
						answer = GeneralComment.InnerText;
						XmlNode Answer = FormDoc.SelectSingleNode("/root/comments/answer");
						Answer.InnerText = answer;
					}
					RootNode.Attributes["completed"].Value = "true";
					XmlWriter writer = XmlWriter.Create(path);
					FormDoc.Save(writer);
					writer.Close();
					//FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read);
					try {
						XmlNodeList Recipients = FormDoc.SelectNodes("/root/email/address");
						MailMessage Message = new MailMessage();
						foreach (XmlNode Recipient in Recipients) {
							Message.To.Add(new MailAddress(Recipient.InnerText));
						}
						Message.From = new MailAddress("no-reply@amakozi.com", "Amakozi Web");
						//Attachment att = new Attachment(fs, new ContentType(MediaTypeNames.Text.Xml));
						//att.ContentDisposition.FileName = Request.QueryString[_QueryStringKey] + ".xml";
						//Message.Attachments.Add(att);
						Message.IsBodyHtml = true;
						Message.Priority = MailPriority.Normal;
						Message.Subject = "Amakozi.com - Consultant Evaluation completed";
						XslCompiledTransform xsl = new XslCompiledTransform();
						xsl.Load(Server.MapPath(_SurveyReportXsl));
						MemoryStream stream = new MemoryStream();
						xsl.Transform(FormDoc, null, stream);
						Message.Body = System.Text.Encoding.UTF8.GetString(stream.ToArray());
						SmtpClient smtp = new SmtpClient("localhost");
						smtp.Send(Message);
					} catch { } 
					//finally {
						//try {
						//    fs.Close();
						//} catch { }
						//fs.Dispose();
					//}
				}
				EvaluationContainer.Visible = false;
				MessageContainer.Text = _CompletedMessage;
				MessageContainer.Visible = true;
			} catch (Exception ex) {
				EvaluationContainer.Visible = false;
				MessageContainer.Text = "An error occurred, please try again later<br />" + ex.Message;
				MessageContainer.Visible = true;
			} finally {
				try {
					FormDoc = null;
					reader = null;
				} catch { }
			}
		} else {
			EvaluationContainer.Visible = false;
			MessageContainer.Text = _CompletedMessage;
			MessageContainer.Visible = true;
		}
	}
}
