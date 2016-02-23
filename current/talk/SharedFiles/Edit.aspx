<%@ Page language="c#" Codebehind="Edit.aspx.cs" MasterPageFile="~/App_MasterPages/layout.Master" AutoEventWireup="false" Inherits="mojoPortal.Web.SharedFilesUI.SharedFilesEdit" %>

<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">

<div class="yui-skin-sam">
<asp:Panel id="pnlNotFound" runat="server" visible="True" CssClass="modulecontent">
	<mp:SiteLabel id="Sitelabel1" runat="server" ConfigKey="SharedFilesNotFoundMessage" ResourceFile="SharedFileResources" UseLabelTag="false"></mp:SiteLabel>
</asp:Panel>

<asp:Panel id="pnlFolder" runat="server" CssClass="modulecontent" DefaultButton="btnUpdateFolder">
    <fieldset>
        <legend>	
            <mp:SiteLabel id="Sitelabel5" runat="server" ConfigKey="SharedFilesEditFolderLabel" ResourceFile="SharedFileResources" UseLabelTag="false"></mp:SiteLabel>
        </legend>
        <div class="settingrow">
             <mp:SiteLabel id="Sitelabel10" runat="server" ForControl="ddFolderList" CssClass="settinglabel" ConfigKey="SharedFilesFolderParentLabel" ResourceFile="SharedFileResources"></mp:SiteLabel>
            <asp:DropDownList id="ddFolderList" runat="server" EnableTheming="false" DataValueField="FolderID" DataTextField="FolderName" CssClass="forminput"></asp:DropDownList>
        </div>
        <div class="settingrow">
            <mp:SiteLabel id="Sitelabel8" runat="server" ForControl="txtFolderName" CssClass="settinglabel" ConfigKey="SharedFilesFolderNameLabel" ResourceFile="SharedFileResources"></mp:SiteLabel>
            <asp:TextBox id="txtFolderName" runat="server"  Columns="45" maxlength="255" CssClass="forminput"></asp:TextBox>
        </div>
        <div class="settingrow">
        <mp:SiteLabel id="SiteLabel35" runat="server" CssClass="settinglabel" ConfigKey="spacer" />
        <div class="forminput">
            <portal:mojoButton id="btnUpdateFolder" runat="server" />&nbsp;
		    <portal:mojoButton  id="btnDeleteFolder" runat="server" CausesValidation="false" />&nbsp;
		    <asp:HyperLink ID="lnkCancelFolder" runat="server" CssClass="cancellink" />&nbsp;	
		   </div>	
        </div>
    </fieldset>
</asp:Panel>
<asp:Panel id="pnlFile" runat="server" visible="False" CssClass="modulecontent" DefaultButton="btnUpdateFile">
   <fieldset>
        <legend>	
            <mp:SiteLabel id="lblEditLabel" runat="server" ConfigKey="SharedFilesEditLabel" ResourceFile="SharedFileResources" UseLabelTag="false"></mp:SiteLabel>
        </legend>
        <div class="settingrow">
            <mp:SiteLabel id="lblUploadDateLabel" runat="server" CssClass="settinglabel" ConfigKey="SharedFilesUploadDateLabel" ResourceFile="SharedFileResources"></mp:SiteLabel>
            <asp:Label id="lblUploadDate" runat="server" ></asp:Label>
        </div>
        <div class="settingrow">
            <mp:SiteLabel id="lblUploadByLabel" runat="server" CssClass="settinglabel" ConfigKey="SharedFilesUploadByLabel" ResourceFile="SharedFileResources"></mp:SiteLabel>
            <asp:Label id="lblUploadBy" runat="server" ></asp:Label>
        </div>
        <div class="settingrow">
            <mp:SiteLabel id="lblFileNameLabel" runat="server" ForControl="txtFriendlyName" CssClass="settinglabel" ConfigKey="SharedFilesFileNameLabel" ResourceFile="SharedFileResources"></mp:SiteLabel>
            <asp:TextBox id="txtFriendlyName" runat="server"  Columns="45" maxlength="255" CssClass="forminput widetextbox"></asp:TextBox>
        </div>
        <div class="settingrow">
            <mp:SiteLabel id="lblFileSizeLabel" runat="server" CssClass="settinglabel" ConfigKey="SharedFilesFileSizeLabel" ResourceFile="SharedFileResources"></mp:SiteLabel>
            <asp:Label id="lblFileSize" runat="server" CssClass="Normal"></asp:Label>
        </div>
        <div class="settingrow">
            <mp:SiteLabel id="SiteLabel7" runat="server" CssClass="settinglabel" ConfigKey="FileDescription" ResourceFile="SharedFileResources" UseLabelTag="false"></mp:SiteLabel>
        </div>
        <div class="settingrow">
            <mpe:EditorControl ID="edDescription" runat="server"></mpe:EditorControl>
        </div>
        <div class="settingrow">
            <mp:SiteLabel id="Sitelabel2" runat="server" ForControl="ddFolders" CssClass="settinglabel" ConfigKey="SharedFilesFolderLabel" ResourceFile="SharedFileResources"></mp:SiteLabel>
            <asp:DropDownList id="ddFolders" runat="server" EnableTheming="false" DataValueField="FolderID" DataTextField="FolderName" CssClass="forminput"></asp:DropDownList>
        </div>
        <div class="settingrow">
            <mp:SiteLabel id="Sitelabel3" runat="server" ForControl="file1" CssClass="settinglabel" ConfigKey="SharedFilesUploadLabel" ResourceFile="SharedFileResources"></mp:SiteLabel>
            <div class="forminput">
            <NeatUpload:InputFile id="file1" size="28" runat="server" /> &nbsp;&nbsp;
		    <portal:mojoButton id="btnUpload" runat="server" Text="Upload" />
		    <NeatUpload:ProgressBar id="progressBar" runat="server"><mp:SiteLabel id="progresBarLabel" runat="server" ConfigKey="CheckProgressText" /></NeatUpload:ProgressBar>
		   
			</div>
        </div>
        <div class="settingrow">
             <portal:mojoButton  id="btnUpdateFile" runat="server" />&nbsp;
		    <portal:mojoButton id="btnDeleteFile" runat="server" CausesValidation="false" />&nbsp;
		    <asp:HyperLink ID="lnkCancelFile" runat="server" CssClass="cancellink" />&nbsp;	
        </div>
        <div class="settingrow">
            <portal:mojoLabel id="lblError" runat="server" cssclass="txterror" />
        </div>
        <div id="divHistory" runat="server" class="modulecontent">
            <mp:SiteLabel id="Sitelabel4" runat="server" ConfigKey="SharedFilesHistoryLabel" ResourceFile="SharedFileResources"></mp:SiteLabel>
            <mp:mojoGridView ID="grdHistory" runat="server"
	             CssClass=""
	             AutoGenerateColumns="false"
                 DataKeyNames="ID">
                 <Columns>
		            <asp:TemplateField>
			            <ItemTemplate>
                            <asp:Button ID="lnkName" CssClass="FileManager buttonlink" runat="server" 
						        text='<%# DataBinder.Eval(Container.DataItem,"FriendlyName") %>' 
						        CommandName="download" 
						        CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' 
						        CausesValidation="false">
						    </asp:Button>
                            
                        </ItemTemplate>
		            </asp:TemplateField>
		            <asp:TemplateField>
			            <ItemTemplate>
			               <%# DataBinder.Eval(Container.DataItem,"SizeInKB") %>
                        </ItemTemplate>
		            </asp:TemplateField>
		            <asp:TemplateField>
			            <ItemTemplate>
			             <%# FormatDate(Convert.ToDateTime(Eval("UploadDate"))) %>
			            </ItemTemplate>
		            </asp:TemplateField>
		            <asp:TemplateField>
			            <ItemTemplate>
                            <%# FormatDate(Convert.ToDateTime(Eval("ArchiveDate")))%>
                        </ItemTemplate>
		            </asp:TemplateField>
		            <asp:TemplateField>
			            <ItemTemplate>
			                 <asp:Button ID="LinkButton1" runat="server" cssclass="buttonlink"
						        CommandName="restore" 
						        CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
						        CausesValidation="false" 
						        text="<%# Resources.SharedFileResources.SharedFilesRestoreLabel %>">
						    </asp:Button>
                            <asp:Button ID="Button1" runat="server" cssclass="buttonlink"
						        CommandName="deletehx" 
						        CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
						        CausesValidation="false" 
						        text="<%# Resources.SharedFileResources.SharedFilesDeleteButton %>">
						    </asp:Button>
                        </ItemTemplate>
		            </asp:TemplateField>
            </Columns>
            </mp:mojoGridView>     
        </div>
    </fieldset>
    <asp:HiddenField ID="hdnReturnUrl" runat="server" />
</asp:Panel>
</div>
<portal:SessionKeepAliveControl id="ka1" runat="server" />	
</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />
