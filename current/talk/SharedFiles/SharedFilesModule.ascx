<%@ Control Language="c#" AutoEventWireup="true" CodeBehind="SharedFilesModule.ascx.cs" Inherits="mojoPortal.Web.SharedFilesUI.SharedFilesModule" %>
<%@ Register Namespace="mojoPortal.Web.SharedFilesUI" Assembly="mojoPortal.Features.UI" TagPrefix="sf" %>
<sf:SharedFilesDisplaySettings ID="displaySettings" runat="server" />
<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
    <mp:CornerRounderTop ID="ctop1" runat="server" />
    <portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" CssClass="panelwrapper sharedfiles">
        <portal:ModuleTitleControl ID="Title1" runat="server" />
        <portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
            <portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
                <asp:UpdatePanel ID="upFiles" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="pnlFile" runat="server" DefaultButton="btnUpload">
                            <table class="FileManager_table" cellspacing="0" cellpadding="0" width="99%" border="0">
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="btnGoUp" runat="server" EnableViewState="false" OnClick="btnGoUp_Click" AlternateText=""
                                            ImageUrl="~/Data/SiteImages/btnUp.jpg" />
                                        <asp:ImageButton ID="btnDelete" runat="server" EnableViewState="false" OnClick="btnDelete_Click" AlternateText="Delete"
                                            ImageUrl="~/Data/SiteImages/btnDelete.jpg" ToolTip="<%# Resources.SharedFileResources.SharedFilesDeleteButton %>" />
                                        &nbsp;&nbsp;
                                        <asp:Label ID="lblCurrentDirectory" runat="server" EnableViewState="false" CssClass="foldername"></asp:Label>
                                        &nbsp;&nbsp;<asp:Label ID="lblError" runat="server" EnableViewState="false" CssClass="txterror"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <mp:mojoGridView ID="dgFile" runat="server" DataKeyNames="ID"
                                            SkinID="FileManager" AllowSorting="True" OnRowCancelingEdit="dgFile_RowCancelingEdit"
                                            OnRowCommand="dgFile_RowCommand" OnRowDataBound="dgFile_RowDataBound" OnRowEditing="dgFile_RowEditing"
                                            OnRowUpdating="dgFile_RowUpdating" OnSorting="dgFile_Sorting" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkChecked" runat="server" EnableViewState="false" Visible='<%# IsEditable%>' />
                                                        <asp:HyperLink runat="server" EnableViewState="false" Text="<%# Resources.SharedFileResources.SharedFilesEditLink %>"
                                                            ToolTip="<%# Resources.SharedFileResources.SharedFilesEditLink %>" ID="editLink"
                                                            ImageUrl='<%# this.ImageSiteRoot + "/Data/SiteImages/" + EditContentImage %>'
                                                            NavigateUrl='<%# this.SiteRoot + "/SharedFiles/Edit.aspx?pageid=" + PageId.ToString() + "&ItemID=" + DataBinder.Eval(Container.DataItem,"ID") + "&mid=" + ModuleId.ToString()  %>'
                                                            Visible="<%# IsEditable %>" /> 
                                                            <asp:Literal ID="litDownloadLink1" runat="server" EnableViewState="false" Text='<%# BuildDownloadLink(Eval("ID").ToString(),Eval("filename").ToString(), Eval("type").ToString(), true )%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField SortExpression="filename">
                                                    <ItemTemplate>
                                                        <asp:PlaceHolder ID="plhImgEdit" runat="server"></asp:PlaceHolder>
                                                        <asp:Image ID="imgType" runat="server" EnableViewState="false" AlternateText=" " ImageUrl="~/Data/SiteImages/Icons/unknown.gif" />
                                                        <asp:Button ID="lnkName" runat="server" CssClass="buttonlink" Text='<%# DataBinder.Eval(Container.DataItem,"filename") %>'
                                                            CommandName="ItemClicked" CommandArgument='<%# Eval("ID") %>' CausesValidation="false"
                                                            Visible='<%# (DataBinder.Eval(Container.DataItem,"type").ToString().ToLower() != "1") %>' />
                                                            <asp:Literal ID="litDownloadLink" runat="server" EnableViewState="false" Text='<%# BuildDownloadLink(Eval("ID").ToString(),Eval("filename").ToString(), Eval("type").ToString(), false )%>' />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Panel ID="PnlRename" runat="server" DefaultButton="btnRename">
                                                            <asp:PlaceHolder ID="Placeholder1" runat="server"></asp:PlaceHolder>
                                                            <asp:Image ID="imgEditType" runat="server" EnableViewState="false" ImageUrl="~/Data/SiteImages/Icons/unknown.gif" />
                                                            <asp:TextBox ID="txtEditName" runat="server" EnableViewState="false" Columns="50" Text='<%# DataBinder.Eval(Container.DataItem,"filename") %>'></asp:TextBox>
                                                        </asp:Panel>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField SortExpression="Description">
                                                    <ItemTemplate>
                                                        <asp:Literal ID="litDescription" runat="server" EnableViewState="false" Text='<%# DataBinder.Eval(Container.DataItem,"Description") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField SortExpression="size">
                                                    <ItemTemplate>
                                                        <asp:Literal ID="litSize" runat="server" EnableViewState="false" Text='<%# DataBinder.Eval(Container.DataItem,"size") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField SortExpression="DownloadCount">
                                                    <ItemTemplate>
                                                        <asp:Literal ID="litDownloadCount" runat="server" EnableViewState="false" Text='<%# DataBinder.Eval(Container.DataItem, "DownloadCount")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField SortExpression="modified">
                                                    <ItemTemplate>
                                                        <asp:Literal ID="litMod" runat="server" EnableViewState="false" Text='<%# DateTimeHelper.GetTimeZoneAdjustedDateTimeString(((System.Data.DataRowView)Container.DataItem),"modified", TimeOffset, timeZone)%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField SortExpression="username">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp;&nbsp;<asp:Literal ID="litUser" runat="server" EnableViewState="false" Text='<%# DataBinder.Eval(Container.DataItem, "username")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button ID="LinkButton1" runat="server" EnableViewState="false" Visible='<%# IsEditable%>' CssClass="buttonlink"
                                                            CommandName="Edit" CommandArgument='<%# Eval("ID") %>' CausesValidation="false"
                                                            Text="<%# Resources.SharedFileResources.FileManagerRename %>" />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Button ID="btnRename" runat="server" EnableViewState="false" CommandName="Update" CommandArgument='<%# Eval("ID") %>'
                                                            Text="<%# Resources.SharedFileResources.SharedFilesUpdateButton %>" />&nbsp;
                                                        <asp:Button ID="LinkButton2" runat="server" CommandName="Cancel" CausesValidation="false"
                                                            Text="<%# Resources.SharedFileResources.SharedFilesCancelButton %>" />
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </mp:mojoGridView>
                                        <asp:HiddenField ID="hdnCurrentFolderId" runat="server" Value="-1" EnableViewState="false" />
                                    </td>
                                </tr>
                                <tr id="trObjectCount" runat="server" EnableViewState="false" class="trfilecount">
                                    <td>
                                        <asp:Label ID="lblCounter" runat="server" EnableViewState="false" CssClass="sfcount"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <table cellspacing="0" cellpadding="2" width="99%" border="0" id="tblNewFolder" runat="server" EnableViewState="false">
                            <tr>
                                <td>
                                    <asp:Panel ID="pnlNewFolder" runat="server" DefaultButton="btnNewFolder">
                                        <asp:TextBox ID="txtNewDirectory" runat="server" Width="224px"></asp:TextBox>
                                        <portal:mojoButton ID="btnNewFolder" runat="server" Text="" OnClick="btnNewFolder_Click" />
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
               <div class="settingrow">
                        <div class="settingrow fileupload">
                            <asp:Panel ID="pnlUpload" runat="server" DefaultButton="btnUpload" CssClass="settingrow uploadpanel">
                                <NeatUpload:MultiFile ID="multiFile" runat="server" UseFlashIfAvailable="true">
                                    <portal:mojoButton ID="btnAddFile" Enabled="true" runat="server" EnableViewState="false" />
                                </NeatUpload:MultiFile>
                                <portal:mojoButton ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" EnableViewState="false" />
                            </asp:Panel>
                        </div>
                    
                        <div class="settingrow fileupload">
                            <NeatUpload:ProgressBar ID="progressBar" runat="server" CssClass="neatupload">
                                <mp:SiteLabel ID="progresBarLabel" runat="server" ConfigKey="CheckProgressText" UseLabelTag="false" />
                            </NeatUpload:ProgressBar>
                           
                        </div>
                </div>   
            </portal:InnerBodyPanel>
        </portal:OuterBodyPanel>
        <portal:EmptyPanel id="divCleared" runat="server" EnableViewState="false" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
    </portal:InnerWrapperPanel>
    <mp:CornerRounderBottom ID="cbottom1" runat="server" />
</portal:OuterWrapperPanel>
